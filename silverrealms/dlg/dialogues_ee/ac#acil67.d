

/*******************************************************************************************************
Dialog Sorni Arnschädel
*******************************************************************************************************/

BEGIN ~AC#SORN4~

IF ~Global("AC#BreskEscape","GLOBAL",20)~ THEN BEGIN hello_bresk_free
SAY ~Bresk ist mit den letzten Arbeitern gerade nach oben gegangen. Ich warte, bis Ihr den oberen Teil der Treppe erreicht habt und folge Euch. Los, nichts wie raus hier!~
IF ~~ THEN EXIT
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY  ~Los, schnell zum Aufzug! Die Halle beginnt einzustürzen, und wenn wir den Aufzug nicht erreichen, sind wir alle verloren! Ich hoffe, Bresk ist schon dort und wartet auf uns.~
   IF ~~ THEN DO ~SetGlobal("AC#SorniEscape","GLOBAL",1)
   AddJournalEntry(@61014,QUEST)~  EXIT
END

IF ~Global("AC#SorniEscape","GLOBAL",3)~ THEN BEGIN 4
SAY  ~Habt Ihr Bresk schon gefunden?~
   IF ~Global("AC#BreskEscape","GLOBAL",1)~ THEN REPLY ~Bresk sitzt in der zusammengestürzten Schmiedehalle fest. Wir müssen irgendwie versuchen, an ein Seil oder ähnliches zu gelangen, damit wir es ihm zuwerfen können.~ + 5
   IF ~~ THEN REPLY ~Ich konnte ihn noch nicht finden.~ + 6
//   IF ~Global("AC#BreskEscape","GLOBAL",1)~ THEN REPLY ~Bresk ist tot. Wir sollten rasch an die Oberfläche gehen.~ + 5
END

IF ~~THEN BEGIN 5
SAY ~Ein Seil? Wir haben Ketten in den Schmiederäumen, um die großen Hämmer zu justieren. Das wird aber kaum ausreichen. Ich muss mich hier um die anderen Fliehenden kümmern. Bitte, beeilt Euch!~
   IF ~~ THEN EXIT
END

IF ~~THEN BEGIN 6
SAY ~Dann sucht bitte weiter! Aber beeilt Euch - wir haben nicht mehr viel Zeit.~
   IF ~~ THEN EXIT
END

IF ~~THEN BEGIN 2
SAY ~Verdammt! Er wollte sich doch hier mit uns treffen!~
++ ~Ich werde nach ihm suchen. Wartet hier.~ + 3
END

IF ~~THEN BEGIN 3
SAY ~Das ist sehr ehrenhaft von Euch. Aber wir haben nicht viel Zeit! Wenn die Azerkyn-Halle unter dem Druck des Wassers zusammenstürzt, wird auch in dieser Ebene alles in sich zusammenbrechen. Leider kann ich nicht sagen, wo er sich befinden könnte. Sucht bitte rasch nach ihm, ich werde hier warten und den Aufzug in Betrieb halten.~
   IF ~~ THEN DO ~SetGlobal("AC#SorniEscape","GLOBAL",3)~  EXIT
END

/*******************************************************************************************************
Dialog Bresk Steinschulter
*******************************************************************************************************/

BEGIN ~AC#BRES4~

IF ~Global("RescuePot","ACIL67",3)~ THEN BEGIN hello_rescued
SAY ~Geschafft! Bei dem Allvater, ich hätte niemals gedacht, dass ich aus dieser Lage gerettet werden könnte! Wo ist Sorni?~
IF ~~ THEN REPLY ~Sie wartet im zentralen Schacht bei den Treppen.~ DO ~SetGlobal("RescuePot","ACIL67",4)~ GOTO move_to_sorni
END

	IF ~~ THEN BEGIN move_to_sorni
	SAY ~Dann nichts wie hin! Die Halle könnte jeden Augenblick einstürzen.~
	IF ~~ THEN GOTO get_outta_here
	END

	IF ~~ THEN BEGIN get_outta_here
	SAY ~Und jetzt aber schnell nach draußen mit uns!~
	IF ~~ THEN DO ~SetGlobal("AC#BreskRescued","GLOBAL",20)
	SetGlobal("AC#BreskEscape","GLOBAL",20)
	EscapeArea()~ EXIT 
	END

