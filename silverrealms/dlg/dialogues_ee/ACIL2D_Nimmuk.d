


/*******************************************************************************************************
Dialog mit Nimmuk, dwarven banshee
*******************************************************************************************************/

BEGIN ~AC#2DDBA~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY ~Wer wagt es, meine Ruhestätte zu betreten? Sprecht, ehe mein Schrei Euch das Blut in den Adern gefrieren lässt!~
IF ~~ THEN REPLY ~Wir kommen nicht, um Euch schaden, Zwerg. Lasst uns passieren.~ GOTO fight
IF ~~ THEN REPLY ~Wir ehren jeden Gefallenen. Doch wir lassen uns von Euch nicht aufhalten.~ GOTO fight
IF ~~ THEN REPLY ~Wir sind keine Grabräuber. Doch wenn Ihr kämpfen wollt, sollt Ihr einen Kampf bekommen.~ GOTO fight
END

IF ~~ THEN BEGIN fight
SAY ~Zu spät für Worte. Hört den Todesschrei des Gefallenen von Shanatar!~
IF ~~ THEN DO ~SetGlobal("Fight","ACIL2D",1)
Enemy()~ EXIT
END
						


