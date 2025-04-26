/*******************************************************************************************************
Thargrun, driftdisc-quest (creates mercury out of cinnabarit
*******************************************************************************************************/
BEGIN ~AC#55TDR~

IF ~Global("MercuryCreation","ACIL55",2)~ THEN BEGIN gratulations_mercury
SAY ~Na, das ist ja gut gelaufen. Glückwunsch zu Eurem ersten Stück Quecksilber! Jetzt passt auf, dass Euch nicht alles gleich wieder in den Händen zerrinnt.~
IF ~~ THEN DO ~SetGlobal("MercuryCreation","ACIL55",10)
AddJournalEntry(@64224,QUEST)~ EXIT 
END

IF ~True()~ THEN BEGIN hello_0
SAY ~Ihr seid kein Schmied und erst recht kein Erzarbeiter. Was sollt Ihr?~
IF ~~ THEN REPLY ~Darf ich Euch etwas fragen?~ + nope
IF ~GlobalGT("AC#Return_to_Surface","GLOBAL",3)~ THEN REPLY ~Dorna Abgrundlied meinte, Ihr könntet mir helfen, aus Erz Quecksilber herzustellen.~ + mercury_01
IF ~~ THEN REPLY ~Bin schon wieder weg.~ GOTO bye
END

	IF ~~ THEN BEGIN mercury_01
	SAY ~Habt Ihr denn das passende Erz?~
	IF ~PartyHasItem("AC#CINNA")~ THEN REPLY ~Ich habe hier etwas Cinnabarit.~ GOTO yes
	IF ~!PartyHasItem("AC#CINNA")~ THEN REPLY ~Nein, noch nicht.~ GOTO no
	END

		IF ~~ THEN BEGIN yes
		SAY ~Oh! Hätt' ich Euch gar nicht zugetraut. Gute Arbeit!~
		IF ~~ THEN REPLY ~Wie kann ich daraus Quecksilber herstellen?~ GOTO make_mercury
		END
		
			IF ~~ THEN BEGIN make_mercury
			SAY ~Der Prozess ist eigentlich recht einfach, selbst für einen <RACE> wie Euch. Wir nennen den Vorgang "Quecksilber rösten". Legt das Erz in den Ofen hinter mir, wartet ein wenig, dann wird das reine Quecksilber aus dem Cinnabarit ausgeschwitzt und Ihr könnt es aufnehmen. Habt Ihr das verstanden?~
			IF ~~ THEN REPLY ~Das Erz in den Ofen legen und warten, bis Quecksilber daraus wird. Ja, das bekomme ich hin.~ GOTO make_mercury_02
			IF ~~ THEN REPLY ~Nein, das habe ich nicht verstanden.~ + not_understood
			END
			
				IF ~~ THEN BEGIN not_understood
				SAY ~*Seufz*. Kein Wunder sind Eure Rüstungen an der Oberfläche so hässlich. Also nochmal: Legt das Erz in den Ofen hinter mir, wartet, bis es beginnt, silbrig zu glänzen, und dann nehmt Ihr das silberne Zeug - das Quecksilber - vorsichtig heraus, ohne Euch die Oberflächen-Pfoten zu verbrennen.~
				IF ~~ THEN GOTO make_mercury_02  
				END
				
					IF ~~ THEN BEGIN make_mercury_02
					SAY ~Na dann los.~
					IF ~~ THEN DO ~EraseJournalEntry(@64222)
					AddJournalEntry(@64223,QUEST)~ EXIT
					END
				
		IF ~~ THEN BEGIN no
		SAY ~Dann kommt wieder, wenn Ihr welches habt.~
		IF ~~ THEN EXIT
		END

IF ~~ THEN BEGIN bye
SAY ~Hmpf.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN nope
SAY ~Nein.~
IF ~~ THEN EXIT 
END

/*******************************************************************************************************
Overseer Brommund
*******************************************************************************************************/
BEGIN ~AC#55DW2~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
  SAY ~Heda! Was seid Ihr für ein <RACE>, dass Ihr einfach so in unsere Schmiede spaziert?!~
  IF ~~ THEN REPLY ~Was ist das für ein Ort?~ + whats_this_place
  IF ~~ THEN REPLY ~Ich wollte mich nur kurz umsehen und bin gleich wieder weg.~  GOTO look_around
  IF ~~ THEN REPLY ~Ich suche hier jemanden.~ + looking_for_someone
