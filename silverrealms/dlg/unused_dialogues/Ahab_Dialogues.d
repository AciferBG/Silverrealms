/*******************************************************************************************************
Dialogues Ahab, the wanderer in ACIL0A 
*******************************************************************************************************/

BEGIN ~AC#BAHA1~ // Ahab, the wanderer


IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello
SAY  ~Seid gegrüßt, <PRO_RACE>! Gut, dass Ihr gekommen seid. Ich sah aus der Ferne ein Gewitter mit Blitzen und Feuer am Himmel- ein seltener Anblick in diesen Tagen! Da machte ich mich auf zum Turboldberg, doch wart Ihr schon woanders. Gut, dass Ihr diesen einstürzenden Turm überlebt habt, von dem man mir berichtet hatte.~ 
IF ~~ THEN REPLY ~Wer seid Ihr?~ GOTO who_are_you
END
	
		IF ~~ THEN BEGIN who_are_you
		SAY ~Man nennt mich Ahab. Die Leute fügen oft noch "der Wanderer" hinzu. Als ob es einen Ahab, den Sitzenden geben würde! Ihr seid <CHARNAME>, nicht wahr? Haben mir meine Kanarienvögel gesagt.~
		IF ~~ THEN REPLY ~Eure Kanarienvögel?~ GOTO canary_01 
		END
		
			IF ~~ THEN BEGIN canary_01
			SAY ~Sie sind meine Augen und Ohren in dieser Welt. Wo sind sie alle nur schon wieder?~ [AC#BIRD1]
			IF ~~ THEN REPLY ~Woher wissen Eure Kanarienvögel, wer ich bin?~ GOTO why_know_canary_who_i_am
			END
			
				IF ~~ THEN BEGIN why_know_canary_who_i_am
				SAY ~Ach, sie schnappen dies und jenes auf, wenn sie so durch die Luft fliegen. Schwierig wird es, aus diesem Sammelsurium das Interessante herauszufiltern.~
				IF ~~ THEN GOTO i_am_interested
				END
				
					IF ~~ THEN BEGIN i_am_interested
					SAY ~Als sie mir berichteten, was hier am Berg passiert ist, bin ich rasch aufgebrochen, um mir das einmal aus der Nähe anzusehen. Aber ich fürchte, hier können wir nicht mehr viel ausrichten,oder?~
					IF ~~ THEN GOTO help_you
					END
					
						IF ~~ THEN BEGIN help_you
						SAY ~Doch vielleicht kann ich dennoch helfen. Auch ich bin den drei Zwergen begegnet. Ich weiß, dass Ihr einen Weg ins Unterreich sucht.~ 
							IF ~~ THEN GOTO access_underdark_02 
							END
							
							IF ~~ THEN BEGIN access_underdark_02
							SAY ~Der Zugang ins Unterreich am Turboldberg ist schon lange verschwunden - doch etwas weiter südlich von hier ist eine alte Höhle, die Euch direkt in die unteren Lande führt, wenn Ihr dorthin reisen wollt.~
							IF ~~ THEN REPLY ~Wo befindet sich diese Höhle, von der Ihr sprecht?~ GOTO ravimors_cave_01
							END
							
								IF ~~ THEN BEGIN ravimors_cave_01
								SAY ~Sie heißt Ravimors Höhle und liegt am Fuße des Omlarandingebirges südlich von hier. Ich stieß zufällig bei einer meiner Wanderungen auf sie. Sie ist nicht von Zwergenhand erbaut, sondern wesentlich älter. Deshalb kam es den Zwergen vermutlich nie in den Sinn, sie zu versiegeln.~
								IF ~~ THEN DO ~RevealAreaOnMap("ACIL01")~ GOTO ravimors_cave_02
								END
								
								IF ~~ THEN BEGIN ravimors_cave_02
								SAY ~Dort würde ich an Eurer Stelle einmal mein Glück versuchen, auch wenn ich nicht weiß, was Euch im Inneren erwartet. Doch ich rede schon wieder zuviel, dabei wollte ich mich nur ein wenig umsehen. Kommt her, meine Kanarienvögel, lasst uns hier noch ein wenig verweilen! Und Euch, <CHARNAME>, alles Gute.~
								IF ~~ THEN DO ~SetGlobal("AC#TalkedToAhab","GLOBAL",1)
								SetGlobal("AC#AhabMeeting","GLOBAL",3)
								MoveToPointNoInterrupt([819.381])~ EXIT 
								END
								
	