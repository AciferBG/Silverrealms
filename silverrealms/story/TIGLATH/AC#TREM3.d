
BEGIN ~AC#TREM3~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello
  SAY ~He, großer <RACE>! Bitte tut mir nichts, auch wenn hier um Euch herum gerade schlimme Sachen vorgefallen sind!~
  IF ~~ THEN REPLY ~Was seid Ihr denn für eine Kreatur?~ GOTO who_are_you
END

	IF ~~ THEN BEGIN who_are_you
	  SAY ~Mein Name ist Tremor. Aber das ist gar nicht wichtig, <RACE>. Meine Herrin hat mich auf die Suche nach Euch geschickt! Wir haben alles in Athkatla nach <CHARNAME> abgesucht, aber Ihr wart wie vom Erdboden verschwunden!~
	IF ~~ THEN REPLY ~Nun, das war ich auch gewissermaßen. Warum sucht Eure Herrin nach mir?~ GOTO why_are_you_searching_for_me
	END
	
		IF ~~ THEN BEGIN why_are_you_searching_for_me
		  SAY ~Meine Herrin meinte, Ihr solltet unbedingt mit ihr reden, bevor Ihr diesen Drachenfriedhof aufsucht!~
		IF ~~ THEN REPLY ~Ihr wisst davon?~ GOTO why_before_acil70
		END
		
			IF ~~ THEN BEGIN why_before_acil70
			  SAY ~Ja! Das war der nächste logische Schritt bei Eurer Suche nach Mith Barak.~
			IF ~~ THEN REPLY ~Ihr wisst sehr viel über mich! Woher wisst das alles?~ GOTO said_too_much
			END
	
				IF ~~ THEN BEGIN said_too_much
				  SAY ~Ooh! Habe schon zuviel gesagt! Müsst mit Herrin sprechen! Ihr Name ist Tiglath. Sie wartet in Athkatla bei den Stadttoren auf Euch! Aber beeilt Euch, denn sie wird nicht ewig dort auf Euch warten können.~
				   IF ~~ THEN DO ~SetGlobal("AC#_TiglathSpawn","GLOBAL",1)
				   AddJournalEntry(@79000,QUEST)
				   EscapeArea()~  EXIT
				END	