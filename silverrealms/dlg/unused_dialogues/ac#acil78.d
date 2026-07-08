/*******************************************************************************************************
Malphas in ACIL78
*******************************************************************************************************/
BEGIN ~AC#MAL78~

IF ~True()~ THEN BEGIN 0
SAY ~Und schon tappt der zweite Tölpel in die gleiche Falle. Willkommen in der Astralebene, <CHARNAME>. Wie könnt Ihr nur so töricht sein, auf den Spuren Mithbarakaz' zu wandeln und nicht damit zu rechnen, dass wir hier auf Euch warten?~
IF ~~ THEN REPLY ~Wer behauptet denn, dass ich Euch nicht erwartet hätte?~ + 2
IF ~~ THEN REPLY ~Ihr seid derjenige, der Mithbarakaz gefangen hält!~ + captive
END

	IF ~~ THEN BEGIN 2
	SAY ~Oh, wie hochmütig Ihr doch seid. Der Unterschied zwischen Euch und Mithbarakaz ist aber, dass wir Euch nicht gefangen nehmen, sondern auf der Stelle töten werden! Eliminiert diesen <PRO_RACE>, meine Freunde, bevor er uns gefährlich werden kann. Ich werde derweil vorbereiten, dass wir unseren Gefangenen verlegen, nun, da seine Befreier immer näher kommen!~ 
	 IF ~~ THEN DO ~SetGlobal("Malphasspawn","ACIL78",2)
	CreateVisualEffectObject("SPDIMNDR",Myself) 
	Wait(1)				
	DestroySelf()~  EXIT
	END
	
	IF ~~ THEN BEGIN captive
	SAY ~Oh, wie scharfsinnig von Euch. Der Unterschied zwischen Euch und Mithbarakaz ist aber, dass wir Euch nicht gefangen nehmen, sondern auf der Stelle töten werden! Eliminiert diesen <PRO_RACE>, meine Freunde, bevor er uns gefährlich werden kann. Ich werde derweil vorbereiten, dass wir unseren Gefangenen verlegen, nun, da seine Befreier immer näher kommen!~ 
	 IF ~~ THEN DO ~SetGlobal("Malphasspawn","ACIL78",2)
	CreateVisualEffectObject("SPDIMNDR",Myself) 
	Wait(1)				
	DestroySelf()~  EXIT
	END
/*******************************************************************************************************
Anor Kytsev
*******************************************************************************************************/
BEGIN ~AC#78MAG~

IF ~True()~ THEN BEGIN 0
SAY ~Seht her, Brilda - noch mehr arme Seelen, die auf diesem scheußlichen Ödland gestrandet sind!~ /* ~Seht her, Brilda - noch mehr arme Seelen, die auf diesem scheußlichen Ödland gestrandet sind!~ */
IF ~~ THEN EXTERN ~AC#78PRI~ 10
END

IF ~~ THEN BEGIN 2
   SAY ~Hätte ich vorher gewusst, was für ein schwaches Wesen Ihr seid, hätte ich Euch nie mit dieser Aufgabe betraut, Nazuu.~ /* ~Hätte ich vorher gewusst, was für ein schwaches Wesen Ihr seid, hätte ich Euch nie mit dieser Aufgabe betraut, Nazuu.~ */
   =
   ~Nun zu Euch, Neunankömmlinge. Seid gegrüßt, Fremde. Darf ich fragen, was Euch an diesen ungastlichen Ort führt?~ /* ~Nun zu Euch. Seid gegrüßt, Fremde. Darf ich fragen, was Euch an diesen ungastlichen Ort führt?~ */
   ++ ~Wir sind hierhergekommen, um den Gott Kalzareinad zu suchen.~ /* ~Wir sind hierhergekommen, um den Gott Kalzareinad zu suchen.~ */ + 3
END

IF ~~ THEN BEGIN 3
   SAY ~Wenn mich nicht alles täuscht, ist dieser Brocken, auf dem wir hier gerade stehen, das Einzige, was von ihm übrig geblieben ist.~ /* ~Wenn mich nicht alles täuscht, ist dieser Brocken, auf dem wir hier gerade stehen, das Einzige, was von ihm übrig geblieben ist.~ */
   =
   ~Allerdings ist uns Euer Anliegen aber herzlich egal. Eigentlich sind wir nur durch einen ungünstigen Zufall hier gelandet. Wir sind nur...~ /* ~Allerdings ist uns Euer Anliegen aber herzlich egal. Eigentlich sind wir nur durch einen ungünstigen Zufall hier gelandet. Wir sind nur...~ */
IF ~~ THEN EXTERN ~AC#78PRI~ 11
END

IF ~~ THEN BEGIN 4
   SAY ~So kann man sagen, richtig. Aber genug geredet.~ /* ~So kann man sagen, richtig. Aber genug geredet.~ */
   =
   ~Würdet Ihr uns jetzt bitte Euer Schiff überlassen, damit wir diesen Ort hier endlich verlassen können?~ /* ~Würdet Ihr uns jetzt bitte Euer Schiff überlassen, damit wir diesen Ort hier endlich verlassen können?~ */
   IF ~~ THEN DO ~
   Enemy()
   ActionOverride("AC#78PRI",Enemy())
   ActionOverride("AC#78HAM",Enemy())
   ActionOverride("AC#78FAM",Enemy())~  EXIT
END

/*******************************************************************************************************
Brilda
*******************************************************************************************************/

BEGIN ~AC#78PRI~

IF ~~ THEN BEGIN 10
   SAY ~Und sie haben sogar ein Schiff, das uns von hier fortbringen kann, nachdem Euer unfähiger Diener uns hier zwar herteleportiert, aber offensichtlich nicht mehr fortbringen kann.~ /* ~Und sie haben sogar ein Schiff, das uns von hier fortbringen kann, nachdem Euer unfähiger Diener uns hier zwar herteleportiert, aber offensichtlich nicht mehr fortbringen kann.~ */
   IF ~~ THEN EXTERN ~AC#78HAM~ 10
END

IF ~~ THEN BEGIN 11
   SAY ~...auf der Durchreise an einen anderen Ort.~ /* ~...auf der Durchreise an einen anderen Ort.~ */
   IF ~~ THEN EXTERN ~AC#78MAG~ 4
END

/*******************************************************************************************************
Nazuu
*******************************************************************************************************/

BEGIN ~AC#78HAM~

IF ~~ THEN BEGIN 10
   SAY ~Ihr sagtet "Bringt mich zur Astralebene", Herr. Fortbringen war nicht Teil des Paktes, den wir geschlossen haben, Meister.~ /* ~Ihr sagtet "Bringt mich zur Astralebene", Herr. Fortbringen war nicht Teil des Paktes, den wir geschlossen haben, Meister.~ */
   IF ~~ THEN EXTERN ~AC#78MAG~ 2
END