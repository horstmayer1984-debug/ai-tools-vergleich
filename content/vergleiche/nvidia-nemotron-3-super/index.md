---
title: "NVIDIA Nemotron 3 Super: Was das Open Source Modell für KI Agenten taugt"
date: 2026-03-16T14:00:00+01:00
lastmod: 2026-03-16T14:00:00+01:00
description: "NVIDIA hat Nemotron 3 Super veröffentlicht. 120B Parameter, 12B aktiv, 1 Million Token Kontext. Für wen sich das Modell eignet."
tags: ["NVIDIA", "Nemotron", "Open Source", "KI Agenten", "LLM"]
image: "https://images.unsplash.com/photo-1558494949-ef010cbdcc31?w=1200"
showTableOfContents: true
showRelatedContent: true
---

NVIDIA hat am 11. März 2026 Nemotron 3 Super veröffentlicht. Ein offenes 120 Milliarden Parameter Modell das nur 12 Milliarden Parameter pro Token aktiviert. Die Hybrid Architektur kombiniert Mamba, Transformer und Mixture of Experts. Das Ergebnis: fünffacher Durchsatz gegenüber vergleichbaren Modellen und ein Kontextfenster von einer Million Token. Komplett offen auf Hugging Face verfügbar.

## Warum Nemotron 3 Super für Entwickler relevant ist

Open Source Modelle mit hoher Agenten Fähigkeit sind selten. Nemotron 3 Super füllt eine Lücke zwischen den grossen proprietären Modellen wie GPT 4 und Claude Opus und den kleineren Open Source Alternativen wie Llama und Qwen. Die Kombination aus grossem Kontext, effizientem Durchsatz und offenen Weights macht es besonders interessant für Entwickler die eigene KI Agenten baün wollen.

Das Modell ist speziell für agentische KI Systeme optimiert. Software Entwicklung, Cybersecurity und Life Sciences sind die Haupteinsatzgebiete die NVIDIA hervorhebt.

## Technische Architektur im Detail

Die Hybrid Architektur ist ungewöhnlich und kombiniert drei verschiedene Ansätze in einem Modell.

Mamba Layer sorgen für effiziente Seqünzverarbeitung. Sie können lange Textseqünzen schnell verarbeiten ohne dass der Speicherbedarf quadratisch mit der Länge wächst. Das ist der Grund für das grosse Kontextfenster von einer Million Token.

Transformer Layer liefern präzise Aufmerksamkeit bei komplexen Aufgaben. Wenn das Modell genau hinschaün muss um Zusammenhänge zwischen weit entfernten Textstellen zu erkennen kommen die Transformer Layer zum Einsatz.

Mixture of Experts sorgt für schnelle Inferenz bei niedrigem Ressourcenverbrauch. Von den 120 Milliarden Gesamtparametern werden pro Token nur 12 Milliarden aktiviert. Das spart Rechenleistung und ermöglicht den hohen Durchsatz.

Das Modell läuft als NVIDIA NIM Container und ist bei Perplexity, OpenRouter, Dell und HPE verfügbar.

## Vergleich mit anderen offenen Modellen

| Modell | Parameter gesamt und aktiv | Kontext | Hauptfokus | Lizenz |
|---|---|---|---|---|
| Nemotron 3 Super | 120B gesamt, 12B aktiv | 1M Token | Agenten, Enterprise | Open Weight |
| Llama 3.1 70B | 70B dense | 128K Token | Allgemein | Open |
| Qwen 3.5 35B A3B | 35B gesamt, 3B aktiv | 262K Token | Allgemein, multimodal | Open |
| Kimi K2.5 | 1T gesamt, 32B aktiv | 256K Token | Agenten, Coding | Modified MIT |

Nemotron 3 Super positioniert sich zwischen den kleineren effizienten Modellen und den riesigen Modellen wie Kimi K2.5. Der Vorteil gegenüber Llama: deutlich grösserer Kontext. Der Vorteil gegenüber Kimi K2.5: deutlich geringere Hardware Anforderungen.

## Für wen eignet sich Nemotron 3 Super

Enterprise Entwickler die eigene KI Agenten für spezifische Aufgaben baün wollen. Besonders relevant für drei Bereiche.

Softwareentwicklung: Code Generierung und Review über grosse Codebasen mit dem vollen Kontextfenster von einer Million Token. Du kannst dem Modell ein ganzes Repository als Kontext geben.

Cybersecurity: Log Analyse mit langem Kontext. Sicherheitsrelevante Events über Stunden oder Tage hinweg in einem einzigen Kontext analysieren.

Life Sciences: Dokumentenanalyse bei langen wissenschaftlichen Papern und Patentschriften.

Für Consumer Anwendungen wie Chat oder Content Erstellung gibt es bessere Optionen. Claude Sonnet, ChatGPT und Gemini sind hier ausgereifter und einfacher zu nutzen.

## Häufige Fragen

**Kann ich Nemotron 3 Super lokal auf meinem PC laufen lassen?**
Theoretisch ja, da nur 12B Parameter aktiv sind. Aber das Modell ist für Server Deployment optimiert. Für lokale Nutzung sind Qwen 3.5 oder Llama besser geeignet.

**Ist das Modell wirklich kostenlos?**
Die Weights sind offen und kostenlos auf Hugging Face. Für NIM Deployment können Infrastrukturkosten anfallen.

**Wie vergleicht sich Nemotron mit GPT 4?**
Für agentische Aufgaben mit langem Kontext kommt Nemotron nahe an proprietäre Modelle heran. Für allgemeine Chat Qualität liegt GPT 4 vorne.

**Was bedeutet eine Million Token Kontext in der Praxis?**
Das entspricht ungefähr 750.000 Wörtern oder etwa 1.500 Seiten Text. Du kannst dem Modell ein komplettes Buch oder eine umfangreiche Codebasis als Kontext geben.
