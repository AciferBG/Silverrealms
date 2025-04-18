// ---------------------------------------------
// Dialogue Gith Warrior Krarak
// ---------------------------------------------

BEGIN ~AC#GITH8~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello
  SAY ~Es war ja nur eine Frage der Zeit, bis Ihr hier auftaucht, <CHARNAME>!~
  IF ~~ THEN REPLY ~Wer seid Ihr und woher kennt Ihr meinen Namen?~ GOTO who_are_you
END

	IF ~~ THEN BEGIN who_are_you
	  SAY ~Wir beobachten Euch schon seit Längerem. Mehr braucht Ihr nicht zu wissen - außer vielleicht noch, dass Euch die Ehre zuteil werden wird, durch die Hand eines Githyanki-Ritters und seines Drachen getötet zu werden!~
		=
		~Cragnortherma, meine Liebste, lasst uns diesem <PRO_RACE> einen feurigen Tod bescheren!~
	IF ~~ THEN DO ~Enemy()
   ActionOverride("AC#DRAS4",Enemy())~  EXIT
	END	
