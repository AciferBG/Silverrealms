/*******************************************************************************************************
Cutscene Malphas - Duergar
*******************************************************************************************************/

// Harmswa, Gith leader
BEGIN ~AC#3XGI1~

//Malphas
BEGIN ~AC#MALG1~

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#MALG1 hello
~Seid Ihr des Wahnsinns, Gith? Wie konntet Ihr zulassen, dass Eure Krieger sich diesem <CHARNAME> offenbaren?~
== AC#3XGI1 ~Es schien eine günstige Gelegenheit, den <PRO_RACE> zu eliminieren.~
== AC#MALG1 ~Dieser <PRO_RACE> ist gefährlicher, als Ihr begreift.~
== AC#3XGI1 ~Meine Krieger werden künftig mit größerer Umsicht handeln. Doch vergesst nicht: Wir sind Eure Verbündeten, nicht Eure Untergebenen.~
== AC#MALG1 ~Euer Volk schwor meiner Herrin einen Eid. Dieser Eid bindet Euch an diesen Dienst.~
== AC#3XGI1 ~Der Eid ist uns gegenwärtig.~
== AC#MALG1 ~Dann vergeudet nicht länger meine Zeit. Ich kehre zu unserem Gefangenen zurück.~
END
IF ~~ THEN DO ~StartCutSceneMode()
StartCutScene("AC#GCT2")~ EXIT
						