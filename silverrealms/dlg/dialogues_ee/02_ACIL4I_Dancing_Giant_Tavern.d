/*******************************************************************************************************
Dialogue innkeeper
*******************************************************************************************************/

BEGIN ~AC#4IINN~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_01
SAY ~Seid gegrüßt, Fremde! Die Taverne "Zum Tanzenden Riesen" bietet Euch ein sauberes Bett, frisches Bier und gute Gesellschaft auf Euren Reisen. Womit kann ich Euch dienen?~
IF ~Global("AC#BeldasPlotStart","GLOBAL",3)~ THEN REPLY ~Ich suche eine Gruppe Zwerge.~ GOTO search_dwarves 
IF ~~ THEN REPLY ~Ich würde gerne sehen, was Ihr anzubieten habt.~ + store
IF ~~ THEN REPLY ~Dürfte ich Euch eine Frage stellen?~ + questions_01
IF ~~ THEN REPLY ~Zum Tanzenden Riesen?~ + dancing_giant
IF ~~ THEN REPLY ~Momentan benötige ich nichts, danke.~ + bye
IF ~Global("AC#IltkazarQuest#2","GLOBAL",1)~ THEN REPLY ~Ich suche nach einem Elfen, der vor Kurzem ziemlich überhastet aufgebrochen ist.~ + search_elven_thief
END

	IF ~True()~ THEN BEGIN hello_02
	SAY ~Seid gegrüßt! Wonach ist es Euch heute?~
	IF ~Global("AC#BeldasPlotStart","GLOBAL",3)~ THEN REPLY ~Ich suche eine Gruppe Zwerge.~ GOTO search_dwarves 
	IF ~~ THEN REPLY ~Ich würde gerne sehen, was Ihr anzubieten habt.~ + store
	IF ~~ THEN REPLY ~Momentan benötige ich nichts, danke.~ + bye
	IF ~~ THEN REPLY ~Dürfte ich Euch eine Frage stellen?~ + questions_01
	IF ~~ THEN REPLY ~Zum Tanzenden Riesen?~ + dancing_giant
	IF ~Global("AC#IltkazarQuest#2","GLOBAL",1)~ THEN REPLY ~Ich suche nach einem Elfen, der vor Kurzem ziemlich überhastet aufgebrochen ist.~ + search_elven_thief
	IF ~Global("AC#IltkazarQuest#2","GLOBAL",11)~ THEN REPLY ~Wisst Ihr, wo die Zwerge sind, die sich bisher in der Taverne aufgehalten hatten?~ + where_are_the_dwarves_01
	END

	IF ~~ THEN BEGIN where_are_the_dwarves_01
	SAY ~Oh! Ihr seid es! Ihr hattet doch mit den Zwergen zu tun, richtig? Fast hätte ich es vergessen: Ihr Anführer bat mich, Euch diesen Brief zu geben.~
	//IF ~Global("RetrieveTaran","ACIL4I",0)~ THEN DO ~GiveItemCreate("AC#4ILET",Player1,0,0,0)~ GOTO where_are_my_coins
	//IF ~GlobalGT("RetrieveTaran","ACIL4I",0)~ THEN REPLY ~Haben die Zwerge erwähnt, wohin sie gegangen sind?~ DO ~GiveItemCreate("AC#4ILET",Player1,0,0,0)~ GOTO where_did_they_go
	IF ~~ THEN REPLY ~Haben die Zwerge erwähnt, wohin sie gegangen sind?~ DO ~GiveItemCreate("AC#4ILET",Player1,0,0,0)~ GOTO where_did_they_go
	//IF ~GlobalGT("RetrieveTaran","ACIL4I",0)~ THEN REPLY ~Danke für Eure Hilfe. Ich werde mich nun wieder auf den Weg machen.~ DO ~GiveItemCreate("AC#4ILET",Player1,0,0,0)~ GOTO bye_02
	IF ~~ THEN REPLY ~Danke für Eure Hilfe. Ich werde mich nun wieder auf den Weg machen.~ DO ~GiveItemCreate("AC#4ILET",Player1,0,0,0)~ GOTO bye_02
	END
	
		IF ~~ THEN BEGIN where_are_my_coins
		SAY ~Habt Ihr denn schon meine Silbermünzen wiederbeschaffen können?~
		IF ~PartyHasItem("AC#4ICOI")~ THEN REPLY ~Ja, hier sind sie.~ GOTO give_coins
		IF ~!PartyHasItem("AC#4ICOI")~ THEN REPLY ~Nein, leider nicht.~ GOTO no_coins
		END
		
			IF ~~ THEN BEGIN no_coins
			SAY ~Hmm. Schade. Nun ja, dann muss ich in nächster Zeit wohl etwas vorsichtiger sein, mit wem ich Geschäfte mache.~
			IF ~~ THEN REPLY ~Danke, dass Ihr mir die Nachricht der Zwerge gegeben habt. Haben sie erwähnt, wohin sie gegangen sind?~ GOTO where_did_they_go
			IF ~~ THEN REPLY ~Danke für Eure Hilfe. Ich werde mich nun wieder auf den Weg machen.~ GOTO bye_02
			END
			
			IF ~~ THEN BEGIN give_coins
			SAY ~Vielen Dank! Ich wusste, dass ich mich auf Euch verlassen kann. Vielleicht ist die Nachricht ein kleiner Ausgleich.~
			IF ~~ THEN REPLY ~Haben die Zwerge erwähnt, wohin sie gegangen sind?~ DO ~TakePartyItemNum("AC#4ICOI",500)
			SetGlobal("RetrieveTaran","ACIL4I",1)~ GOTO where_did_they_go
			IF ~~ THEN REPLY ~Danke für Eure Hilfe. Ich werde mich nun wieder auf den Weg machen.~ DO ~TakePartyItemNum("AC#4ICOI",500)
			SetGlobal("RetrieveTaran","ACIL4I",1)~ GOTO bye_02
			END
		
		IF ~~ THEN BEGIN where_did_they_go
		SAY ~Sie sind ziemlich überhastet aufgebrochen - weit nach Süden, wie es scheint. Soweit ich weiß, wollten sie in Tethyr irgendeinen Berg erklimmen. Das hätte ich gerne gesehen: Einen Zwerg beim Klettern!~
		IF ~~ THEN REPLY ~Danke für Eure Hilfe.~ GOTO bye_02
		END
		
			IF ~~ THEN BEGIN bye_02
			SAY ~Gerne! Haben gut gezahlt und viel gebechert - zumindest zwei von ihnen. Der Dritte wollte immer nur Quellwasser statt Bier trinken, komischer Kauz. Aber sagt ihnen, dass sie hier jederzeit wieder willkommen sind! Und jetzt entschuldigt mich, ich muss mich um meine anderen Gäste kümmern.~
			IF ~~ THEN DO ~SetGlobal("AC#IltkazarQuest#2","GLOBAL",20)
		RevealAreaOnMap("ACIL0A")
		EraseJournalEntry(@20070)
		EraseJournalEntry(@20002)		
		AddJournalEntry(@20010,QUEST)~ EXIT
			END

	IF ~~ THEN BEGIN search_dwarves
	SAY ~Ach, die. Die stehen da hinten um den runden Tisch in der Ecke. Aber sprecht den kräftigen Kerl mit der Glatze lieber nicht an! Der hat die mieseste Laune von den Dreien und an allem etwas auszusetzen.~
	IF ~~ THEN EXIT
	END
	
	IF ~~ THEN BEGIN questions_01
	SAY ~Eine Frage? Natürlich! Bestellt Euch doch einfach etwas zu Trinken, das lockert nicht nur Eure Zunge, sondern auch meine.~
	IF ~~ THEN REPLY ~Ich würde gerne sehen, was Ihr anzubieten habt.~ + store
	IF ~~ THEN REPLY ~Momentan benötige ich nichts, danke.~ + bye
	END
		
	IF ~~ THEN BEGIN dancing_giant
	SAY ~Ihr wundert Euch über den Namen? So geht es vielen.~
	IF ~~ THEN REPLY ~Woher stammt dieser Name?~ GOTO dancing_giant_02
	IF ~~ THEN REPLY ~Dürfte ich Euch eine Frage stellen?~ + questions_01
	IF ~~ THEN REPLY ~Ich würde gerne sehen, was Ihr anzubieten habt.~ + store
	IF ~~ THEN REPLY ~Ich werde wieder meines Weges ziehen.~ + bye
	END
	
	IF ~~ THEN BEGIN dancing_giant_02
	SAY ~Es ist nicht so, wie Ihr denkt. Ich habe noch nie einen Riesen tanzen sehen - und möchte das auch nie erleben! Hier in der Nähe gibt es ein Steinmonument, das "Tanzender Riese" genannt wird. Daher rührt der Name.~
	IF ~~ THEN REPLY ~Dürfte ich Euch eine Frage stellen?~ + questions_01
	IF ~~ THEN REPLY ~Ich würde gerne sehen, was Ihr anzubieten habt.~ + store
	IF ~~ THEN REPLY ~Ich werde wieder meines Weges ziehen.~ + bye 
	END
	
	IF ~~ THEN BEGIN store
	SAY ~Aber natürlich! Sucht Euch einen freien Platz und legt die Mäntel ab. Aber die Stiefel lasst bitte an, ja? Ihr werdet gleich bedient.~
	IF ~~ THEN DO ~StartStore("AC#4IINN",LastTalkedToBy)~ EXIT 
	END
	
	IF ~~ THEN BEGIN bye
	SAY ~Seht Euch in Ruhe um. Früher oder später wird auch Euch der Hunger oder Durst packen!~
	IF ~~ THEN EXIT 
	END
	
	
	IF ~~ THEN BEGIN search_elven_thief
	SAY ~Oh, der! Ja, der ist vor Kurzem abgereist. Hat mich fürstlich bezahlt, jawohl! Mit richtigen Edelsteinen.~
	IF ~~ THEN REPLY ~...die wahrscheinlich ebenso gestohlen waren wie die anderen Dinge, weswegen ich ihn jetzt suche.~ GOTO stolen_gems
	END
	
		IF ~~ THEN BEGIN stolen_gems
		SAY ~Ääh... das wusste ich nicht. Ihr denkt also, er wäre nichts als ein ganz gewöhnlicher Dieb?~
		IF ~~ THEN REPLY ~Zumindest gibt es hier Gäste, denen er etwas entwendet hat, ja.~ GOTO search_elven_thief_02 
		IF ~~ THEN REPLY ~Das behaupten zumindest einige Eurer anderen Gäste.~ GOTO search_elven_thief_02 
		END
		
		IF ~~ THEN BEGIN search_elven_thief_02
		SAY ~Nun, wenn das so ist...~
		IF ~~ THEN GOTO search_elven_thief_03
		END
		
			IF ~~ THEN BEGIN search_elven_thief_03
			SAY ~Wo er hingegangen ist kann ich Euch leider auch nicht sagen. Es war noch sehr früh am Morgen. Aber he, vielleicht hat Onnor, der Bauer ihn gesehen? Der steht hier in unserem Dorf immer am frühesten auf.~
			IF ~~ THEN REPLY ~Wo finde ich diesen Onnor?~ GOTO where_is_onnor 
			END
						
							IF ~~ THEN BEGIN where_is_onnor
							SAY ~Draußen, an einem der Höfe solltet Ihr auf ihn treffen.~
							IF ~~ THEN REPLY ~Gut, dann werde ich draußen einmal mit ihm reden.~ GOTO bye_search_onnor
							END
					
							IF ~~ THEN BEGIN bye_search_onnor
							SAY ~Gerne! Dann kann ich mich nun ja wieder um meine ehrliche Kundschaft kümmern.~
							IF ~~ THEN
							DO ~SetGlobal("AC#IltkazarQuest#2","GLOBAL",2)
							EraseJournalEntry(@20060)
							AddJournalEntry(@20065,QUEST)~ EXIT 
							END
