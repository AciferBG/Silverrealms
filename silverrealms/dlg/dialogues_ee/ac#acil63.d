/*******************************************************************************************************
Dunnabar-Dialog
*******************************************************************************************************/
BEGIN ~AC#DUN02~

IF ~Global("AC#Goapspawn","GLOBAL",7)~ THEN BEGIN hello_find_bresk
SAY ~Geht und seht nach meinem Sohn Bresk. Er wird als Kriegsmeister außen die Verteidung der Stadt organisieren. Meine Pflicht ist es, hier innen die Stellung zu halten und den König zu beschützen.~
IF ~~ THEN REPLY ~Wird gemacht.~ + bye_find_bresk
IF ~~ THEN REPLY ~Ich bin am Ende meiner Kräfte und benötige Heilung.~ + need_healing
END

	IF ~~ THEN BEGIN need_healing
	SAY ~Sagt das doch gleich! Ich kann Euch jederzeit den Segen Gorm Gulthyms schenken!~
	IF ~~ THEN DO ~StartStore("AC#DUN02",LastTalkedToBy(Myself))~ EXIT 
	END

	IF ~~ THEN BEGIN bye_find_bresk
	SAY ~Viel Erfolg, <CHARNAME>!~
	IF ~~ THEN EXIT 
	END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY  ~Gut, dass Ihr hier seid, <CHARNAME>! Das Böse ist über unsere Stadt hereingebrochen! Sagt, habt Ihr meine Söhne gesehen? Was geschieht da draußen?~
++ ~Harthar bewacht das äußere Tor, und Bresk organisiert in der Stadt die Verteidigungsmaßnahmen. Sie haben mich hierher geschickt, um den König zu beschützen.~ + 2
END

IF ~~ THEN BEGIN 2
SAY ~Den König zu beschützen? Als Priester des Gorm obliegt mir diese Verantwortung. Die Hizaagkur-Tore nach außen wurden nach Eurem Eintreffen versiegelt, es wird keinem Wesen gelingen, hier einzudringen.~
++ ~Bresk ist sich sicher, dass die Kreaturen hergekommen sind, um König Mith Barak zu holen und alles daransetzen werden, in die Hallen vorzudringen. Wir müssen uns auf einen Kampf hier Innen gefasst machen.~ + 3
/*
IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ Jaheira_Comment_Dumathoin
IF ~!IsValidForPartyDialog("Jaheira")~ THEN REPLY ~Was ist hier geschehen?~ + 3
*/
END

IF ~~ THEN BEGIN 3
   SAY ~Sie sind hinter dem König her? Das sind wahrhaft schlimme Nachrichten. Ihr habt schon viel für unsere Stadt getan, <CHARNAME>, doch ich bitte Euch, uns in dieser Stunde der Not erneut beizustehen. Werdet Ihr unser Waffengefährte sein?~
++ ~Ich werde Euch helfen, das Leben des Königs und der Bewohner Iltkazars zu beschützen.~ + 4
END

IF ~~ THEN BEGIN 4
   SAY ~Wohlan Zwerge Iltkazars, habt Ihr es gehört? Heute kämpfen wir Seite an Seite mit unseren Freunden, um weiter in Frieden und Freiheit leben zu dürfen! Rüstet Euch für den Kampf. Für den König!~
   IF ~~ THEN DO ~SetGlobal("AC#Goapspawn","GLOBAL",1)
   EraseJournalEntry(@66001)~  EXIT
END

IF ~~ THEN BEGIN 10
   SAY ~Kehrt zurück in die  Hölle, aus der Ihr entsprungen seid, Scheusal! Euer Weg endet hier, denn meine Gefährten und ich werden keinen Fuß zurückweichen!~
IF ~~ THEN EXTERN ~AC#GOAP1~ 2
END

/*******************************************************************************************************
Goap-Dialog
*******************************************************************************************************/
BEGIN ~AC#GOAP1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY  ~Die Verderbnis ist über Eure Stadt gekommen, Zwergenpriester. Geht beiseite und überlasst uns Euren greisen König, denn Euer Kampf ist ohnehin vergebens.~
IF ~~ THEN EXTERN ~AC#DUN02~ 10
END

IF ~~ THEN BEGIN 2
   SAY ~So sei es denn. Ich hätte Euch einen raschen Tod gegönnt, doch nun sollt Ihr ewig in den Neun Höllen leiden.~
   IF ~~ THEN DO ~SetGlobal("AC#Goapspawn","GLOBAL",5)
   Enemy()
   ActionOverride("AC#CORN1",Enemy())
   ActionOverride("AC#CORN2",Enemy())~  EXIT
END

/*******************************************************************************************************
Dialog des Boten nach Goaps Tod
*******************************************************************************************************/
BEGIN ~AC#DWMS1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY  ~<CHARNAME>! Bresk Steinschulter schickt mich. Es ist noch nicht vorbei! Wir wissen, wo diese Teufel herkommen. Sie haben die Kuppel der Arnschädelhalle durchbrochen und strömen in Massen aus den unteren Bereichen der Azerkyn-Halle empor. Dort scheint sich ein Portal in die unteren Ebenen aufgetan haben.~
++ ~Das sind schlechte Nachrichten. Wo ist Bresk jetzt?~ + 2
END

IF ~~ THEN BEGIN 2
SAY ~Er versucht mit den verbliebenen Kriegern, die Brücke über den Fluss zu halten, doch es sind zu viele Scheusale, die gegen meine Kameraden anstürmen. Sie werden die Brücke nicht lange halten können. Er möchte in die unteren Hallen vordringen, um das Portal zu schließen, und benötigt dabei Eure Hilfe.~
++ ~Ich denke, wir haben hier gerade den Anführer der Unholde erschlagen.~ + 3
/*
IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ Jaheira_Comment_Dumathoin
IF ~!IsValidForPartyDialog("Jaheira")~ THEN REPLY ~Was ist hier geschehen?~ + 3
*/
END

IF ~~ THEN BEGIN 3
   SAY ~Dieser hier, den Ihr getötet habt, steht nicht hinter dem Angriff. Ich habe mit eigenen Augen gesehen, wie das Scheusal Befehle von einem noch mächtigeren Wesen entgegen genommen hat. Ich bitte Euch, beeilt Euch und schlagt Euch zu Kriegsmeister bresk vor, sonst wir alle verloren.~
++ ~Nun gut, meine Gefährten und ich werden zur Brücke aufbrechen, nachdem wir unsere Wunden versorgt haben.~ + 4
END

IF ~~ THEN BEGIN 4
   SAY ~Habt Dank, Freunde! Ich werde versuchen, in der Stadt weitere versprengte Verteidiger zusammen zu trommeln.~
   IF ~~ THEN DO ~SetGlobal("AC#Goapspawn","GLOBAL",7)
   EscapeArea()~  EXIT
END

