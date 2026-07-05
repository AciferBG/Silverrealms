
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
  SAY ~Gut, dass Ihr hier seid, <CHARNAME>! Die Bestien brechen aus den tieferen Bereichen der Arnschädelhalle hervor. Wir verlieren Boden um Boden und können den Ansturm nicht länger aufhalten!~
  IF ~~ THEN DO ~SetGlobal("AC#BreskQuest","GLOBAL",4)~ EXIT
END

IF ~Global("AC#BreskQuest","GLOBAL",4)~ THEN BEGIN 6
  SAY ~Ich danke Euch für Eure Hilfe! Doch noch immer dringen weitere Unholde aus den Tiefen nach oben. Wenn wir ihre Quelle nicht versiegeln, ist Iltkazar verloren.~
  ++ ~Wir konnten einen Angriff auf den Thronsaal abwehren, der von einem gewaltigen Höllenschlundscheusal angeführt wurde.~ + 7
  ++ ~Die Stadt hält stand. Das Scheusal, das die Bestien anführte, tut es nicht mehr. Ich habe es getötet.~ + 7
  ++ ~Die Angreifer haben einen hohen Preis bezahlt. Ihr Anführer wurde erschlagen.~ + 7
END

IF ~~ THEN BEGIN 2
SAY ~Hathar hält stand? Dann besteht Hoffnung. Die Stadttore bleiben verriegelt. Niemand kommt mehr hinein oder hinaus!~
++ ~Wisst Ihr etwas darüber, wer uns angreift?~ + 3
++ ~Was gibt es zu tun?~ + bye_protect_king
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
  SAY ~Ich habe die Kreatur gesehen. Sie brach aus den Tiefen hervor, breitete ihre Schwingen aus und erhob sich bis unter die Höhlendecke. Unsere Bolzen prallten wirkungslos an ihr ab.~
  ++ ~Sie hatte es auf den König abgesehen.~ + 8
END

IF ~~ THEN BEGIN 8
  SAY ~Gorm beschütze uns! Ist unser König wohlauf?~
  ++ ~Ja. Die Angreifer wurden zurückgeschlagen.~ + 9
  ++ ~Der König ist in Sicherheit. Vorerst.~ + 9
  ++ ~Sagen wir es so: Die Angreifer hingegen haben einen sehr schlechten Tag erwischt.~ + 9
  ++ ~Ja. Zum Glück! Ich hätte nur ungern in einem einstürzenden Thronsaal sterben wollen.~ + 9
END

IF ~~ THEN BEGIN 9
  SAY ~Wir dürfen keine Zeit verlieren. Irgendwoher kommen diese Unholde, und solange wir ihre Quelle nicht finden, ist Iltkazar nicht sicher. Im Augenblick scheinen sie sich neu zu sammeln.~ 
  =
  ~Folgt mir in die Arnschädelhalle! Wir werden herausfinden, woher diese Bestien kommen.~
  IF ~~ THEN DO ~AddJournalEntry(@66003,QUEST)
  SetGlobal("AC#BreskQuest","GLOBAL",5)~ EXIT
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

