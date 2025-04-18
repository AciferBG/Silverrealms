// ---------------------------------------------
// AC#53BKM: Buchbindemaschine
// ---------------------------------------------

BEGIN ~AC#53BKM~

IF ~True()~ THEN BEGIN 0
  SAY ~Die Maschine summt, und wenn Ihr Blätter habt, die gebunden werden sollen, könnt Ihr sie nun auf die dafür vorgesehenen Klappen legen.~
  IF ~~ THEN REPLY ~(Nichts tun und von der Maschine weggehen.)~ GOTO exit
  IF ~PartyHasItem("AC#53PA1")
  PartyHasItem("AC#53PA2")
  PartyHasItem("AC#53PA3")
  PartyHasItem("AC#53PA4")
  PartyHasItem("AC#53PA5")~ THEN REPLY ~(Versuchen, ein Buch zu binden)~ GOTO make_book_start
    IF ~OR(5)
  !PartyHasItem("AC#53PA1")
  !PartyHasItem("AC#53PA2")
  !PartyHasItem("AC#53PA3")
  !PartyHasItem("AC#53PA4")
  !PartyHasItem("AC#53PA5")~ THEN REPLY ~(Versuchen, ein Buch zu binden)~ GOTO not_enogh_pages
END 

	IF ~~ THEN BEGIN not_enogh_pages
	SAY ~Gerade, als Ihr beginnen wollt, stellt Ihr fest, dass Ihr noch nicht alle Blätter beisammen habt, um das Buch zu binden.~
	IF ~~ THEN EXIT
	END
  
	  IF ~~ THEN BEGIN make_book_start
	  SAY ~Welches Blatt wollt Ihr als Erstes auf den Mechanismus legen?~
	  IF ~PartyHasItem("AC#53PA1")~ THEN REPLY ~(Das Blatt mit der Überschrift "Die Geschichte der Schildzwerge" auf den Arbeitsblock legen)~ GOTO RIGHT_PAGE_2
	  IF ~PartyHasItem("AC#53PA2")~ THEN REPLY ~(Das Blatt mit der Überschrift "Alatorin" auf den Arbeitsblock legen)~ DO ~TakePartyItem("AC#53PA2") DestroyItem("AC#53PA2")~ GOTO WRONG_CYCLE
	  IF ~PartyHasItem("AC#53PA3")~ THEN REPLY ~(Das Blatt mit der Überschrift "Tief-Shanatar" auf den Arbeitsblock legen)~ DO ~TakePartyItem("AC#53PA3") DestroyItem("AC#53PA3")~ GOTO WRONG_CYCLE
	  IF ~PartyHasItem("AC#53PA4")~ THEN REPLY ~(Das Blatt mit der Überschrift "Verrat von Coramshan" auf den Arbeitsblock legen)~ DO ~TakePartyItem("AC#53PA4") DestroyItem("AC#53PA4")~ GOTO WRONG_CYCLE
	  IF ~PartyHasItem("AC#53PA5")~ THEN REPLY ~(Das Blatt mit der Überschrift "Die Bruderkriege" auf den Arbeitsblock legen)~ DO ~TakePartyItem("AC#53PA5") DestroyItem("AC#53PA5")~ GOTO WRONG_CYCLE
	  IF ~~ THEN REPLY ~Den Hebel für den Start des Buchbindeverfahrens in Bewegung setzen.~ GOTO WRONG_END_02
	  IF ~~ THEN REPLY ~(Nichts tun und von der Maschine weggehen.)~ GOTO exit_02
	  END

	IF ~~ THEN BEGIN WRONG_CYCLE
	  SAY ~Ihr legt das Blatt ab und hofft, dass es das Richtige gewesen ist.~
	  IF ~~ THEN GOTO WRONG_CYCLE_NOT_FINISHED
	END
	
		IF ~~ THEN BEGIN WRONG_CYCLE_NOT_FINISHED
		  SAY ~Das Buch ist noch nicht gebunden. Ihr könnt weitere Blätter hinzufügen oder das Buchbindeverfahren in Gang setzen.~
		  IF ~~ THEN GOTO WRONG_CYCLE_02
		END
	
		IF ~~ THEN BEGIN WRONG_CYCLE_02
		  SAY ~Was wollt Ihr als nächstes tun?~
		  IF ~PartyHasItem("AC#53PA1")~ THEN REPLY ~(Das Blatt mit der Überschrift "Die Geschichte der Schildzwerge" auf den Arbeitsblock legen)~ DO ~TakePartyItem("AC#53PA1")~ GOTO WRONG_CYCLE
		  IF ~PartyHasItem("AC#53PA2")~ THEN REPLY ~(Das Blatt mit der Überschrift "Alatorin" auf den Arbeitsblock legen)~ DO ~TakePartyItem("AC#53PA2")~ GOTO WRONG_CYCLE
		  IF ~PartyHasItem("AC#53PA3")~ THEN REPLY ~(Das Blatt mit der Überschrift "Tief-Shanatar" auf den Arbeitsblock legen)~ DO ~TakePartyItem("AC#53PA3")~ GOTO WRONG_CYCLE
		  IF ~PartyHasItem("AC#53PA4")~ THEN REPLY ~(Das Blatt mit der Überschrift "Verrat von Coramshan" auf den Arbeitsblock legen)~ DO ~TakePartyItem("AC#53PA4")~ GOTO WRONG_CYCLE
		  IF ~PartyHasItem("AC#53PA5")~ THEN REPLY ~(Das Blatt mit der Überschrift "Die Bruderkriege" auf den Arbeitsblock legen)~ DO ~TakePartyItem("AC#53PA5")~ GOTO WRONG_CYCLE
		  IF ~~ THEN REPLY ~Den Hebel für den Start des Buchbindeverfahrens in Bewegung setzen.~ GOTO WRONG_END_02
		  IF ~~ THEN REPLY ~(Nichts tun und von der Maschine weggehen.)~ GOTO exit_02
		END