IF ~Global("RescuePot","ACIL67",1)~ THEN BEGIN hello_pot
SAY ~Ihr seid ja immer noch hier!~
IF ~~ THEN REPLY ~Ich habe hier einen Schmelztiegel gefunden. Meint Ihr, Ihr könntet an dessen Stange zu mir herüberklettern?~ GOTO potplot_01
END

	IF ~~ THEN BEGIN potplot_01
	SAY ~<CHARNAME>, Ihr seid verrückt. Aber ja, das könnte funktionieren. Schiebt das Ding einmal vorsichtig zu mir herüber...~
	IF ~~ THEN DO ~TakePartyItem("AC#67POT")
	DestroyItem("AC#67POT")~ GOTO potplot_02 
	END
	
		IF ~~ THEN BEGIN potplot_02
		SAY ~Noch ein Stückchen weiter und es sollte Recht sein...~
		IF ~~ THEN DO ~ClearAllActions()
		SetGlobal("RescuePot","ACIL67",2)
		StartCutSceneMode()
		StartCutScene("AC#67CT1")~ EXIT 
		END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY  ~<CHARNAME>! Bringt Euch in Sicherheit! Die Zeit wird knapp, sonst seid Ihr verloren!~
IF ~~ THEN REPLY ~Bresk! Wir haben Euch überall gesucht. Könnt Ihr zu uns herüber kommen?~ + 2
IF ~~ THEN REPLY ~Und was wird aus Euch?~ + what_about_you
IF ~PartyHasItem("AC#67POT")~ THEN REPLY ~Ich habe hier einen Schmelztiegel gefunden. Meint Ihr, Ihr könntet an dessen Stange zu mir herüberklettern?~ GOTO potplot_01
END

IF ~~THEN BEGIN 2
SAY ~Ich suchte hier nach Überlebenden, als plötzlich der Boden unter meinen Füßen wegbrach. Ich konnte mich gerade noch an der Statue festklammern, die umstürzte, aber nun sitze ich hier fest.~
IF ~~ THEN GOTO what_about_you
END

IF ~~ THEN BEGIN what_about_you
SAY ~Ich bin verloren, <CHARNAME>. Ich kann nicht zu Euch herüber springen. Vergeudet keine Zeit mit mir, sondern rettet Euch selber.~
++ ~Nein! Ich werde hier nicht weggehen, bis Ihr in Sicherheit seid!~ + 3
IF ~~ THEN REPLY ~Gut. Ich hatte ohnehin nicht vor, Euch zu retten.~ + bye
END

IF ~~THEN BEGIN 3
SAY ~<CHARNAME>! Ich bitte Euch inständig, geht! Lasst mich hier zurück. Tot werdet Ihr niemandem mehr etwas nützen.~
IF ~~ THEN GOTO bye
END

IF ~~ THEN BEGIN bye
SAY ~Jetzt rennt schon schleunigst nach oben!~
   IF ~~ THEN DO ~SetGlobal("AC#BreskEscape","GLOBAL",1)~  EXIT
END

/*******************************************************************************************************
Dialog mit Wache: Bresk ist weg!
*******************************************************************************************************/

BEGIN ~AC#DWDE2~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY  ~Meisterin Sorni! Unser Kriegsmeister Bresk wird vermisst!~
IF ~~ THEN EXTERN ~AC#SORN4~ 2
END

IF ~True()~ THEN BEGIN hello_again
SAY  ~Sammelt Euch und dann nichts wie raus hier!~
IF ~~ THEN EXIT
END

