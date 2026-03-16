---
title: "Karpathys Autoresearch: Der KI Agent der ueber Nacht allein forscht"
date: 2026-03-16T21:00:00+01:00
lastmod: 2026-03-16T21:00:00+01:00
description: "Andrej Karpathy hat Autoresearch veroeffentlicht. Ein Open Source Tool mit dem ein KI Agent selbststaendig Code aendert, Experimente durchfuehrt und Modelle verbessert."
tags: ["Karpathy", "Autoresearch", "KI Agent", "Open Source", "ML Forschung"]
image: "https://images.unsplash.com/photo-1555949963-aa79dcee981c?w=1200"
showTableOfContents: true
showRelatedContent: true
---

Andrej Karpathy hat Autoresearch auf GitHub veroeffentlicht. Ein Open Source Projekt mit rund 630 Zeilen Code das einen KI Agenten selbststaendig forschen laesst. Der Agent aendert Code, trainiert Modelle, misst die Ergebnisse und behaelt nur die Verbesserungen. Das laeuft die ganze Nacht oder das Wochenende durch ohne menschliches Eingreifen.

Shopify CEO Tobi Luetke hat das Tool als einer der Ersten oeffentlich getestet. Er hat dem Agenten ein GitHub Repo gegeben und ist schlafen gegangen. Am naechsten Morgen: 19 Prozent besserer Score bei einem kleineren Modell. 37 Experimente komplett autonom durchgefuehrt. Luetkes Kommentar: Er habe mehr gelernt als bei monatelangem Zuschauen echter Forscher.

## Wie Autoresearch funktioniert

Das Prinzip ist einfach. Du aenderst nur eine Textdatei namens program.md. Dort schreibst du deine Ziele hin. Zum Beispiel: "Mach das Training schneller und besser. Probiere alles aus: Architektur, Lernrate, Optimizer."

Der KI Agent aendert daraufhin nur eine einzige Datei: train.py. Das ist der komplette Code fuer ein kleines Sprachmodell. Alles steckt darin: Neuronales Netz, Optimizer, Trainingsschleife.

Dann laeuft ein Loop: Der Agent aendert den Code. Er trainiert genau fuenf Minuten lang auf einer normalen GPU. Er misst ob das Modell besser geworden ist. Wenn ja speichert er die Aenderung als Git Commit auf einem eigenen Branch. Wenn nein verwirft er die Aenderung und probiert etwas Neues.

Am Ende hast du eine Git History mit allen Experimenten. Du siehst genau welche Ideen der Agent hatte und welche funktioniert haben. Batch Size halbieren, Warmup hinzufuegen, Window Pattern aendern, alle Schritte sind nachvollziehbar.

## Was Autoresearch besonders macht

Es ist kein fertiges Produkt sondern ein minimales Framework. 630 Zeilen Code die den Kern abbilden: Agent editiert Code, misst Erfolg, behaelt Verbesserungen. Dieser Kern funktioniert ueberall wo du ein messbares Ergebnis hast.

Karpathy nennt es "Teil Code, Teil Science Fiction". Der Agent denkt wie ein Forscher und kann endlos weiterforschen. Er wird nicht muede, vergisst keine Ideen und dokumentiert alles automatisch per Git.

Die Ergebnisse sind echt. Karpathys eigenes Mini Sprachmodell nanochat hat durch Autoresearch neue Rekordwerte erreicht. Die Verbesserungen funktionieren auch bei groesseren Modellen.

## Autoresearch jenseits von LLM Training

Das Tool ist so flexibel dass die Community es bereits fuer andere Bereiche adaptiert hat.

Auf MacBooks und Windows gibt es fertige Forks. Du brauchst keine NVIDIA GPU. Kleinere Datasets wie TinyStories funktionieren genauso.

Autoexp ist eine Verallgemeinerung die den gleichen Loop fuer beliebige Optimierungsprobleme nutzt. Schnellere Sortier Algorithmen, bessere KI Gegner in Spielen, effizientere Daten Pipelines, genauere Physik Simulationen. Ueberall wo ein Score gemessen werden kann laesst sich der Agent einsetzen.

Lehrer optimieren Quiz Generatoren. Hobby Entwickler verbessern kleine Modelle. Indie Researcher testen Ideen ueber Nacht auf einer einzigen GPU. Kein teures Cloud Cluster noetig.

## Was du brauchst um Autoresearch zu starten

Eine normale NVIDIA GPU reicht. Das Setup dauert etwa fuenf Minuten. Du klonst das Repository von GitHub, passt die program.md an deine Ziele an und startest den Loop. Der Agent erledigt den Rest.

Ohne NVIDIA GPU funktionieren die Community Forks fuer Mac mit MLX oder fuer Windows mit RTX Karten.

Das Repository: github.com/karpathy/autoresearch

## Karpathys Vision fuer die Zukunft

Statt einem Agenten koennten Tausende Agenten kollaborativ forschen. Jeder auf einem eigenen Branch, sie lesen gegenseitig ihre Ergebnisse und bauen aufeinander auf. Aehnlich wie verteiltes Rechnen bei SETI@home, aber fuer KI Forschung.

Das wuerde die Geschwindigkeit von KI Forschung massiv beschleunigen. Nicht durch groessere Cluster sondern durch parallele autonome Experimente die systematisch aufeinander aufbauen.

## Haeufige Fragen

**Brauche ich ML Erfahrung fuer Autoresearch?**
Grundlegendes Verstaendnis von Python und Machine Learning hilft. Du musst aber keinen Code schreiben. Du definierst nur die Ziele in program.md.

**Wie lange laeuft ein typischer Autoresearch Durchlauf?**
Jedes Experiment dauert fuenf Minuten. Ueber Nacht schafft der Agent 50 bis 100 Experimente. Ueber ein Wochenende mehrere hundert.

**Funktioniert das auch auf einem Mac?**
Ja. Es gibt Community Forks fuer macOS mit MLX. Die Performance ist geringer als auf NVIDIA Hardware aber ausreichend fuer kleine Modelle.

**Kann der Agent auch mein bestehendes Projekt optimieren?**
Ja, wenn du ein messbares Ergebnis definieren kannst. Der Loop funktioniert mit jeder Codebasis die einen Score ausgibt.

**Ist Autoresearch kostenlos?**
Ja. Vollstaendig open source auf GitHub. Keine Lizenzkosten, keine API Gebuehren fuer das Tool selbst. Die Kosten fuer den KI Agenten der den Code aendert haengen vom verwendeten Modell ab.