IF ~~ THEN BEGIN RIGHT_PAGE_2
  SAY ~Was wollt Ihr als nächstes tun?~
  IF ~~ THEN REPLY ~(Nichts tun und von der Maschine weggehen.)~ GOTO exit_02
  IF ~PartyHasItem("AC#53PA2")~ THEN REPLY ~(Das Blatt mit der Überschrift "Alatorin" auf den Arbeitsblock legen)~ GOTO RIGHT_PAGE_3
  IF ~PartyHasItem("AC#53PA3")~ THEN REPLY ~(Das Blatt mit der Überschrift "Tief-Shanatar" auf den Arbeitsblock legen)~ DO ~TakePartyItem("AC#53PA3")~ GOTO WRONG_CYCLE
  IF ~PartyHasItem("AC#53PA4")~ THEN REPLY ~(Das Blatt mit der Überschrift "Verrat von Coramshan" auf den Arbeitsblock legen)~ DO ~TakePartyItem("AC#53PA4")~ GOTO WRONG_CYCLE
  IF ~PartyHasItem("AC#53PA5")~ THEN REPLY ~(Das Blatt mit der Überschrift "Die Bruderkriege" auf den Arbeitsblock legen)~ DO ~TakePartyItem("AC#53PA5")~ GOTO WRONG_CYCLE
  IF ~~ THEN REPLY ~Den Hebel für den Start des Buchbindeverfahrens in Bewegung setzen.~ GOTO WRONG_END_02
END

IF ~~ THEN BEGIN RIGHT_PAGE_3
  SAY ~Was wollt Ihr als nächstes tun?~
  IF ~~ THEN REPLY ~(Nichts tun und von der Maschine weggehen.)~ GOTO exit_02
  IF ~PartyHasItem("AC#53PA3")~ THEN REPLY ~(Das Blatt mit der Überschrift "Tief-Shanatar" auf den Arbeitsblock legen)~ GOTO RIGHT_PAGE_4
  IF ~PartyHasItem("AC#53PA4")~ THEN REPLY ~(Das Blatt mit der Überschrift "Verrat von Coramshan" auf den Arbeitsblock legen)~ DO ~TakePartyItem("AC#53PA4")~ GOTO WRONG_CYCLE
  IF ~PartyHasItem("AC#53PA5")~ THEN REPLY ~(Das Blatt mit der Überschrift "Die Bruderkriege" auf den Arbeitsblock legen)~ DO ~TakePartyItem("AC#53PA5")~ GOTO WRONG_CYCLE
  IF ~~ THEN REPLY ~Den Hebel für den Start des Buchbindeverfahrens in Bewegung setzen.~ GOTO WRONG_END_02
END

