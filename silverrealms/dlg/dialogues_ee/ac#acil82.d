

/*******************************************************************************************************
Dialog Malphas Cutscene  ÁCIL82
*******************************************************************************************************/
BEGIN ~AC#GITH4~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY ~<CHARNAME> ist durch das Innere des Gefängnisses gedrungen, Malphas. Die anderen Gefangenen sind erschlagen oder entkommen. Es war töricht, diese so einfach ziehen zu lassen!~
IF ~~ THEN EXTERN ~AC#MAL04~ 01
END

IF ~~ THEN BEGIN 2
SAY ~Ich diene nur unserer Herrin, der Lich-Königin, und nehme nur deren Befehle entgegen. Wäre ich nicht auf deren Geheiß hier, hätte ich mit Euch nichts zu schaffen.~
IF ~~ THEN EXTERN ~AC#MAL04~ 02
END

IF ~~ THEN BEGIN 3
SAY ~Natürlich nicht, Malphas.~
IF ~~ THEN EXTERN ~AC#MAL04~ 03
END

/*******************************************************************************************************
Dialog AC#MAL04
*******************************************************************************************************/

BEGIN ~AC#MAL04~

IF ~Global("AC#Cut2","ACIL82",2)~ THEN BEGIN 04
SAY ~Wollt Ihr anderen Githyanki ebenfalls gegen mich aufbegehren? Sprecht schnell, denn meine Geduld mit Euresgleichen ist erschöpft.~
IF ~~ THEN EXTERN ~AC#GITH5~ 1
END

IF ~~ THEN BEGIN 01
SAY ~Ihr wagt es, hier meine Befehle in Frage zu stellen, Githyanki?~
IF ~~ THEN EXTERN ~AC#GITH4~ 2
END

IF ~~ THEN BEGIN 02
SAY ~Hütet Eure Zunge, Gith! Ihr wisst, dass meine Herrin mit Eurer Königin vor Jahrtausenden ein Abkommen geschlossen hat, das Euch auch Tiamat zur Treue verpflichtet! Oder könnte Eure Rasse auf all die roten Drachen, die Euch freiwillig dienen, verzichten?~
IF ~~ THEN EXTERN ~AC#GITH4~ 3
END

IF ~~ THEN BEGIN 03
SAY ~Nennt mich nicht bei diesem Namen, Unwürdiger! Ich bin einer der Herzöge von Avernus, und Ihr und Eure Rasse seid nichts als Lemuren unter den Hufen der Legionen Tiamats! Spürt den Zorn eines Teufels, Sterblicher!~
IF ~~ THEN DO ~SetGlobal("AC#Cut2","ACIL82",1)
   ClearAllActions()
   StartCutSceneMode()
   StartCutScene("ac#ct82B")~
   EXIT
END

IF ~~ THEN BEGIN 05
SAY ~Gut. Dann lasst den Spinnendämon frei. Er wird diese törichten Abenteurer hoffentlich in Stücke reißen.~
IF ~~ THEN EXTERN ~AC#GITH5~ 2
END

IF ~~ THEN BEGIN 06
SAY ~Ihr gefallt mir, Githyanki. Begebt Euch zu der Höhle im Osten und öffnet die Tore.~
IF ~~ THEN EXTERN ~AC#GITH6~ 3
END

IF ~~ THEN BEGIN 07
SAY ~Ich werde in das Innere meines Turmes gehen. Verbarrikadiert die Tür, wir wollen <CHARNAME> einen schönen Empfang bereiten, wenn er schaffen sollte, die Tore zu durchbrechen. Und noch etwas, Gith...~
IF ~~ THEN EXTERN ~AC#GITH5~ 3
END

IF ~~ THEN BEGIN 08
SAY ~Jetzt, da Euer Kamerad sich bereit erklärt hat, den Dämon freizulassen, habt Ihr die ehrenvolle Aufgabe, die Tür hinter mir wieder zu verriegeln und den Eingang mit Eurem Leben zu verteidigen.~
IF ~~ THEN EXTERN ~AC#GITH5~ 4
END
/*******************************************************************************************************
Dialog GITH05
*******************************************************************************************************/

BEGIN ~AC#GITH5~

IF ~~ THEN BEGIN 1
SAY ~Nein, Herr, wir folgen Euch bis in den Tod.~
IF ~~ THEN EXTERN ~AC#GITH6~ 1
END

IF ~~ THEN BEGIN 2
SAY ~Ihr wollt den Dämon freilassen? Aber er ist seit Jahrhunderten hier eingekerkert und könnte uns alle mit Leichtigkeit vernichten!~
IF ~~ THEN EXTERN ~AC#GITH6~ 2
END

IF ~~ THEN BEGIN 3
SAY ~Ja, Meister?~
IF ~~ THEN EXTERN ~AC#MAL04~ 08
END

IF ~~ THEN BEGIN 4
SAY ~Jawohl, Herr, mit meinem Leben!~
IF ~~ THEN DO
   ~SetGlobal("AC#Cut3","ACIL82",1)
   ClearAllActions()
   StartCutSceneMode()
   StartCutScene("ac#ct82C")
~ EXIT
END

/*******************************************************************************************************
Dialog GITH06
*******************************************************************************************************/

BEGIN ~AC#GITH6~

IF ~~ THEN BEGIN 1
SAY ~Bis in den Tod.~
IF ~~ THEN EXTERN ~AC#MAL04~ 05
END

IF ~~ THEN BEGIN 2
SAY ~Ihr habt gehört, was der Herzog gesagt hat. Wir werden den Dämon freilassen.~
IF ~~ THEN EXTERN ~AC#MAL04~ 06
END

IF ~~ THEN BEGIN 3
SAY ~Jawohl, Herzog.~
IF ~~ THEN EXTERN ~AC#MAL04~ 07
END