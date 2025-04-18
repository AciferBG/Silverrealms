/*******************************************************************************************************
Dialog Marid in ACIL0D
*******************************************************************************************************/

BEGIN ~AC#MARID~

IF ~Global("MaridDialogue","ACIL0D",2)~ THEN BEGIN hello_again_02
SAY  ~Bei der Zitadelle der zehntausend Perlen! Ihr seid immer noch hier? Wird es nicht langsam Zeit für Euch, das Weite zu suchen?~  
++ ~Wenn ich mir etwas in den Kopf gesetzt habe, lasse ich mich nicht so leicht davon abbringen.~ DO ~SetGlobal("MaridDialogue","ACIL0D",3)~ + fight_02
IF ~~ THEN REPLY ~Was bewacht Ihr hier eigentlich?~ GOTO what_guarding
END

	IF ~~ THEN BEGIN what_guarding
	SAY  ~Dumme Frage! Den Schatz natürlich, Sterblicher!~  
	IF ~OR(2)
	DifficultyLT(NORMAL)
	CheckStatGT(Player1Fill,19,CHR)~ THEN REPLY ~Ja, aber was für ein Schatz soll das denn sein?~ GOTO what_treasure_success
	IF ~OR(2)
	DifficultyGT(EASY)
	CheckStatLT(Player1Fill,20,CHR)~ THEN REPLY ~Geht es vielleicht etwas genauer?~ GOTO what_treasure_failure
	END
	
	IF ~~ THEN BEGIN what_treasure_success
	SAY ~Warum sollte das für mich wichtig sein?~
	++ ~Vielleicht ist das, was Ihr da bewacht, ja gar nicht wertvoll? Was, wenn es unter Eurer Würde wäre?~ + treasure_not_valuable
	++ ~Ach, vergesst es. Lasst uns weiterkämpfen.~ DO ~SetGlobal("MaridDialogue","ACIL0D",3)~ + fight_02
	END
	
		IF ~~ THEN BEGIN treasure_not_valuable
		SAY ~Warum sollte jemand ein so mächtiges Wesen wie mich mit der Bewachung eines unwichtigen Gegenstandes betrauen?~
		++ ~Ihr habt noch nie in die Truhe geschaut, was darin ist?~ + treasure_not_valuable_02
		END
		
			IF ~~ THEN BEGIN treasure_not_valuable_02
			SAY ~Nein, natürlich nicht! Diese Truhe ist mit einem mächtigen Zauber belegt, die jede außerweltliche Kreatur umgehend aus der materiellen Ebene verbannen würde!~
			++ ~Danke für den Hinweis. Jetzt ist es aber an mir, *Euch* von dieser Ebene zu verbannen!~ DO ~SetGlobal("MaridDialogue","ACIL0D",3)~ + fight_02
			++ ~Oh, das ist interessant! Also scheint dort etwas für jemand Mächtigeres als Euch selbst verborgen zu sein!~ + treasure_more_powerful
			END
			
				IF ~~ THEN BEGIN treasure_more_powerful
				SAY ~Wie kommt Ihr darauf, dass Jemand mächtiger als ich sein sollte?~
				++ ~Na, weil er Euch hier mit dieser Aufgabe gebunden hat, mitten im Nirgendwo in einem Schiffswrack zu verweilen.~ + i_guard_the_chest
				END
				
					IF ~~ THEN BEGIN i_guard_the_chest
					SAY ~Da habt Ihr wohl Recht.~
					++ ~Ich könnte stattdessen diese Truhe ein wenig bewachen. Dann könntet *Ihr* Euch wichtigeren Dingen zuwenden.~ + i_guard_the_chest_02
					END
					
						IF ~~ THEN BEGIN i_guard_the_chest_02
						SAY ~Hmm...~
						=
						~Ihr habt mich überzeugt. Wahrscheinlich ist der Zauber des Magiers ohnehin am Verblassen. Also gut, ich übertrage die Aufgabe an Euch. Macht, was Ihr wollt. Ich bin von dieser Last befreit.~
						IF ~~ THEN + treasure_more_powerful_02
						END
				
					IF ~~ THEN BEGIN treasure_more_powerful_02
					SAY ~Gehabt Euch wohl, Sterbliche. Und betet, dass unser nächstes Zusammentreffen ebenso glimpflich für Euch ausgehen möge.~
					IF ~~ THEN DO ~AddexperienceParty(2000)
					ForceSpell(Myself,DRYAD_TELEPORT)~ EXIT
					END
	
	IF ~~ THEN BEGIN what_treasure_failure
	SAY  ~Oh nein, kommt mir nicht mit so etwas! Ich spüre, dass Ihr mich übertölpeln wollt - mich, den mächtigen Shah! Dafür werdet Ihr sterben!~  
	IF ~~ THEN EXIT
	END
	
	IF ~~ THEN BEGIN fight_02
	SAY  ~So sterbt denn durch die Hand des mächtigen Shah!~  
	IF ~~ THEN EXIT
	END
	
IF ~Global("MaridDialogue","ACIL0D",5)~ THEN BEGIN hello_again_03
SAY  ~Ihr schon wieder? Wollen wir hier nun auf ewig gegeneinander kämpfen, bis in den unteren Ebenen der Blutkrieg endet und in den sieben Himmeln die Fanfaren ertönen?~ 
IF ~OR(2)
	DifficultyLT(NORMAL)
	CheckStatGT(Player1Fill,17,CHR)~ THEN REPLY ~Seid Ihr des Kampfes nicht ebenfalls überdrüssig?~ GOTO what_treasure_success_02
	IF ~OR(2)
	DifficultyGT(EASY)
	CheckStatLT(Player1Fill,18,CHR)~ THEN REPLY ~Seid Ihr des Kampfes nicht ebenfalls überdrüssig?~ GOTO what_treasure_failure 
++ ~Wenn es sein muss, ja. Außer Ihr gebt auf.~ DO ~SetGlobal("MaridDialogue","ACIL0D",6)~ + fight_03
END

	IF ~~ THEN BEGIN fight_03
	SAY  ~Eure Ausdauer ist bewundernswert, doch leider vergeblich!~  
	IF ~~ THEN EXIT
	END
	
		IF ~~ THEN BEGIN what_treasure_success_02
	SAY ~Warum sollte das für mich wichtig sein?~
	++ ~Vielleicht ist das, was Ihr da bewacht, ja gar nicht wertvoll? Was, wenn es unter Eurer Würde wäre?~ + treasure_not_valuable
	++ ~Ach, vergesst es. Lasst uns weiterkämpfen.~ DO ~~ + fight_03
	END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello
SAY  ~Noch mehr Abenteurer, die gekommen sind, um den Schatz, den ich bewachen muss, zu stehlen? Ihr werdet genauso kläglich scheitern wie sämtliche Narren vor Euch!~  
IF ~~ THEN EXIT
END
