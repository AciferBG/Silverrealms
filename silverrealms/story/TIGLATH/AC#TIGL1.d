// creator  : weidu (version 24000)
// argument : AC#TIGL1.DLG
// game     : .
// source   : ./override/AC#TIGL1.DLG
// dialog   : .\dialog.tlk
// dialogF  : .\dialogF.tlk

BEGIN ~AC#TIGL1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0 // from:
  SAY @1 /* ~<CHARNAME>! Bitte wartet einen Augenblick. Ich muss etwas Wichtiges mit Euch besprechen.~ #108035 */
  IF ~~ THEN REPLY @2 /* ~Wer seid Ihr? Und woher kennt Ihr meinen Namen?~ #108036 */ GOTO 1
END

IF ~~ THEN BEGIN 1 // from: 0.0
  SAY @3 /* ~Ich bin Tiglath. Ich komme von weit aus dem Osten, aus Unther, und habe schon eine ganze Weile nach Euch gesucht.~ #108037 */
  IF ~~ THEN REPLY @4 /* ~Seid gegrüßt, Tiglath. Was wollt Ihr von mir?~ #108038 */ GOTO 2
END

IF ~~ THEN BEGIN 2 // from: 1.0
  SAY @5 /* ~Ich muss mit Euch in einer dringenden Angelegenheit sprechen. Es geht um Eure nächsten Schritte, nachdem Ihr dem Rätsel um den schlafenden König näher gekommen seid. Ich habe Informationen von großer Wichtigkeit für Euch. Aber nicht hier in aller Öffentlichkeit. Ich kenne diese Stadt nicht, aber es müsste doch sicher einen ruhigen Ort geben, an dem wir uns unterhalten können.~ #108039 */
  IF ~~ THEN REPLY @6 /* ~Die Kupferkrone ist ein Gasthaus in den Slums und ein sicherer Ort für vertrauliche Gespräche. Trefft mich dort.~ #108040 */ GOTO 3
END

IF ~~ THEN BEGIN 3 // from: 2.0
  SAY @7 /* ~Gut, ich werde in der Kupferkrone auf Euch warten, <CHARNAME>. Kommt, Tremor, machen wir uns auf den Weg.~ #108041 */
  IF ~~ THEN DO ~ActionOverride("AC#TREM1",EscapeArea())
SetGlobal("AC#_TiglathSpawn","GLOBAL",3)
EscapeArea()~ JOURNAL @8 /* ~In Athkatla hat mich eine Frau namens Tiglath angesprochen, die etwas mit mir bereden möchte. Sie wartet in der Kupferkrone auf mich.~ #108042 */ EXIT
END

// alt:
/*
IF ~~ THEN BEGIN 3 // from: 2.0
  SAY @7
  IF ~~ THEN DO ~ActionOverride("AC#TREM1",EscapeAreaMove("AR0406",1203,567,3))
SetGlobal("AC#_TiglathSpawn","GLOBAL",3)
EscapeAreaMove("AR0406",1167,646,0)~ JOURNAL @8 EXIT
END
*/
