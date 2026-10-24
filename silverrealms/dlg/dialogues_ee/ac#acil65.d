
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

// Dialogue Abishai

BEGIN ~AC#IL65A~
BEGIN ~AC#IL65B~

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#IL65A hello_0
~Da! Die Kette! Genau wie die Herrin gesagt hat. Los, brecht ein Stück heraus!~
== AC#IL65B ~Ein ganzes Glied? Wozu braucht sie noch eines? Sie hat doch schon genug Ketten!~
== AC#IL65A ~Dummkopf! Um ihre Ketten zu sprengen, natürlich!~
== AC#IL65B ~Schon gut. Ich schlage hier zu und... Argh! Verfluchtes Zwergenmetall! Nicht einmal eine Kerbe!~
== AC#IL65A ~Dann schlagt fester!~
== AC#IL65B ~Nein. Schleppt einen der Zwergenschmiede her! Bevor ich meine Klauen breche, werde ich lieber einem Zwerg jeden Finger einzeln brechen, bis er uns zeigt, wie es geht.~
== AC#IL65A ~Wir haben die Schmiede alle erschlagen, Ihr Narr! Los, sucht ein loses Glied!~
== AC#IL65B ~Hier liegt keines. Alles hängt zusammen.~
== AC#IL65A ~Dann nehmen wir alles. Packt an!~
== AC#IL65B ~Hrrr... Das bewegt sich nicht! Kein Wunder, dass die Herrin nicht aus diesen Ketten kommt!~
== AC#IL65A ~Holt die anderen. Schnell!~
== AC#IL65B ~Da! Am Eingang! Ein <PRO_RACE>!~
== AC#IL65A ~Wir holen die Kette später. Erst töten wir diese Eindringlinge!~
END
IF ~~ THEN DO ~SetGlobal("AC#IL_AbishaiChain","GLOBAL",1)
ActionOverride("AC#IL65B",Enemy())
Enemy()~ EXIT

/*
CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#IL65A hello_0
~Hier! Das muss die Kette sein, von der die Herrin gesprochen hat. Seht Euch diese Glieder an!~
== AC#IL65B ~Lasst uns ein Stück davon nehmen und verschwinden. Wir sollten nicht mit leeren Klauen vor sie treten.~
== AC#IL65A ~Trennt eines der Glieder ab. Ein einziges sollte genügen.~
== AC#IL65B ~Argh, verflucht! Meine Klinge hinterlässt nicht einmal eine Kerbe in diesem Zwergenmetall!~
== AC#IL65A ~Dann sucht ein loses Glied. Irgendwo müssen diese Zwerge doch ihren Vorrat aufbewahren.~
== AC#IL65B ~Ich habe bereits gesucht. Die Glieder hier sind alle verbunden.~
== AC#IL65A ~Dann nehmen wir den ganzen Abschnitt mit. Helft mir!~
== AC#IL65B ~Das ist zu schwer! Wir werden diese Kette nie bewegen können. Kein Wunder, dass unsere Herrin darin gefangen bleibt!~
== AC#IL65B ~Wir müssen mit mehr Kräften zurückkommen. Vielleicht...~
== AC#IL65A ~Still! Dort, am Eingang. Wir werden beobachtet!~
END
IF ~~ THEN DO ~SetGlobal("AC#IL_AbishaiChain","GLOBAL",1)
ActionOverride("AC#IL65B",Enemy())
Enemy()~ EXIT
*/