/*		
			IF ~~ THEN BEGIN search_elven_thief_03_OLD
			SAY ~Er fragte mich, mit welchen Münzen man in Athkatla am Wenigsten auffallen würde, und ich habe ihm seine Edelsteine gegen einen Beutel voll Taran, Silbermünzen, eingewechselt. Ich habe mir nichts dabei gedacht, schließlich gibt es viele Edelsteinhändler in Amn. Aber jetzt glaube ich auch, dass er ein paar krumme Dinger geplant hat.~
			IF ~~ THEN REPLY ~Wäre das nicht zu offensichtlich, ihn in Athkatla zu vermuten?~ GOTO search_elven_thief_04
			END
			
				IF ~~ THEN BEGIN search_elven_thief_04
				SAY ~Wenn es einen Ort in den Reichen gibt, an denen ein einzelner Dieb am Wenigsten auffällt, dann wäre das sicher in der Stadt des Geldes. Ich mag zwar nur ein einfacher Schankwirt sein, aber ich denke, Ihr solltet dort mit Eurer Suche beginnen.~
				IF ~~ THEN DO ~GiveItemCreate("MISC32",Player1,4,0,0)~ GOTO give_gems
				END
				
				IF ~~ THEN BEGIN give_gems
				SAY ~Ach so - hier sind die Edelsteine, mit denen er mich bezahlt hat. Wenn er die wirklich gestohlen hat, möchte ich den wahren Besitzern lieber nicht begegnen!~
				IF ~~ THEN REPLY ~Ihr gebt sie mir einfach so?~ GOTO give_gems_02 
				IF ~~ THEN REPLY ~Was soll ich damit machen?~ GOTO give_gems_02 
				END
				
					IF ~~ THEN BEGIN give_gems_02
					SAY ~Im Austausch hätte ich gerne meine Silbermünzen zurück, die ich diesem Halunken gegeben habe! Wenn Ihr ihn findet und er die Münzen noch besitzt, wäre ich Euch sehr dankbar, wenn Ihr sie mir wiederbringen würdet.~
					IF ~~ THEN REPLY ~Wo in Athkatla sollte ich denn Eurer Meinung nach nach ihm suchen?~ GOTO sewerquest_01
					END

						IF ~~ THEN BEGIN sewerquest_01
						SAY ~Er erwähnte leider nicht, wo genau in der Stadt des Geldes ihn seine Reise hinführen könnte.~
						IF ~~ THEN REPLY ~Hat er Euch irgendeinen Anhaltspunkt gegeben, wo ich nach ihm suchen könnte?~ GOTO think_about_it 
						IF ~~ THEN REPLY ~Athkatla ist groß. Jeder Hinweis wäre wichtig.~ GOTO think_about_it
						IF ~~ THEN REPLY ~Dann werde ich mich einmal auf die Suche machen.~ GOTO sewerquest_02
						END
						
						IF ~~ THEN BEGIN think_about_it
						SAY ~Hmm... lasst mich einmal nachdenken...~
						IF ~~ THEN GOTO sewerquest_02
						END

						IF ~~ THEN BEGIN sewerquest_02
						SAY ~Wartet, er fragte noch vor der Abreise, ob ich ihm etwas Gerberfett besorgen könnte, wenn Euch das weiterhilft!~
						IF ~~ THEN REPLY ~Und Ihr habt ihm welches gegeben?~ GOTO degras_01
						IF ~~ THEN REPLY ~Wozu wollte er das denn haben?~ + why_grease
						END	
						
						IF ~~ THEN BEGIN why_grease
						SAY ~Das hat er nicht gesagt. Ich habe auch keins. Aber ich habe ihn an Onnor verwiesen. Der ist der Einzige hier in Zweiwasser, der so etwas haben könnte. Ich hatte ihm geraten, Onnor einmal nach Melkfett zu fragen.~
						IF ~~ THEN REPLY ~Wo finde ich diesen Onnor?~ GOTO milking_grease_03 
						END
						
						IF ~~ THEN BEGIN degras_01
						SAY ~Ich habe keins. Aber ich habe ihn an Onnor verwiesen. Der ist der Einzige hier in Zweiwasser, der ein ähnliches Fett hat. Ich hatte ihm deshalb geraten, Onnor nach Melkfett zu fragen.~
						IF ~~ THEN REPLY ~Wo finde ich diesen Onnor?~ GOTO milking_grease_03 
						END
						
							IF ~~ THEN BEGIN milking_grease_03
							SAY ~Draußen, an einem der Höfe solltet Ihr auf ihn treffen.~
							IF ~~ THEN REPLY ~Gut, Vielen Dank. Ich hoffe, ich kehre mit Euren Silbermünzen zurück.~ GOTO bye_sewers
							END
					
							IF ~~ THEN BEGIN bye_sewers
							SAY ~Gerne! Dann kann ich mich nun ja wieder um meine ehrliche Kundschaft kümmern.~
							IF ~~ THEN
							DO ~SetGlobal("AC#IltkazarQuest#2","GLOBAL",2)
							EraseJournalEntry(@20060)
							AddJournalEntry(@20063,QUEST)~ EXIT 
							END
*/
/*******************************************************************************************************
Dialogue thief
*******************************************************************************************************/
BEGIN ~AC#4ITHF~

