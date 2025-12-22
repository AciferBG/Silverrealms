// ---------------------------------------------
// Dream-Dialoge
// ---------------------------------------------

BEGIN AC#DREA2  // König oder Ratgeber?
IF ~NumTimesTalkedTo(1)~ THEN BEGIN 0
SAY ~Mein Herr! König Mith Barak! So antwortet doch! Was ist mit Euch geschehen?~
IF ~~ THEN DO ~/*SetGlobal("AC#ACIL23CutScene1","GLOBAL",5)*/
SetGlobal("AC#ACIL23CutScene1","GLOBAL",6)
ClearAllActions()
StartCutSceneMode()
StartCutScene("AC#23CT3")~ EXIT
END

BEGIN AC#DREA1  // Mithbarak

CHAIN IF WEIGHT #-1 ~NumTimesTalkedTo(0)~ THEN AC#DREA2 1
~Mith Barak, der Mithralschild, ist in der Halle der Herrscher Iltkazars eingetroffen. Und das in Zeiten großer Not, denn unser geliebter König liegt im Sterben, und schon bald wird er den Ruf Moradins vernehmen und in die Seelenschmiede aufbrechen. Seid gegrüßt, Mith Barak, der Clanlose, Wächter der Bücher, seid Ihr bereit, die Bürde, die Euch auferlegt wurde, anzunehmen?~
// DO ~SetGlobal("AC#ACIL23CutScene1","GLOBAL",3)~
== AC#DREA1 ~Deshalb bin ich hier, Zwerge von Iltkazar, denn den Schwur, den ich Eurem Volke vor langer Zeit gegeben habe, werde ich nun einlösen.~
== AC#DREA2 ~So sei es denn beschlossen. Mith Barak der Clanlose wird der neue König von Iltkazar sein!~
END
IF ~~ THEN DO ~/*SetGlobal("AC#ACIL23CutScene1","GLOBAL",3)*/
SetGlobal("AC#ACIL23CutScene1","GLOBAL",4)
ClearAllActions()
StartCutSceneMode()
StartCutScene("AC#23CT2")~ EXIT
