/*******************************************************************************************************
Dialogue in Tiamats prison 1st time
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
						
/*******************************************************************************************************
Dialogue in Tiamats prison 2nd time
*******************************************************************************************************/

// Tiamat
BEGIN ~AC#4TTIA~

//Malphas
BEGIN ~AC#MAL4T~
						
CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#MAL4T hello
~Herrin... <CHARNAME> war im Drachenfriedhof; <PRO_HESHE> hat den Tempel gefunden. Und <PRO_HESHE> hat mit Maldraedior gesprochen.~
== AC#4TTIA ~Maldraedior...~
== AC#MAL4T ~Dann war unsere Vermutung richtig. Kalzareinads Einfluss reicht noch immer bis an diesen Ort.~
== AC#4TTIA ~Kalzareinad ist tot. Doch selbst im Tod hinterlässt mein alter Widersacher Spuren, über die Sterbliche stolpern können.~
== AC#MAL4T ~Und Maldraedior sorgt dafür, dass sie ihnen folgen.~
== AC#4TTIA ~Seit Äonen. Er war schon gerissen, als Kalzareinad noch glaubte, seine Pläne vor mir verbergen zu können. Und er ist gerissen genug, sich dort zu verkriechen, wo selbst meine Diener ihn nicht erreichen können.~
== AC#MAL4T ~Wenn er <CHARNAME> erzählt hat, was er weiß, kennt <PRO_HESHE> nun möglicherweise die Wahrheit über Mithbarakaz.~
== AC#4TTIA ~Möglicherweise. Maldraedior verschwendet keine Worte ohne Grund.~
== AC#MAL4T ~Dann weiß <CHARNAME> nun, dass Mith Barak in Wahrheit ein Silberdrache ist. Und dass Kalzareinad ihn verflucht hat.~
== AC#MAL4T ~Soll ich Maldraedior zum Schweigen bringen lassen?~
== AC#4TTIA ~Wenn ich wüsste, wie, wäre er schon vor Jahrhunderten verstummt. Nein. Verschwendet keine Zeit mit ihm.~
== AC#MAL4T ~Dann wird <CHARNAME> nach Iltkazar zurückkehren und den Zwergen alles berichten.~
== AC#4TTIA ~Natürlich wird er das. Und Ihr sorgt gefälligst dafür, dass sein Weg dort endet!~
== AC#MAL4T ~Wie Ihr befehlt, Herrin. Ich habe schon einen guten Plan...~
== AC#4TTIA ~...der hoffentlich für Euch besser ausgeht als Euer Letzter!~
== AC#MAL4T ~Mit Sicherheit, Herrin. Ich werde nicht scheitern!~
END
IF ~~ THEN DO ~StartCutSceneMode()
StartCutScene("AC#2TCT4")~ EXIT
						
/*******************************************************************************************************
Dialogue in Tiamats prison 3rd time
*******************************************************************************************************/

// Tiamat
BEGIN ~AC#5TTIA~

//Malphas
BEGIN ~AC#MAL5T~
						
CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#MAL5T hello
~Herrin... der Angriff auf Iltkazar ist gescheitert.~
== AC#5TTIA ~Gescheitert?~
== AC#MAL5T ~Die Zwerge haben sich erbitterter gewehrt, als wir erwartet hatten. Goap ist gefallen. Auch seine Diener wurden vernichtet.~
== AC#5TTIA ~Ihr wollt mir sagen, dass mein General von einigen Zwergen bezwungen wurde?~
== AC#MAL5T ~Nicht nur von den Zwergen, Herrin. <CHARNAME> war dort, <PRO_HESHE> hat ihnen geholfen.~
== AC#5TTIA ~Natürlich. Immer wieder dieser Name.~
== AC#MAL5T ~Die Zwerge haben schließlich die Schmiedehalle zum Einsturz gebracht. Der Zugang durch ihre Öfen ist verschüttet. Auf diesem Wege werden wir Iltkazar nicht erneut erreichen.~
== AC#5TTIA ~Dann habt Ihr nicht nur meinen General verloren, sondern auch noch den einzigen Zugang, den Ihr in die Stadt geschaffen habt! Und vielleicht die einzige Möglichkeit, Metall zu schmieden, das stark genug ist, meine Ketten zu sprengen. Erbärmlich, Malphas.~
== AC#MAL5T ~Verzeiht, Herrin. Aber noch ist nichts verloren. Das einzige Portal in erreichbarer Nähe, das <CHARNAME> näher an unseren Gefangenen bringen könnte, befindet sich in Torglor. Und Torglor wird von den Githyanki gehalten. Sie sind unsere Verbündeten.~
== AC#5TTIA ~Ihr habt <CHARNAME> bereits unterschätzt. Tut es nicht noch einmal.~
== AC#MAL5T ~Gewiss, Herrin.~
== AC#5TTIA ~Das will ich hoffen. Oder habt Ihr vergessen, weshalb Ihr mir dient?~
== AC#MAL5T ~Nein, Herrin.~
== AC#5TTIA ~Seht an Euch herab, Malphas. Betrachtet, was aus Euch geworden ist: Ein schäbiger Vogel! Mithbarakaz ist verdammt, als Zwerg sein Dasein zu fristen. Das hat mein alter Widersacher Kalzareinad gut gemacht. Doch *Euer* Fluch ist viel erniedrigender. Und er wird erst enden, wenn meine Ketten gebrochen sind und ich wieder frei bin. Oder gefällt Euch diese erbärmliche Gestalt inzwischen so sehr, dass Ihr sie bis in alle Ewigkeit behalten wollt?~
== AC#MAL5T ~Nein, Herrin. Ich werde Euch befreien, um meine ursprüngliche Gestalt wiederzuerlangen.~
== AC#5TTIA ~Dann sorgt dafür, dass der verfluchte Silberne die Astralebene nicht verlässt! Und dass <CHARNAME> ihn niemals erreicht!~
== AC#MAL5T ~Jawohl, Herrin.~
END
IF ~~ THEN DO ~StartCutSceneMode()
StartCutScene("AC#2TCT6")~ EXIT

/*******************************************************************************************************
Dialogue in Tiamats prison last time
*******************************************************************************************************/
// Tiamat
BEGIN ~AC#7TTIA~

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#7TTIA hello
~Malphas!~
== AC#7TTIA ~MALPHAS!~
== AC#7TTIA ~Verfluchter Vogel, wo steckt Ihr?~
== AC#7TTIA ~MALPHAS!~
== AC#7TTIA ~Argh... nach all der Zeit, noch immer diese Ketten!~
== AC#7TTIA ~ICH WERDE NICHT EWIG HIER BLEIBEN!~
END
IF ~~ THEN DO ~StartCutSceneMode()
StartCutScene("AC#2TCT8")~ EXIT