IF ~True()~ THEN BEGIN hello
SAY ~Ich kenne Euch nicht. Und Ihr kennt mich hoffentlich auch nicht! Und das soll auch so bleiben.~
IF ~~ THEN REPLY ~Wer seid Ihr?~ GOTO wrong_question
IF ~~ THEN REPLY ~Was macht Ihr hier?~ GOTO wrong_question
END

	IF ~~ THEN BEGIN wrong_question
	SAY ~Falsche Frage.~
	IF ~~ THEN EXIT
	END

/*******************************************************************************************************
Dialogue players
*******************************************************************************************************/
BEGIN ~AC#4IDR1~
BEGIN ~AC#4IDR2~
BEGIN ~AC#4IDR3~

// player 1
CHAIN IF ~Global("CardGame","ACIL4I",0)~ THEN AC#4IDR1 hello_01
~Na, bereit euer ganzes Gold zu verlieren, ihr zwei?~ 
== AC#4IDR2 ~Das letzte Mal als du so geredet hast, bin ich mit *deinem* Gold nach Hause gegangen. Pass besser auf deine Karten auf!~
== AC#4IDR3 ~Lasst uns einfach das Spiel genießen. Wer weiß, vielleicht zieht einer von uns den Gold-Drachen.~
DO ~SetGlobal("CardGame","ACIL4I",1)~ EXIT

