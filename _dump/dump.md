# Notizen

Informiere in den generierten Dateien darüber, das Änderungen daran bei einem erneuten Generatorlauf verloren gehen würden. Markiere diese Dateien als automatisch generiert!

## Welche Fähigkeiten um einen Generator zu bauen

* Umgang mit Template-Engines
* Grundlagen von Regulären Ausdrücken
* XML Parser:
	- Streaming Parser:
		* SAX (Simple-API for XML), gute Perfomance, wenig Speicherverbrauch
	- DOM basiert:
		* lesen und validieren den gesamten XML Stream und geben eine Menge von Objekten zurück, welche den Inhalt des Files repräsentieren
		* langsamer als Streaming Parser
		* aber, einfacher in der Hostsprache zu nutzen

	- Kapitel über die Entscheidungsfindung zur Hostsprache?

## Sprachkonstrukte

* Kommentare
* Klassendefinition
* Methoden
* RegEx
* ...

[Paolo Costa - Generative Programming](http://research.microsoft.com/en-us/um/people/pcosta/slides/GenerativeProgramming.pdf)

## Generative Programming

3 fundamentale Schritte:
- Komponenten designen, passend zu einer allgemeinen Produktarchitektur
- Konfiguration um Abstrakte Voraussetzungen zu spezifischer Menge von Komponenten zu wandeln
- Implementieren dieser Konfiguration in Form eines Konfigurators

## Generative Domain Model

Problembereich -> Konfiguration -> Lösungsbereich
DSLs -> Generators -> Components + Architecture


S. 15-17 (Code Generation in Action)
* **Qualität** - Codegenerierung aus Templates erzeugt auf Knopfdruck eine konsistente Codebasis. Bugfixes und Verbesserungen werden nach einem Generatordurchlauf automatisch in die gesamte Codebasis eingepflegt
* **Konsistenz** - Der erzeugte Code ist konsistent im API Design sowie in der Bezeichnung der Variablen. Dies verhindert ungewünschte Überraschungen und macht das Benutzen der Schnittstellen einfacher
* **Gebündeltes Wissen** - eine Änderung am Schema sickert durch alle Generatorschichten und wird somit im ganzen System implementiert. Änderungen werden nur noch an einer Stelle durchgeführt, was die Wartbarkeit und Fehlertoleranz erhöht.
* **Mehr Designzeit** - Bei handgeschriebenen Anwendungen können sich kleine Designfehler durch das ganze Projekt ziehen, mit Codegenerierung muss nur das Template geändert werden um solche Fehler auszuräumen
* **Übersichtlichkeit** - Designentscheidungen sind in kurzen Templateabschnitten viel leichter zu erkennen, als in der schieren Menge des generierten Codes.

# Vorteile für (Produkt-)Manager

* **Architektonische Konsistenz** - Das Ergebnis des Generierungsvorganges ist Realisierung der Architekturentscheidungen
	* Die Generatorlösung ermutigt die Entwickler mit der Architektur zu arbeiten
	* Wenn Features nicht gut in die Architektur passen, merkt man das an der schwierigen Implementierbarkeit in den Generator
	* ein gut dokumentierter und gewarteter Code Generator bietet eine konsistente Struktur und Zugang zum Projekt
* **Abstraktion** - Die Architekturbeschreibung leigt in sprachunabhängiger Form vor, daraus ergeben sich zwei Vorteile
    * Entwickler können durhc anpssen der Template den Code in andere Zielsprachen "übersetzen"
    * Die Kapselung der Applikationslogik in der abstrakten Beschreibung vereinfacht das wiederverwenden des Codes.

# Der Codegenerierungsprozess

* formale Methode
	- Anforderungsphase:
		Was muss der Generator können? Bereich des Generators eingrenzen. Für was genau soll der Generator zuständig sein, ermitteln der Hauptfunktionen? 
	- Spezifikation:
		Welche Art von Generator soll genutzt werden? Wie fügt sich der Generator in den Entwicklungsablauf ein? Dauerhafte oder Temproräre Lösung?

* Generator kaufen oder selber erstellen, (Pros and Cons S.24)

* Nachteile von Codegenerierung
	- Großer Anfangsoverhead um den Generator zu "bauen", wird erst sinnvoll wenn eine Mindestmenge an Output generiert wird
	- Bei häufigen Änderungen an der Architektur ist die Wartung des generators zu aufwendig
	- Kein Allzweckmittel, aber ein Tool was man effektiv für einen speziellen Einsatz nutzen kann

// read 1.4.3 Documenting it

# active and passive code generators

* passive Codegeneratoren erzeugen Code der von dem Entwickler angepasst und geändert werden soll, also nur Grundbausteine. Wizards in IDEs sind meistens Passive Codegeneratoren.

## Aktive Codegeneratoren

Unterteilung in:
	* Komplexität
	* Nutzung (Domäne)
	* Ausgabeform

	