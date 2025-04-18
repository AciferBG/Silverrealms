/*******************************************************************************************************
Cutscene Malphas - Duergar
*******************************************************************************************************/

// Duergar Clanchief
BEGIN ~AC#T2DU1~

//Malphas
BEGIN ~AC#MALT2~




CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#T2DU1 hello
						~Ihr  habt um eine Audienz bei meiner Rasse gebeten. Was wollt Ihr, Scheusal?~ 
						== AC#MALT2 ~Ich wollte Euch mitteilen, dass die versiegelten Tore in Eure alte Heimat Barakuir wieder geöffnet worden sind.~
						== AC#T2DU1 ~Was? Wer hat dies vollbracht?~ 
						== AC#MALT2 ~Ein trotteliger <PRO_RACE> von der Oberfläche. Allerdings geschah dies unbeabsichtigt, doch es könnte Euch jedoch dennoch zum Vorteil gereichen.~
						== AC#T2DU1 ~Ihr überbringt uns diese Nachricht einfach so?~
						== AC#MALT2 ~Einfach so.~
						== AC#T2DU1 ~Ich glaube Euch nicht.~
						== AC#MALT2 ~Das verletzt mich. Allerdings könntet Ihr diese Gelegenheit beim Schopfe packen, indem Ihr gen Süden marschiert und Eure alte Heimat wieder für Eure Rasse beansprucht.~
						== AC#T2DU1 ~Auf diesem Weg liegt Iltkazar. Wir müssten gefährlich nahe an der Stadt vorbeimarschieren, um Zugang nach Barakuir zu erlangen.~
						== AC#MALT2 ~Das wäre ein ... interessanter Nebeneffekt. Denkt einmal darüber nach...~
						END
						IF ~~ THEN DO ~StartCutSceneMode()
						StartCutScene("AC#T2CT3")~ EXIT
						