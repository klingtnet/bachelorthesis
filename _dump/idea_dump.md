# Bachelorarbeit -- Infos

## Metriken

- Zeit: 3 Monate
- Umfang: 30-60 Seiten
- Abstract: evtl.
- Inhaltsverz.: ja
- Anhänge: falls erforderlich
- Literaturverzeichnis: ja
- Sachindex: nein
- eidesstattliche Erklärung: nein

## Aufbau

1. Deckblatt
1. Abstract
1. Inhaltsverzeichnis	
1. Einleitung
1. Einbettung der Arbeit
    * Uebersicht ueber Literatur und notwendiges Hintergrundwissen
    * Stand der Forschung zum Thema
    * Arbeit muss ohne Kenntnis der zitierten Arbeiten verstaendlich sein
1. Hauptteil
1. Fazit
1. Literaturverzeichnis
1. weitere Verzeichnisse
1. Anhaenge
1. eidesstattliche Erklaerung (Selbststaendigkeitserklaerung)

---

# Thema

1. Codegenerierung -- Grundlagen, Konzepte und Implementierung eines Generators am Beispiel der Spreadshirt-API
1. Erzeugung einer (Software-)Bibliothek [fuer einen REST Webservice] durch Codegenerierung anhand der Spreadshirt-API
1. Entwicklung eines Generator-Frameworks zur Erstellung einer PHP Client-Bibliothek für die Spreadshirt-API

---

# Abstract

- 50-200 Seiten
- Kern der Arbeit anreissen, inkl. Ergebnisse
- "Werbeplakat" fuer Arbeit

---


* bis 07.06. ausformulieren

Titel / Thema

"Generierung einer Client-Bibliothek für die Spreadshirt-API"
"Entwicklung eines Generator-Frameworks für Client-Bibliotheken für die ..."

* Generative Programmierung
** http://de.wikipedia.org/wiki/Generative_Programmierung
** http://141.57.15.100/libero/WebOpac.cls?VERSION=2&ACTION=DISPLAY&RSN=5094823&DATA=HTK&TOKEN=x9N4Mw8uwn8333&Z=1&SET=1

* Codegenerierung
* 2 Quellen - abstrakte Beschreibung, XML
** Schema XSD
** WADL
** mergen -> gemeinsames Modell
* REST
* Spreadshirt-API
* Templating

Teil Client-Lib
* Infrastruktur
* Daten
** Mapping / Konvertierung / (Un-)Marshaller  / (De-)Serialisierer
*** media type
* Verhalten
** Methoden, Operationen auf den Daten / auf der Spreadshirt-API

Inhalt der Arbeit:
* Was ist Spreadshirt-API
** REST und co
** Spreadshirt domain model
* Dokumentbeschreibungssprachen: XSD, WADL
* Parsen
** zirkulär
* Dokumente -> Modell -> Generator -> Library
** transitive Abhängigkeiten von includes
* Templates
** Freemarker
* API-Design der Library
** "generierte" Dokumentation
** Benutzbarkeit der Bibliothek => Zielgruppe
** "generierte" Entwurfsmuster -> z.B. Expression Builder, Parameter Object (Spreadshirt Security)
** Komposition, "Chaining" der Aufrufe
** Facades
d