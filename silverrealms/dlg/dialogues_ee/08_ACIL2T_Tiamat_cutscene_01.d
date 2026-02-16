/*******************************************************************************************************
Dialogue in sewers
*******************************************************************************************************/

// Tiamat
BEGIN ~AC#2TTIA~

//Malphas
BEGIN ~AC#MAL2T~




CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#MAL2T hello
						~Die Zwerge wurden von dem Wächter vernichtet, Herrin.~ [AC#ILMAB]
						== AC#2TTIA ~Ihr kommt spät, um mir dies mitzuteilen. Warum hat es so lange gedauert?~ 
						== AC#MAL2T ~Es ist schwieriger als gedacht. Die Zwerge haben einen Verbündeten.~
						== AC#2TTIA ~Wer soll das sein?~ 
						== AC#MAL2T ~Ein <PRO_RACE> namens <CHARNAME>. Er scheint sich in der Zwergenstadt aufzuhalten.~
						== AC#2TTIA ~Woher wisst Ihr das?~
						== AC#MAL2T ~Unsere Verbündeten haben einen Fehler gemacht und ein Astralportal nicht verschlossen. Ich konnte ihn dadurch sehen.~
						== AC#2TTIA ~Habt Ihr Euch dessen angenommen?~
						== AC#MAL2T ~Ich habe das Portal wieder versiegelt, ja.~
						== AC#2TTIA ~Ich meinte den <PRO_RACE>.~
						== AC#MAL2T ~Dieser <PRO_RACE> hält sich wahrscheinlich in Iltkazar auf, wo wir ihn nicht erreichen können. Soll ich dennoch unsere Verbündeten anweisen, ihn zu eliminieren?~
						== AC#2TTIA ~Nein, das würde zu viel Aufmerksamkeit verursachen. Sie sollen ihn aus sicherer Entfernung beobachten. Und Ihr wendet Euch wieder Eurer eigentlichen Aufgabe zu.~						
						== AC#MAL2T ~Jawohl, Herrin. Ich werde mit der Bewachung unseres Gefangenen fortfahren.~
						== AC#2TTIA ~Das meinte ich nicht. Ihr solltet Euch besser an die Arbeit machen, um einen Weg zu finden, mich endlich aus diesen verfluchten Fesseln zu befreien!~
						== AC#MAL2T ~Jawohl, Herrin!~
						END
						IF ~~ THEN DO ~StartCutSceneMode()
						StartCutScene("AC#2TCT2")~ EXIT
						
						
//