
/*******************************************************************************************************
Dialog Bresk Steinschulter
*******************************************************************************************************/

BEGIN ~AC#BRES2~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY ~<CHARNAME>! Die Stadt wird angegriffen! Die Runenzauber sind aktiv und die Zitadellen versiegelt, doch die Feinde dringen weiter vor. Geht zur Großen Halle und schützt den König!~
++ ~Ich habe Hathar vor den Toren getroffen, wie er gegen eine Horde Ungeheuer kämpfte.~ + 2
++ ~Wisst Ihr etwas darüber, wer uns angreift?~ + 3
++ ~Ich schaue einmal, was ich tun kann.~ + 4
++ ~Kämpft Ihr ruhig weiter gegen diese Scheusale. Ich sehe nach dem König.~ + bye_protect_king
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
SAY ~Hathar hält stand? Dann besteht Hoffnung. Die Stadttore bleiben verriegelt. Niemand kommt mehr hinein oder hinaus!~
++ ~Wisst Ihr etwas darüber, wer uns angreift?~ + 3
++ ~Was gibt es zu tun?~ + bye_protect_king
/*
IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ Jaheira_Comment_Dumathoin
IF ~!IsValidForPartyDialog("Jaheira")~ THEN REPLY ~Was ist hier geschehen?~ + 3
*/
END

IF ~~ THEN BEGIN 3
SAY ~Diese Kreaturen stammen aus den unteren Ebenen. Warum sie hier sind, wissen wir nicht. Doch sie streben zum Königspalast. Geht zu meinem Vater Dunnabar und beschützt den König! Ich werde mit meinen Männern die Quelle dieses Angriffs aufspüren.~
++ ~Gut. Ich verspreche, den König mit meinem Leben zu beschützen.~ + 4
++ ~Ich schaue einmal, was ich tun kann.~ + 4
++ ~Kämpft Ihr ruhig weiter gegen diese Scheusale. Ich sehe nach dem König.~ + bye_protect_king
END

IF ~~ THEN BEGIN 4
   SAY ~Habt Dank, <CHARNAME>, bei Clangeddin, ich werde Euren Mut und Eure Ehre nicht vergessen!~ 
IF ~~ THEN GOTO bye_protect_king
END 
 
IF ~~ THEN BEGIN bye_protect_king
   SAY ~Geht zur Halle des Regentschaftrates und meldet Euch bei meinem Vater. Wir müssen alles daransetzen, die Biester aus dem Königspalast fernzuhalten!~
   =
   ~Männer! Zu mir! Wir werden die Truppen sammeln und einen Vorstoß in das Gebiet machen, aus dem die Teufel kommen!~
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

//_________________________________________________
BEGIN ~AC#66DW1~

IF ~RandomNum(5,1)~ THEN BEGIN hello_fight_1
  SAY ~Für Iltkazar! Haltet die Linie!~
  IF ~~ THEN EXIT
END

IF ~RandomNum(5,2)~ THEN BEGIN hello_fight_2
  SAY ~Kein Feind wird diese Hallen lebend betreten!~
  IF ~~ THEN EXIT
END

IF ~RandomNum(5,3)~ THEN BEGIN hello_fight_3
  SAY ~Für König und Heimat!~
  IF ~~ THEN EXIT
END

IF ~RandomNum(5,4)~ THEN BEGIN hello_fight_4
  SAY ~Die Feinde sollen an unseren Schilden zerschellen!~
  IF ~~ THEN EXIT
END

IF ~RandomNum(5,5)~ THEN BEGIN hello_fight_5
  SAY ~Kein Schritt zurück!~
  IF ~~ THEN EXIT
END
//_______________________________________________
BEGIN ~AC#66DW2~

IF ~RandomNum(5,1)~ THEN BEGIN hello_fight_1
  SAY ~Für Iltkazar! Haltet die Linie!~
  IF ~~ THEN EXIT
END

IF ~RandomNum(5,2)~ THEN BEGIN hello_fight_2
  SAY ~Kein Feind wird diese Hallen lebend betreten!~
  IF ~~ THEN EXIT
END

IF ~RandomNum(5,3)~ THEN BEGIN hello_fight_3
  SAY ~Für König und Heimat!~
  IF ~~ THEN EXIT
END

IF ~RandomNum(5,4)~ THEN BEGIN hello_fight_4
  SAY ~Die Feinde sollen an unseren Schilden zerschellen!~
  IF ~~ THEN EXIT
END

IF ~RandomNum(5,5)~ THEN BEGIN hello_fight_5
  SAY ~Kein Schritt zurück!~
  IF ~~ THEN EXIT
END

