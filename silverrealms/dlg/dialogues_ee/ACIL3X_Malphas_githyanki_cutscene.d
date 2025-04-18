/*******************************************************************************************************
Cutscene Malphas - Duergar
*******************************************************************************************************/

// Harmswa, Gith leader
BEGIN ~AC#3XGI1~

//Malphas
BEGIN ~AC#MALG1~




CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#MALG1 hello
						~Seid Ihr des Wahnsinns, Gith? Wie konntet Ihr so töricht sein, in die Zwergenstadt einzudringen?~ 
						== AC#3XGI1 ~Der Magier hatte uns entdeckt. Wir mussten die Gelegenheit ... am Schopfe packen. Sonst wäre unsere Basis nicht mehr sicher gewesen.~
						== AC#MALG1 ~Ich gab Euch das Zepter, um es weise einzusetzen, nicht, um es in sinnlosen Aktionen zu vergeuden!~
						== AC#3XGI1 ~Bitte entschuldigt. Es wird nicht wieder vorkommen. Dennoch möchte ich Euch darauf hinweisen, dass wir Eure Verbündeten, nicht Eure Untergebenen sind.~						
						== AC#MALG1 ~Ihr wisst, dass Euch der Schwur, den Euer Volk meiner Herrin gab, zu diesem Dienst verpflichtet.~
						== AC#3XGI1 ~In der Tat. In der Zwergenstadt hält sich übrigens ein <PRO_RACE> namens <CHARNAME> auf. Er schien nicht aus der Stadt zu stammen, aber mit den Zwergen im Bunde zu sein.~ 
						== AC#MALG1 ~Bei den stinkenden Sieben Himmeln, schon wieder dieser Name!~
						== AC#3XGI1 ~Sollen wir uns um <CHARNAME> kümmern?~
						== AC#MALG1 ~Hmmm... Das will wohl überlegt sein. Früher oder später werdet Ihr ohnehin auf <PRO_HIMHER> treffen. Und nun lasst mich zurück zu unserem Gefangenen!~
						END
						IF ~~ THEN DO ~StartCutSceneMode()
						StartCutScene("AC#GCT2")~ EXIT
						