IF ~~ THEN BEGIN RIGHT_PAGE_4
  SAY ~Was wollt Ihr als nächstes tun?~
  IF ~~ THEN REPLY ~(Nichts tun und von der Maschine weggehen.)~ GOTO exit_02
  IF ~PartyHasItem("AC#53PA4")~ THEN REPLY ~(Das Blatt mit der Überschrift "Verrat von Coramshan" auf den Arbeitsblock legen)~ GOTO RIGHT_PAGE_5
  IF ~PartyHasItem("AC#53PA5")~ THEN REPLY ~(Das Blatt mit der Überschrift "Die Bruderkriege" auf den Arbeitsblock legen)~ DO ~TakePartyItem("AC#53PA5")~ GOTO WRONG_CYCLE
  IF ~~ THEN REPLY ~Den Hebel für den Start des Buchbindeverfahrens in Bewegung setzen.~ GOTO WRONG_END_02
END

IF ~~ THEN BEGIN RIGHT_PAGE_5
  SAY ~Was wollt Ihr als nächstes tun?~
  IF ~~ THEN REPLY ~(Nichts tun und von der Maschine weggehen.)~ GOTO exit_02
  IF ~PartyHasItem("AC#53PA5")~ THEN REPLY ~(Das Blatt mit der Überschrift "Die Bruderkriege" auf den Arbeitsblock legen)~ GOTO RIGHT_END
  IF ~~ THEN REPLY ~Den Hebel für den Start des Buchbindeverfahrens in Bewegung setzen.~ GOTO WRONG_END_02
END

IF ~~ THEN BEGIN RIGHT_END
  SAY ~Ihr habt keine Blätter mehr, die Ihr auf das gerät legen könntet.~
  IF ~~ THEN REPLY ~(Nichts tun und von der Maschine weggehen.)~ GOTO exit_02
  IF ~~ THEN REPLY ~Den Hebel für den Start des Buchbindeverfahrens in Bewegung setzen.~ GOTO RIGHT_END_02
END

IF ~~ THEN BEGIN RIGHT_END_02
  SAY ~Die Maschine rattert und quietscht, als sie sich in Bewegung setzt, und nach kurzer Zeit wirft sie ein fertig gedrucktes Buch in einen dafür vorgesehenen Behälter. Ihr nehmt das Buch schnell an Euch und hofft, dass Ihr die Seiten zusammengesetzt habt.~ [AM0307E]
  IF ~~ THEN DO ~TakePartyItem("AC#53PA1")
TakePartyItem("AC#53PA2")
TakePartyItem("AC#53PA3")
TakePartyItem("AC#53PA4")
TakePartyItem("AC#53PA5")
SetGlobal("AC#bookbinder","ACIL53",2)
AddJournalEntry(@53109,QUEST)
GiveItemCreate("AC#53BK1",LastTrigger,0,0,0)~ EXIT
END

IF ~~ THEN BEGIN WRONG_END_02
  SAY ~Die Maschine rattert und quietscht, als sie sich in Bewegung setzt, und nach kurzer Zeit wirft sie ein fertig gedrucktes Buch in einen dafür vorgesehenen Behälter. Ihr nehmt das Buch schnell an Euch und hofft, dass Ihr die Seiten zusammengesetzt habt.~ [AM0307E]
  IF ~~ THEN DO ~TakePartyItem("AC#53PA1")
TakePartyItem("AC#53PA2")
TakePartyItem("AC#53PA3")
TakePartyItem("AC#53PA4")
TakePartyItem("AC#53PA5")
SetGlobal("AC#bookbinder","ACIL53",2)
AddJournalEntry(@53109,QUEST)
GiveItemCreate("AC#53BK2",LastTrigger,0,0,0)~ EXIT
END


IF ~~ THEN BEGIN exit_02
  SAY ~Ihr nehmt die bereits vorbereiteten Blätter wieder von dem Gerät und wendet Euch von der Maschine ab.~
  IF ~~ THEN DO ~TakePartyItem("AC#53PA1")
TakePartyItem("AC#53PA2")
TakePartyItem("AC#53PA3")
TakePartyItem("AC#53PA4")
TakePartyItem("AC#53PA5")
GiveItemCreate("AC#53PA1",LastTrigger,0,0,0)
GiveItemCreate("AC#53PA2",LastTrigger,0,0,0)
GiveItemCreate("AC#53PA3",LastTrigger,0,0,0)
GiveItemCreate("AC#53PA4",LastTrigger,0,0,0)
GiveItemCreate("AC#53PA5",LastTrigger,0,0,0)~ EXIT
END

/*
IF ~~ THEN BEGIN exit_02
  SAY ~Ihr lasst die bereits vorbereiteten Blätter auf dem Gerät und wendet Euch von der Maschine ab.~
  IF ~~ THEN EXIT
END
*/

IF ~~ THEN BEGIN exit
  SAY ~Ihr wendet Euch wieder von der Maschine ab.~
  IF ~~ THEN EXIT
END