CHAIN IF ~Global("CardGame","ACIL4I",1)~ THEN AC#4IDR1 hello_02
~Ich sag's euch, heute ist mein Glückstag. Dieses Blatt ist unschlagbar!~ 
== AC#4IDR2 ~Unschlagbar? Das wollen wir doch mal sehen. Zeig her, was du hast!~
== AC#4IDR3 ~Beruhigt euch, ihr beiden. Denkt dran, es ist nur ein Spiel. Aber ich werde nicht zögern, euch beide zu übertrumpfen.~
DO ~SetGlobal("CardGame","ACIL4I",2)~ EXIT

CHAIN IF ~Global("CardGame","ACIL4I",2)~ THEN AC#4IDR1 hello_03
~Schaut her, ich lege den Roten Drachen und zwei Greifen. Versucht das mal zu überbieten!~ 
== AC#4IDR2 ~Mächtig, aber nicht genug. Hier sind mein Goldener Drache und drei Harpyien. Seht ihr, wie sie glänzen?~
== AC#4IDR3 ~Beide gute Versuche, aber mein Schwarzer Drache und ein Paar Zhentarim werden das Rennen machen.~
== AC#4IDR2 ~Ihr habt die Zhentarim? Bei Beshaba, dann müssen wir uns wohl wirklich geschlagen geben...~
DO ~SetGlobal("CardGame","ACIL4I",3)~ EXIT

