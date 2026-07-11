

/*******************************************************************************************************
Dialog mit Kalzareinads Herz
*******************************************************************************************************/

BEGIN ~AC#HEAR1~

IF ~Global("AC#Heart","ACIL79",7)~ THEN BEGIN heart_02
SAY  ~Das riesige Herz pulsiert in einem gleichmäßigen Rhythmus.~
++ ~Das Herz in Ruhe lassen.~ + 16
++ ~Versuchen, mit Kalzareinad zu sprechen.~ + talk_to_Kalzareinad
IF ~Global("AC#MithbarakazCurse","GLOBAL",0)~ THEN REPLY ~Eine Waffe in das Herz treiben und es zerstören.~ + kill_heart_mith_NOT_cured
IF ~Global("AC#MithbarakazCurse","GLOBAL",1)~ THEN REPLY ~Eine Waffe in das Herz treiben und es zerstören.~ + kill_heart_mith_cured
END

	IF ~~ THEN BEGIN talk_to_Kalzareinad
	SAY ~Niemand antwortet.~
	IF ~~ THEN EXIT
	END

IF ~GlobalLT("AC#Heart","ACIL79",3)~ THEN BEGIN 1
SAY  ~Das riesige Herz ruht still vor Euch. Es bewegt sich nicht. Ob sich noch ein einziger Funken Leben in ihm befindet, könnt Ihr nicht erkennen.~
++ ~Das Herz in Ruhe lassen.~ + 16
++ ~Das Herz berühren.~ + 3
++ ~Einige Tropfen Eures Blutes auf das Herz träufeln.~ + 4
END

IF ~~ THEN BEGIN 3
   SAY ~Das Herz fühlt sich kalt und feucht an. Gerade, als Ihr Eure Hand wieder entfernen wollt, spürt Ihr eine leichte Bewegung in der riesigen Masse.~
++ ~Das Herz in Ruhe lassen.~ + 16
++ ~Einige Tropfen Eures Blutes auf das Herz träufeln.~ + 4
END

IF ~~THEN BEGIN 4
SAY ~Ihr nehmt ein kleines Messer, ritzt eine kleine Wunde in Eure Handfläche, lasst die Blutstropfen auf das riesige Herz träufeln und beobachtet, wie das Blut langsam an seinen Seiten herunterrinnt.~
   IF ~~ THEN DO ~SetGlobal("AC#Heart","ACIL79",3)
   ApplyDamage(Player1,1,SLASHING)~  EXIT
END

IF ~~ THEN BEGIN 16
   SAY ~Ihr wendet Euch von dem Herz ab.~
   IF ~~ THEN EXIT
END

IF ~~THEN BEGIN kill_heart_mith_NOT_cured
SAY ~Da der Fluch noch nicht von Mith Barak genommen wurde, wird der Silberdrache nach dem Tod Kalzareinads zeitlebens in seiner Zwergengestalt leben müssen, wenn Ihr Kalzareinad nun den endgültigen Todesstoß versetzt.~
   ++ ~Das Herz in Ruhe lassen.~ + 16
   IF ~~ THEN REPLY ~Eine Waffe in das Herz treiben und es zerstören.~ + kill_heart
END

IF ~~THEN BEGIN kill_heart_mith_cured
SAY ~Da der Fluch von Mith Barak genommen wurde, könnt Ihr Kalzareinad vernichten - allerdings wird dies dem Drachen Maldraedior alles andere als gefallen.~
   ++ ~Das Herz in Ruhe lassen.~ + 16
   IF ~~ THEN REPLY ~Eine Waffe in das Herz treiben und es zerstören.~ + kill_heart
END

	IF ~~THEN BEGIN kill_heart
	SAY ~Die Waffe dringt mühelos in das Innere des pulsierenden Herzens ein. Es gibt einen Ruck, bevor das Organ kraftlos in sich zusammenfällt. Ein riesiges Loch klafft nun an der Stelle, an der Ihr Kalzareinad den Todesstoß gegeben habt.~
	   IF ~~ THEN DO ~SetGlobal("AC#Heart","ACIL79",8)~  EXIT
	END


