/*******************************************************************************************************
Dialog Charvekannathor in his lair (ACIL47)
*******************************************************************************************************/

BEGIN ~AC#CHARV~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello
SAY  ~Ihr besitzt wirklich Mut, einfach so in meine Höhle zu spazieren!~ 
IF ~~ THEN REPLY ~Ich habe die ganze Zeit auf Euch gewartet. Da Ihr nicht zu mir gekommen seid, musste ich eben Euch einen Besuch abstatten!~ GOTO bold
IF ~~ THEN REPLY ~Endlich treffen wir uns wieder. Jetzt werde ich das vollenden, was auf dem Berggipfel begonnen hat!~ + bold 
IF ~~ THEN REPLY ~Wir haben uns schon einmal gegenübergestanden. Diesmal endet es anders.~ GOTO bold
IF ~~ THEN REPLY ~Ich suche einen Weg an die Oberfläche. Ihr steht mir im Weg.~ GOTO way_surface
IF ~~ THEN REPLY ~Genug geredet - jetzt wird gekämpft!~ GOTO fight
END


IF ~~ THEN BEGIN bold
SAY ~Ihr wagt es… mir in meiner eigenen Höhle zu drohen? Wie töricht!~
IF ~~ THEN GOTO defeat_once
END

IF ~~ THEN BEGIN way_surface
SAY ~Ihr seid so töricht wie dieser Zwerg Beldas. Hier gibt es keinen Weg nach draußen, nur den Tod.~
IF ~~ THEN GOTO defeat_once
END


	IF ~~ THEN BEGIN my_walls
	SAY ~Seht Ihr die Wände meiner Höhle? Wisst Ihr, warum sie so schön glänzen?~
	IF ~~ THEN REPLY ~Weil Ihr ständig mit Eurem fetten Hintern daran reibt?~ GOTO glass
	IF ~~ THEN REPLY ~Ich weiß es nicht und es interessiert mich auch nicht.~ GOTO glass
	IF ~~ THEN REPLY ~Edelsteine? Eine besondere Sorte Fels? Was weiß denn ich.~ GOTO glass
	IF ~~ THEN REPLY ~Ich bin neugierig, es gleich zu erfahren.~ GOTO glass
	END


IF ~~ THEN BEGIN glass
SAY ~Mein feuriger Atem hat sie nahezu in Glas verwandelt! Heute wird meine Höhle noch ein wenig mehr glänzen, wenn ich mit Euch fertig bin!~
IF ~~ THEN + fight
END

IF ~~ THEN BEGIN fight
SAY ~So verbrennt in meinen lodernden Flammen!~
IF ~~ THEN DO ~Enemy()~ EXIT
END

	CHAIN AC#CHARV defeat_once
	~Ihr habt mir einmal eine knappe Niederlage zugefügt, <CHARNAME>. Dieses Mal nicht mehr!~
	END
	IF ~~ THEN REPLY ~Wem dient Ihr?~ GOTO who_serve
	IF ~~ THEN REPLY ~Das werden wir ja sehen!~ GOTO my_walls
	
	CHAIN AC#CHARV who_serve
	~Ich diene niemandem! Nur mir selbst. Ich schuldete einem... anderen Wesen einen Gefallen, und die Zwerge waren eine leichte Beute.~
	END
	IF ~~ THEN REPLY ~Sagt mir, wer hinter allem dahintersteckt!~ GOTO who_serve_02

	CHAIN AC#CHARV who_serve_02
	~Ganz gewiss nicht! Ihr seid ein unbedeutendes Wesen in diesem großen Konflikt. Es wird mir ein leichtes sein, Eure unbedeutende Existenz auszulöschen!~
	END
	IF ~~ THEN GOTO my_walls

/***********************************************
Rest-Interrupt
***********************************************/

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

// OLD:
/*
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

	*/