CHAIN IF ~Global("CardGame","ACIL4I",3)~ THEN AC#4IDR1 hello_04
~Das letzte Spiel war eng. Ich denke, dieses Mal sollte ich geben, um mein Glück auszugleichen.~ 
== AC#4IDR2 ~Warte mal! Letztes Mal hast du schon gegeben. Es ist nur fair, wenn jetzt *ich* dran bin.~
== AC#4IDR3 ~Wie wäre es, wenn wir eine Münze werfen? So bleibt es fair für uns alle. Wer gewinnt, darf auch geben.~
== AC#4IDR2 ~Wie sollen wir denn zu dritt eine Münze werfen? Es gibt nur zwei Seiten.~
== AC#4IDR3 ~Bei manchen landet sie auch auf der Kante. Kennst Du die Geschichte nicht?~
== AC#4IDR2 ~So ein Unsinn. Hier hast Du die Karten, du darfst geben...~
DO ~SetGlobal("CardGame","ACIL4I",0)~ EXIT

// player 2
CHAIN IF ~Global("CardGame","ACIL4I",0)~ THEN AC#4IDR2 hello_01
~Na, bereit euer ganzes Gold zu verlieren, ihr zwei?~ 
== AC#4IDR1 ~Das letzte Mal als du so geredet hast, bin ich mit *deinem* Gold nach Hause gegangen. Pass besser auf deine Karten auf!~
== AC#4IDR3 ~Lasst uns einfach das Spiel genießen. Wer weiß, vielleicht zieht einer von uns den Gold-Drachen.~
DO ~SetGlobal("CardGame","ACIL4I",1)~ EXIT

