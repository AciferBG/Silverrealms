/*******************************************************************************************************
Dialogue Paladin in acil41
*******************************************************************************************************/

BEGIN ~AC#41PAL~


IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello
SAY  ~Habt acht, <RACE>! In dieser Höhle haust ein finsterer Drache!~ 
IF ~~ THEN REPLY ~Oh! Das hatte ich noch gar nicht bemerkt.~ GOTO not_noticed_yet
IF ~~ THEN REPLY ~Ein Drache?~ GOTO not_noticed_yet
IF ~~ THEN REPLY ~Nicht mehr. Habe ihn gerade getötet.~ GOTO already_killed_dragon
IF ~~ THEN REPLY ~Was denkt Ihr, wo ich herkomme? Aus dem Drachenhort, Ihr Vollidiot! Wisst Ihr auch warum? Weil ich den Drachen soeben zur Strecke gebracht habe!~ GOTO already_killed_dragon
END

	IF ~~ THEN BEGIN not_noticed_yet
	SAY ~Fürchtet Euch nicht! Ich bin gekommen, um das Untier zu erschlagen!~
	IF ~~ THEN REPLY ~Nicht nötig. Das habe ich schon erledigt.~ GOTO already_killed_dragon
	IF ~~ THEN REPLY ~Viel Erfolg dabei!~ + good_luck
	END
	
		IF ~~ THEN BEGIN good_luck
		SAY ~Danke! Und jetzt bringt Euch in Sicherheit, denn schon bald wird der Boden hier draußen durch den epischen Kampf erzittern...~
		IF ~~ THEN DO ~EscapeAreaObject("Tracil47")~ EXIT 
		END
	
		IF ~~ THEN BEGIN already_killed_dragon
		SAY ~Bei dem Treuen Zorn! Ihr habt den Drachen bereits erschlagen?!~
		IF ~~ THEN REPLY ~Natürlich habe ich das. Wie sonst hätte ich es lebendig aus dieser Höhle herausgeschafft?~ GOTO of_course
		IF ~~ THEN REPLY ~Ja. Sein Feuer ist erloschen.~ GOTO of_course
		IF ~~ THEN REPLY ~Geht hinein und überzeugt Euch selbst.~ GOTO of_course
		END
		
			IF ~~ THEN BEGIN of_course
			SAY ~Das ist... das ist...~
			=
			~Das ist ja furchtbar! Dieser Drache war meine Queste zur Initiation in den heiligen Orden der Helden der Wachsamkeit in Velen! Was soll ich jetzt tun?~
			IF ~~ THEN REPLY ~Sieht so aus, als müsstet Ihr Euch einen anderen Drachen suchen.~ GOTO new_quest 
			IF ~~ THEN REPLY ~Ihr könnt gerne jedem erzählen, dass Ihr es wart, der den Drachen erschlagen hat.~ GOTO tell_it_was_you 
			END
			
				IF ~~ THEN BEGIN tell_it_was_you
				SAY ~Ein durch und durch unehrenhafter Gedanke! Nein, das kann ich nicht machen.~
				IF ~~ THEN REPLY ~Dann müsst Ihr Euch einen anderen Drachen suchen.~ GOTO new_quest 
				END
			
				IF ~~ THEN BEGIN new_quest
				SAY ~*Seufz* Der Weg eines Paladins ist beschwerlich. Ich muss eine neue Aufgabe finden... und mich ihrer als würdig erweisen! Wo finde ich nur auf die Schnelle einen neuen Drachen?~
				IF ~~ THEN DO ~EscapeArea()~ EXIT 
				END