END

	IF ~~ THEN BEGIN look_around
	SAY ~Ist ja gut. Nur so, wie Ihr ausseht, könnt Ihr weder mit Hammer noch mit dem Schmelzofen gefahrlos umgehen. Passt also auf und steht nicht einfach dumm im Weg herum. Von der Sorte haben hier genug.~
	IF ~~ THEN REPLY ~Danke, ich werde mich wieder auf den Weg machen.~ GOTO bye
	END
	
	IF ~~ THEN BEGIN whats_this_place
	SAY ~Das, <GIRLBOY>, ist die Arnschädelhalle. Die beste Schmiede im Unterreich! Wir fertigen hier neben Waffen und Rüstungen auch jeden Alltagsgegenstand, den die Bewohner Iltkazars benötigen.~
	 IF ~~ THEN REPLY ~Ich wollte mich nur kurz umsehen und bin gleich wieder weg.~  GOTO look_around
	END
	
	IF ~~ THEN BEGIN looking_for_someone
	SAY ~Ach. Wer soll es denn sein?~
	IF ~~ THEN REPLY ~Niemand wichtiges. Ich werde mich wieder auf den Weg machen.~ + bye
	IF ~GlobalGT("AC#Return_to_Surface","GLOBAL",3)~ THEN REPLY ~Ein Zwerg namens Thargrun Trunkensang soll mir helfen, aus einem Erz Quecksilber herzustellen.~ + looking_4_Thargrun
	IF ~OR(3)
	GlobalGT("AC#HizagkuurQuest","GLOBAL",0)
	GlobalGT("AC#Vronia_Quest","GLOBAL",6)
	GlobalGT("AC#RC_Sorni_Fourth","GLOBAL",0)~ THEN REPLY ~Ich suche Sorni Arnschädel.~ + looking_4_Sorni
	IF ~GlobalGT("AC#BetrangridQuest","GLOBAL",0)~ THEN REPLY ~Ich suche Whundaed, den Fiebereisenschmied.~  GOTO looking_4_Whundaed
	END
	
		IF ~~ THEN BEGIN looking_4_Thargrun
		SAY ~Quecksilber herstellen? Ihr gebt ja gleich mächtig Feuer in die Esse! Thargrun ist in der großen Schmiedehalle nordwestlich von hier. Nehmt einfach den Durchgang hinter mir, folgt den Flüchen und Ihr werdet ihn schnell finden.~
		IF ~~ THEN REPLY ~Ich habe noch weitere Fragen.~ + questions
		IF ~~ THEN REPLY ~Danke, ich werde mich wieder auf den Weg machen.~ GOTO bye
		END
		
		IF ~~ THEN BEGIN bye
		SAY ~Nun denn. wenn Ihr sonst noch etwas braucht, fragt mich. Oder wenn Ihr jemanden in der Arnschädelhalle sucht. Ist schließlich meine Aufgabe hier unten, auf alles aufzupassen.~
		IF ~~ THEN EXIT 
		END
		
		IF ~~ THEN BEGIN looking_4_Sorni
		SAY ~Ihr sucht die Schmiedeherrin? Die ist nicht hier in diesem Stockwerk. Sie ist eine Ebene tiefer, bei den Hochöfen, in der Azerkyn-Halle. Nehmt eine der großen Treppen im Nord- oder Südwesten dieser Halle. Ihr findet sie meist in der Nähe des Lavaflusses bei den Hochöfen. Aber nehmt Euch in Acht - sie ist stark wie ein Höhlenbär! Sie kann ein Stück Stahl allein mit ihrer Armeskraft zurechtbiegen. Ihr solltet ihr lieber nicht krumm kommen.~
		IF ~~ THEN REPLY ~Ich habe noch weitere Fragen.~ + questions
		IF ~~ THEN REPLY ~Danke, ich werde mich wieder auf den Weg machen.~ GOTO bye 
		END
		
		IF ~~ THEN BEGIN looking_4_Whundaed
		SAY ~Whundaed ist im Osten in der Fiebereisenschmiede. Nehmt den Durchgang gegenüber von mir im Südosten. Wenn Euch plötzlich kalt wird, seid Ihr in der Nähe, weil die Fiebereisenschmiede ihre Arbeit nur bei extremer Kälte verrichten können.~
		IF ~~ THEN REPLY ~Ich habe noch weitere Fragen.~ + questions
		IF ~~ THEN REPLY ~Danke, ich werde mich wieder auf den Weg machen.~ GOTO bye 
		END
		