CHAIN IF ~Global("CardGame","ACIL4I",1)~ THEN AC#4IDR2 hello_02
~Ich sag's euch, heute ist mein Glückstag. Dieses Blatt ist unschlagbar!~ 
== AC#4IDR1 ~Unschlagbar? Das wollen wir doch mal sehen. Zeig her, was du hast!~
== AC#4IDR3 ~Beruhigt euch, ihr beiden. Denkt dran, es ist nur ein Spiel. Aber ich werde nicht zögern, euch beide zu übertrumpfen.~
DO ~SetGlobal("CardGame","ACIL4I",2)~ EXIT

CHAIN IF ~Global("CardGame","ACIL4I",2)~ THEN AC#4IDR2 hello_03
~Schaut her, ich lege den Roten Drachen und zwei Greifen. Versucht das mal zu überbieten!~ 
== AC#4IDR1 ~Mächtig, aber nicht genug. Hier sind mein Goldener Drache und drei Harpyien. Seht ihr, wie sie glänzen?~
== AC#4IDR3 ~Beide gute Versuche, aber mein Schwarzer Drache und ein Paar Zhentarim werden das Rennen machen.~
== AC#4IDR2 ~Ihr habt die Zhentarim? Bei Beshaba, dann müssen wir uns wohl wirklich geschlagen geben...~
DO ~SetGlobal("CardGame","ACIL4I",3)~ EXIT

CHAIN IF ~Global("CardGame","ACIL4I",3)~ THEN AC#4IDR2 hello_04
~Das letzte Spiel war eng. Ich denke, dieses Mal sollte ich geben, um mein Glück auszugleichen.~ 
== AC#4IDR1 ~Warte mal! Letztes Mal hast du schon gegeben. Es ist nur fair, wenn jetzt *ich* dran bin.~
== AC#4IDR3 ~Wie wäre es, wenn wir eine Münze werfen? So bleibt es fair für uns alle. Wer gewinnt, darf auch geben.~
== AC#4IDR2 ~Wie sollen wir denn zu dritt eine Münze werfen? Es gibt nur zwei Seiten.~
== AC#4IDR3 ~Bei manchen landet sie auch auf der Kante. Kennst Du die Geschichte nicht?~
== AC#4IDR2 ~So ein Unsinn. Hier hast Du die Karten, du darfst geben...~
DO ~SetGlobal("CardGame","ACIL4I",0)~ EXIT

