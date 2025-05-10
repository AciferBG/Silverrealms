// Dialogue Cutscene Malphas searching Beldas
BEGIN AC#09MAL
BEGIN AC#07MU2

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#09MAL hello_Malphas
	~Ist der Hinterhalt gelegt?~ 
	== AC#07MU2 ~Jawohl. Wir haben einige Bäume gefällt und können mit diesen schnell die Brücke sperren, damit niemand mehr passieren kann.~ 
	== AC#09MAL ~Gut. Haltet hier die Stellung. Ich werde weiter gehen und nach dieser Taverne Ausschau halten, in der sich die Zwerge aufhalten sollen.~
	END
	IF ~~ THEN DO ~StartCutSceneMode()
	StartCutScene("AC#07CT1")~ EXIT


// Dialogue ambush on axebridge acil09
CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#07MU2 hello
~Na, das ist ja einmal eine Überraschung. Da kommt tatsächlich noch jemand die Brücke entlanggeschlendert! Dann war es ja doch gut, dass wir hier noch ein wenig Wache geschoben haben. Tut mir leid, aber der Befehl lautet, niemanden, der diese Brücke passieren möchte, am Leben zu lassen. Los, Männer, an die Arbeit - töten wir diesen armseligen Haufen! Und Du, Dicker, geh voran!~
END
IF ~~ THEN DO ~SetGlobal("Highwaymen","ACIL09",1)
MoveToPoint([796.388]) 
Enemy()~ EXIT

	
BEGIN ~AC#MAL09~

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#MAL09 hello_01
~Das ist doch nicht zu fassen! Hatte ich nicht gesagt, dass *alle* auf dieser Brücke getötet werden sollen? Es sieht so aus, dass meine nichtsnutzigen Untergebenen hier einige Wesen wie diesen <PRO_RACE> übersehen haben.~
END
IF~~THEN REPLY ~Warum tut Ihr das?~ EXTERN AC#MAL09 bye
IF~~THEN REPLY ~Hier wird niemand mehr umgebracht! Außer Euch, wenn es sein muss!~ EXTERN AC#MAL09 bye

CHAIN IF ~~ THEN AC#MAL09 bye
~Mit einem niederen <PRO_RACE> wie Euch gebe ich mich nicht ab. Ihr seid hier wohl zufällig in etwas hereingestolpert, das zu groß für Euch ist - und aus dem Ihr wohl nicht mehr lebend herauskommen werdet! Untergebene, tötet diese armseligen Kreaturen!~
DO ~SetInterrupt(FALSE)
SetGlobal("MalphasAppears","ACIL09",1)
CreateVisualEffectObject("SPDIMNDR",Myself) 
Wait(1)
SetInterrupt(TRUE)
DestroySelf()~ EXIT

BEGIN ~AC#MERDE~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY ~Flieht, solange Ihr noch könnt, Fremde! *hust* Hier regnet es Feuer vom Himmel!~
//++ ~Feuer?~ + chain_npc_reaction
++ ~Feuer?~ + npc_reaction
END

