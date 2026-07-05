
/*******************************************************************************************************
Dialog Bresk Steinschulter
*******************************************************************************************************/

BEGIN ~AC#BRES3~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
  SAY ~Gut, dass Ihr hier seid. Die Bestien kommen tatsächlich aus den tieferen Bereichen. Dort unten muss sich ein Portal geöffnet haben! Ich hoffe, Sorni Arnschädel lebt noch. Wenn jemand weiß, wie wir diesen Wahnsinn stoppen können, dann sie.~ 
  =
  ~Die Azerkyn-Halle liegt unter uns. Dort müssen wir hin! Wir teilen uns auf: Ich nehme den südlichen Zugang, Ihr den nördlichen. Einer von uns wird Sorni finden, der andere hoffentlich das Portal.~
  IF ~~ THEN DO ~AddJournalEntry(@66004,QUEST)
    SetGlobal("AC#BreskQuest","GLOBAL",7)
    EscapeAreaObject("TrACIL61B")
  ~ EXIT
END