// player 3
CHAIN IF ~Global("CardGame","ACIL4I",0)~ THEN AC#4IDR3 hello_01
~Na, bereit euer ganzes Gold zu verlieren, ihr zwei?~ 
== AC#4IDR2 ~Das letzte Mal als du so geredet hast, bin ich mit *deinem* Gold nach Hause gegangen. Pass besser auf deine Karten auf!~
== AC#4IDR1 ~Lasst uns einfach das Spiel genießen. Wer weiß, vielleicht zieht einer von uns den Gold-Drachen.~
DO ~SetGlobal("CardGame","ACIL4I",1)~ EXIT

CHAIN IF ~Global("CardGame","ACIL4I",1)~ THEN AC#4IDR3 hello_02
~Ich sag's euch, heute ist mein Glückstag. Dieses Blatt ist unschlagbar!~ 
== AC#4IDR2 ~Unschlagbar? Das wollen wir doch mal sehen. Zeig her, was du hast!~
== AC#4IDR1 ~Beruhigt euch, ihr beiden. Denkt dran, es ist nur ein Spiel. Aber ich werde nicht zögern, euch beide zu übertrumpfen.~
DO ~SetGlobal("CardGame","ACIL4I",2)~ EXIT

CHAIN IF ~Global("CardGame","ACIL4I",2)~ THEN AC#4IDR3 hello_03
~Schaut her, ich lege den Roten Drachen und zwei Greifen. Versucht das mal zu überbieten!~ 
== AC#4IDR2 ~Mächtig, aber nicht genug. Hier sind mein Goldener Drache und drei Harpyien. Seht ihr, wie sie glänzen?~
== AC#4IDR1 ~Beide gute Versuche, aber mein Schwarzer Drache und ein Paar Zhentarim werden das Rennen machen.~
== AC#4IDR2 ~Ihr habt die Zhentarim? Bei Beshaba, dann müssen wir uns wohl wirklich geschlagen geben...~
DO ~SetGlobal("CardGame","ACIL4I",3)~ EXIT

CHAIN IF ~Global("CardGame","ACIL4I",3)~ THEN AC#4IDR3 hello_04
~Das letzte Spiel war eng. Ich denke, dieses Mal sollte ich geben, um mein Glück auszugleichen.~ 
== AC#4IDR2 ~Warte mal! Letztes Mal hast du schon gegeben. Es ist nur fair, wenn jetzt *ich* dran bin.~
== AC#4IDR1 ~Wie wäre es, wenn wir eine Münze werfen? So bleibt es fair für uns alle. Wer gewinnt, darf auch geben.~
== AC#4IDR2 ~Wie sollen wir denn zu dritt eine Münze werfen? Es gibt nur zwei Seiten.~
== AC#4IDR1 ~Bei manchen landet sie auch auf der Kante. Kennst Du die Geschichte nicht?~
== AC#4IDR2 ~So ein Unsinn. Hier hast Du die Karten, du darfst geben...~
DO ~SetGlobal("CardGame","ACIL4I",0)~ EXIT

/*******************************************************************************************************
Dialogue Der trockene Seabert
*******************************************************************************************************/

BEGIN ~AC#4IDR4~

