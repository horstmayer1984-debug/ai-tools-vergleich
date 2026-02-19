---
title: "Claude Sonnet 4.6: Dynamic Filtering für bessere Web-Suche"
date: "2026-02-17"
draft: false
categories: [ai, llm, tools]
tags: [claude, anthropic, web-search, dynamic-filtering, ai-tools]
---

# Claude Sonnet 4.6: Dynamic Filtering für bessere Web-Suche

## Einführung

Anthropic hat mit Claude Sonnet 4.6 eine значительVerbesserung der Web-Suchfunktion veröffentlicht. Das neue Dynamic Filtering ermöglicht es dem Modell, Suchergebnisse direkt zu verarbeiten und nur relevante Inhalte in den Context zu laden. Das Ergebnis: 11% höhere Genauigkeit bei 24% weniger Input-Token.

## Was ist Dynamic Filtering?

Dynamic Filtering ist eine Technik, bei der Claude während der Web-Suche Python-Code ausführt, um Ergebnisse zu filtern, bevor sie in den Context geladen werden. Statt ganze HTML-Seiten zu verarbeiten, extrahiert das Modell nur die relevanten Informationen.

### Vorteile im Überblick

- **Weniger Token:** 24% Reduktion der Input-Token
- **Höhere Genauigkeit:** 11% Verbesserung in Benchmarks
- **Schnellere Antworten:** Effizientere Verarbeitung
- **Kosteneffizienz:** Geringere API-Kosten

## Benchmark-Ergebnisse

### BrowseComp

BrowseComp testet die Fähigkeit, gezielt schwer auffindbare Informationen im Web zu finden. Dynamic Filtering verbesserte die Genauigkeit signifikant:

| Modell | Ohne Filter | Mit Filter | Verbesserung |
|--------|-------------|------------|--------------|
| Sonnet 4.6 | 33,3% | 46,6% | +13,3% |
| Opus 4.6 | 45,3% | 61,6% | +16,3% |

### DeepsearchQA

DeepsearchQA prüft die Fähigkeit, mehrere richtige Antworten zu finden. Gemessen wird der F1-Score:

| Modell | Ohne Filter | Mit Filter | Verbesserung |
|--------|-------------|------------|--------------|
| Sonnet 4.6 | 52,6% | 59,4% | +6,8% |
| Opus 4.6 | 69,8% | 77,3% | +7,5% |

## Für wen ist Sonnet 4.6 geeignet?

Claude Sonnet 4.6 eignet sich besonders für:

- **Entwickler:** Die Web-Suchfunktionen in Agents integrieren
- **Forscher:** Mehrstufige Recherchen durchführen
- **Content-Ersteller:** Aktuelle Informationen schnell finden
- **Unternehmen:** Wissensmanagement und Datenextraktion

## Technische Details

Dynamic Filtering wird automatisch aktiviert bei:

- Claude API mit Sonnet 4.6 oder Opus 4.6
- Web-Search-Tool (web_search_20260209)
- Web-Fetch-Tool (web_fetch_20260209)

### Beispiel-Usage

```python
{
  "model": "claude-sonnet-4-6",
  "tools": [
    {"type": "web_search_20260209", "name": "web_search"},
    {"type": "web_fetch_20260209", "name": "web_fetch"}
  ]
}
```

## Vergleich zu anderen Modellen

Im direkten Vergleich zeigt Sonnet 4.6 mit Dynamic Filtering deutliche Vorteile bei Recherchen und Informationsbeschaffung. Die Kombination aus effizienter Token-Nutzung und höherer Genauigkeit macht es zu einer starken Wahl für agent-basierte Workflows.

## Fazit

Claude Sonnet 4.6 mit Dynamic Filtering represents einen bedeutenden Fortschritt bei der Web-Suche für AI-Modelle. Die Möglichkeit, Code auszuführen, um Suchergebnisse zu filtern, spart Token und verbessert die Antwortqualität. Für Entwickler und Unternehmen, die auf Web-Recherchen angewiesen sind, ist dies ein erheblicher Vorteil.

[Mehr über Claude Sonnet 4.6](https://www.anthropic.com/news/claude-sonnet-4-6)
