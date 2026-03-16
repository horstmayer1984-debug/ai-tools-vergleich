---
title: "Karpathys Autoresearch: Der KI Agent der über Nacht allein forscht"
date: 2026-03-16T21:00:00+01:00
lastmod: 2026-03-16T21:00:00+01:00
description: "Andrej Karpathy hat Autoresearch veröffentlicht. Ein Open Source Tool mit dem ein KI Agent selbstständig Code ändert, Experimente durchführt und Modelle verbessert."
tags: ["Karpathy", "Autoresearch", "KI Agent", "Open Source", "ML Forschung"]
image: "https://images.unsplash.com/photo-1555949963-aa79dcee981c?w=1200"
showTableOfContents: true
showRelatedContent: true
---

Andrej Karpathy hat Autoresearch auf GitHub veröffentlicht. Ein Open Source Projekt mit rund 630 Zeilen Code das einen KI Agenten selbstständig forschen lässt. Der Agent ändert Code, trainiert Modelle, misst die Ergebnisse und behält nur die Verbesserungen. Das läuft die ganze Nacht oder das Wochenende durch ohne menschliches Eingreifen.

Shopify CEO Tobi Lütke hat das Tool als einer der Ersten öffentlich getestet. Er hat dem Agenten ein GitHub Repo gegeben und ist schlafen gegangen. Am nächsten Morgen: 19 Prozent besserer Score bei einem kleineren Modell. 37 Experimente komplett autonom durchgeführt. Lütkes Kommentar: Er habe mehr gelernt als bei monatelangem Zuschaün echter Forscher.

## Wie Autoresearch funktioniert

Das Prinzip ist einfach. Du änderst nur eine Textdatei namens program.md. Dort schreibst du deine Ziele hin. Zum Beispiel: "Mach das Training schneller und besser. Probiere alles aus: Architektur, Lernrate, Optimizer."

Der KI Agent ändert daraufhin nur eine einzige Datei: train.py. Das ist der komplette Code für ein kleines Sprachmodell. Alles steckt darin: Neuronales Netz, Optimizer, Trainingsschleife.

Dann läuft ein Loop: Der Agent ändert den Code. Er trainiert genau fünf Minuten lang auf einer normalen GPU. Er misst ob das Modell besser geworden ist. Wenn ja speichert er die Änderung als Git Commit auf einem eigenen Branch. Wenn nein verwirft er die Änderung und probiert etwas Neüs.

Am Ende hast du eine Git History mit allen Experimenten. Du siehst genau welche Ideen der Agent hatte und welche funktioniert haben. Batch Size halbieren, Warmup hinzufügen, Window Pattern ändern, alle Schritte sind nachvollziehbar.

## Was Autoresearch besonders macht

Es ist kein fertiges Produkt sondern ein minimales Framework. 630 Zeilen Code die den Kern abbilden: Agent editiert Code, misst Erfolg, behält Verbesserungen. Dieser Kern funktioniert überall wo du ein messbares Ergebnis hast.

Karpathy nennt es "Teil Code, Teil Science Fiction". Der Agent denkt wie ein Forscher und kann endlos weiterforschen. Er wird nicht müde, vergisst keine Ideen und dokumentiert alles automatisch per Git.

Die Ergebnisse sind echt. Karpathys eigenes Mini Sprachmodell nanochat hat durch Autoresearch neü Rekordwerte erreicht. Die Verbesserungen funktionieren auch bei grösseren Modellen.

## Autoresearch jenseits von LLM Training

Das Tool ist so flexibel dass die Community es bereits für andere Bereiche adaptiert hat.

Auf MacBooks und Windows gibt es fertige Forks. Du brauchst keine NVIDIA GPU. Kleinere Datasets wie TinyStories funktionieren genauso.

Autöxp ist eine Verallgemeinerung die den gleichen Loop für beliebige Optimierungsprobleme nutzt. Schnellere Sortier Algorithmen, bessere KI Gegner in Spielen, effizientere Daten Pipelines, genaüre Physik Simulationen. Überall wo ein Score gemessen werden kann lässt sich der Agent einsetzen.

Lehrer optimieren Quiz Generatoren. Hobby Entwickler verbessern kleine Modelle. Indie Researcher testen Ideen über Nacht auf einer einzigen GPU. Kein teures Cloud Cluster nötig.

## Was du brauchst um Autoresearch zu starten

Eine normale NVIDIA GPU reicht. Das Setup daürt etwa fünf Minuten. Du klonst das Repository von GitHub, passt die program.md an deine Ziele an und startest den Loop. Der Agent erledigt den Rest.

Ohne NVIDIA GPU funktionieren die Community Forks für Mac mit MLX oder für Windows mit RTX Karten.

Das Repository: github.com/karpathy/autoresearch

## Karpathys Vision für die Zukunft

Statt einem Agenten könnten Tausende Agenten kollaborativ forschen. Jeder auf einem eigenen Branch, sie lesen gegenseitig ihre Ergebnisse und baün aufeinander auf. Ähnlich wie verteiltes Rechnen bei SETI@home, aber für KI Forschung.

Das würde die Geschwindigkeit von KI Forschung massiv beschleunigen. Nicht durch grössere Cluster sondern durch parallele autonome Experimente die systematisch aufeinander aufbaün.

## Häufige Fragen

**Brauche ich ML Erfahrung für Autoresearch?**
Grundlegendes Verständnis von Python und Machine Learning hilft. Du musst aber keinen Code schreiben. Du definierst nur die Ziele in program.md.

**Wie lange läuft ein typischer Autoresearch Durchlauf?**
Jedes Experiment daürt fünf Minuten. Über Nacht schafft der Agent 50 bis 100 Experimente. Über ein Wochenende mehrere hundert.

**Funktioniert das auch auf einem Mac?**
Ja. Es gibt Community Forks für macOS mit MLX. Die Performance ist geringer als auf NVIDIA Hardware aber ausreichend für kleine Modelle.

**Kann der Agent auch mein bestehendes Projekt optimieren?**
Ja, wenn du ein messbares Ergebnis definieren kannst. Der Loop funktioniert mit jeder Codebasis die einen Score ausgibt.

**Ist Autoresearch kostenlos?**
Ja. Vollständig open source auf GitHub. Keine Lizenzkosten, keine API Gebühren für das Tool selbst. Die Kosten für den KI Agenten der den Code ändert hängen vom verwendeten Modell ab.
