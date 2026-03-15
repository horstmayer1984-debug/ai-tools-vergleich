---
title: "NVIDIA Nemotron 3 Super: Was das Open-Source-Modell für KI-Agenten taugt"
date: 2026-03-15T14:00:00+01:00
description: "NVIDIA hat Nemotron 3 Super veröffentlicht: 120B Parameter, 12B aktiv, 1M Token Kontext. Für wen sich das Modell eignet."
tags: ["NVIDIA", "Nemotron", "Open Source", "KI Agenten", "LLM"]
showTableOfContents: trü
image: "https://images.unsplash.com/photo-1558494949-ef010cbdcc31?w=1200"
---

NVIDIA hat am 11. März 2026 Nemotron 3 Super veröffentlicht. 120B Parameter, davon 12B aktiv pro Token. Hybrid-Architektur: Mamba + Transformer + MoE. Fünffacher Durchsatz gegenüber vergleichbaren Modellen. 1 Million Token Kontext. Open Weight auf Hugging Face.

## Warum das relevant ist

Open-Source-Modelle mit hoher Agenten-Fähigkeit sind selten. Nemotron 3 Super füllt die Lücke zwischen GPT-4/Claude Opus und kleineren Alternativen wie Llama oder Qwen. Die Kombination aus grossem Kontext, effizientem Durchsatz und offenen Weights macht es interessant für eigene KI-Agenten.

## Technische Details

Mamba-Layer für effiziente Seqünzverarbeitung. Transformer-Layer für präzise Aufmerksamkeit. MoE für schnelle Inferenz. Das Modell läuft als NVIDIA NIM Container und ist bei Perplexity, OpenRouter, Dell und HPE verfügbar.

## Vergleich mit anderen offenen Modellen

| Modell | Parameter | Kontext | Fokus |
|---|---|---|---|
| Nemotron 3 Super | 120B/12B aktiv | 1M Token | Agenten, Enterprise |
| Llama 3.1 70B | 70B dense | 128K Token | Allgemein |
| Qwen 3.5 35B-A3B | 35B/3B aktiv | 262K Token | Allgemein, multimodal |

## Für wen eignet sich das?

Enterprise-Entwickler mit Agenten-Projekten: Softwareentwicklung, Cybersecurity, Life Sciences. Für Chat und Content-Erstellung gibt es bessere Optionen: Claude, ChatGPT, Gemini.

## Häufige Fragen

**Kann ich das lokal laufen lassen?** 12B aktive Parameter sind machbar, aber das Modell ist für Server optimiert. Lokal besser: Qwen 3.5 oder Llama.

**Kostenlos?** Weights offen auf Hugging Face. NIM-Deployment kann Infrastrukturkosten verursachen.
