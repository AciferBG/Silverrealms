

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
   ~EraseJournalEntry(@80000)
   StartCutSceneMode()
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
SAY ~Nein, meine Teuerste. Den Githyanki sind ihre Schiffe heilig, und wir können es uns nicht leisten, unsere Verbündeten derart zu brüskieren. Lasst sie ruhig kommen, unsere Gegner. Der psychische Wind ist hier besonders stark, und von diesem Ort wird es kein Entkommen geben. Ihr habt die ehrenvolle Aufgabe, im Namen unserer dunklen Herrin <CHARNAME> und den Rest der Gruppe hier vor den Toren unserer Festung zu vernichten oder bei dem Versuch ehrenhaft zu sterben.~
IF ~~ THEN EXTERN ~AC#CYLL1~ 2
END

IF ~~ THEN BEGIN 02
SAY ~Ich werde mich ins Innerste der Festung begeben und von dort die weitere Verteidigung vorbereiten. Verschließt die Tore hinter mir und versucht, <CHARNAME> solange es geht aufzuhalten, damit wir Zeit haben, unseren Gefangen von hier fortzubringen. Scheitert nicht an Eurer Aufgabe, denn ansonsten werden Eure Qualen unermesslich sein.~
IF ~~ THEN EXTERN ~AC#CYLL1~ 3
END

/*******************************************************************************************************
Dialog Bariaur
*******************************************************************************************************/
BEGIN ~AC#BARI1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY ~Dieser Ort ist nichts für Euch, Fremde, denn hier lauert nur der Tod. Zieht weiter, solange Ihr noch könnt.~
IF ~~ THEN REPLY ~Was ist das für ein Ort hier?~ + 2
IF ~~ THEN REPLY ~Was für ein Wesen seid Ihr?~ + bariaur
END

	IF ~~ THEN BEGIN 2
	SAY ~Dies ist die Hülle eines vergessenen Gottes. Die Githyanki hatten sie zu ihrem Wohnort gemacht, wie es so ihre Art ist. Doch nun sind sie weitergezogen, und schlimmeres Böses treibt nun in den Mauern dieser Festung ihr Unheil.~
	IF ~~ THEN REPLY ~Ich hörte, dies sei der Palast der zerschmetterten Seelen?~ + palace_of_shattered_souls
	END
	
		IF ~~ THEN BEGIN palace_of_shattered_souls
		SAY ~Palast der zerschmetterten Seelen? Dieser Name ist gut gewählt. Die Königin der Githyanki soll einst hier gehaust haben, und man erzählt sich schlimme Geschichten über sie. Angeblich soll sie versuchen, die Essenz der hier ruhenden toten Götter aufzunehmen, indem sie jedem Lebewesen in den Mauern ihres Palastes die Lebenskraft raubt. Auch wenn sie diesen Ort längst verlassen hat, soll man noch immer das Wehklagen derjenigen hören, die in den Hallen ihr Leben ausgehaucht haben.~
		IF ~~ THEN REPLY ~Was für ein Wesen seid Ihr?~ + bariaur
		END
	
	IF ~~ THEN BEGIN bariaur
	SAY ~Meine Rasse nennt man Bariaur. Ich stamme nicht von dieser Ebene. Ich kam hierher, um nach Gefährten zu suchen, die an diesem Ort verschollen sind. Aber wenn sie in diesen Mauern gefangen wurden, sind sie verloren und ich kann nichts mehr für sie tun.~
	IF ~~ THEN REPLY ~Wollt Ihr es nicht wenigstens einmal versuchen?~ + not_even_try
	IF ~~ THEN REPLY ~Was ist das für ein Ort hier?~ + 2
	END
	
		IF ~~ THEN BEGIN not_even_try
		SAY ~Nein. Die Astrale Ebene ist ein Ort des ewigen Vergessens. Ich werde hier nicht länger verweilen und rate Euch, das selbe zu tun.~ 
		IF ~~ THEN REPLY ~Was ist das für ein Ort hier?~ + 2
		IF ~~ THEN REPLY ~Was für ein Wesen seid Ihr?~ + bariaur
		IF ~~ THEN REPLY ~Dann werde ich Euch nicht länger aufhalten.~ + bye
		END
		
		IF ~~ THEN BEGIN bye
		SAY ~Gehabt Euch wohl, <RACE>.~
		IF ~~ THEN DO ~CreateVisualEffectObject("SPDIMNDR",Myself) 
		Wait(1)				
		DestroySelf()~  EXIT
		END
	