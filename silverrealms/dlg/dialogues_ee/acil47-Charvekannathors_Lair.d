/*******************************************************************************************************
Dialog Charvekannathor in his lair (ACIL47)
*******************************************************************************************************/

BEGIN ~AC#CHARV~


IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello
SAY  ~Ich muss sagen, Ihr besitzt wirklich Mut, einfach so in meine Höhle zu spazieren!~ 
IF ~~ THEN REPLY ~Ich habe die ganze Zeit auf Euch gewartet. Da Ihr nicht zu mir gekommen seid, musste ich eben Euch einen Besuch abstatten!~ GOTO 2
IF ~~ THEN REPLY ~Endlich treffen wir uns wieder! Jetzt werde ich das vollenden, was auf dem Berggipfel begonnen hat!~ + 2 
END

IF ~~ THEN BEGIN 2
SAY ~Großmäulig wie eh und je, das muss man Euch lassen.~
IF ~~ THEN GOTO my_walls
END

	IF ~~ THEN BEGIN my_walls
	SAY ~Seht Ihr die Wände meiner Höhle? Wisst Ihr, warum sie so schön glänzen?~
	IF ~~ THEN REPLY ~Weil Ihr ständig mit Eurem fetten Hintern daran reibt?~ GOTO glass
	IF ~~ THEN REPLY ~Ich weiß es nicht und es interessiert mich auch nicht.~ GOTO glass
	IF ~~ THEN REPLY ~Edelsteine? Eine besondere Sorte Fels? Was weiß denn ich.~ GOTO glass
	IF ~~ THEN REPLY ~Ich bin neugierig, es gleich zu erfahren.~ GOTO glass
	END
	
		IF ~~ THEN BEGIN glass
		SAY ~Mein feuriger Atem hat sie nahezu in Glas verwandelt! Heute wird meine Höhle noch ein bisschen mehr glänzen, wenn ich mit Euch fertig bin!~
		IF ~~ THEN DO ~Enemy()~ EXIT
		END
		
BEGIN ~AC#CHARR~

IF ~True()~ THEN BEGIN hello
SAY ~Na, wer wird denn da gleich einschlafen?~
IF ~~ THEN GOTO kill_you
END

	IF ~~ THEN BEGIN kill_you
	SAY ~Zeit zu sterben!~
	IF ~~ THEN DO ~SetGlobal("CharveRestInterrupt","ACIL47",1)
	Enemy()~ EXIT
	END

	