IF ~True()~ THEN BEGIN hello_1
  SAY ~Seid gegrüßt, <RACE>.~
  IF ~~ THEN + questions
  END
  
  IF ~~ THEN BEGIN questions
SAY ~Was wollt Ihr von mir?~
  IF ~~ THEN REPLY ~Was ist das für ein Ort?~ + whats_this_place
  IF ~~ THEN REPLY ~Ich suche hier jemanden.~ + looking_for_someone
  IF ~~ THEN REPLY ~Ich werde mich wieder auf den Weg machen.~ GOTO bye
END
/*******************************************************************************************************
Dialog Whundaed, Fiebereisenschmied
*******************************************************************************************************/
BEGIN ~AC#55SM1~

IF ~Global("AC#BetrangridQuest","GLOBAL",10)~ THEN BEGIN hello_again
  SAY ~Ihr schon wieder! Habt Ihr das Schwert hoffentlich schon der Glücksmaid übergeben?~
  IF ~~ THEN REPLY ~Ich entschuldige die Störung und werde Euch in Ruhe lassen.~  GOTO bye_again
  IF ~PartyHasItem("ac#52HA1")~ THEN REPLY ~Betrangrid hat mir das Schwert überlassen. Sie meinte, ich könnte die Klinge auch gegen eine andere Waffe bei Euch eintauschen.~  GOTO change_blade
END

IF ~Global("AC#BetrangridQuest","GLOBAL",2)~ THEN BEGIN hello_again_02
  SAY ~Ihr schon wieder! Habt Ihr das Schwert hoffentlich schon der Glücksmaid übergeben?~
  IF ~~ THEN REPLY ~Ich entschuldige die Störung und werde Euch in Ruhe lassen.~  GOTO bye_again
  IF ~~ THEN REPLY ~Nein, ich habe stattdessen noch einige Fragen an Euch.~  GOTO questions
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY ~Jemanden wie Euch bekommt man in der Arnschädelhalle wahrlich nicht häufig zu Gesicht! Passt auf, ich trage gerade einen Tiegel mit heißen Fiebereisen!~
  IF ~~ THEN REPLY ~Ich entschuldige die Störung und werde Euch in Ruhe lassen.~  GOTO bye
  IF ~Global("AC#BetrangridQuest","GLOBAL",1)~ THEN REPLY ~Betrangrid aus dem Tempel Haelas bat mich, ihre Klinge bei Euch hier abzuholen.~  GOTO get_blade
END

IF ~True()~ THEN BEGIN hello_again_02
  SAY ~Ihr mögt wohl die Kälte hier in der Kammer, oder warum steht Ihr mir schon wieder im Wege herum?~
  IF ~~ THEN REPLY ~Ich entschuldige die Störung und werde Euch in Ruhe lassen.~  GOTO bye_again
  IF ~~ THEN REPLY ~Ich habe noch einige Fragen an Euch.~  GOTO questions
  IF ~Global("AC#BetrangridQuest","GLOBAL",1)~ THEN REPLY ~Betrangrid aus dem Tempel Haelas bat mich, ihre Klinge bei Euch hier abzuholen.~  GOTO get_blade
END

IF ~~ THEN BEGIN questions
  SAY ~Sehe ich so aus, als hätte ich Langeweile? Alos gut, was wollt Ihr denn von einem *telor* wie mir wissen?~
  IF ~~ THEN REPLY ~Ich entschuldige die Störung und werde Euch in Ruhe lassen.~  GOTO bye_again
  IF ~~ THEN REPLY ~Was macht Ihr hier?~  GOTO fever_iron
  IF ~~ THEN REPLY ~Warum ist es hier so kalt?~  GOTO why_hot
  IF ~~ THEN REPLY ~Was ist denn der Vorteil einer Fiebereisenwaffe?~  GOTO feveriron_advantage
