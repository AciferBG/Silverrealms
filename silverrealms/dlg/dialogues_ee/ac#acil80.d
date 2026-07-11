

/*******************************************************************************************************
Dialog Cylla-Malphas Cutscene
*******************************************************************************************************/
BEGIN ~AC#CYLL1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY ~Unsere Feinde sind  an den äußeren Plattformen gelandet, Meister. Soll ich den Wachen befehlen, sie mit unseren Ballisten zu vernichten?~
IF ~~ THEN EXTERN ~AC#MAL03~ 01
END

IF ~~ THEN BEGIN 2
SAY ~Jawohl, Herr.~
IF ~~ THEN EXTERN ~AC#MAL03~ 02
END

IF ~~ THEN BEGIN 3
SAY ~Ich werde Euch nicht enttäuschen, Meister.~
IF ~~ THEN DO
   ~StartCutSceneMode()
   SetGlobal("AC#ACIL80CutScene2","GLOBAL",1)
   ActionOverride("AC#MAL03",EscapeArea())
    Wait(1)
    CloseDoor("DOOR03")
    Lock("DOOR03")
	ActionOverride("CUTSPY",DestroySelf())
    Wait(1)
	MoveViewPoint([267.265],INSTANT)
    EndCutSceneMode()~EXIT
END

BEGIN ~AC#MAL03~

IF ~~ THEN BEGIN 01
SAY ~Nein, meine Teuerste. Den Githyanki sind ihre Schiffe heilig, und wir können es uns nicht leisten, unsere Verbündeten derart zu brüskieren. Lasst sie ruhig kommen, unsere Gegner. Der psychische Wind ist hier besonders stark, und von diesem Ort wird es kein Entkommen geben!~ 
=
~Ihr habt die ehrenvolle Aufgabe, <CHARNAME> hier vor den Toren unserer Festung zu vernichten.~
IF ~~ THEN EXTERN ~AC#CYLL1~ 2
END

IF ~~ THEN BEGIN 02
SAY ~Ich werde mich ins Innerste der Festung begeben und von dort die weitere Verteidigung vorbereiten. Verschließt die Tore hinter mir und versucht, <CHARNAME> solange es geht aufzuhalten, damit wir Zeit haben, unseren Gefangen von hier fortzubringen. Scheitert nicht an Eurer Aufgabe, denn ansonsten werden Eure Qualen unermesslich sein.~
IF ~~ THEN EXTERN ~AC#CYLL1~ 3
END
