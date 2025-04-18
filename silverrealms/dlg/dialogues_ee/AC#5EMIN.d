

/*******************************************************************************************************
Dialog Mindflayer in Mirror
*******************************************************************************************************/

BEGIN ~AC#5EMIN~


IF ~True()~ THEN BEGIN 1
SAY  ~Ihr seid nicht der Magier. Was wollt Ihr?~
IF ~~ THEN REPLY ~Ich wollte sehen, was es mit dem Spiegel auf sich hat.~ + what_mirror
IF ~~ THEN REPLY ~Ein Gedankenschinder! Das erklärt das merkwürdige Verhalten des Magiers.~ + what_mirror
++ ~Wusstet Ihr, dass in einigen Kulturen Tentakel wie die Euren als Delikatesse gelten?~ + cuttlehead
END

	IF ~~THEN BEGIN what_mirror
	SAY ~Nun wisst Ihr es. Sollten wir uns irgendwann einmal begegnen, wird dies Euer Ende sein.~
	++ ~Das werden wir ja sehen, Fischgesicht.~ + cuttlehead
	++ ~Sollten wir uns je wieder begegnen, werde ich über Euch richten, finstere Kreatur!~ + cuttlehead
	++ ~Was hat zwei Glubschaugen, vier Tentakel und das nächste Mal, wenn ich es treffe, meinen Dolch in seinem Schädel stecken?~ + cuttlehead
	END
				
		IF ~~THEN BEGIN cuttlehead
		SAY ~Schimpft nur, soviel Ihr wollt, <RACE>. Unsere Mission ist mit dem Scheitern des Magiers ohnehin beendet. Ihr seid uns noch dienlich, indem Ihr ihm einen qualvollen Tod bereitet.~
		IF ~~ THEN DO ~
		SetGlobal("AC#Mirror","ACIL5E",3)
		~  EXIT
		END
	