IF ~~ THEN BEGIN npc_reaction
SAY ~Ja... *keuch* die Flammen sind aus dem Nichts aufgetaucht... wir waren gerade auf dem Weg aus Trollfurt nach Amnwasser und überquerten hier gerade die Axtbrücke...~
IF~~THEN GOTO 3
IF ~InParty("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN EXTERN MazzyJ mazzy_reaction //~Flammen tauchen selten aus dem Nichts auf. Wir sollten auf der Hut sein.~
IF ~InParty("keldorn") !StateCheck("keldorn",CD_STATE_NOTVALID)~ THEN EXTERN KeldorJ keldorn_reaction//~Es würde mich nicht wundern, wenn hinter all dem finstere Magie stecken würde.~
IF ~InParty("aerie") !StateCheck("aerie",CD_STATE_NOTVALID)~ THEN EXTERN AerieJ aerie_reaction//~Dieser beißende Rauch brennt in den Augen! Was ist seit dem letzten Mal hier geschehen?~
IF ~InParty("viconia") !StateCheck("viconia",CD_STATE_NOTVALID)~ THEN EXTERN ViconiJ viconia_reaction//~Axtbrücke? Dieser Ort hat sich seit unserem letzten Besuch ziemlich verändert, <CHARNAME>.~
IF ~InParty("minsc") !StateCheck("minsc",CD_STATE_NOTVALID)~ THEN EXTERN MinscJ minsc_reaction//~Boo mag den Rauch nicht. Das letzte Mal hat ihm der Ort viel besser gefallen!~
IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN EXTERN JaheiraJ jaheira_reaction//~Es ist noch nicht lange her, dass wir hier waren. Was für ein schrecklicher Anblick, die ganzen Bäume brennen zu sehen, <CHARNAME>.~
IF ~InParty("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN EXTERN BEDWIN edwin_reaction //~Pah! Vielleicht ein Magierduell oder etwas Ähnliches. Dieser sollte besser aufpassen, wessen Weg er mit seinem Karren kreuzt!~
//==ValygarJ IF ~InParty("valygar") !StateCheck("valygar",CD_STATE_NOTVALID)~ THEN ~Dieser Ort hat sich seit unserem letzten Besuch ziemlich verändert, <CHARNAME>.~
END

/*
IF ~~ THEN BEGIN 2
SAY ~Ja... *keuch* die Flammen sind aus dem Nichts aufgetaucht... wir waren gerade auf dem Weg aus Trollfurt nach Amnwasser und überquerten hier gerade die Axtbrücke...~
IF~~THEN GOTO chain_npc_reaction
END
*/

/*
CHAIN chain_npc_reaction
~Ja... *keuch* die Flammen sind aus dem Nichts aufgetaucht... wir waren gerade auf dem Weg aus Trollfurt nach Amnwasser und überquerten hier gerade die Axtbrücke...~
==ViconiJ IF ~InParty("viconia") !StateCheck("viconia",CD_STATE_NOTVALID)~ THEN ~Axtbrücke? Dieser Ort hat sich seit unserem letzten Besuch ziemlich verändert, <CHARNAME>.~
==MazzyJ IF ~InParty("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN ~Flammen tauchen selten aus dem Nichts auf. Wir sollten auf der Hut sein.~
==KeldorJ IF ~InParty("keldorn") !StateCheck("keldorn",CD_STATE_NOTVALID)~ THEN ~Es würde mich nicht wundern, wenn hinter all dem finstere Magie stecken würde.~
==AerieJ IF ~InParty("aerie") !StateCheck("aerie",CD_STATE_NOTVALID)~ THEN ~Dieser Ort hat sich seit unserem letzten Besuch ziemlich verändert, <CHARNAME>.~
==MinscJ IF ~InParty("minsc") !StateCheck("minsc",CD_STATE_NOTVALID)~ THEN ~Dieser Ort hat sich seit unserem letzten Besuch ziemlich verändert, <CHARNAME>.~
==YoshJ IF ~InParty("yoshimo") !StateCheck("yoshimo",CD_STATE_NOTVALID)~ THEN ~Dieser Ort hat sich seit unserem letzten Besuch ziemlich verändert, <CHARNAME>.~
==JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN ~Dieser Ort hat sich seit unserem letzten Besuch ziemlich verändert, <CHARNAME>.~
== BEDWIN IF ~InParty("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN ~Dieser Ort hat sich seit unserem letzten Besuch ziemlich verändert, <CHARNAME>.~
==ValygarJ IF ~InParty("valygar") !StateCheck("valygar",CD_STATE_NOTVALID)~ THEN ~Dieser Ort hat sich seit unserem letzten Besuch ziemlich verändert, <CHARNAME>.~
END
IF~~THEN GOTO 3
*/

IF ~~ THEN BEGIN 3
SAY ~*Hust*! Die Axtbrücke soll von Zwergen erbaut worden sein, führt auf dem schnellsten Weg nach Zweiwasser. Und jetzt ist alles ein Opfer der Flammen geworden! So etwas habe ich hier in den Reichen noch nie zuvor gesehen.~
++ ~Habt Ihr eine Idee, woher das Feuer kam?~ + 5
END


IF ~~ THEN BEGIN 5
SAY ~He, ich liege hier gerade in meiner eigenen Asche, und Ihr... *hust* habt nichts besseres zu tun, als mich mit Fragen zu Löchern?~
++ ~Entschuldigt, natürlich! Wartet, ich sehe nach, ob ich einen Heiltrank für Euch habe!~ + 6
++ ~Bitte, ich muss es wissen!~ + 7
++ ~Sprecht, sonst lasse ich Euch hier verrecken!~ + 8
END



IF ~~ THEN BEGIN 6
SAY ~Ach, macht Euch nicht die Mühe...Mein Leben ist verwirkt. Meine Familie tot, die Ware verbrannt, die Pferde verendet... mit mir ist's aus!~
IF ~~ THEN DO ~Kill(Myself)~ EXIT
END

IF ~~ THEN BEGIN 7
SAY ~Ich kann Euch nicht mehr helfen...Mein Leben ist verwirkt. Meine Familie tot, die Ware verbrannt, die Pferde verendet... mit mir ist's aus!~
IF ~~ THEN DO ~Kill(Myself)~ EXIT
END

IF ~~ THEN BEGIN 8
SAY ~Na und? Mein Leben ist verwirkt. Meine Familie tot, die Ware verbrannt, die Pferde verendet... mit mir ist's aus!~
IF ~~ THEN DO ~Kill(Myself)~ EXIT
END

// NPC reactions
APPEND ~MazzyJ~
IF ~~ THEN BEGIN mazzy_reaction
SAY ~Flammen tauchen selten aus dem Nichts auf. Wir sollten auf der Hut sein.~
 IF ~~ THEN EXTERN ~AC#MERDE~ 3
END
END

APPEND ~KeldorJ~
IF ~~ THEN BEGIN keldorn_reaction
SAY ~Es würde mich nicht wundern, wenn hinter all dem finstere Magie stecken würde.~
 IF ~~ THEN EXTERN ~AC#MERDE~ 3
END
END

APPEND ~AerieJ~
IF ~~ THEN BEGIN aerie_reaction
SAY ~Dieser beißende Rauch brennt in den Augen! Was ist seit dem letzten Mal bloß hier geschehen?~
 IF ~~ THEN EXTERN ~AC#MERDE~ 3
END
END

APPEND ~ViconiJ~
IF ~~ THEN BEGIN viconia_reaction
SAY ~Axtbrücke? Dieser Ort hat sich seit unserem letzten Besuch ziemlich verändert, <CHARNAME>.~
 IF ~~ THEN EXTERN ~AC#MERDE~ 3
END
END

APPEND ~MinscJ~
IF ~~ THEN BEGIN minsc_reaction
SAY ~Boo mag den Rauch nicht. Das letzte Mal hat ihm der Ort viel besser gefallen!~
 IF ~~ THEN EXTERN ~AC#MERDE~ 3
END
END

APPEND ~JaheiraJ~
IF ~~ THEN BEGIN jaheira_reaction
SAY ~Es ist noch nicht lange her, dass wir hier waren. Was für ein schrecklicher Anblick, die ganzen Bäume brennen zu sehen, <CHARNAME>.~
 IF ~~ THEN EXTERN ~AC#MERDE~ 3
END
END

APPEND ~BEDWIN~
IF ~~ THEN BEGIN edwin_reaction
SAY ~Pah! Vielleicht ein Magierduell oder etwas Ähnliches. Dieser Nichtsnutz sollte besser aufpassen, wessen Weg er mit seinem Karren kreuzt!~
 IF ~~ THEN EXTERN ~AC#MERDE~ 3
END
END
