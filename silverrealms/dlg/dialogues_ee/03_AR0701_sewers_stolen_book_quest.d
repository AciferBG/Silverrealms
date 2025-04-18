/*******************************************************************************************************
Dialogue in sewers
*******************************************************************************************************/

// thief
BEGIN ~AC#4ITH2~

//Larkonlan
BEGIN ~ac#s#cd3~

//Guard
BEGIN ~ac#s#cd4~



CHAIN IF ~NumTimesTalkedTo(0)~ THEN ac#s#cd3 hello_book 
						~Hier sind wir, am vereinbarten Treffpunkt, aber nicht zur vereinbarten Zeit. Ihr kommt spät.~ 
						== AC#4ITH2 ~Wozu dieser ganze Hokuspokus mit den Schutzzaubern, Magier? Vertraut Ihr mir nicht?~ 
						== ac#s#cd3 ~Ich vertraue niemandem in diesem Land. Habt Ihr das Buch, Dieb?~
						== AC#4ITH2 ~Natürlich habe ich es. Habt Ihr denn meine Belohnung?~
						== ac#s#cd3  ~Selbstverständlich. Zeigt mir aber zunächst das Buch, damit ich mich überzeugen kann, dass es das Richtige ist.~
						== AC#4ITH2 ~Es war das Einzige, das der Zwerg bei sich trug. Hier ist es.~
						== ac#s#cd3  ~Hmm. Ja, das ist es. Leibwächter?~
						== ac#s#cd4  ~Ja, Herr?~
						== ac#s#cd3  ~Verbrennt das Buch.~
						== AC#4ITH2 ~Was tut Ihr da? Weshalb sollte ich es Euch besorgen, wenn Ihr es nun zerstört?~
						== ac#s#cd3  ~Das soll nicht Eure Sorge sein. Euer Auftrag lautete, den Zwergen das Buch zu entwenden. Ich selbst habe dafür keine Verwendung - wichtig war lediglich, dass es die Zwerge nicht in ihre Stadt bringen!~
						= ~Nun verbrennt es schon!~
						== ac#s#cd4  ~Jawohl, Herr.~
						END
						IF ~~ THEN DO ~StartCutSceneMode()
						StartCutScene("AC#0701A")~ EXIT
						
CHAIN IF ~True()~ THEN ac#s#cd3 book_burned	
						~Idiot! Ich hatte ihm doch gesagt, er solle das Buch anzünden - und nicht sich selbst!~ 
						== AC#4ITH2 ~Das Buch ist noch da, Euer Leibwächter jedoch nicht mehr.~ 
						== ac#s#cd3 ~Hmm... Scheint so, als wäre das Buch doch mit einem Dweomer versehen gewesen. Egal. Darum kümmern wir uns später!~
						== AC#4ITH2 ~Was wird nun aus meiner Belohnung?~
						== ac#s#cd3 ~Die sollt Ihr natürlich bekommen. Es war wie immer eine Freude, mit Euch zusammenzuarbeiten! Ich habe hier die vereinbarten...~
						= ~He, wer ist denn da? Zu den Waffen, wir werden belauscht!~
						END
						IF ~~ THEN DO ~Enemy()
						ActionOverride("AC#4ITH2",Enemy())
						ActionOverride("ac#s#cd4",Enemy())~ EXIT

						