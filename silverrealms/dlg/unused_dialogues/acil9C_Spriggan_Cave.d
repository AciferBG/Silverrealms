/*******************************************************************************************************
Dialog Spriggan in ACIL9C
*******************************************************************************************************/

BEGIN ~AC#SPRG3~


IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello
SAY  ~Eindringlinge in unserer Höhle! Kommt Freunde, lasst sie uns unter unseren Füßen zerquetschen!~ 
IF ~~ THEN REPLY ~Ich möchte ich ja nicht zu nahetreten - aber übertreibt Ihr da bei Eurer Größe nicht ein wenig?~ GOTO too_small 
END

	IF ~~ THEN BEGIN too_small
	SAY  ~Ihr werdet schon sehen, kleiner <RACE>!~  
	IF ~~ THEN DO ~Enemy()~ EXIT
	END
