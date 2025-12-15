/*******************************************************************************************************
Dialogue in sewers
*******************************************************************************************************/

// Tiamat
BEGIN ~AC#2TTIA~

//Malphas
BEGIN ~AC#MAL2T~




CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#MAL2T hello
						~Die Zwerge wurden von dem Wächter vernichtet, Herrin.~ [AC#ILMAB]
						== AC#2TTIA ~Gut. Warum hat es so lange gedauert?~ 
						== AC#MAL2T ~Es war schwieriger als gedacht. Die Zwerge hatten einen mächtigen Verbündeten.~
						== AC#2TTIA ~Wer war das?~ 
						== AC#MAL2T ~Ein <PRO_RACE> namens <CHARNAME>. Niemand, um den wir uns noch kümmern müssen.~
						== AC#2TTIA ~Gut. Trefft unsere Verbündeten und sagt ihnen, wir seien dankbar, dass sie uns ihre alte Festung überlassen haben.~
						== AC#MAL2T ~Natürlich, Herrin.~
						== AC#2TTIA ~Wir brauchen sie - ohne dass es ihnen bewusst ist. Sie werden sich ganz in der Nähe des Silbernen einen Stützpunkt errichten, der uns bei unseren weiteren Schritten noch von Nutze sein wird.~
						== AC#MAL2T ~Ihr seid gerissen, wie immer.~
						== AC#2TTIA ~Ich weiß. Und Ihr macht Euch besser wieder an die Arbeit, um mich endlich aus diesen verfluchten Fesseln zu befreien!~
						== AC#MAL2T ~Jawohl, Herrin!~
						END
						IF ~~ THEN DO ~StartCutSceneMode()
						StartCutScene("AC#2TCT2")~ EXIT
						
						
// OLD
/*
CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#MAL2T hello
						~Ich habe beide Zepter erbeutet, Herrin.~ 
						== AC#2TTIA ~Ihr kommt spät.~ 
						== AC#MAL2T ~Es war schwieriger als gedacht. Die Zwerge und der Magier hatten einen mächtigen Verbündeten.~
						== AC#2TTIA ~Wer war das?~ 
						== AC#MAL2T ~Ein <PRO_RACE> namens <CHARNAME>. Niemand, um den wir uns noch kümmern müssen.~
						== AC#2TTIA ~Gut. Behaltet das Zepter für die Feuerreiche. Übergebt das Zepter für die Silberreiche unseren Verbündeten, auf dass sie es gegen ihre alten Feinde einsetzen mögen. Sagt ihnen, es sei als Dank dafür, dass sie uns ihre alte Festung überlassen haben.~
						== AC#MAL2T ~Ihr seid zu großzügig.~
						== AC#2TTIA ~Nicht nur. Wir brauchen sie - ohne dass es ihnen bewusst ist. Sie werden sich ganz in der Nähe des Silbernen einen Stützpunkt errichten, der uns bei unseren weiteren Schritten noch von Nutze sein wird.~
						== AC#MAL2T ~Ihr seid gerissen, wie immer.~
						== AC#2TTIA ~Ich weiß. Und Ihr macht Euch besser wieder an die Arbeit, um mich endlich aus diesen verfluchten Fesseln zu befreien!~
						== AC#MAL2T ~Jawohl, Herrin!~
						END
						IF ~~ THEN DO ~StartCutSceneMode()
						StartCutScene("AC#2TCT2")~ EXIT
*/						