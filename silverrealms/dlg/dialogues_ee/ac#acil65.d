
/*******************************************************************************************************
Dialog Bresk Steinschulter
*******************************************************************************************************/

BEGIN ~AC#BRES3~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY  ~Danke, dass Ihr mir hierhin gefolgt seid. Wie ich vermutet hatte, scheinen sie aus den unteren Bereichen zu kommen. Ich fürchte, dass sich dort eine Art Portal aufgetan hat. Ich hoffe, Sorni Arnschädel lebt noch, denn eigentlich müsste sie hier irgendwo sein. Wir müssen uns in die Azerkyn-Halle durchschlagen. Dazu teilen wir uns am Besten auf- ich nehme den südlichen, und Ihr den nördlichen Eingang.~
++ ~Was habt Ihr vor, wenn wir in der Azerkynhalle angelangt sind?~ + 2
END

IF ~~ THEN BEGIN 2
SAY ~Ich weiß es nicht. Wir sollten Sorni finden, vielleicht kann sie uns sagen, was zu tun ist- wenn sie denn noch am Leben ist.~
IF ~~ THEN GOTO 3
END

IF ~~ THEN BEGIN 3
   SAY ~Doch alles Verzagen nützt nichts. Lasst uns aufbrechen und sehen, was wir vorfinden. Wie gesagt, schlagt Euch nach Norden durch, dann haben wir bessere Chancen, die Scheusale zu entzweien.~
   IF ~~ THEN DO ~SetGlobal("AC#BreskQuest","GLOBAL",7)
   EscapeAreaObject("TrACIL61B")~  EXIT
END
