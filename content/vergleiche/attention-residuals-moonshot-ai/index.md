---
title: "Attention Residuals: Moonshot AIs neue Methode fuer effizientere Transformer"
date: 2026-03-16T20:00:00+01:00
lastmod: 2026-03-16T20:00:00+01:00
description: "Moonshot AI hat Attention Residuals veroeffentlicht. Die Methode ersetzt klassische Residual Connections durch lernbare Aufmerksamkeit und liefert einen 1.25 fach Compute Vorteil."
tags: ["Moonshot AI", "Attention Residuals", "Transformer", "KI Architektur", "Kimi"]
image: "https://images.unsplash.com/photo-1620712943543-bcc4688e7485?w=1200"
showTableOfContents: true
showRelatedContent: true
---

Moonshot AI hat am 16. Maerz 2026 Attention Residuals vorgestellt. Die Methode ersetzt die seit 2015 verwendeten festen Residual Connections in Transformern durch eine lernbare Aufmerksamkeit ueber fruehere Schichten. Statt blind die Ausgabe der vorherigen Schicht zu addieren schaut jede Schicht gezielt zurueck und waehlt nur die relevanten Teile aus. Das Ergebnis: ein 1.25 fach Compute Vorteil bei weniger als zwei Prozent zusaetzlicher Inferenz Latenz. Das Paper ist open source auf GitHub verfuegbar.

## Was Residual Connections bisher gemacht haben und warum das nicht reicht

Klassische Residual Connections funktionieren wie feste Abkuerzungen. Jede Schicht in einem Transformer addiert die Ausgabe der vorherigen Schicht unveraendert zu ihrer eigenen Ausgabe. Das loest ein altes Problem: Ohne diese Abkuerzungen verschwinden die Gradienten in tiefen Netzen und das Training bricht zusammen.

Bei sehr tiefen Modellen mit vielen Milliarden Parametern entstehen aber neue Probleme. Die alten Informationen werden bei jeder Addition verduennt. Die internen Zustandsvektoren wachsen unkontrolliert an. Das fuehrt zu Instabilitaeten im Training und begrenzt wie tief ein Modell sinnvoll werden kann.

## Wie Attention Residuals das Problem loest

Attention Residuals ersetzt die feste Addition durch eine weiche Aufmerksamkeitsmechanik. Jede Schicht bekommt Zugriff auf alle frueheren Schichten und waehlt inputabhaengig aus welche Informationen sie braucht. Relevante Teile werden stark gewichtet, irrelevante ignoriert.

Diese inputabhaengige Selektion verhindert Verduenung. Die Hidden State Groesse bleibt stabil unabhaengig von der Modelltiefe. Gradienten fliessen gleichmaessiger durch alle Schichten. Das Training wird stabiler und die Ergebnisse auf Downstream Benchmarks verbessern sich.

Die Idee entstand aus einer Beobachtung: In rekurrenten Netzen sind Zeitschritt und Schichttiefe dasselbe. Transformer haben beides getrennt was Parallelverarbeitung ermoeglichte aber die Selektivitaet verlor. Attention Residuals bringt die Selektivitaet zurueck ohne die Parallelitaet aufzugeben.

## Block AttnRes: Praktikabel fuer grosse Modelle

Bei Modellen mit hunderten Schichten waere volle Aufmerksamkeit ueber alle Schichten zu teuer. Der Speicherbedarf wuerde quadratisch mit der Schichtanzahl wachsen. Block AttnRes loest das indem die Schichten in Bloecke gruppiert werden. Die Aufmerksamkeit arbeitet nur auf Block Ebene.

Der Speicherbedarf sinkt dadurch von quadratisch auf linear. Block AttnRes ist ein Drop In Ersatz fuer herkoemmliche Residuals. Bestehender Code muss kaum geaendert werden. Die Rechenkosten steigen minimal waehrend der Nutzen bei Training und Inferenz messbar ist.

## Konkrete Ergebnisse: Kimi Linear als Testmodell

Moonshot AI hat Attention Residuals im Kimi Linear Modell validiert. Dieses experimentelle Modell hat 48 Milliarden Parameter insgesamt und aktiviert nur drei Milliarden pro Token. Es wurde auf 1.4 Billionen Tokens vortrainiert.

Die Ergebnisse in Zahlen: Bei gleichem Rechenaufwand sinkt der Loss um den Faktor 1.25 schneller als mit klassischen Residuals. Die Inferenz Latenz steigt um weniger als zwei Prozent. Die Trainingsstabilitaet verbessert sich messbar. Gradienten fliessen gleichmaessiger und die Ausgabemagnituden bleiben ueber die gesamte Modelltiefe kontrolliert.

Scaling Law Experimente bestaetigen den Vorteil ueber verschiedene Modellgroessen hinweg. Das ist kein Effekt der nur bei einem bestimmten Setup funktioniert.

## Ist Attention Residuals bereits in Kimi 2.5 enthalten

Nein. Kimi 2.5 wurde im Januar 2026 veroeffentlicht und basiert auf einer MoE Architektur mit einer Billion Parametern. Attention Residuals wurde separat auf dem Kimi Linear Prototyp getestet und ist nicht in die aktuelle oeffentliche Version integriert.

Alles deutet darauf hin dass Moonshot AI die Methode in kuenftige Versionen einbauen wird. Fuer Nutzer der aktuellen Kimi Version aendert sich vorerst nichts.

## Was das fuer die KI Branche bedeutet

Die Methode ist open source. Jedes Labor kann die Idee uebernehmen. Eine kleine Aenderung an den Residual Connections die seit zehn Jahren als geloestes Problem galten bringt einen messbaren Effizienzgewinn.

Fuer die Praxis heisst das: Modelle koennen tiefer werden ohne Instabilitaet. Kontexte bleiben laenger erhalten. Reasoning verbessert sich bei langen Aufgaben. Die Compute Einsparungen summieren sich bei grossen Trainingslaeufen auf erhebliche Betraege.

Der Fokus verschiebt sich weiter von reiner GPU Skalierung hin zu smarteren Architekturen. Mehr Parameter allein reichen nicht. Wie die Parameter miteinander verbunden sind wird zunehmend wichtiger.

## Haeufige Fragen

**Was ist der 1.25 fach Compute Vorteil genau?**
Bei gleichem Rechenaufwand erreicht ein Modell mit Attention Residuals einen niedrigeren Loss als mit klassischen Residuals. Umgekehrt braucht man etwa 20 Prozent weniger Compute um dasselbe Ergebnis zu erzielen.

**Kann ich Attention Residuals in meinem eigenen Modell nutzen?**
Ja. Das Paper und der Code sind auf GitHub verfuegbar. Block AttnRes ist als Drop In Ersatz fuer bestehende Residual Connections konzipiert.

**Wird GPT 5 oder Claude Opus diese Technik nutzen?**
Das ist Spekulation. Die Methode ist oeffentlich zugaenglich. Ob und wann andere Labore sie uebernehmen ist nicht bekannt.

**Wie gross ist der Speicher Mehrverbrauch durch Attention Residuals?**
Mit Block AttnRes waechst der Speicherbedarf linear statt quadratisch. In der Praxis liegt der Mehrverbrauch im niedrigen einstelligen Prozentbereich.
