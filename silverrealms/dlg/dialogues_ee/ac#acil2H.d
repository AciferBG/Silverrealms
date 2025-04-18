


/*******************************************************************************************************
Dialog mit Duergar-Anführer
*******************************************************************************************************/

BEGIN ~AC#2HDU2~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY ~Na sieh' mal an, da läuft einem doch tatsächlich ein <RACE> von der Oberfläche vor's Visier!~
IF ~~ THEN REPLY ~Nicht schießen, Zwerg, wir kommen aus Iltkazar!~ + 2
END

	IF ~~ THEN BEGIN 2
	SAY ~Hahaha! Habt Ihr das gehört, Männer? Als ob und das abhalten würde, Euch einen Bolzen in Euren süßen Kopf zu jagen, <RACE>!~
	IF ~~ THEN + we_are_duergar
	END
	
	IF ~~ THEN BEGIN we_are_duergar
	SAY ~Wenn ich könnte, würde ich die ganze verfluchte Zwergenstadt ausräuchern, <GIRLBOY>! Wir sind Duergar und haben Euch die ganze Zeit schon beobachtet. Habt es nur nicht bemerkt.~
	IF ~~ THEN REPLY ~Duergar? Was wollt Ihr hier?~ + 3
	END

		IF ~~ THEN BEGIN 3
		SAY ~Das, was Ihr besitzt. Hizagkuur. Das gibt es nämlich dort, wo unsere Clanfeste ist, nicht. Also her mit dem Erz!~
		IF ~~ THEN REPLY ~Nur über meine Leiche.~ + only_corpse
		END

		IF ~~ THEN BEGIN only_corpse
		SAY ~Das ist uns so oder so das Liebste. Leichen stellen keine blöden Fragen und geben keine dummen Antworten. Los, Männer, für König Olorn!~
		IF ~~ THEN DO ~SetGlobal("AC#ACIL2HDuergar","GLOBAL",2)
		Shout(99)
		Enemy()~ EXIT
		END
						


