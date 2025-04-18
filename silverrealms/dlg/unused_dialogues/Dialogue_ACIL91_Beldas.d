BEGIN ~ac#dwf04~ //Beldas Creature No 4

IF ~Global("FoundShanatarMap","ACIL91",0)~ THEN BEGIN welcome_turbold
SAY ~Willkommen im Inneren des Turboldberges, Freunde! Seht und bestaunt dieses Meisterwerk der zwergischen Steinmetzkunst.~
IF ~~ THEN REPLY ~Was für ein Bauwerk ist das hier?~ + what_is_it
END

	IF ~~ THEN BEGIN what_is_it
	SAY ~Das, <CHARNAME>, ist ein Andenken an die glorreichen Tage Shanatars. Die zehn Statuen stellen jeweiles eines der verschiedenen Unterkönigreiche dar. Seht, dort drüben, die Statue mit den Zwillingsäxten ist die Statue Iltkazars!~
	IF ~~ THEN REPLY ~Habt Ihr einen Zugang ins Unterreich gefunden?~ + underdark_entry_01
	END
	
	IF ~~ THEN BEGIN underdark_entry_01
	SAY ~Ja und Nein. Schaut Euch diese riesige vernietete Bronzeplatte an der Felswand an! Das war der ursprüngliche Zugang nach Tief-Shanatar ins Unterreich.~
	IF ~~ THEN REPLY ~Gibt es eine Möglichkeit, dieses Tor wieder zu öffnen?~ + underdark_entry_02
	END
	
		IF ~~ THEN BEGIN underdark_entry_02
		SAY ~Nein. Meine Vorfahren haben hier sämtliche Meißel gezogen, um unseren Feinden den Zutritt in unsere Heimat unmöglich zu machen. Wir haben vorhin schon versucht, dieses Tor irgendwie in Bewegung zu setzen. Dieses Vorhaben ist aber aussichtslos. Seht Ihr die verwitterte Metallplatte auf dem Boden vor uns? Dort steht in altem Zwergisch geschrieben: "Der Zugang vom Turboldberg in die heiligen Hallen Shanatars möge unseren Feinden bis zum Ende der Zeiten verwehrt bleiben."~
		IF ~~ THEN REPLY ~Und was bedeutet das jetzt?~ EXTERN ~AC#DWF34~ underdark_entry_03
		END
		
		IF ~~ THEN BEGIN not_enough_time
		SAY ~Soviel Zeit haben wir leider nicht, mein Freund. Da wir an diesem Ort keine Möglichkeit haben, in unser geliebtes Iltkazar zurückzukehren, bleibt uns nur noch der Versuch, über Ravimors Höhle im Süden einen Zugang ins Unterreich zu finden.~
		IF ~~ THEN REPLY ~Das heißt, wir sind hier fertig?~ + ravimors_cave_01
		END
		
			IF ~~ THEN BEGIN ravimors_cave_01
			SAY ~Ja. Atmet noch einmal tief durch und lasst den Geruch Shanatars in Eure Lungen dringen. Spürt, wie der Blick der steinernen Wächter auf Euch gerichtet ist...~
			IF ~~ THEN + exit
			END

IF ~~ THEN BEGIN exit
SAY ~So, Freunde, genug verharrt an diesem Platz. Ein letztes Gebet an die Morndinsamman, und dann heißt es Abschied zu nehmen von den Hallen unserer Ahnen! Mögen sie uns unvergessen bleiben und in unseren Taten fortbestehen. Gehen wir nach draußen.~
IF ~~ THEN DO ~SetGlobal("AC#Charvekannathor","GLOBAL",1)
ActionOverride("AC#DWF24",EscapeAreaObject("TrACIL90"))
ActionOverride("AC#DWF34",EscapeAreaObject("TrACIL90"))
EscapeAreaObject("TrACIL90")~ EXIT
END

// Gormar

BEGIN ~AC#DWF24~ 

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello
SAY ~Was für ein erhabener Ort hier! Beldas möchte Euch etwas sagen.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN underdark_entry_04
SAY ~Wenn Ihr es so sehen möchtet, ja. Jedem *echten* Zwerg schlägt das Herz an diesem Ort höher und der Bart erzittert vor Freude und Ehrfurcht.~
IF ~~ THEN EXTERN ~AC#DWF34~ turbolds_axe
END

// Thradear

BEGIN ~AC#DWF34~ 

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello
SAY ~Endlich mal ein Platz nach meinem Geschmack! Beldas möchte Euch etwas sagen.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN underdark_entry_03
SAY ~...dass wir uns einen anderen Weg zurück nach Iltkazar suchen müssen.~
IF ~~ THEN REPLY ~Das heißt, wir sind ganz umsont hierher gekommen?~ EXTERN ~AC#DWF24~ underdark_entry_04
END

IF ~~ THEN BEGIN turbolds_axe
SAY ~Ich hätte vorgeschlagen, wir suchen noch Turbolds legendäre Axt, die hier irgendwo herumliegen muss, und nehmen sie mit zu unseren Göttern nach Iltkazar.~
IF ~~ THEN EXTERN ~AC#dwf04~ not_enough_time
END
