// ---------------------------------------------
// Dream-Dialoge
// ---------------------------------------------

BEGIN AC#DREA8  // König Mithbarak

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
SAY ~Wir sind unserem Ziel sehr nah. Seht, hier liegt Xaxathart, der Vergüter. Er war der erste unserer Art, der vor Äonen von Tethir, dem Drachentöter erschlagen wurde.~
IF ~~ THEN DO ~SetGlobal("AC#ACIL23CutScene1","GLOBAL",7)
StartCutSceneMode()
StartCutScene("AC#23CT4")
~ EXIT
END

BEGIN AC#DREA9  // Bleucorundum

CHAIN IF WEIGHT #-1 ~NumTimesTalkedTo(1)~ THEN AC#DREA8 1
~Und hier müssen sich unsere Wege trennen, mein Freund. Den weiteren Weg muss ich alle beschreiten. Und wenn ich wieder nach Iltkazar zurückkehre, werde ich bald in meinen Schlaf fallen.~
== AC#DREA9 ~Ich verstehe. Habt Ihr noch letzte Anweisungen an mich, Mithbarakaz?~
== AC#DREA8 ~Versiegelt die Kapelle des Blutmondes und hütet das kostbare Wissen, das dort verborgen liegt. Gegen Phezults uralten Zauber des Schlafes helfen schwarze Saphire. Sollte ich in dem Versuch scheitern, meinen Fluch zu lösen, könnte irgendwann einmal jemand die Halle der Geschichte aufsuchen und das Wissen um mich benötigen, um unsere Rasse und die der Zwerge zu retten. Und denkt daran: Solltet Ihr jemals wieder zu diesem Drachenfriedhof zurückkehren müssen: Dies ist ein heiliger Ort der Elfen und in deren alten Überlieferungen enthalten.~
== AC#DREA9 ~Gut, mein Freund. Möge der Engel der sieben Himmel über Euch wachen.~
END
IF ~~ THEN DO ~SetGlobal("AC#ACIL23CutScene1","GLOBAL",8)
StartCutSceneMode()
StartCutScene("AC#23CT5")~ EXIT
