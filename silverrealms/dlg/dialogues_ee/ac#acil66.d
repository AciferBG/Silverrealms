
/*******************************************************************************************************
Dialog Bresk Steinschulter
*******************************************************************************************************/

BEGIN ~AC#BRES2~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY  ~<CHARNAME>! Die Stadt wird angegriffen! Wir haben die alten Runenzauber aktiviert, und die Speicherbrunnen sind alle versiegelt, doch der Angriff dauert dennoch unvermindert an. Geht zur großen Halle und helft den Wachen, den König zu schützen. Er ist in großer Gefahr.~
++ ~Ich habe Hathar vor den Toren getroffen, wie er gegen eine Horde Ungeheuer kämpfte.~ + 2
END

IF ~Global("AC#BreskQuest","GLOBAL",3)~ THEN BEGIN 5
SAY  ~Gut, dass Ihr kommt, <CHARNAME>! Die Biester scheinen aus den tieferen Bereichen der Arnschädelhalle zu kommen, und wir können dem Ansturm nicht länger standhalten.~
IF ~~ THEN DO ~SetGlobal("AC#BreskQuest","GLOBAL",4)~  EXIT
END

IF ~Global("AC#BreskQuest","GLOBAL",4)~ THEN BEGIN 6
SAY  ~Ich danke Euch für Eure Hilfe, Freunde. Ohne Euch hätten wir diesen Angriff sicher nicht mehr überlebt. Doch viele meiner tapferen Männer sind gefallen, und es scheinen immer noch mehr Unholde aus den unteren Bereichen nach oben zu dringen.~
++ ~Wir konnten einen Angriff auf den Thronsaal abwehren, der von einem riesigen Höllenschlundscheusal angeführt wurde.~ + 7
END

IF ~~ THEN BEGIN 2
SAY ~Ihr habt meinen Bruder getroffen? Er ist noch auf seinem Posten? Gut. Es freut mich, dass er tapfer vor den Toren der Stadt seine Pflicht erfüllt. Doch es ist schrecklich, dass diese Biester bereits vor die Tore gelangt sind. Ich werde den Befehl geben müssen, die Stadt in der Zeit des Angriffs abzuriegeln, dass niemand mehr hinein, aber auch niemand heraus kann.~
++ ~Wisst Ihr etwas darüber, wer uns angreift?~ + 3
/*
IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ Jaheira_Comment_Dumathoin
IF ~!IsValidForPartyDialog("Jaheira")~ THEN REPLY ~Was ist hier geschehen?~ + 3
*/
END

IF ~~ THEN BEGIN 3
   SAY ~Nach allem, was ich weiß, sind dies Wesen aus den unteren Ebenen, Kreaturen aus der Hölle - doch woher sie kommen -oder was sie wollen- konnte ich noch nicht herausfinden. Doch sie streben zum Königspalast, so als ob sie es ganz auf unseren geliebten Herrscher abgesehen haben. Ich bitte Euch, <CHARNAME>, helft mir in dieser Stunde der Not und beschützt unseren König. Ich werde mit meinen verbliebenen Männern erkunden, wo diese Untiere herkommen und versuchen, sie in ihre verfluchte Ebene zurückzudrängen.~
++ ~Gut. Ich verspreche, den König mit meinem Leben zu beschützen.~ + 4
++ ~Ich schaue einmal, was ich tun kann.~ + 4
++ ~Kämpft Ihr ruhig weiter gegen diese Scheusale. Ich sehe nach dem König.~ + bye_protect_king
END

IF ~~ THEN BEGIN 4
   SAY ~Habt Dank, <CHARNAME>, bei Clangeddin, ich werde Euren Mut und Eure Ehre nicht vergessen!~ 
IF ~~ THEN GOTO bye_protect_king
END 
 
IF ~~ THEN BEGIN bye_protect_king
   SAY ~Geht zur Halle des Regentschaftrates und meldet Euch bei meinem Vater, der dort seiner Pflicht gemäß Stellung bezogen hat. Ihr müsst ihn überzeugen, dass wir alles daransetzen müssen, die Biester aus dem Königspalast fernzuhalten, sonst ist der König verloren.~
   =
   ~Männer! Zu mir! Wir werden in der Stadt die Truppen sammeln und einen Vorstoß in das Gebiet machen, aus dem Teufel kommen!~
   IF ~~ THEN DO ~SetGlobal("AC#BreskQuest","GLOBAL",1)
   SetGlobal("AC#BreskMoves01","ACIL66",1)
   EraseJournalEntry(@66000)
   AddJournalEntry(@66001,QUEST)~  EXIT
END

IF ~~ THEN BEGIN 7
   SAY ~Ich habe diese Kreatur gesehen, als sie hier aus dem Untergrund hervorkam. Doch bevor wir sie in einem Kampf stellen konnten, breitete sie ihren riesigen Flügel aus und erhob sich in die Lüfte. Sie schwebte in Richtung Höhlendecke, und unsere Armbrustbolzen konnten ihrer Haut noch nicht einmal einen Kratzer zufügen.~
++ ~Sie hatten es auf den König abgesehen.~ + 8
END

IF ~~ THEN BEGIN 8
   SAY ~Gorm beschütze uns! Ist unser geliebter König wohlauf?~
++ ~Wir haben alle Kreaturen erschlagen. Doch sie konnten mühelos die Tore in den Ratssaal durchbrechen.~ + 9
END

IF ~~ THEN BEGIN 9
   SAY ~Von irgendwoher müssen diese Biester ja kommen. Wir müssen uns zum Ursprung ihres Eindringens durchschlagen. Im Augenblick scheinen sie nicht weiter vorzudringen. Vielleicht sammeln sie sich für einen neuen Angriff. Folgt mir in die Arnschädelhallen, damit wir sehen können, wo die Kreaturen herkommen.~
   IF ~~ THEN DO ~SetGlobal("AC#BreskQuest","GLOBAL",5)~  EXIT
END
