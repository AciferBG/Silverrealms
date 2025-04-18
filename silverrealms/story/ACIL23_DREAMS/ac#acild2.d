// ---------------------------------------------
// Dream-Dialoge
// ---------------------------------------------

BEGIN AC#DREA2  // König oder Ratgeber?
IF ~NumTimesTalkedTo(1)~ THEN BEGIN 0
SAY @3
IF ~~ THEN DO ~/*SetGlobal("AC#ACIL23CutScene1","GLOBAL",5)*/
SetGlobal("AC#ACIL23CutScene1","GLOBAL",6)
ClearAllActions()
StartCutSceneMode()
StartCutScene("AC#23CT3")~ EXIT
END

BEGIN AC#DREA1  // Mithbarak

CHAIN IF WEIGHT #-1 ~NumTimesTalkedTo(0)~ THEN AC#DREA2 1
@0
// DO ~SetGlobal("AC#ACIL23CutScene1","GLOBAL",3)~
== AC#DREA1 @1
== AC#DREA2 @2
END
IF ~~ THEN DO ~/*SetGlobal("AC#ACIL23CutScene1","GLOBAL",3)*/
SetGlobal("AC#ACIL23CutScene1","GLOBAL",4)
ClearAllActions()
StartCutSceneMode()
StartCutScene("AC#23CT2")~ EXIT
