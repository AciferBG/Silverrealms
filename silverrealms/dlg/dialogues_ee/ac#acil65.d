
/*******************************************************************************************************
Dialog Bresk Steinschulter
*******************************************************************************************************/

BEGIN ~AC#BRES3~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
  SAY ~Gut, dass Ihr hier seid. Die Bestien kommen tatsächlich aus den tieferen Bereichen. Dort unten muss sich ein Portal geöffnet haben. Ich hoffe, Sorni Arnschädel lebt noch! Wenn jemand weiß, wie wir diesen Wahnsinn stoppen können, dann sie.~ 
  =
  ~Die Azerkyn-Halle liegt unter uns. Dort müssen hin! Wir teilen uns auf: Ich nehme den südlichen Zugang, Ihr den nördlichen. Einer von uns wird Sorni finden, der andere vielleicht das Portal.~
  ++ ~Und dann?~ + 2
  ++ ~Dann verlieren wir keine Zeit mehr.~ + 3
END

IF ~~ THEN BEGIN 2
  SAY ~Ich weiß es nicht. Wir sollten Sorni finden, vielleicht kann sie uns sagen, was zu tun ist- wenn sie denn noch am Leben ist.~
  IF ~~ THEN GOTO 3
END

IF ~~ THEN BEGIN 3
  SAY ~Gut. Kämpft Euch zur Azerkyn-Halle durch. Möge Gorm über Euch wachen.~
  IF ~~ THEN DO ~
    SetGlobal("AC#BreskQuest","GLOBAL",7)
    EscapeAreaObject("TrACIL61B")
  ~ EXIT
END
