// ---------------------------------------------
// Dream-Dialoge
// ---------------------------------------------

BEGIN AC#DREA8  // König Mithbarak

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
SAY ~Ich bin meinem Ziel sehr nah. Hier liegt Xaxathart, der Vergüter. Er war der erste seiner Art, der vor Äonen von Tethir, dem Drachentöter erschlagen wurde.~
IF ~~ THEN DO ~SetGlobal("AC#ACIL23CutScene1","GLOBAL",7)
StartCutSceneMode()
StartCutScene("AC#23CT4")
~ EXIT
END

// BEGIN AC#DREA9  // Bleucorundum

CHAIN IF WEIGHT #-1 ~NumTimesTalkedTo(1)~ THEN AC#DREA8 1
~Nun muss ich also diesen Weg beschreiten. Und wenn ich wieder nach Iltkazar zurückkehre, werde ich bald in meinen Schlaf fallen. Hoffentlich bringt mich die Suche hier an diesem Tempel an der Oberfläche weiter.~
== AC#DREA8 ~Zwischen den Knochen der Drachen liegt mein Schicksal. Und vielleicht… meine Erlösung. An diesem heiligen Ort der Elfen finde ich vielleicht die Macht, meinen Fluch zu brechen… oder ihm endgültig zu verfallen. Der Ort war glücklicherweise in dem einzigen Buch Iltkazars, das nicht in der Bibliothek liegen darf, vermerkt. Sollte ich scheitern, so möge einst jemand dieses Buch zur Hand nehmen und ihm zu diesem Ort folgen.~
END
IF ~~ THEN DO ~SetGlobal("AC#ACIL23CutScene1","GLOBAL",8)
StartCutSceneMode()
StartCutScene("AC#23CT5")~ EXIT
