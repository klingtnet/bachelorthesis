# Inhaltsverzeichnis

I. Abstract
1. Einleitung (Aufgabe)
	1. warum Code generieren? (Problem)
	1. Spreadshirt
1. Grundlagen
	1. Dokumentbeschreibungsformate
	    1. XSD
	    1. WADL
	1. RESTful WebService
	1. Generatortypen
		(einstufig, mehrstufig, teilcode-generatoren, ...)
	1. Polyglot
1. Modellierung des Datenmodells
1. Implementierung des Generators
1. Ergebnis und Ausblick


Schritte zum fertigen Generator:

1. Parsen von WADL und XSD
1. Vereinigen der Daten in eigenem Datenmodell
1. Ermitteln von Abhaengigkeiten
1. Generieren der Bibliothek mit Hilfe einer Template-Engine