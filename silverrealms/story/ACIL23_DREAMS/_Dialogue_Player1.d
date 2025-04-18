// CHARNAME Self-Reflection after the dreams


APPEND ~PLAYER1~
IF WEIGHT #-999 ~Global("AC#ACIL23DreamReflection","GLOBAL",1)
AreaCheck("ACIL23")
~ THEN BEGIN self_reflection_01
   SAY ~Ihr erwacht aus Eurem Schlaf und seid Euch nicht sicher, wie lange Ihr überhaupt in diesem Zustand gewesen seid.~
   IF ~~ THEN DO ~SetGlobal("AC#ACIL23DreamReflection","GLOBAL",2)~  GOTO self_reflection_02
END

	IF ~~ THEN BEGIN self_reflection_02
	SAY ~Euer Kopf dröhnt, doch die Bilder, die Euch in Eurem Traum begegnet sind, seht Ihr noch klar vor Euch.~
	IF ~!NumInPartyGT(1)~ THEN GOTO  solo_run_01
	IF ~NumInPartyGT(1)~ THEN GOTO  solo_run_01
	END
	
		IF ~~ THEN BEGIN solo_run_01
		SAY ~Obwohl die Bilder ungeordnet scheinen, müssen sie einen tieferen Sinn ergeben. Ihr versucht Euch zu erinnern und das Erlebte zu interpretieren.~
		IF ~~ THEN GOTO image_mithbarak_throne
		END
		
			IF ~~ THEN BEGIN image_mithbarak_throne
			SAY ~König Mith Barak bei seiner Thronbesteigung, in seinem tiefen Schlaf - und der König, wie er an einem unbekannten Ort einen gefallenen Drachen begutachtet... ~
			IF ~~ THEN GOTO image_mithbarak_dragons
			END
			
				IF ~~ THEN BEGIN image_mithbarak_dragons
				SAY ~Und nicht zuletzt das Bild, wie der schlafende König von flammenden Drachen umkreist zu werden scheint - mit einem Symbol, welches Ihr nicht so recht deuten könnt. Und wer war der merkwürdige Begleiter Mithbaraks?~
				IF ~~ THEN GOTO image_clans_parting
				END
				
					IF ~~ THEN BEGIN image_clans_parting
					SAY ~Ein Ort ist Euch jedoch in Erinnerung geblieben - der Drachenfriedhof. Was immer er zu bedeuten hat, er scheint den Weg zu dem sonderbaren Ort, den Mith Barak in Eurem Traum besucht hat, weisen können. Dies sollte Euer nächstes Ziel sein.~
					IF ~~ THEN GOTO solo_run_finish
					END
		
		IF ~~ THEN BEGIN solo_run_finish
		SAY ~Ihr schüttelt Euren Kopf. Es hilft nichts, Ihr müsst nach Iltkazar zurückkehren und die Eindrücke den Zwergen berichten. Vielleicht wissen diese ja, wo der Ort aus Euren Träumen zu finden sein könnte.~
		IF ~~ THEN DO ~EraseJournalEntry(@23000)
		AddJournalEntry(@23003,QUEST)~ EXIT
		END
		/*
		IF ~~ THEN BEGIN companions
		SAY ~Ihr schüttelt Euren Kopf. Es hilft nichts, Ihr müsst nach Iltkazar zurück und die Eindrücke den Zwergen berichten.~
		IF ~~ THEN EXIT
		END
		*/
END
		