/*
IF ~True()~ THEN BEGIN hello_silence
SAY ~...~
IF ~~ THEN EXIT 
END
*/

												
IF ~Global("Rhyme","LOCALS",0)~ THEN BEGIN hello
SAY  ~Ich liebte einst ein Mädchen 
dem winkte ich nach von Deck,
doch als mein Schiff wieder einlief
da war das Mädchen weg.~  
IF ~~ THEN + calimshan_01
END

	IF ~~ THEN BEGIN calimshan_01
	SAY ~Ich liebte einst ein Mädchen
	drunten in Calimshan...~
	IF ~~ THEN + calimshan_02
	END
	
		IF ~~ THEN BEGIN calimshan_02
		SAY ~...~
		IF ~~ THEN + calimshan_rhyme
		END
		
			IF ~~ THEN BEGIN calimshan_rhyme
			SAY ~Hmm... was reimt sich auf "Calimshan"?~
			++ ~Für so einen Schwachsinn habe ich keine Zeit.~ + no_time
			IF ~~ THEN REPLY ~Seid Ihr nicht ein bisschen arg weit weg vom Meer für solche Geschichten?~ + far_away_sea
			++ ~"Lebertran"?~ + Cod_Liver_Oil
			++ ~"Chance vertan"?~ + chance
			++ ~"Lantan"?~ + lantan
			++ ~"Zahn"?~ + tooth
			END
			
					IF ~~ THEN BEGIN far_away_sea
					SAY ~He, ich bin Barde auf Landgang, kapiert?~
					IF ~~ THEN EXIT
					END	
			
					IF ~~ THEN BEGIN no_time
					SAY ~Hä? Und warum quatscht Ihr mich dann so komisch an, <RACE>?~
					IF ~~ THEN EXIT
					END	
					
				
				IF ~~ THEN BEGIN tooth
				SAY ~Zahn? Ha! Das passt gut...~
				IF ~~ THEN + tooth_rhyme
				END
				
					IF ~~ THEN BEGIN tooth_rhyme
					SAY ~Ich liebte einst ein Mädchen
					drunten in Calimshan
					doch bei unserem ersten Kuss
					verlor' ich meinen letzten Zahn.~
					IF ~~ THEN DO ~SetGlobal("Rhyme","LOCALS",1)~ EXIT
					END
					
				IF ~~ THEN BEGIN Cod_Liver_Oil
				SAY ~Lebertran? Nun gut...~
				IF ~~ THEN + Cod_Liver_Oil_rhyme
				END
				
					IF ~~ THEN BEGIN Cod_Liver_Oil_rhyme
					SAY ~Ich liebte einst ein Mädchen
					drunten in Calimshan
					doch als ich ihr zu nahe kam
					roch sie nach Lebertran.~
					IF ~~ THEN DO ~SetGlobal("Rhyme","LOCALS",1)~ EXIT
					END

				IF ~~ THEN BEGIN chance
				SAY ~Chance vertan? Gut, ich versuche es mal...~
				IF ~~ THEN + chance_rhyme
				END

					IF ~~ THEN BEGIN chance_rhyme
					SAY ~Ich liebte einst ein Mädchen
					drunten in Calimshan
					doch in uns'rer ersten Nacht
					hatt' ich meine größte Chance vertan.~
					IF ~~ THEN DO ~SetGlobal("Rhyme","LOCALS",1)~ EXIT
					END

				IF ~~ THEN BEGIN lantan
				SAY ~Lantan? Das hab' ich ja noch nie gehört. Was soll das denn sein?~
				++ ~Lantan ist ein Land der Gnome weit im Süden.~ + lantan_rhyme
				END	

					IF ~~ THEN BEGIN lantan_rhyme
					SAY ~Ich liebte einst ein Mädchen
					drunten in Calimshan
					doch sie betrog mich am laufenden Band
					mit dem kleinsten Gnom in Lantan.~
					IF ~~ THEN DO ~SetGlobal("Rhyme","LOCALS",1)~ EXIT
					END				
	
IF ~True()~ THEN BEGIN hello_01
SAY ~Stehlt nicht meine wertvolle Zeit, Fremde! Ich genieße meinen Landgang, bevor bald mein Schiff wieder Segel gen Calimhafen setzt!~
IF ~~ THEN EXIT
END	
					
					