// Canary Dialogues

// Area ACIL08 (Crumbled mage tower)

BEGIN ~AC#BIRD2~


IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0 
  SAY ~Hallo großer <PRO_RACE>!~ //[AC#BIRD1]
  IF ~~ THEN REPLY ~Noch ein sprechender Vogel? Das darf doch wohl nicht wahr sein! In was werdet Ihr Euch verwandeln - in eine Taraske?~ + talking_bird
END

	IF ~~ THEN BEGIN talking_bird
	SAY ~Wie meint Ihr das?~
	IF ~~ THEN REPLY ~Nun, alle sprechenden Vögel, denen ich bisher begegnet bin, haben sich später in etwas Anderes verwandelt - der Letzte in ein Wesen, das mich fast umgebracht hätte!~ GOTO talking_bird_02
	END
	
		IF ~~ THEN BEGIN talking_bird_02
		SAY ~Oh, da hattet Ihr bisher aber wirklich Pech mit Euren... Vögeln. Mit mir habt Ihr Glück! Ich bin nämlich eigentlich ein goldener Drache.~
		IF ~~ THEN GOTO golden_dragon_01
		END
		
			IF ~~ THEN BEGIN golden_dragon_01
			SAY ~...~
			IF ~~ THEN GOTO golden_dragon_02
			END
			
				IF ~~ THEN BEGIN golden_dragon_02
				SAY ~Reingelegt! Haha! Ihr hättet einmal Euer Gesicht sehen müssen!~ [AC#BIRD2]
				IF ~~ THEN REPLY ~Ich bin momentan wirklich nicht zum Scherzen aufgelegt, Kleiner.~ GOTO message_01
				END
				
					IF ~~ THEN BEGIN message_01
					SAY ~Kann ich verstehen. Ich wurde Zeuge Eures ganzen Unglückes. Ich wollte viel früher dran sein und Euch warnen, aber Ihr habt Euch ja unbedingt herumteleportieren müssen! Außerdem wurde ich von einer Elster aufgehalten. Aber jetzt habe ich Euch ja doch gefunden.~
					IF ~~ THEN REPLY ~Was wollt Ihr von mir?~ GOTO message_02
					END
					
						IF ~~ THEN BEGIN message_02
						SAY ~Ich bringe Euch eine Nachricht von meinem Meister. Er ist ein großer...~
						IF ~~ THEN REPLY ~Oh nein! Nicht noch ein Magier, der mich um einen Gefallen bittet!~ GOTO not_a_mage
						IF ~~ THEN REPLY ~Magier?~ GOTO not_a_mage
						END
						
							IF ~~ THEN BEGIN not_a_mage
							SAY ~Ein Magier? Nein. Mein Meister ist kein Magier, sondern ein großer Wanderer. Ahab, der Wanderer wird er genannt.~
							IF ~~ THEN REPLY ~Ich wüsste wirklich nicht, warum ich dem Wort eines Vogels Glauben noch schenken sollte.~ GOTO nope
							END
							
								IF ~~ THEN BEGIN nope
								SAY ~Mein Meister weiß, dass Ihr nach einem Zugang ins Unterreich sucht. Er kennt einen, der nicht weit entfernt ist.~
								IF ~~ THEN REPLY ~Und was verlangt er als Gegenleistung?~ GOTO wants_nothing
								END
								
									IF ~~ THEN BEGIN wants_nothing
									SAY ~Nichts. Ihm sind die Zwerge, die sich mit Euch getroffen haben, vor einiger Zeit auch über den Weg gelaufen. Mein Meister ist kein schlechter Mensch. Er möchte Euch nur ein wenig bei Eurer Suche unter die Flügel greifen.~
									IF ~~ THEN GOTO meet_dwarfcamp
									END
									
										IF ~~ THEN BEGIN meet_dwarfcamp
										SAY ~Er wartet in dem Lager, das die Zwerge am Fuße des Turboldberges aufgeschlagen hatten, auf Euch. Gemütlich ist es dort! Ein Jammer, was mit den Zwergen geschehen ist. So, wie ich ihn kenne, wird er dort auch noch einige Zeit verweilen. Aber wenn Ihr Hilfe benötigt, solltet Ihr ihm dort einmal einen Besuch abstatten. Doch ich verweile hier schon zulange. Keine besonders sichere Gegend für einen Kanarienvogel. Bis bald, <PRO_RACE>!~
										IF ~~ THEN DO ~SetGlobal("AC#AhabMeeting","GLOBAL",1)
										EscapeArea()~ EXIT 
										END
	