#!/bin/bash
set -euo pipefail
PROJECT_DIR="$HOME/projects/ai-tools-vergleich"
ENV_FILE="$HOME/project-data/ai-tools-vergleich/.env"
CONTENT_DIRS=("content/vergleiche" "content/posts" "content/reviews" "content/news")
IMAGE_WIDTH=1200
LOG_PREFIX="[auto-hero]"
DRY_RUN=false
while [[ $# -gt 0 ]]; do
    case $1 in
        --dry-run) DRY_RUN=true; shift ;;
        *) echo "Unbekanntes Argument: $1"; exit 1 ;;
    esac
done
if [ -f "$ENV_FILE" ]; then
    source "$ENV_FILE"
fi
if [ -z "${UNSPLASH_ACCESS_KEY:-}" ]; then
    echo "$LOG_PREFIX FEHLER: UNSPLASH_ACCESS_KEY nicht gesetzt."
    exit 1
fi
cd "$PROJECT_DIR"
PROCESSED=0
SKIPPED=0
DOWNLOADED=0
ERRORS=0
echo "$LOG_PREFIX $(date '+%Y-%m-%d %H:%M:%S') — Start"
echo "$LOG_PREFIX Dry-Run: $DRY_RUN"
extract_keywords() {
    local file="$1"
    local tags=""
    tags=$(grep -m1 '^tags:' "$file" | sed 's/^tags:\s*\[//;s/\]//;s/"//g;s/,/ /g')
    if [ -n "$tags" ]; then
        echo "$tags" | tr '[:upper:]' '[:lower:]' | xargs | cut -d' ' -f1-3
    else
        local title=""
        title=$(grep -m1 '^title:' "$file" | sed 's/^title:\s*"*//;s/"*\s*$//')
        echo "$title" | tr '[:upper:]' '[:lower:]' | \
            sed 's/[–—|:,.]/ /g' | \
            sed 's/\b\(der\|die\|das\|und\|für\|von\|im\|in\|den\|dem\|ein\|eine\|mit\|ist\|auf\|des\|als\|oder\|an\|zu\|bei\|nach\|aus\|wie\|über\|2024\|2025\|2026\|detaillierter\|kompletter\|besten\|beste\|vergleich\|komplettanleitung\)\b//g' | \
            tr -s ' ' | xargs | cut -d' ' -f1-3
    fi
}
search_unsplash() {
    local query="$1"
    local response
    response=$(curl -s -H "Authorization: Client-ID $UNSPLASH_ACCESS_KEY" \
        "https://api.unsplash.com/search/photos?query=$(echo "$query" | tr ' ' '+')&orientation=landscape&per_page=1&content_filter=high")
    echo "$response" | python3 -c "
import sys, json
try:
    data = json.load(sys.stdin)
    if data.get('results') and len(data['results']) > 0:
        r = data['results'][0]
        url = r['urls']['raw'] + '&w=${IMAGE_WIDTH}&q=80&fm=jpg&fit=crop'
        author = r['user']['name']
        unsplash_url = r['links']['html']
        photo_id = r['id']
        print(f'{url}|SEP|{author}|SEP|{unsplash_url}|SEP|{photo_id}')
    else:
        print('')
except:
    print('')
" 2>/dev/null || echo ""
}
download_image() {
    local url="$1"
    local output="$2"
    curl -sL -o "$output" "$url"
    if [ ! -s "$output" ]; then
        echo "$LOG_PREFIX   WARNUNG: Leere Datei"
        rm -f "$output"
        return 1
    fi
    local size
    size=$(stat -c%s "$output")
    if [ "$size" -lt 10000 ]; then
        echo "$LOG_PREFIX   WARNUNG: Zu klein ($size bytes)"
        rm -f "$output"
        return 1
    fi
    return 0
}
update_frontmatter() {
    local file="$1"
    local image_filename="$2"
    sed -i "/^tags:/a\\
image: \"$image_filename\"" "$file"
}
convert_to_bundle() {
    local file="$1"
    local dir
    dir=$(dirname "$file")
    local bn
    bn=$(basename "$file" .md)
    if [ "$bn" = "index" ] || [ "$bn" = "_index" ]; then
        echo "$dir"
        return
    fi
    local bundle_dir="$dir/$bn"
    mkdir -p "$bundle_dir"
    mv "$file" "$bundle_dir/index.md"
    echo "$bundle_dir"
}
# Keyword-Map: Deutsche Begriffe → bessere englische Unsplash-Queries
declare -A FALLBACK_KEYWORDS
FALLBACK_KEYWORDS=(
    ["chatgpt"]="artificial intelligence chatbot"
    ["claude"]="artificial intelligence assistant"
    ["dsgvo"]="data privacy security"
    ["ki-tools"]="artificial intelligence technology"
    ["deepseek"]="artificial intelligence code"
    ["openai"]="artificial intelligence technology"
    ["api"]="programming code technology"
    ["marketing"]="digital marketing strategy"
    ["entwickler"]="software developer coding"
)
get_fallback_query() {
    local keywords="$1"
    for key in "${!FALLBACK_KEYWORDS[@]}"; do
        if echo "$keywords" | grep -qi "$key"; then
            echo "${FALLBACK_KEYWORDS[$key]}"
            return
        fi
    done
    echo "technology artificial intelligence"
}
for content_dir in "${CONTENT_DIRS[@]}"; do
    if [ ! -d "$content_dir" ]; then
        continue
    fi
    while IFS= read -r -d '' file; do
        PROCESSED=$((PROCESSED + 1))
        if [[ "$(basename "$file")" == "_index.md" ]]; then
            SKIPPED=$((SKIPPED + 1))
            continue
        fi
        if grep -q '^image:' "$file" 2>/dev/null || grep -q '^featuredImage:' "$file" 2>/dev/null; then
            echo "$LOG_PREFIX SKIP (hat Bild): $file"
            SKIPPED=$((SKIPPED + 1))
            continue
        fi
        local_dir=$(dirname "$file")
        if [ -f "$local_dir/hero.jpg" ] || [ -f "$local_dir/featured.jpg" ]; then
            echo "$LOG_PREFIX SKIP (Bild existiert): $file"
            SKIPPED=$((SKIPPED + 1))
            continue
        fi
        echo "$LOG_PREFIX Verarbeite: $file"
        keywords=$(extract_keywords "$file")
        echo "$LOG_PREFIX   Keywords: $keywords"
        result=$(search_unsplash "$keywords")
        if [ -z "$result" ]; then
            fallback=$(get_fallback_query "$keywords")
            echo "$LOG_PREFIX   Fallback-Suche: $fallback"
            result=$(search_unsplash "$fallback")
        fi
        if [ -z "$result" ]; then
            echo "$LOG_PREFIX   SKIP: Kein Bild gefunden"
            SKIPPED=$((SKIPPED + 1))
            continue
        fi
        IFS='|SEP|' read -r img_url img_author img_unsplash_url img_id <<< "$result"
        img_author=$(echo "$img_author" | sed 's/^|*//;s/|*$//')
        img_id=$(echo "$img_id" | sed 's/^|*//;s/|*$//')
        echo "$LOG_PREFIX   Bild: $img_author (ID: $img_id)"
        if [ "$DRY_RUN" = true ]; then
            echo "$LOG_PREFIX   [DRY-RUN] Würde herunterladen"
            continue
        fi
        bundle_dir=$(convert_to_bundle "$file")
        local_file="$bundle_dir/index.md"
        hero_path="$bundle_dir/hero.jpg"
        if download_image "$img_url" "$hero_path"; then
            echo "$LOG_PREFIX   ✓ Heruntergeladen: $hero_path ($(stat -c%s "$hero_path") bytes)"
            DOWNLOADED=$((DOWNLOADED + 1))
            update_frontmatter "$local_file" "hero.jpg" 
            echo "$LOG_PREFIX   ✓ Front Matter aktualisiert"
        else
            echo "$LOG_PREFIX   ✗ Download fehlgeschlagen"
            ERRORS=$((ERRORS + 1))
        fi
        sleep 1
    done < <(find "$content_dir" -name "*.md" -print0)
done
if [ "$DRY_RUN" = false ] && [ "$DOWNLOADED" -gt 0 ]; then
    echo ""
    echo "$LOG_PREFIX Git Commit..."
    cd "$PROJECT_DIR"
    git add -A
    git commit -m "Auto: Hero-Bilder für $DOWNLOADED Artikel (Unsplash)"
    git push origin main
    echo "$LOG_PREFIX ✓ Gepusht"
fi
echo ""
echo "$LOG_PREFIX ==============================="
echo "$LOG_PREFIX   Geprüft:        $PROCESSED"
echo "$LOG_PREFIX   Übersprungen:    $SKIPPED"
echo "$LOG_PREFIX   Heruntergeladen: $DOWNLOADED"
echo "$LOG_PREFIX   Fehler:          $ERRORS"
echo "$LOG_PREFIX   $(date '+%Y-%m-%d %H:%M:%S') — Ende"
