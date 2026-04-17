---
title: "Attention Residuals: Moonshot AIs neü Methode für effizientere Transformer"
date: 2026-03-29T10:00:00+01:00
lastmod: 2026-03-29T10:00:00+01:00
description: "Moonshot AI hat Attention Residuals veröffentlicht. Die Methode ersetzt klassische Residual Connections durch lernbare Aufmerksamkeit und liefert einen 1.25 fach Compute Vorteil."
tags: ["Moonshot AI", "Attention Residuals", "Transformer", "KI Architektur", "Kimi"]
image: "https://images.unsplash.com/photo-1620712943543-bcc4688e7485?w=1200"
showTableOfContents: true
showRelatedContent: true
---

Moonshot AI hat am 16. März 2026 Attention Residuals vorgestellt. Die Methode ersetzt die seit 2015 verwendeten festen Residual Connections in Transformern durch eine lernbare Aufmerksamkeit über frühere Schichten. Statt blind die Ausgabe der vorherigen Schicht zu addieren schaut jede Schicht gezielt zurück und wählt nur die relevanten Teile aus. Das Ergebnis: ein 1.25 fach Compute Vorteil bei weniger als zwei Prozent zusätzlicher Inferenz Latenz. Das Paper ist open source auf GitHub verfügbar.

## Was Residual Connections bisher gemacht haben und warum das nicht reicht

Klassische Residual Connections funktionieren wie feste Abkürzungen. Jede Schicht in einem Transformer addiert die Ausgabe der vorherigen Schicht unverändert zu ihrer eigenen Ausgabe. Das löst ein altes Problem: Ohne diese Abkürzungen verschwinden die Gradienten in tiefen Netzen und das Training bricht zusammen.

Bei sehr tiefen Modellen mit vielen Milliarden Parametern entstehen aber neü Probleme. Die alten Informationen werden bei jeder Addition verdünnt. Die internen Zustandsvektoren wachsen unkontrolliert an. Das führt zu Instabilitäten im Training und begrenzt wie tief ein Modell sinnvoll werden kann.

## Wie Attention Residuals das Problem löst

Attention Residuals ersetzt die feste Addition durch eine weiche Aufmerksamkeitsmechanik. Jede Schicht bekommt Zugriff auf alle früheren Schichten und wählt inputabhängig aus welche Informationen sie braucht. Relevante Teile werden stark gewichtet, irrelevante ignoriert.

Diese inputabhängige Selektion verhindert Verdünung. Die Hidden State Grösse bleibt stabil unabhängig von der Modelltiefe. Gradienten fliessen gleichmässiger durch alle Schichten. Das Training wird stabiler und die Ergebnisse auf Downstream Benchmarks verbessern sich.

Die Idee entstand aus einer Beobachtung: In rekurrenten Netzen sind Zeitschritt und Schichttiefe dasselbe. Transformer haben beides getrennt was Parallelverarbeitung ermöglichte aber die Selektivität verlor. Attention Residuals bringt die Selektivität zurück ohne die Parallelität aufzugeben.

## Block AttnRes: Praktikabel für grosse Modelle

Bei Modellen mit hunderten Schichten wäre volle Aufmerksamkeit über alle Schichten zu teür. Der Speicherbedarf würde quadratisch mit der Schichtanzahl wachsen. Block AttnRes löst das indem die Schichten in Blöcke gruppiert werden. Die Aufmerksamkeit arbeitet nur auf Block Ebene.

Der Speicherbedarf sinkt dadurch von quadratisch auf linear. Block AttnRes ist ein Drop In Ersatz für herkömmliche Residuals. Bestehender Code muss kaum geändert werden. Die Rechenkosten steigen minimal während der Nutzen bei Training und Inferenz messbar ist.

## Konkrete Ergebnisse: Kimi Linear als Testmodell

Moonshot AI hat Attention Residuals im Kimi Linear Modell validiert. Dieses experimentelle Modell hat 48 Milliarden Parameter insgesamt und aktiviert nur drei Milliarden pro Token. Es wurde auf 1.4 Billionen Tokens vortrainiert.

Die Ergebnisse in Zahlen: Bei gleichem Rechenaufwand sinkt der Loss um den Faktor 1.25 schneller als mit klassischen Residuals. Die Inferenz Latenz steigt um weniger als zwei Prozent. Die Trainingsstabilität verbessert sich messbar. Gradienten fliessen gleichmässiger und die Ausgabemagnituden bleiben über die gesamte Modelltiefe kontrolliert.

Scaling Law Experimente bestätigen den Vorteil über verschiedene Modellgrössen hinweg. Das ist kein Effekt der nur bei einem bestimmten Setup funktioniert.

## Ist Attention Residuals bereits in Kimi 2.5 enthalten

Nein. Kimi 2.5 wurde im Januar 2026 veröffentlicht und basiert auf einer MoE Architektur mit einer Billion Parametern. Attention Residuals wurde separat auf dem Kimi Linear Prototyp getestet und ist nicht in die aktuelle öffentliche Version integriert.

Alles deutet darauf hin dass Moonshot AI die Methode in künftige Versionen einbaün wird. Für Nutzer der aktuellen Kimi Version ändert sich vorerst nichts.

## Was das für die KI Branche bedeutet

Die Methode ist open source. Jedes Labor kann die Idee übernehmen. Eine kleine Änderung an den Residual Connections die seit zehn Jahren als gelöstes Problem galten bringt einen messbaren Effizienzgewinn.

Für die Praxis heisst das: Modelle können tiefer werden ohne Instabilität. Kontexte bleiben länger erhalten. Reasoning verbessert sich bei langen Aufgaben. Die Compute Einsparungen summieren sich bei grossen Trainingsläufen auf erhebliche Beträge.

Der Fokus verschiebt sich weiter von reiner GPU Skalierung hin zu smarteren Architekturen. Mehr Parameter allein reichen nicht. Wie die Parameter miteinander verbunden sind wird zunehmend wichtiger.

## Häufige Fragen

**Was ist der 1.25 fach Compute Vorteil genau?**
Bei gleichem Rechenaufwand erreicht ein Modell mit Attention Residuals einen niedrigeren Loss als mit klassischen Residuals. Umgekehrt braucht man etwa 20 Prozent weniger Compute um dasselbe Ergebnis zu erzielen.

**Kann ich Attention Residuals in meinem eigenen Modell nutzen?**
Ja. Das Paper und der Code sind auf GitHub verfügbar. Block AttnRes ist als Drop In Ersatz für bestehende Residual Connections konzipiert.

**Wird GPT 5 oder Claude Opus diese Technik nutzen?**
Das ist Spekulation. Die Methode ist öffentlich zugänglich. Ob und wann andere Labore sie übernehmen ist nicht bekannt.

**Wie gross ist der Speicher Mehrverbrauch durch Attention Residuals?**
Mit Block AttnRes wächst der Speicherbedarf linear statt quadratisch. In der Praxis liegt der Mehrverbrauch im niedrigen einstelligen Prozentbereich.
