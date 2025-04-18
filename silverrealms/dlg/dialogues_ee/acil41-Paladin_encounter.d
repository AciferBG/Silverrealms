/*******************************************************************************************************
Dialogue Paladin in acil41
*******************************************************************************************************/

BEGIN ~AC#41PAL~


IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello
SAY  ~Habt acht, <RACE>! In dieser Höhle haust ein finsterer Drache!~ 
IF ~~ THEN REPLY ~Oh! Das hatte ich noch gar nicht bemerkt.~ GOTO not_noticed_yet
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
		SAY ~Bei dem Treuen Zorn! Ihr habt den Drachen schon erschlagen?!~
		IF ~~ THEN REPLY ~Natürlich habe ich das. Wie sonst hätte ich es lebendig aus dieser Höhle herausgeschafft?~ GOTO of_course
		END
		
			IF ~~ THEN BEGIN of_course
			SAY ~Das ist... das ist...~
			=
			~Das ist ja furchtbar! Dieser Drache war meine Queste zur Initiation in den heiligen Orden der Helden der Wachsamkeit in Velen! Was soll ich jetzt tun?~
			IF ~~ THEN REPLY ~Sieht so aus, als müsstet Ihr Euch einen anderen Drachen suchen.~ GOTO new_quest 
			END
			
				IF ~~ THEN BEGIN new_quest
				SAY ~Das ist wohl wahr. Gehabt Euch wohl!~
				IF ~~ THEN DO ~EscapeArea()~ EXIT 
				END

