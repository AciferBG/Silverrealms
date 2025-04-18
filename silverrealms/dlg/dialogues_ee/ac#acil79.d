

/*******************************************************************************************************
Dialog mit Kalzareinads Herz
*******************************************************************************************************/

BEGIN ~AC#HEAR1~

IF ~Global("AC#Heart","ACIL79",7)~ THEN BEGIN heart_02
SAY  ~Das riesige Herz pulsiert in einem gleichmäßigen Rhythmus.~
++ ~Das Herz in Ruhe lassen.~ + 16
IF ~Global("AC#MithbarakazCurse","GLOBAL",0)~ THEN REPLY ~Eine Waffe in das Herz treiben und es zerstören.~ + kill_heart
IF ~Global("AC#MithbarakazCurse","GLOBAL",1)~ THEN REPLY ~Eine Waffe in das Herz treiben und es zerstören.~ + kill_heart_mith_cured
END

IF ~GlobalLT("AC#Heart","ACIL79",3)~ THEN BEGIN 1
SAY  ~Das riesige Herz ruht still vor Euch. Es bewegt sich nicht. Ob sich noch ein einziger Funken Leben in ihm befindet, könnt Ihr nicht erkennen.~
++ ~Das Herz in Ruhe lassen.~ + 16
++ ~Das Herz berühren.~ + 3
++ ~Etwas Blut von Euch auf das Herz träufeln.~ + 4
END

IF ~~ THEN BEGIN 3
   SAY ~Das Herz fühlt sich kalt und feucht an. Gerade, als Ihr Eure Hand wieder entfernen wollt, spürt Ihr eine leichte Bewegung in der riesigen Masse.~
++ ~Das Herz in Ruhe lassen.~ + 16
END

IF ~~THEN BEGIN 4
SAY ~Ihr nehmt ein kleines Messer und ritzt eine kleine Wunde in Eure Handfläche. Langsam lasst Ihr die Blutstropfen auf das riesige Herz träufeln und beobachtet, wie das Blut langsam an seinen Seiten herunterrinnt.~
   IF ~~ THEN DO ~SetGlobal("AC#Heart","ACIL79",3)
   ApplyDamage(Player1,1,SLASHING)~  EXIT
END

/*
IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ Jaheira_Comment_Dumathoin
IF ~!IsValidForPartyDialog("Jaheira")~ THEN REPLY ~Was ist hier geschehen?~ + 3
*/

IF ~~ THEN BEGIN 16
   SAY ~Ihr wendet Euch von dem Herz ab.~
   IF ~~ THEN EXIT
END

IF ~~THEN BEGIN kill_heart
SAY ~Die Waffe dringt mühelos in das Innere des pulsierenden Herzens ein. Es gibt einen Ruck, bevor das Organ kraftlos in sich zusammenfällt.~
   IF ~~ THEN DO ~SetGlobal("AC#Heart","ACIL79",8)
   AddexperienceParty(1000)
   AddJournalEntry(@79500,QUEST)~  EXIT
END

IF ~~THEN BEGIN kill_heart_mith_cured
SAY ~Die Waffe dringt mühelos in das Innere des pulsierenden Herzens ein. Es gibt einen Ruck, bevor das Organ kraftlos in sich zusammenfällt. Ein riesiges Loch klafft nun an der Stelle, an der Ihr Kalzareinad den Todessto gegeben habt.~
   IF ~~ THEN DO ~SetGlobal("AC#Heart","ACIL79",8)
   AddexperienceParty(1000)
   AddJournalEntry(@79501,QUEST)~  EXIT
END


