// ---------------------------------------------
// Dream-Dialoge
// ---------------------------------------------

BEGIN AC#DREA8  // König Mithbarak

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
SAY @0
IF ~~ THEN DO ~SetGlobal("AC#ACIL23CutScene1","GLOBAL",7)
StartCutSceneMode()
StartCutScene("AC#23CT4")
~ EXIT
END

BEGIN AC#DREA9  // Bleucorundum

CHAIN IF WEIGHT #-1 ~NumTimesTalkedTo(1)~ THEN AC#DREA8 1
@1
== AC#DREA9 @2
== AC#DREA8 @3
== AC#DREA9 @4
END
IF ~~ THEN DO ~SetGlobal("AC#ACIL23CutScene1","GLOBAL",8)
StartCutSceneMode()
StartCutScene("AC#23CT5")~ EXIT