END

IF ~~ THEN BEGIN fever_iron
  SAY ~Dies hier ist die Fiebereisenschmiede, und ich und meine *toren* hier bearbeiten dieses seltene Metall.~
  IF ~~ THEN REPLY ~Ich entschuldige die Störung und werde Euch in Ruhe lassen.~  GOTO bye_again
  IF ~~ THEN REPLY ~Ich habe noch weitere Fragen an Euch.~  GOTO questions
END

IF ~~ THEN BEGIN why_hot
  SAY ~Seht Ihr den Bottich da drüben? Fiebereisen ist bei normaler Temperatur flüssig und siedend heiß. Wir müssen es herunterkühlen, um es verarbeiten zu können. Deshalb sind unsere Öfen hier in der Kammer von den Priestern unseres Clans derart verzaubert worden, dass sie die ganze Kammer abkühlen.~
  IF ~~ THEN REPLY ~Ich entschuldige die Störung und werde Euch in Ruhe lassen.~  GOTO bye_again
  IF ~~ THEN REPLY ~Ich habe noch weitere Fragen an Euch.~  GOTO questions
END

IF ~~ THEN BEGIN feveriron_advantage
  SAY ~Das ist doch klar wie ein polierter Kupferschild! Das Metall glüht ja von selbst, wir müssen es nicht mal verzaubern, damit es den Gegner verbrennt.~
  IF ~~ THEN REPLY ~Ich entschuldige die Störung und werde Euch in Ruhe lassen.~  GOTO bye_again
  IF ~~ THEN REPLY ~Ich habe noch weitere Fragen an Euch.~  GOTO questions
END

IF ~~ THEN BEGIN bye_again
SAY ~Gute Idee!~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN change_blade
SAY ~Hat sie das? Immer diese Glücksmädels mit ihren Ränkespielen. Also hört mal zu: Ich schmiede nicht einfach so für jemanden eine Fiebereisenwaffe, auch wenn Ihr noch so viel betteln möget.~
    IF ~~ THEN REPLY ~Genau das wurde mir aber versprochen.~  GOTO change_blade_02
END

IF ~~ THEN BEGIN change_blade_02
SAY ~Und ich würde nie das Wort einer dieser waffenschwingenden Zwerginnen in Frage stellen. Also passt mal auf: Ich habe hier einige Waffen auf Vorrat, die Ihr kaufen könnt, wenn Ihr die Klinge, die Ihr gerade besitzt, nicht wollt.~
    IF ~~ THEN REPLY ~Ja, so ist es.~  GOTO change_blade_03
END

IF ~~ THEN BEGIN change_blade_03
SAY ~Gut. Dafür findet sich bestimmt ein anderer Abnehmer.~
IF ~~ THEN DO ~TakePartyItem("ac#52HA1")~ EXIT
END

IF ~~ THEN BEGIN bye
SAY ~Gute Idee!~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN get_blade
SAY ~Und deshalb schickt sie gerade einen wie Euch hierher? Wie merkwürdig von ihr.~
=
~Nun ja, das soll nicht mein *bedorn* sein. Hier ist die Klinge.~
  IF ~~ THEN DO ~GiveItemCreate("ac#52HA1",LastTalkedToBy,1,0,0)
  SetGlobal("AC#BetrangridQuest","GLOBAL",2)~ GOTO get_blade_02
END

IF ~~ THEN BEGIN get_blade_02
SAY ~Geht sorgsam damit um. Es dauert lange, das Fiebereisen zu formen, und ich möchte nicht, dass ein Oberflächen-<PRO_RACE> sie gleich wieder kaputtmacht.~
    IF ~~ THEN REPLY ~Ich werde vorsichtig sein, das verspreche ich.~  GOTO take_care
END

IF ~~ THEN BEGIN take_care
SAY ~Gut. Und jetzt lasst mich schnell weiter mit meinem Tiegel arbeiten, bevor sich das Fiebereisen noch wieder erhitzt.~
    IF ~~ THEN DO ~AddJournalEntry(@52101,QUEST)
EraseJournalEntry(@52100)~ EXIT
END



