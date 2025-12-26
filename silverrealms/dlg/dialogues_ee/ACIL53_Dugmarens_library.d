// ---------------------------------------------
//Guards
// ---------------------------------------------

//Cernds Guard #1
BEGIN ~AC#53CE1~

IF ~Global("AC#Ellhimar_Cernd","GLOBAL",3)
GlobalGT("Prison_Cernd","ACIL53",0)~ THEN BEGIN hello_cernd
  SAY ~Na geht schon rein, oder wollt Ihr hier nur dumm herumstehen?~
  IF ~~ THEN EXIT
  END
  
IF ~Global("AC#Ellhimar_Cernd","GLOBAL",3)
Global("Prison_Cernd","ACIL53",0)~ THEN BEGIN hello_cernd
  SAY ~Hab' schon gehört, dass Euch Bettargh erlaubt hat, hier einzutreten. Seid vorsichtig! Ich traue unserem ehemaligen Clanbruder Cernd nicht mehr über den Weg, seit er mit den *caradhak* Kontakt hatte.~
  IF ~~ THEN DO ~SetGlobal("Prison_Cernd","ACIL53",1)~  EXIT
  END

IF ~GlobalLT("AC#Ellhimar_Cernd","GLOBAL",3)~ THEN BEGIN 0
  SAY ~Geht weiter, <RACE>! Niemand darf hier herein!~
  IF ~~ THEN REPLY ~Was befindet sich hinter dieser Tür?~ GOTO behind_door_01
END

	IF ~~ THEN BEGIN behind_door_01
	  SAY ~Nichts, das Euch zu interessieren hat!~
	    IF ~~ THEN EXIT
	END

//Cernds Guard #2	
BEGIN ~AC#53CE2~

IF ~Global("AC#Ellhimar_Cernd","GLOBAL",3)
GlobalGT("Prison_Cernd","ACIL53",0)~ THEN BEGIN hello_cernd
  SAY ~Na geht schon rein, oder wollt Ihr hier nur dumm herumstehen?~
  IF ~~ THEN EXIT
  END
  
IF ~Global("AC#Ellhimar_Cernd","GLOBAL",3)
Global("Prison_Cernd","ACIL53",0)~ THEN BEGIN hello_cernd
  SAY ~Hab' schon gehört, dass Euch Bettargh erlaubt hat, hier einzutreten. Seid vorsichtig! Ich traue unserem ehemaligen Clanbruder Cernd nicht mehr über den Weg, seit er mit den *caradhak* Kontakt hatte.~
  IF ~~ THEN DO ~SetGlobal("Prison_Cernd","ACIL53",1)~  EXIT
  END

IF ~GlobalLT("AC#Ellhimar_Cernd","GLOBAL",3)~ THEN BEGIN 0
  SAY ~Geht weiter, <RACE>! Niemand darf hier herein!~
  IF ~~ THEN REPLY ~Was befindet sich hinter dieser Tür?~ GOTO behind_door_01
END

	IF ~~ THEN BEGIN behind_door_01
	  SAY ~Nichts, das Euch zu interessieren hat!~
	    IF ~~ THEN EXIT
	END

/*******************************************************************************************************
Dialogue Svirfneblin potionseller (explosives!) // Krerthmull Staubmarker
*******************************************************************************************************/
BEGIN ~AC#53SVM~

IF ~Global("Sell_Explosives","ACIL53",1)~ THEN BEGIN hello
SAY ~Seid gegrüßt, <RACE>! Wieder Lust auf etwas Schall und Rauch?~
IF ~~ THEN REPLY ~Sicher, zeigt mir einmal, was Ihr anzubieten habt.~ DO ~StartStore("AC#53SVM",LastTalkedToBy(Myself)) ~ EXIT 
IF ~~ THEN REPLY ~Vielleicht später einmal.~ + bye
END

IF ~True()~ THEN BEGIN hello_0
SAY ~Verflixt! Jetzt ist für längere Zeit unsere Werkstatt im unteren Stockwerk unbewohnbar!~
IF ~~ THEN REPLY ~Habt Ihr den hinteren Teil der Bibliothek in die Luft gesprengt?~ GOTO blew_up 
IF ~~ THEN REPLY ~Das ist nicht mein Problem.~ + bye
END

	IF ~~ THEN BEGIN blew_up
	SAY ~Wer? Ich? Nein, das war das Pulver!~
	IF ~~ THEN REPLY ~Habt Ihr noch etwas von dem Zeug? Ich könnte es bei meinen Abenteuern noch gut gebrauchen.~ GOTO stuff
	IF ~~ THEN REPLY ~Schon gut. Ich muss weiter.~ + bye
	END
	
	IF ~~ THEN BEGIN stuff
	SAY ~Den wirklich harten Stoff darf ich Euch nicht verkaufen. Das Pulver ist einfach zu instabil. Stellt Euch vor, Ihr fallt hin und Euer Rucksack explodiert!~
	IF ~~ THEN DO ~SetGlobal("Sell_Explosives","ACIL53",1)~ GOTO store_01
	END
	
		IF ~~ THEN BEGIN store_01
		SAY ~Aber ich habe noch andere Dinge, die Euch für einen kleinen Obulus verkaufen könnte!~
		IF ~~ THEN REPLY ~Sicher, zeigt mir einmal, was Ihr anzubieten habt.~ DO ~StartStore("AC#53SVM",LastTalkedToBy(Myself)) ~ EXIT 
		IF ~~ THEN REPLY ~Vielleicht später einmal.~ + bye
		END
		
		IF ~~ THEN BEGIN bye
		SAY ~Wie Ihr wollt, <RACE>.~
		IF ~~ THEN EXIT
		END
/*******************************************************************************************************
Dialog Jorboud Hornfinger
*******************************************************************************************************/

BEGIN ~AC#JOUR1~

IF ~Global("Jorboud_Runestone","ACIL53",2)~ THEN BEGIN hello_have_runstone
  SAY ~Geht damit zu Bettargh. Er sollte wissen, was mit diesem Runenstein anzufangen ist.~
IF ~~ THEN DO ~SetGlobal("Jorboud_Runestone","ACIL53",10)
SetGlobal("AC#RC_Bettargh_Third","GLOBAL",3)
EraseJournalEntry(@62031)
GiveItemCreate("AC#RUN53",LastTalkedToBy,0,0,0)  
~ EXIT
END
				
IF ~NumTimesTalkedToGT(0)~ THEN BEGIN hello_again
  SAY ~Oh! Der <PRO_RACE> von der Oberfläche! Was kann ich für Euch tun?~
  IF ~~ THEN REPLY ~Derzeit nichts.~ GOTO bye_01
  IF ~Global("AC#TalkedToBettargh","ACIL53",0)~ THEN REPLY ~Ich suche den Leiter der Bibliothek.~ GOTO bettargh
  IF ~Global("AC#Return_to_Surface","GLOBAL",1)~ THEN REPLY ~Ich suche nach Dorna Abgrundlied. Sie soll mir helfen, zurück an die Oberfläche zu gelangen.~ + driftdisc_search_dorna_02
  IF ~Global("AC#RC_Bettargh_Third","GLOBAL",2)~ THEN REPLY ~Bettargh meinte, Ihr könntet mir bei der Beschaffung einer speziellen Runentafel helfen.~ + bettargh_asked_for_runestone
END

	IF ~~ THEN BEGIN driftdisc_search_dorna_02
	  SAY ~Die Priesterin des Dugmaren befindet sich meist in ihrem Tempel. Der Eingang ist ganz in der Nähe etwas nördlich von hier, unter der Werkstatt der Tiefengnome.~
	  IF ~~ THEN REPLY ~Dann werde ich sie dort aufsuchen.~ GOTO bye_01
	END
	
	IF ~~ THEN BEGIN bettargh_asked_for_runestone
	SAY ~Natürlich kann ich das! Welche Runentafel möchtet Ihr denn haben?~
	IF ~~ THEN REPLY ~Eine Runentafel über Barakuir.~ GOTO runestone_barakuir_01
	END
	
	IF ~~ THEN BEGIN runestone_barakuir_01
	SAY ~B-B-Barakuir? Da habt Ihr Euch ja gerade das finsterste Kapitel unserer Geschichte ausgesucht!~
	IF ~~ THEN REPLY ~Ich weiß. Habt Ihr nun diese Tafel oder nicht?~ GOTO runestone_barakuir_02
	END
	
		IF ~~ THEN BEGIN runestone_barakuir_02
		SAY ~Natürlich habe ich die Tafel. Einen Moment bitte...~
		IF ~~ THEN DO ~SetGlobal("Jorboud_Runestone","ACIL53",1)
		ClearAllActions()
		StartCutSceneMode()
		StartCutScene("AC#53CT2")
		~ EXIT
		END		

	IF ~~ THEN BEGIN bye_01
	SAY ~Nun gut. Wenn Ihr einmal Hilfe von einem echten zwergischen Bibliothekar benötigt, wisst Ihr, wo ich zu finden bin.~
	IF ~~ THEN EXIT
	END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY ~Verfluchte Gnome! Jetzt haben sie doch tatsächlich mit einem ihrer Experimente wieder einen Teil der Halle zum Einsturz gebracht!~
  IF ~~ THEN REPLY ~Was war das für ein Geräusch?~ GOTO noise
  IF ~~ THEN REPLY ~Halle? Einsturz? Ich gehe besser wieder.~ GOTO take_care
END

IF ~~ THEN BEGIN noise
  SAY ~Das? Das war der südliche Teil unserer schönen Bibliothek, der sich gerade in Schall und Rauch aufgelöst hat. Und Schuld daran sind wieder einmal die *gnur*!~
  IF ~~ THEN REPLY ~Was ist ein Gnur?~ GOTO gnur
  IF ~Global("AC#TalkedToBettargh","ACIL53",0)~ THEN REPLY ~Ich suche den Leiter der Bibliothek.~ GOTO bettargh
  IF ~Global("AC#Return_to_Surface","GLOBAL",1)~ THEN REPLY ~Ich suche nach Dorna Abgrundlied. Sie soll mir helfen, zurück an die Oberfläche zu gelangen.~ + driftdisc_search_dorna
END

	IF ~~ THEN BEGIN driftdisc_search_dorna
	  SAY ~Die Priesterin des Dugmaren befindet sich meist in ihrem Tempel. Der Eingang ist ganz in der Nähe etwas nördlich von hier, unter der Werkstatt der Tiefengnome.~
	  IF ~Global("AC#TalkedToBettargh","ACIL53",0)~ THEN REPLY ~Ich suche den Leiter der Bibliothek.~ GOTO bettargh
	  IF ~~ THEN REPLY ~Habt Dank. Ich werde weiterziehen.~ GOTO take_care
	END

IF ~~ THEN BEGIN gnur
  SAY ~Na, die Tiefengnome, die hier zu Ehren ihres Gottes Nebelun einige Dinge erbauen und denen öfter einmal eines ihrer Bauwerke um die spitzen Ohren fliegt.~
  IF ~Global("AC#TalkedToBettargh","ACIL53",0)~ THEN REPLY ~Ich suche den Leiter der Bibliothek.~ GOTO bettargh
  IF ~Global("AC#Return_to_Surface","GLOBAL",1)~ THEN REPLY ~Ich suche nach Dorna Abgrundlied. Sie soll mir helfen, zurück an die Oberfläche zu gelangen.~ + driftdisc_search_dorna
  IF ~~ THEN REPLY ~Dann sollte ich sehen, dass wieder verschwinde, bevor das nächste Experiment beginnt.~ GOTO take_care
END

IF ~~ THEN BEGIN bettargh
  SAY ~Bettargh vom Clan Abgrundlied ist der Leiter der Bibliothek. Ich denke, um ihn zu finden, müsst Ihr nur dem Qualm nach Süden folgen, da er sicher gerade die Schäden inspiziert, die die *gnur* angerichtet haben.~
  IF ~Global("AC#Return_to_Surface","GLOBAL",1)~ THEN REPLY ~Ich suche nach Dorna Abgrundlied. Sie soll mir helfen, zurück an die Oberfläche zu gelangen.~ + driftdisc_search_dorna
  IF ~~ THEN REPLY ~Danke, ich werde ihn dort aufsuchen.~ GOTO take_care
END

IF ~~ THEN BEGIN take_care
  SAY ~Tut das. He, Ihr seid doch die von der Oberfläche, oder? Passt auf, dass Ihr nicht den zentralen Schacht herunterfallt. Jeder der Bibliothekare ist mit einem Federfall-Zauber ausgestattet, aber für Euch wäre der Absturz nicht ganz so glücklich.~
  IF ~~ THEN EXIT
END

/*******************************************************************************************************
Dialog Kukgralug, Buchbindequest
*******************************************************************************************************/
BEGIN ~AC#KUKR1~

IF ~Global("AC#bookbinder","ACIL53",10)~ THEN BEGIN hello_after_books
SAY ~Danke nochmal für das Buchbinden, <RACE>!~
IF ~~ THEN EXIT
END

IF ~GlobalGT("AC#bookbinder","ACIL53",0)
GlobalLT("AC#bookbinder","ACIL53",10)~ THEN BEGIN wait_for_books
SAY ~Na? Seid Ihr mit dem Buch schon fertig?~
IF ~PartyHasItem("AC#53BK1")~ THEN REPLY ~Ich habe das Buch gebunden.~ + right_book_finished
IF ~PartyHasItem("AC#53BK2")~ THEN REPLY ~Ich habe das Buch gebunden.~ + wrong_book_finished
++ ~Nein.~ + no
END

	IF ~~ THEN BEGIN right_book_finished
	SAY ~Oh! Zeigt mal her.~
	IF ~~ THEN DO ~TakePartyItem("AC#53BK1")~ + right_book_finished_02
	END
	
		IF ~~ THEN BEGIN right_book_finished_02
		SAY ~Ja, das sieht gut aus. Ich wusste gar nicht, dass Ihr an der Oberfläche solche Sachen auch könnt! Also, wenn es mit dem Abenteurerleben mal nicht mehr so recht gelingen will, könnte ich Euch eine Tätigkeit als Buchbinder anbieten.~
		++ ~Ich werde darauf zurückkommen, Danke.~ + bye_finished
		++ ~Ich hoffe nicht, dass ich einmal in eine Situation gerate, Euer Angebot annehmen zu müssen.~ + bye_finished
		END
		
			IF ~~ THEN BEGIN bye_finished
			SAY ~Eure Entscheidung. Jedenfalls werde ich meinen Schülern zeigen, dass selbst ein <RACE> von der Oberfläche Bücher binden kann!~
			IF ~~ THEN DO ~SetGlobal("AC#bookbinder","ACIL53",10)
			IncrementGlobal("AC_Iltkazar_Reputation","GLOBAL",1)
			EraseJournalEntry(@53100)
			EraseJournalEntry(@53109)
			AddJournalEntry(@53110,QUEST_DONE)
			AddexperienceParty(500)
			DisplayStringNoName(Player1,@1021)~ EXIT
			END

	IF ~~ THEN BEGIN wrong_book_finished
	SAY ~Oh! Zeigt mal her.~
	IF ~~ THEN DO ~TakePartyItem("AC#53BK2")
	DestroyItem("AC#53BK2")~ + wrong_book_finished_02
	END
	
		IF ~~ THEN BEGIN wrong_book_finished_02
		SAY ~Da stimmt ja gar nichts! Ihr sollt nicht die Geschichte umschreiben, sondern so, wie sie gewesen ist, wieder in Buchform bringen! Jetzt können wir alles wieder auseinanderreißen...~
		=
		~Hier habt Ihr die Blätter zurück. Bindet damit ein neues Buch. Hoffentlich diesmal in besserer Reihenfolge!~
			IF ~~ THEN DO ~GiveItemCreate("AC#53PA1",LastTrigger,0,0,0)
GiveItemCreate("AC#53PA2",LastTrigger,0,0,0)
GiveItemCreate("AC#53PA3",LastTrigger,0,0,0)
GiveItemCreate("AC#53PA4",LastTrigger,0,0,0)
GiveItemCreate("AC#53PA5",LastTrigger,0,0,0)
EraseJournalEntry(@53109)~ EXIT
			END

IF ~Global("AC#Explosion","ACIL53",1)~ THEN BEGIN new_here
SAY ~He, Ihr! Wenn Ihr Euch nützlich machen wollt, könnt Ihr mir helfen, das ganze Papier, das hier herumliegt, aufzusammeln und neu zu sortieren.~
IF ~~ THEN REPLY ~Ich soll das Papier aufheben?~ + pick_up
++ ~Vielleicht später.~ + no
++ ~Ich muss mich um wichtigere Dingen kümmern.~ + no
END

	IF ~~ THEN BEGIN pick_up
	SAY ~Ja, bücken, in die Hand nehmen, und dann wieder zu einem neuen, sinnvollen Buch zusammenbinden.~
	++ ~Ihr wollt, dass ich ein Buch binde?~ + buch_binden
	++ ~Darauf habe ich gerade keine Lust. Vielleicht später.~ + no
	END

		IF ~~ THEN BEGIN buch_binden
		SAY ~Ja, das dürfte auch für einen <RACE> mit Euren Fähigkeiten nicht allzu schwer sein. In diesem Teil der Bibliothek befanden sich meist eh' nur relativ wertlose Kopien von vergänglichen Büchern aus der Oberfläche, die sich mit der Natur von uns Zwergen befassten. Pah! Als ob die *hurm* davon eine Ahnung hätten!~
		=
		~Egal. Ihr sammelt die Seiten auf und seht zu, dass Ihr sie wieder zu etwas Sinnvollem zusammenbindet.~
		++ ~Wo kann ich ein Buch binden?~ + buch_binden_02
		++ ~Vielleicht später.~ + no
		END

			IF ~~ THEN BEGIN buch_binden_02
			SAY ~Ganz in der Nähe steht ein Gerät, mit dem man relativ schnell die Blätter zu etwas Ganzem zusammensetzen kann. Es nimmt einem die Bindearbeit ab, das Einzige, worauf Ihr achten müsst, ist, dass Ihr die Blätter in der richtigen Reihenfolge auf den Apparat legt.~
			++ ~Das klingt nach einer leichten Aufgabe. Ich werde mit dem fertigen Buch zurückkommen.~ + yes
			++ ~Darauf habe ich gerade keine Lust. Vielleicht später.~ + no
			END

		IF ~~ THEN BEGIN yes
		SAY ~Na wer sagt's denn. Dann mal los an die Arbeit! Ich denke, fünf Seiten für das Buch sollten reichen. Wenn Ihr die fünf Blätter beisammen habt, könnt Ihr mit dem Binden an der Maschine beginnen.~
		IF ~~ THEN DO ~SetGlobal("AC#bookbinder","ACIL53",1)~ EXIT
		END

		IF ~~ THEN BEGIN no
		SAY ~Schade. Das Lesen hätte Euch einmal gut getan, aber sei's drum.~
		IF ~~ THEN DO ~~ EXIT 
		END

/*******************************************************************************************************
Dialog Fruntuck Flaschenhals
*******************************************************************************************************/
BEGIN ~AC#53SV2~

IF ~True()~ THEN BEGIN hick_01
SAY ~*Hicks*?~
IF ~Global("AC#Fruntuck","GLOBAL",0)~ THEN REPLY ~Was ist denn mit Euch los?~ + whats_up_with_you
IF ~PartyHasItem("ac#eyebe")~ THEN REPLY ~Ich habe hier einen Augenstiel eines Betrachters für Euch.~ + need_potion_eyestalk
++ ~Ich sehe schon, das wird nichts. Auf Wiedersehen!~ + bye
IF ~Global("AC#Fruntuck_Levitate","GLOBAL",1)~ THEN REPLY ~Ich brauche einen Levitationstrank.~ + need_levitation_potion
END

	IF ~~ THEN BEGIN need_potion_eyestalk
	SAY ~*Hicks*...~ [HICCUP]
	IF ~~ THEN DO ~TakePartyItem("ac#eyebe")
	DestroyItem("ac#eyebe")~ + take_eyestalk 
	END
	
	IF ~~ THEN BEGIN take_eyestalk
	SAY ~Aaaahh!~
	=
	~Bei Urdlens Zahnlücke! Ich dachte schon, der sei noch am Leben. Ihr habt mich jetzt aber erschreckt!~
	++ ~Auf jeden Fall scheine ich Euch endgültig von Eurem Schluckauf kuriert zu haben.~ + make_potion
	END
				
				IF ~~ THEN BEGIN make_potion
				SAY ~Wie dem auch sei. Jetzt habe ich wieder Material, mit dem ich den stärksten Leviationstrank brauen kann, den es im Unterreich gibt!~
				=
				~Was für ein prächtiger Augenstiel das doch ist! Passt auf, mit diesem Trank segelt Ihr herauf bis nach Arborea!~
				++ ~Wollt Ihr ihn gleich anfertigen?~ + make_potion_02
				END
				
					IF ~~ THEN BEGIN make_potion_02
					SAY ~Also, wenn Ihr zusehen wollt, dürft Ihr das gerne machen.~
					++ ~Aber klar doch! Los geht's.~ + lets_get_started
					END
					
										
							IF ~~ THEN BEGIN lets_get_started
							SAY ~Gut! Also, als Erstes müssen wir ein Konzentrat aus ätherischen Ölen aufsetzen.~
							=
							~...~ [AM0602D2]
							=
							~Jetzt muss der Augenstiel zerdrückt werden, bis der Betrachtersaft gleichmäßig herausläuft...~
							=
							~...~ [AM0602D3]
							=
							~Wenn wir das jetzt kurz erhitzen, wird das ganze schnell sämig. Die Betrachteressenz setzt sich gerne oben ab, dies müssen wir durch stetiges Rühren verhindern, sonst bildet sich eine Haut. Stört Euch nicht am Geruch!~
							=
							~...~ [AM0602D1]
							=
							~Fertig! Das ging doch schnell, oder? Hier, ich gieße es noch in eine schicke Flasche. Das Schöne ist, dass man die Flasche niemals fallen lassen kann, da sie durch die Wirkung des Trankes kontinuierlich schwebt.~
							IF ~~ THEN DO ~GiveItemCreate("AC#POTL2",Player1,1,1,1)
							EraseJournalEntry(@64203)
				EraseJournalEntry(@64204)
				EraseJournalEntry(@64205)
				AddJournalEntry(@64206,QUEST_DONE)~ EXIT
				END
	
	IF ~~ THEN BEGIN whats_up_with_you
	SAY ~*Hicks*.~ [HICCUP]
	++ ~Ich sehe schon, das wird nichts. Auf Wiedersehen!~ + bye
	++ ~Ihr habt einen Schluckauf?~ + hickup
	END
	
			IF ~~ THEN BEGIN hickup
			SAY ~*Hicks*!~ [HICCUP]
			++ ~Ihr stellt Tränke her?~ + to_do_with_potions
			++ ~Hat das etwas mit den Tränken zu tun, die Ihr hier braut?~ + reason_hickup
			++ ~Ich sehe schon, das wird nichts. Auf Wiedersehen!~ + bye
			END
			
			IF ~~ THEN BEGIN reason_hickup
		SAY ~*Hicks*! Ich erforschte gerade die Wir-*Hicks*-kung eines Trankes, der den Bauch grö-*Hicks*-ßer werden lassen kann, als mich dieser Schluck-*Hicks* erwi-*Hicks*-te!~ [HICCUP]
		++ ~Wozu bei den neun Höllen braucht man einen Trank, der den Bauch wachsen lässt?~ + belly_growth_02
		END
		
			IF ~~ THEN BEGIN belly_growth_02
			SAY ~Viele Zwerg*Hicks*e finden einen großen Bauch äußerst attrakt*Hicks*. Außerdem pa-*Hicks*-sst in einen großen Bauch mehr herein. Die *Hicks*Zwerge würden sich um einen solch*Hicks*en Trank sicher reißen! *Hicks*!~ [HICCUP]
			++ ~Zum Glück habt Ihr ihn erst bei Euch selbst ausprobiert, sonst hätte jetzt die ganze Stadt Schluckauf!~ + to_do_with_potions
			END
			
			IF ~~ THEN BEGIN to_do_with_potions
			SAY ~*Hicks*! Ja. *Hicks*!~ [HICCUP]
			++ ~Ich sehe schon, das wird nichts. Auf Wiedersehen!~ + bye
			++ ~Ich komme später wieder, wenn Euer Schluckauf vorbei ist.~ + bye
			IF ~Global("AC#Fruntuk_Levitate","GLOBAL",1)~ THEN REPLY ~Ich brauche einen Levitationstrank.~ + need_levitation_potion
			END
			
			IF ~~ THEN BEGIN need_levitation_potion
			SAY ~Das seid Ihr bei mir richtig! Ich bin -*Hicks*!- dafür zuständig, den Gelehrten hier Levitationstränke zu brauen, damit sie nicht ständig -*Hicks*!- Gefahr laufen, den zentralen Schacht herunterzufallen.~ [HICCUP]
			=
			~Nur leider fehlen mir dazu die nötigen Ingredi-*hicks*ien. Durch die Explosion sind alle Lagervor*hicks*räte zerstört worden.~			
			++ ~Was benötigt Ihr für diesen Trank?~ + need_beholder_eyestalk
			END
			
			IF ~~ THEN BEGIN need_beholder_eyestalk
			SAY ~Den Augenstiel eines -*Hicks*!- Betrachters.~ [HICCUP]
			++ ~Ihr trinkt hier Tränke, in denen der Augenstiel eines Betrachters schwimmt?~ + need_beholder_eyestalk_02
			END
						
							IF ~~ THEN BEGIN need_beholder_eyestalk_02
							SAY ~Es gibt leider keine andere -*Hicks*!- Kreatur, die über eine derart mächtige -*Hicks*!- Art der Levitation verfügt, bedaure.~ [HICCUP]
							=
							~Bringt mir einen *hicks* Augenstiel, dann kann ich wieder weitere derartige Tränke brauen.~
							++ ~Nun gut, und wo soll ich einen Betrachter finden, den ich überzeugen kann, sich von einem Augenstiel zu trennen?~ + need_beholder_eyestalk_03
							END
							
								IF ~~ THEN BEGIN need_beholder_eyestalk_03
								SAY ~Nun, glücklicherweise sind Betrachter in dieser Region des Unterreiches nicht sehr selten.~
								++ ~Das ist ja äußerst beruhigend!~ + need_beholder_eyestalk_04
								END
								
									IF ~~ THEN BEGIN need_beholder_eyestalk_04
									SAY ~Die Betrachter suchen seit Jahren nach einem Weg, Iltkazar -*Hicks*!- zu schaden. Nicht weit entfernt von dieser Stadt befinden sich noch alte Schächte, die aus den Zeiten herrühren, als die Betrachter uns Gnomen... nun ja, -*Hicks*!- nach dem Leben trachteten.~ [HICCUP]
									++ ~Gut. Wie komme ich dorthin?~ + need_beholder_eyestalk_05
									END
									
										IF ~~ THEN BEGIN need_beholder_eyestalk_05
										SAY ~Die Frage wäre eher, wie Ihr dort -*Hicks*!- herunterkommt. Denn die Schächte sind -*Hicks*!- für Betrachter geschaffen, denen es natürgemäß ein Leichtes ist, hinauf und -*Hicks*!- hi-hinunter-*Hicks*!-zuschweben.~ [HICCUP]
										=
										~Glücklicherweise sind die -*Hicks*!- Schächte nicht sonder-*Hicks*!-lich tief. Man kann gut mit einer Leiter dort herunterklettern. Sagt, habt Ihr eine -*Hicks*!- Leiter?~ [HICCUP]
										IF ~~ THEN REPLY ~Nein, leider nicht mehr.~ + not_have_ladder
										IF ~~ THEN REPLY ~Nein.~ + not_have_ladder
										END
											
												IF ~~ THEN BEGIN not_have_ladder
												SAY ~Dann müsst Ihr Euch eine -*Hicks*!- neue Leiter besorgen. Mit derlei Dingen kenne ich mich nicht -*Hicks*!- gut aus. Ich denke, in der Zi-*Hicks*!-sterne, in der auch das blutige Boll-*Hicks*!-werk beheimatet ist, könntet Ihr jedoch fündig werden.~ [HICCUP]
												=
												~Fragt einmal bei Thif*hicks*... ich meine *Hicks*tic... ach, verdammt... Thiftic! Er sollte solche Dinge im *Hicks*gebot haben.~
												IF ~~ THEN DO ~SetGlobal("AC#Fruntuck","GLOBAL",1)
												SetGlobal("AC#Fruntuk_Levitate","GLOBAL",2)
												AddJournalEntry(@64201,QUEST)
												~ EXIT
												END	
	
		IF ~~ THEN BEGIN bye
		SAY ~*Hicks*!~ [HICCUP]
		IF ~~ THEN DO ~~ EXIT 
		END
/*******************************************************************************************************
Dialog Metagolem
*******************************************************************************************************/
BEGIN ~AC#GOLME~

IF ~~ THEN BEGIN golem_name
SAY ~Ihr habt mir auch noch keinen Namen gegeben, Meister.~
IF ~~ THEN EXTERN ~AC#53SV1~ golem_name_02
END	
/*******************************************************************************************************
Dialog Metagolem 2
*******************************************************************************************************/
BEGIN ~AC#GOLM2~

	
/*******************************************************************************************************
Dialog Schnaiklu Kobaltwächter
*******************************************************************************************************/
BEGIN ~AC#53SV1~

IF ~RandomNum(6,1)~ THEN BEGIN hello_01
SAY ~Wo habe ich nur diesen verfluchten Zirkel...~
IF ~~ THEN DO ~~ GOTO oh_hello
END

IF ~RandomNum(6,2)~ THEN BEGIN hello_02
SAY ~...das Blatt mit den Skizzen muss doch hier irgendwo sein...~
IF ~~ THEN DO ~~ GOTO oh_hello
END

IF ~RandomNum(6,3)~ THEN BEGIN hello_03
SAY ~Ich bin mir sicher, dass der Stößel doch gerade hier irgendwo gelegen ist...~
IF ~~ THEN DO ~~ GOTO oh_hello
END

IF ~RandomNum(6,4)~ THEN BEGIN hello_04
SAY ~(...)~
IF ~~ THEN DO ~~ GOTO oh_hello
END

IF ~RandomNum(6,5)~ THEN BEGIN hello_05
SAY ~Wenn es doch nur eine Möglichkeit gäbe, an mehr von diesem Material zu kommen...~
IF ~~ THEN DO ~~ GOTO oh_hello
END

IF ~RandomNum(6,6)~ THEN BEGIN hello_06
SAY ~Denk nach, Schnaiklu, so schwer kann das doch nicht sein...~
IF ~~ THEN DO ~~ GOTO oh_hello
END

IF ~~ THEN BEGIN oh_hello
SAY ~Huch! Oh, Hallo <RACE>! Ich hatte Euch gar nicht bemerkt.~
IF ~Global("AC#talkedSchnaiklu","ACIL53",0)~ THEN REPLY ~Wer seid Ihr?~ + who_are_you
IF ~Global("AC#metagolem","ACIL53",0)~ THEN REPLY ~Was ist das für ein seltsam glänzendes Wesen neben Euch?~ + strange_thing
// old - metagolem for bettargh
/*IF ~Global("AC#RC_Bettargh_Third","GLOBAL",2)
Global("AC#MetagolemIngredients","ACIL53",0)~ THEN REPLY ~Bettargh meinte, Ihr bräuchtet Hilfe wegen eines speziellen Golems.~ + bettargh_asked_for_metagolem
*/
IF ~Global("AC#MetagolemIngredients","ACIL53",1)~ THEN REPLY ~Wegen Eures Metagolems...~ + will_you_do_it
IF ~Global("AC#MetagolemIngredients","ACIL53",2)~ THEN REPLY ~Wegen Eures Metagolems...~ + about_metagolem_02
IF ~PartyHasItem("AC#HIZA1")~ THEN REPLY ~Ich habe hier etwas Hizagkuur-Erz.~ + raw_hizagkuur
IF ~PartyHasItem("AC#HIZA2")~ THEN REPLY ~Ich habe hier etwas Hizagkuur-Erz.~ + final_hizagkuur
IF ~PartyHasItem("AC#ILWES")
Global("AC#WaterEleQuest","GLOBAL",1)~ THEN REPLY ~Hier ist die Essenz eines Höheren Wasserelementares.~ + have_water_essence
IF ~~ THEN REPLY ~Nichts für ungut. Ich werde Euch nicht weiter stören.~ GOTO goodbye_01
END

	IF ~~ THEN BEGIN final_hizagkuur
	SAY ~Das ist genau das, was ich brauche!~
	IF ~~ THEN DO ~TakePartyItem("AC#HIZA2")
	SetGlobal("AC#HizagkuurQuest","GLOBAL",4)~ + final_hizagkuur_02
	END
	
		IF ~~ THEN BEGIN final_hizagkuur_02
		SAY ~Früher musste man einen Metagolem ständig mittels Blitzzauber aktivieren, aber das ist jetzt durch die Verwendung des Hizagkuur hinfällig!~
		IF ~~ THEN + what_else
		END
	
		IF ~~ THEN BEGIN what_else
		SAY ~Was ist mit den anderen Dingen, um die Euch gebeten habe?~
		IF ~PartyHasItem("AC#ILWES")
		Global("AC#WaterEleQuest","GLOBAL",1)~ THEN REPLY ~Hier ist die Essenz eines Höheren Wasserelementares.~ + have_water_essence
		IF ~PartyHasItem("AC#HIZA1")~ THEN REPLY ~Ich habe hier etwas Hizagkuur-Erz.~ + raw_hizagkuur
		IF ~PartyHasItem("AC#HIZA2")~ THEN REPLY ~Ich habe hier etwas Hizagkuur-Erz.~ + final_hizagkuur
		IF ~HasItem("AC#HIZA2",Myself)  
		HasItem("AC#ILWES",Myself)~ THEN REPLY ~Ihr besitzt doch schon alles, um das Ihr mich gebeten hattet.~ + given_all
		IF ~GlobalLT("AC#HizagkuurQuest","GLOBAL",4)
		GlobalLT("AC#WaterEleQuest","GLOBAL",2)~ THEN REPLY ~Mehr habe ich noch nicht für Euch.~ + sit_and_wait
		IF ~~ THEN REPLY ~Ich bin noch auf der Suche.~ + sit_and_wait
		END
		
				IF ~~ THEN BEGIN given_all
				SAY ~Was? Oh, ja, tatsächlich! Dann können wir ja jetzt den Metagolem zum Leben erwecken!~
				=
				~Tretet bitte einen Schritt zurück! Dies wird ein mächtigiger Moment in meinem Gnomenleben!~
				IF ~~ THEN DO ~SetGlobal("AC#MetagolemIngredients","ACIL53",3)
				EraseJournalEntry(@53200)
				AddJournalEntry(@53201,QUEST_DONE)
				~ EXIT
				END
		
		IF ~~ THEN BEGIN have_water_essence
		SAY ~Oh! Lasst es mich Euch gleich abnehmen - und vorsichtig damit, dass Ihr nichts verschüttet!~
		IF ~~ THEN DO ~TakePartyItem("AC#ILWES")
		SetGlobal("AC#WaterEleQuest","GLOBAL",2)~ + have_water_essence_02
		END
		
			IF ~~ THEN BEGIN have_water_essence_02
			SAY ~Unglaublich, dass in so einem kleinen Pfützlein die Seele eines derart mächtigen Wesens schlummert!~
			IF ~~ THEN + what_else
			END
	
	IF ~~ THEN BEGIN raw_hizagkuur
	SAY ~Oh! Das sind aber die rohen Erz-Klumpen! Passt mit dem Zeug auf, sonst bekommt Ihr eine geschmiert! Ihr solltet es zu Sorni bringen, damit sie es in brauchbares Material umwandeln kann.~
	IF ~~ THEN DO ~~ EXIT 
	END
	
	IF ~~ THEN BEGIN about_metagolem_02
	SAY ~Ja? Habt Ihr die Dinge schon gefunden?~
	IF ~~ THEN REPLY ~Was benötigt Ihr nochmal dafür?~ + what_do_you_need_again
	IF ~~ THEN REPLY ~Nein.~ + sit_and_wait
	END
	
		IF ~~ THEN BEGIN what_do_you_need_again
		SAY ~Wasserelementaressenz und Hizagkuur.~
		IF ~~ THEN DO ~~ EXIT 
		END
		
		IF ~~ THEN BEGIN sit_and_wait
		SAY ~*Seufz*. Dann werde ich wohl hier an anderen meiner Ideen weiterarbeiten müssen.~
		IF ~~ THEN DO ~~ EXIT 
		END
	
	IF ~~ THEN BEGIN will_you_do_it
	SAY ~Wollt Ihr mir etwa helfen, die Zutaten zu beschaffen?~
	//IF ~Global("AC#RC_Bettargh_Third","GLOBAL",2)~ THEN REPLY ~Da Bettargh ohne den Metagolem nicht weiterkommt, werde ich mich wohl auf die Suche machen müssen.~ + i_will_do_it
	IF ~~ THEN REPLY ~Ja.~ + i_will_do_it
	IF ~~ THEN REPLY ~Nein.~ + have_to_think_about_it
	END

	IF ~~ THEN BEGIN who_are_you
	SAY ~Ich bin Schnaiklu Kobaltwächter, Erfinder im Dienste Nebeluns.~
	IF ~~ THEN REPLY ~Ich habe einige Fragen an Euch.~ DO ~SetGlobal("AC#talkedSchnaiklu","ACIL53",1)~ GOTO questions_01
	IF ~~ THEN REPLY ~Mehr möchte ich gar nicht wissen. Gutes Gelingen.~ DO ~SetGlobal("AC#talkedSchnaiklu","ACIL53",1)~ GOTO goodbye_01
	END
	
	IF ~~ THEN BEGIN strange_thing
	SAY ~Das, mein lieber <RACE>, ist eine besondere Art von Golem, ein Metagolem.~
	IF ~~ THEN REPLY ~Ich habe weitere Fragen an Euch.~ DO ~SetGlobal("AC#talkedSchnaiklu","ACIL53",1)
	SetGlobal("AC#metagolem","ACIL53",1)~ GOTO questions_01
	IF ~~ THEN REPLY ~Mehr möchte ich gar nicht wissen. Gutes Gelingen.~ DO ~SetGlobal("AC#talkedSchnaiklu","ACIL53",1)
	SetGlobal("AC#metagolem","ACIL53",1)~ GOTO goodbye_01
	IF ~~ THEN REPLY ~Was ist ein Metagolem?~ DO ~SetGlobal("AC#talkedSchnaiklu","ACIL53",1)
	SetGlobal("AC#metagolem","ACIL53",1)~ GOTO what_is_metagolem
	END
	
	// old - Bettargh metagolem
	/*
	IF ~~ THEN BEGIN bettargh_asked_for_metagolem
	SAY ~Oh, das ist aber nett von dem Zwerg, dass er endlich Hilfe schickt! Ich komme hier sonst auch nicht mit dem Metagolem weiter, den Bettargh gerne haben möchte.~
	IF ~~ THEN REPLY ~Was ist ein Metagolem?~ DO ~SetGlobal("AC#talkedSchnaiklu","ACIL53",1)
	SetGlobal("AC#metagolem","ACIL53",1)~ GOTO what_is_metagolem
	END
	*/
	
		IF ~~ THEN BEGIN what_is_metagolem
		SAY ~Ein Metagolem ist ein ganz besonderer Golem. Habt Ihr schon einmal gewöhnliche Golems wie Fleisch-, Lehm- oder Steingolems kennengelernt?~
		IF ~~ THEN REPLY ~Ich denke schon, ja. Ein mächtiger Magier, der mich gefangennahm, hatte sie als Wächter.~ + what_is_metagolem_02
		END
		
			IF ~~ THEN BEGIN what_is_metagolem_02
			SAY ~Dann ist Euch sicher aufgefallen, dass alle Golems eines gemeinsam haben?~
			IF ~~ THEN REPLY ~Sie sind stark.~ + golems_strong
			IF ~~ THEN REPLY ~Sie sind dumm.~ + golems_dumb
			END
			
				IF ~~ THEN BEGIN golems_strong
				SAY ~...das schon, aber sie sind vor allem Eines...~
				IF ~~ THEN + golems_dumb_02
				END
				
				IF ~~ THEN BEGIN golems_dumb
				SAY ~...sie sind nicht nur dumm...~
				IF ~~ THEN + golems_dumb_02
				END
				
					IF ~~ THEN BEGIN golems_dumb_02
					SAY ~Golems sind saudumm! Wusstet Ihr, dass die meisten Golems früher oder später ihren eigenen Erschaffer erschlagen, weil sie seine Befehle falsch verstehen?~
					IF ~~ THEN REPLY ~Das ist tragisch.~ + thats_why_metagolems_made_for
					IF ~~ THEN REPLY ~Den meisten geschieht es wahrscheinlich recht.~ + thats_why_metagolems_made_for
					END
					
						IF ~~ THEN BEGIN thats_why_metagolems_made_for
						SAY ~Nicht so bei Metagolems! Sie sind intelligenter als mancher Zwerg, als die meisten Menschen sowieso...~
						IF ~~ THEN REPLY ~Euer Exemplar sieht mir aber nicht sehr geistig rege aus.~ + not_your_metagolem
						END
						
							IF ~~ THEN BEGIN not_your_metagolem
							SAY ~Das genau ist mein Problem. Mir fehlen zwei Zutaten, um die Kreatur mit Intelligenz zu füllen. Deshalb kommt Ihr mir gerade recht.~
							IF ~~ THEN REPLY ~Ich soll Euch die Zutaten besorgen?~ + search_ingredients
							END
							
								IF ~~ THEN BEGIN search_ingredients
								SAY ~Genau! Eigentlich sollte mir dabei der Menschenmagier Ellhimar helfen, aber er hat sich hier einfach nicht mehr blicken lassen.~
								IF ~OR(2)
								Dead("ac#ilel1")
								Dead("ac#ilel2")~ THEN REPLY ~Das liegt daran, dass er ein Drow war und jetzt tot ist.~ + ellhimar_dead
								IF ~~ THEN REPLY ~Was sollte der Magier Euch denn bringen?~ + what_ingredients_ellhimar
								END
								
									IF ~~ THEN BEGIN ellhimar_dead
									SAY ~Oh! Ist er etwa auch von einem Golem erschlagen worden?~
									IF ~~ THEN REPLY ~Nein, von mir.~ + pc_killed_ellhimar
									END
									
										IF ~~ THEN BEGIN pc_killed_ellhimar
										SAY ~Dann ist ja gut. Wäre ja schlimm, wenn es ein Golem gewesen wär'!~
										IF ~~ THEN + what_ingredients_ellhimar
										END
// ingredient_ water elemental essence__________________________________								
								IF ~~ THEN BEGIN what_ingredients_ellhimar
								SAY ~Also passt auf. Ich brauche zum Einen die Essenz eines höheren Elementarwesens, eines Wasserelementars. Dabei sollte mir der Magier eigentlich helfen.~
								IF ~PartyHasItem("AC#ILWES")~ THEN REPLY ~Ich glaube, ich habe eine solche Essenz bereits gefunden. Seht her!~ + already_have_water_essence
								IF ~!PartyHasItem("AC#ILWES")~ THEN REPLY ~Wo finde ich solch ein Wesen?~ DO ~SetGlobal("AC#WaterEleQuest","GLOBAL",1)
								AddJournalEntry(@53220,QUEST)~ + where_to_find_water_elemental
								END
								
									IF ~~ THEN BEGIN already_have_water_essence
									SAY ~Oh! Ja tatsächlich, das ist genau das, was ich brauche! Was für eine Überraschung. Lasst es mich Euch gleich abnehmen - und vorsichtig damit, dass Ihr nichts verschüttet!~
									IF ~~ THEN DO ~TakePartyItem("AC#ILWES")
									~ + have_water_essence_need_second_ingredient
									END
								
										IF ~~ THEN BEGIN have_water_essence_need_second_ingredient
										SAY ~Dann fehlt mir nur noch noch eine zweite Zutat.~
										IF ~~ THEN REPLY ~Und die wäre?~ DO ~SetGlobal("AC#WaterEssenceDelivered","LOCALS",1)
										SetGlobal("AC#WaterEleQuest","GLOBAL",2)~ + second_ingredient
										END
									
									IF ~~ THEN BEGIN where_to_find_water_elemental
									SAY ~Genau das kann ich Euch nicht sagen. Wenn ich es wüsste, würde ich es mir natürlich selbst besorgen. Ich brauche auch noch eine zweite Zutat.~
									IF ~~ THEN REPLY ~Und die wäre?~ + second_ingredient
									END
									
										IF ~~ THEN BEGIN second_ingredient
										SAY ~Ein besonderes Metall, das die Zwerge hier verarbeiten, welches sich Hizagkuur nennt.~
										IF ~~ THEN REPLY ~Warum gerade dieses Metall?~ DO ~SetGlobal("AC#HizagkuurQuest","GLOBAL",1)
										AddJournalEntry(@53230,QUEST)~ + why_need_hizagkuur
										END
										
											IF ~~ THEN BEGIN why_need_hizagkuur
											SAY ~Hizagkuur hat eine Eigenschaft, das es für den Bau eines Metagolems unersetzlich macht. Es ist derart voller Energie, dass es ständig Blitze aussendet, wenn man es berührt. Diese Energie brauche ich, um meinen Metagolem zu aktivieren und mit Intelligenz und Verstand zu füllen.~
											IF ~~ THEN REPLY ~Das klingt in der Tat nach einem außergewöhnlichen Werkstoff.~ + where_is_hizagkuur
											END
											
												IF ~~ THEN BEGIN where_is_hizagkuur
												SAY ~Deshalb wird die Verarbeitung in Iltkazar auch gehütet wie ein großer Schatz. Nur Sorni Arnschädel weiß, woher man es bekommt und wie man es vergütet, doch sie will es mir nicht sagen.~
												=
												~Ihr könnt Sorni in der Arnschädelhalle fragen, ob sie Euch etwas Hizagkuur abgibt. Mich hat sie aber bisher immer abblitzen lassen.~
												IF ~!HasItem("AC#ILWES",Myself)~ THEN REPLY ~Ich soll also für Euch einen höheren Wasserelementar erschlagen, seine Essenz einsammeln und ein Metall, das Blitze aussendet, suchen.~ DO ~SetGlobal("AC#MetagolemIngredients","ACIL53",1)~ GOTO ingredients_conclusion
												IF ~HasItem("AC#ILWES",Myself)~ THEN REPLY ~Ich soll also für Euch noch nach einem Metall, das Blitze aussendet, suchen.~ DO ~SetGlobal("AC#MetagolemIngredients","ACIL53",1)~ GOTO ingredients_conclusion
												//IF ~PartyHasItem("AC#HIZA1")~ THEN REPLY ~Ich habe hier schon etwas Hizagkuur bei mir.~ DO ~SetGlobal("AC#MetagolemIngredients","ACIL53",1)~ GOTO already_have_hizagkuur_ore
												//IF ~PartyHasItem("AC#HIZA2")~ THEN REPLY ~Ich habe hier schon etwas Hizagkuur bei mir.~ DO ~SetGlobal("AC#MetagolemIngredients","ACIL53",1)~ GOTO final_hizagkuur
												END
												
														IF ~~ THEN BEGIN already_have_hizagkuur_ore
														SAY ~Oh! Das sind aber die rohen Erz-Klumpen! Passt mit dem Zeug auf, sonst bekommt Ihr eine geschmiert! Ihr solltet es zu Sorni bringen, damit sie es in brauchbares Material umwandeln kann.~
														IF ~~ THEN + come_back_later
														END
														
													IF ~~ THEN BEGIN ingredients_conclusion
													SAY ~Richtig! Das ist für Euch doch machbar, oder?~
													IF ~~ THEN REPLY ~Ich denke schon, ja.~ + i_will_do_it
													IF ~~ THEN REPLY ~Darüber muss ich erst einmal in Ruhe nachdenken.~ + have_to_think_about_it
													END
													
															IF ~~ THEN BEGIN have_to_think_about_it
															SAY ~Schade. Naja, Ihr wisst ja, wo ich zu finden bin, wenn Ihr es Euch anders überlegt...~
															IF ~~ THEN DO ~~ EXIT 
															END
													
														IF ~~ THEN BEGIN i_will_do_it
														SAY ~Das ist toll! Natürlich werde ich Euch auch entlohnen, wenn Ihr mir einen so großen Dienst erweist.~
														IF ~~ THEN  + come_back_later
														END
														
															IF ~~ THEN BEGIN come_back_later
															SAY ~Wenn Ihr alles zusammen habt, kommt wieder hier vorbei. Ich kann den Moment kaum erwarten, wenn mein Golem zu richtigem Leben erwacht!~
															IF ~~ THEN DO ~SetGlobal("AC#MetagolemIngredients","ACIL53",2)
															AddJournalEntry(@53200,QUEST)~ EXIT
															END
									
	
	IF ~~ THEN BEGIN goodbye_01
	SAY ~Jaja. Hmm... wo war noch gleich dieser Hebel...~
	IF ~~ THEN DO ~~ EXIT 
	END
	
	IF ~~ THEN BEGIN questions_01
	SAY ~Oh! Ich rede gerne über meine Erfindungen. Was wollt Ihr denn wissen?~
	IF ~Global("AC#talkedSchnaiklu","ACIL53",0)~ THEN REPLY ~Wer seid Ihr?~ + who_are_you
	IF ~Global("AC#metagolem","ACIL53",0)~ THEN REPLY ~Was ist das für ein seltsam glänzendes Wesen neben Euch?~ + strange_thing
	//IF ~Global("AC#RC_Bettargh_Third","GLOBAL",2)~ THEN REPLY ~Bettargh meinte, Ihr bräuchtet Hilfe wegen eines speziellen Golems.~ + bettargh_asked_for_metagolem
	IF ~~ THEN REPLY ~Mehr möchte ich gar nicht wissen. Gutes Gelingen.~ GOTO goodbye_01
	END
	
		// Old - bettargh metagolem
		/*
		IF ~~ THEN BEGIN first_task_metagolem
		SAY ~Ja, aber das wäre fast zu einfach...~
		IF ~~ THEN REPLY ~Ihr könntet ihn damit beauftragen, die Runenplatte zu suchen, die ich für Bettargh besorgen soll.~ GOTO task_metagolem_seek_runestone
		END
		*/
		
		IF ~~ THEN BEGIN first_task_metagolem
		SAY ~Ja, aber das wäre fast zu einfach... Über Eure erste Aufgabe muss ich einmal in Ruhe nachdenken...~
		IF ~~ THEN EXTERN ~AC#GOLME~ golem_name
		END

// old - bettargh metagolem
/*	
			IF ~~ THEN BEGIN task_metagolem_seek_runestone
			SAY ~...das ist eine gute Idee! Hört zu, Golem, ich möchte, dass Ihr mir alle Runentafeln zu dem Thema...~
			=
			~...was war es doch gleich, <CHARNAME>?~
			IF ~~ THEN REPLY ~Ein Weg nach Barakuir.~ GOTO chain_metagolem_barakuir
			END
			
				IF ~~ THEN BEGIN task_metagolem_finished
				SAY ~So, <CHARNAME>, jetzt heißt es warten...~
				IF ~~ THEN DO ~SetGlobal("AC#MetagolemIngredients","ACIL53",6)
				ActionOverride("AC#GOLME",ReallyForceSpell(Myself,GOLEM_HASTE))
				ActionOverride("AC#GOLME",EscapeArea())
				~ EXIT
				END
				
				IF ~~ THEN BEGIN metagolem_take_runestone
				SAY ~Habt Dank, Geschöpf! <CHARNAME>, hier ist die Tafel, die Ihr suchtet. Ich hoffe, Bettargh kann damit etwas anfangen.~
				=
				~Habt nochmals Dank für Eure Hilfe bei der Erschaffung dieses wundervollen Golems. Habt Ihr etwas dagegen, wenn ich ihn <CHARNAME> nenne?~
				IF ~~ THEN REPLY ~Es wäre mir eine Ehre.~ + golem_change_name
				IF ~~ THEN REPLY ~Das fände ich ziemlich unpassend.~ + golem_change_name_not
				END
*/
				IF ~~ THEN BEGIN golem_name_02
				SAY ~In der Tat! Ihr braucht einen guten Namen. Habt Ihr etwas dagegen, wenn ich ihn <CHARNAME> nenne?~
				IF ~~ THEN REPLY ~Es wäre mir eine Ehre.~ + golem_change_name
				IF ~~ THEN REPLY ~Das fände ich ziemlich unpassend.~ + golem_change_name_not
				END
				
				
					IF ~~ THEN BEGIN golem_change_name
					SAY ~Fabelhaft! So soll er also <CHARNAME> heißen und mich immer an den <PRO_RACE> von der Oberfläche erinnern, der mit so gut geholfen hat.~
					IF ~~ THEN DO ~SetGlobal("AC#MetagolemName","ACIL53",1)~ GOTO thank_you_metagolem_quest_finished
					END
					
					IF ~~ THEN BEGIN golem_change_name_not
					SAY ~Dann eben nicht. War ja nur ein Vorschlag.~
					IF ~~ THEN GOTO thank_you_metagolem_quest_finished
					END
				
				IF ~~ THEN BEGIN thank_you_metagolem_quest_finished
				SAY ~Jedenfalls habt Ihr mir bei meiner Mühe sehr geholfen, und dafür bin ich Euch dankbar! Hier habt Ihr einen besonderen Brocken Fels, der mir bei den Streifzügen meiner Jugend sehr viel geholfen hat.~
				IF ~~ THEN DO ~SetGlobal("AC#MetagolemIngredients","ACIL53",8)
				IncrementGlobal("AC_Iltkazar_Reputation","GLOBAL",1)
				GiveItemCreate("AC#RCKEL",LastTalkedToBy,1,1,1)
				DisplayStringNoName(Player1,@1021)~ EXIT
				END
	
// Chain #1: Golem erwacht zum Leben
CHAIN IF WEIGHT #-1 ~Global("AC#MetagolemIngredients","ACIL53",5)~ THEN AC#GOLME awakening
~Ich bin erwacht! Welche erste Aufgabe gebt Ihr mir, Meister?~
== AC#53SV1 ~Es funktioniert! Bevor ich Euch mit einer ersten Aufgabe betraue, lasst mich Euch zunächst testen.~
== AC#GOLME ~Ich beantworte all Eure Fragen, Meister!~
== AC#53SV1 ~Hmm... bei der ganzen Aufregung fällt mir jetzt spontan gar keine Frage ein...~
== AC#GOLME ~Ihr könntet mir beispielsweise eine Rechenaufgabe stellen, für die Ihr normalerweise einen Rechenschieber benötigen würdet.~
END
IF ~~ THEN EXTERN ~AC#53SV1~ first_task_metagolem

// old - metagolem runestone
// Chain #2: Golem bekommt Auftrag
/*
CHAIN IF ~~ THEN AC#53SV1 chain_metagolem_barakuir
~Ja, richtig! Golem, sucht für mich all die Runentafeln heraus, die über einen Weg nach Barakuir berichten!~
== AC#GOLME ~Euer Wille ist mir Befehl, Meister! Soll ich nur die Runentafeln oder auch die Inschriften im inneren Rundkreis der Bibliothek nach Einträgen absuchen?~
== AC#53SV1 ~Sucht nach allem, was Ihr finden könnt, und kehrt danach zu mir zurück!~
== AC#GOLME ~Wie Ihr wünscht, Meister.~
END
IF ~~ THEN EXTERN ~AC#53SV1~ task_metagolem_finished

CHAIN IF WEIGHT #-1 ~NumTimesTalkedTo(0)~ THEN AC#GOLM2 found_book
~Ich habe die Runentafeln zu Barakuir gefunden, Meister.~
== AC#53SV1 ~So schnell? Dieser Golem ist ja wirklich ein Glücksgriff.~
== AC#GOLM2 ~Die Aufzeichnung, die Ihr suchtet, befand sich im fünfundzwanzigsten Stockwerk der Bibliothek. Hier ist die Tafel.~
END
IF ~~ THEN EXTERN ~AC#53SV1~ metagolem_take_runestone
*/

// Various priests of Dugmaren
BEGIN ~AC#IL53S~ 
IF ~RandomNum(10,1)~ THEN BEGIN 1
  SAY ~Willkommen in den Hallen des Wissens, wo die Geheimnisse des Dugmaren zwischen den Seiten der Zeit ruhen.~
IF ~~ THEN EXIT
END

IF ~RandomNum(10,2)~ THEN BEGIN 2
  SAY ~Tretet näher, Suchende. Hier, unter den alten Schriften, finden wir Erleuchtung.~
IF ~~ THEN EXIT
END

IF ~RandomNum(10,3)~ THEN BEGIN 3
  SAY ~Die Antworten, die Ihr sucht, sind vielleicht nur ein Buch entfernt.~
IF ~~ THEN EXIT
END

IF ~RandomNum(10,4)~ THEN BEGIN 4
  SAY ~Jedes Buch hier ist ein Fenster in eine andere Welt, geöffnet durch Weisheit.~
IF ~~ THEN EXIT
END

IF ~RandomNum(10,5)~ THEN BEGIN 5
  SAY ~In der Stille dieser heiligen Hallen spricht Dugmaren zu jenen, die zuhören.~
IF ~~ THEN EXIT
END

IF ~RandomNum(10,6)~ THEN BEGIN 6
  SAY ~Wahres Wissen ist ein Licht, das selbst im Dunkelsten Unterreich nicht erlischt.~
IF ~~ THEN EXIT
END

IF ~RandomNum(10,7)~ THEN BEGIN 7
  SAY ~Geduld und Neugier sind die Schlüssel, die jedes Schloss der Gelehrsamkeit öffnen.~
IF ~~ THEN EXIT
END

IF ~RandomNum(10,8)~ THEN BEGIN 8
  SAY ~Ein wahrer Schüler von Dugmaren sammelt Wissen wie ein Zwerg Edelsteine.~
IF ~~ THEN EXIT
END

IF ~RandomNum(10,9)~ THEN BEGIN 9
  SAY ~Bücher sind die treuesten Freunde; sie verraten ihre Geheimnisse nur den Würdigen.~
IF ~~ THEN EXIT
END

IF ~RandomNum(10,10)~ THEN BEGIN 10
  SAY ~Lasst uns gemeinsam durch die Seiten der Geschichte wandeln und ihre Lektionen lernen.~
IF ~~ THEN EXIT
END

// confused priest Orik Dunkelschrift

BEGIN AC#IL53T

CHAIN IF ~True()~ THEN AC#IL53T hello_01
~Ah, seid gegrüßt! Oder... haben wir uns schon gegrüßt? Egal, egal. Mein Name ist Orik Dunkelschrift, und ich stecke in einer kleinen... nun, sagen wir, Vergesslichkeitsschleife.~
END
IF~Global("Book_Labyrinth","ACIL53",0)~THEN REPLY ~Wie kann ich Euch damit helfen?~ EXTERN AC#IL53T book_01	
IF~GlobalGT("Book_Labyrinth","ACIL53",0)~THEN REPLY ~Wegen Eures Buches...~ EXTERN AC#IL53T about_your_book	
IF~~THEN REPLY ~Ich muss weiter.~ EXTERN AC#IL53T bye

	CHAIN IF ~~ THEN AC#IL53T about_your_book
	~Oh! Ihr wisst davon?~
	END
	IF~~THEN REPLY ~Ihr habt es mir selbst erzählt.~ EXTERN AC#IL53T you_told_me	
	IF~~THEN REPLY ~Nichts für ungut. Ich gehe wieder.~ EXTERN AC#IL53T bye
	
	CHAIN IF ~~ THEN AC#IL53T you_told_me
	~Ach... Habt Ihr es zufällig gefunden?~
	END
	IF~PartyHasItem("AC#53BK3")~THEN REPLY ~Ja, hier ist es.~ EXTERN AC#IL53T yes_have_book	
	IF~~THEN REPLY ~Nein, noch nicht.~ EXTERN AC#IL53T bye_keep_searching
	
		CHAIN IF ~~ THEN AC#IL53T yes_have_book
		~Ihr seid ja fantastisch! Danke, ich nehme es gleich an mich...~
		END
		IF~Global("AC#IL53M","GLOBAL",1)~THEN REPLY ~Ihr solltet vorsichtig sein. Das Buch schickt einen beim Lesen ja in einen Irrgarten!~ EXTERN AC#IL53T book_warning_maze
		IF~~THEN REPLY ~Bitte, nehmt es.~ EXTERN AC#IL53T book_no_warning_maze
		
			CHAIN IF ~~ THEN AC#IL53T book_warning_maze
			~Aber das ist ja der Sinn der Sache! In diesem Irrgarten fühle ich mich endlich frei.~
			END
			IF~~THEN EXTERN AC#IL53T book_no_warning_maze
			
				CHAIN IF ~~ THEN AC#IL53T book_no_warning_maze
				~Habt Dank, dass Ihr mir mein Buch wiedergebracht habt! Jetzt ist alles gut...~
				END
				IF~~THEN DO ~SetGlobal("Book_Labyrinth","ACIL53",10)
				TakePartyItem("AC#53BK3")
				DestroyItem("AC#53BK3")
				StartCutSceneMode()
				CreateVisualEffectObject("SPSPMAZE",Myself)
				Wait(1)
				EndCutSceneMode()
				IncrementGlobal("AC_Iltkazar_Reputation","GLOBAL",1)
				EraseJournalEntry(@53301)
				AddJournalEntry(@53302,QUEST_DONE)
				AddexperienceParty(500)
				DisplayStringNoName(Player1,@1021)
				DestroySelf()~ EXIT
	
	CHAIN IF ~~ THEN AC#IL53T book_01
	~Ich scheine mein Buch verlegt zu haben. Es ist ein äußerst wichtiges Buch, versteht Ihr? 'Die verschlungenen Pfade des verlorenen Wissens', habt Ihr davon gehört?~
	END
	IF~~THEN REPLY ~Ich kann nicht sagen, dass mir der Titel bekannt vorkommt. Wo habt Ihr es zuletzt gesehen?~ EXTERN AC#IL53T book_02	
	IF~PartyHasItem("AC#53BK3")~THEN REPLY ~Ich glaube, ich habe es bereits bei mir.~ EXTERN AC#IL53T yes_have_book	
	IF~~THEN REPLY ~Ich muss weiter.~ EXTERN AC#IL53T bye
	
		CHAIN IF ~~ THEN AC#IL53T book_02
		~Ach, wenn ich das nur wüsste! Ich erinnere mich daran, es in der Nähe der großen Halle gehabt zu haben... oder war es in der Nähe von Borthuns Standbild? Oh, meine Erinnerung ist wie ein Sieb. Ich wäre Euch sehr verbunden, wenn Ihr nachsehen könntet. Es könnte überall sein, vielleicht sogar in den unteren Bibliotheksregalen...~
		END
		IF~~THEN REPLY ~Ich werde mein Bestes tun, um es zu finden. Gibt es besondere Erkennungszeichen am Buch?~ EXTERN AC#IL53T book_03	
		IF~~THEN REPLY ~Ich muss weiter.~ EXTERN AC#IL53T bye
		
			CHAIN IF ~~ THEN AC#IL53T book_03
			~Oh, ja, ja, natürlich! Es ist gebunden in dunkelgrünes Leder, ziemlich abgenutzt, und auf dem Deckel ist eine Silberprägung, die ein Labyrinth darstellt. Sehr passend, nicht wahr? Ich hoffe, das hilft Euch bei der Suche.~
			END
			IF~~THEN REPLY ~Ich werde mich danach umsehen. Bleibt hier, falls ich weitere Fragen habe.~ EXTERN AC#IL53T book_04	
			IF~~THEN REPLY ~Ich muss weiter.~ EXTERN AC#IL53T bye
			
				CHAIN IF ~~ THEN AC#IL53T book_04
				~Oh, das werde ich. Ich werde nirgendwo hingehen... zumindest glaube ich das. Viel Glück, und möge Dugmaren Euren Weg erhellen!~
				END
				IF~~THEN DO ~SetGlobal("Book_Labyrinth","ACIL53",1)
				AddJournalEntry(@53300,QUEST)~ EXIT

CHAIN IF ~~ THEN AC#IL53T bye_keep_searching
~Bitte sucht weiter danach!~
EXIT

CHAIN IF ~~ THEN AC#IL53T bye
~Seid stets wachsam auf den verschlungenen Pfaden des Wissens und erinnert Euch: Selbst wenn Ihr Euch verirrt, ist jeder Irrweg eine Lektion.~
EXIT	

// riddle priest Dolgrin Tiefdenker

BEGIN AC#IL53R

CHAIN IF ~Global("RiddleDwarf","ACIL53",1)~ THEN AC#IL53R hello_02
~Seid gegrüßt, junger Suchender. Denkt daran, nicht jeder Fisch beißt sofort an. Manchmal muss man geduldig warten und die Leine straff halten.~
EXIT

CHAIN IF ~True()~ THEN AC#IL53R hello_01
~Seid gegrüßt, Ehrwürdige! Sucht Ihr Weisheit hier in diesen Hallen?~
END
IF~~THEN REPLY ~Ja.~ EXTERN AC#IL53R seek_wisdom	
IF~~THEN REPLY ~Nein.~ EXTERN AC#IL53R bye

	CHAIN IF ~~ THEN AC#IL53R seek_wisdom
	~Weisheit! Wie ein schillernder Fisch in einem endlosen Meer aus Tinte. Sucht Ihr sie mit einem Netz oder einem Haken?~
	END
	IF~~THEN REPLY ~Mit einem Netz vielleicht?~ EXTERN AC#IL53R seek_wisdom_net	
	IF~~THEN REPLY ~Ich denke, ein Haken wäre besser.~ EXTERN AC#IL53R seek_wisdom_hook	
	IF~~THEN REPLY ~Ich bin mir nicht sicher, was Ihr meint.~ EXTERN AC#IL53R not_sure	
	IF~~THEN REPLY ~Weder noch. Ich gehe wieder.~ EXTERN AC#IL53R bye

	CHAIN IF ~~ THEN AC#IL53R seek_wisdom_hook
	~Ein Haken! Das spitze Werkzeug für den scharfen Geist. Mit dem Haken zieht man besondere Weisheit aus der Tiefe der Gedanken.~
	END
	IF~~THEN REPLY ~Und wie finde ich den richtigen Haken für das, was ich suche?~ EXTERN AC#IL53R seek_wisdom_hook_02	
	IF~~THEN REPLY ~Ich gehe wieder.~ EXTERN AC#IL53R bye
	
		CHAIN IF ~~ THEN AC#IL53R seek_wisdom_hook_02
		~Den richtigen Haken formt man aus der eigenen Neugier. Ihr müsst eine Frage stellen, die tief genug ist, um das Interesse der schlummernden Bücher zu wecken.~
		END
		IF~~THEN REPLY ~Ich werde es beherzigen.~ DO ~SetGlobal("RiddleDwarf","ACIL53",1)~ EXTERN AC#IL53R bye
	
	CHAIN IF ~~ THEN AC#IL53R seek_wisdom_net
	~Ein Netz, ja! Um viele Gedanken auf einmal zu fangen. Doch Vorsicht, nicht jedes Buch beißt an. Manche müssen gelockt werden.~
	END
	IF~~THEN REPLY ~Und wie locke ich ein Buch?~ EXTERN AC#IL53R seek_wisdom_net_02	
	IF~~THEN REPLY ~Ich gehe wieder.~ EXTERN AC#IL53R bye
	
		CHAIN IF ~~ THEN AC#IL53R seek_wisdom_net_02
		~Mit Neugier, junger Wanderer! Stellt die richtigem Fragen, und die Seiten werden sich schneller öffnen als ein Bierfass beim Fest.~
		END
		IF~~THEN REPLY ~Ich werde es beherzigen.~ DO ~SetGlobal("RiddleDwarf","ACIL53",1)~ EXTERN AC#IL53R bye
	
	CHAIN IF ~~ THEN AC#IL53R not_sure
	~Ihr geht auf Suche, ohne zu wissen, was Ihr finden wollt? Dann habe ich keinen Rat für Euch.~
	EXIT

CHAIN IF ~~ THEN AC#IL53R bye
~Denkt immer daran, dass der größte Schatz oft hinter dem seltsamsten Gedanken verborgen liegt. Frohes Suchen!~
EXIT	

// Closeviewer dwarf Nurin Klarblick

BEGIN AC#IL53F

CHAIN IF ~NumTimesTalkedToGT(0)~ THEN AC#IL53F hello_02
~Seid erneut gegrüßt! Wollt Ihr erneut meinen 'Nahseher' bewundern?~
END 
IF~~THEN REPLY ~Ja, erzählt mir mehr.~ EXTERN AC#IL53F Closeviewer_01	
IF~~THEN REPLY ~Kein Interesse.~ EXTERN AC#IL53F bye

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#IL53F hello_01
~Seid gegrüßt! Ihr habt sicher schon von meinem neuesten Meisterwerk gehört, oder? Nein? Unmöglich! Es ist der 'Nahseher' – eine Wundererfindung, die den fernen Höhlenhorizont direkt vor Eure Nasenspitze holt!~
END
IF~~THEN REPLY ~Der Nahseher? Das klingt interessant.~ EXTERN AC#IL53F Closeviewer_01	
IF~~THEN REPLY ~Kein Interesse.~ EXTERN AC#IL53F bye

	CHAIN IF ~~ THEN AC#IL53F Closeviewer_01
	~Oh, es ist eine einfache, aber geniale Konstruktion! Seht, ich habe Linsen aus den feinsten Kristallen der tiefen Minen geschliffen und sie in dieses Rohr hier eingefügt. Durch eine sorgfältige Anordnung dieser Linsen kann man Dinge sehen, die viele Felslängen entfernt sind, als wären sie zum Greifen nah!~
	END
	IF~~THEN REPLY ~Was bringt Euch dazu, ein solches Gerät zu entwickeln?~ EXTERN AC#IL53F Closeviewer_02	
	IF~~THEN REPLY ~Ich muss mich verabschieden.~ EXTERN AC#IL53F bye
	
		CHAIN IF ~~ THEN AC#IL53F Closeviewer_02
		~Nun, der Gedanke kam mir eines Tages, als ich durch die weitläufigen Tunnel unseres Reichs wanderte und in die Tiefen unserer Hallen blickte. Ich dachte bei mir, wie wunderbar es wäre, wenn wir Zwerge die verborgenen Winkel und geheimen Kammern so klar sehen könnten, wie wir unsere geschätzten Erze betrachten. Und so wurde der 'Nahseher' geboren!~
		END
		IF~~THEN REPLY ~Ich muss mich verabschieden.~ EXTERN AC#IL53F bye

CHAIN IF ~~ THEN AC#IL53F bye
~Nun denn, mögen Eure Wege unter und über der Erde sicher sein. Und vergesst nicht, Euren Blick auch immer einmal wieder in die Ferne schweifen zu lassen, egal wie verzweigt der Tunnel sein mag!~
EXIT

// archimedes dwarf Grumnir Strudelbart

BEGIN AC#IL53G

CHAIN IF ~NumTimesTalkedToGT(0)~ THEN AC#IL53G hello_02
~Seid erneut gegrüßt! Na, wollt Ihr Euch ein wenig die Stiefel nass machen? Kommt und seht meinen 'Wasserwirbler'!~
END 
IF~~THEN REPLY ~Erklärt mir, was das soll.~ EXTERN AC#IL53G waterlifter_01	
IF~~THEN REPLY ~Kein Interesse.~ EXTERN AC#IL53G bye

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#IL53G hello_01
~Oh, Ihr kommt gerade rechtzeitig, um Zeuge meiner neuesten Errungenschaft in der Kunst des Wasserhebens zu werden.~
END
IF~~THEN REPLY ~Das klingt interessant. Was habt Ihr da genau entwickelt?~ EXTERN AC#IL53G waterlifter_01	
IF~~THEN REPLY ~Kein Interesse.~ EXTERN AC#IL53G bye

	CHAIN IF ~~ THEN AC#IL53G waterlifter_01
	~Ich habe ein Gerät konstruiert, das Wasser auf wundersame Weise in die Höhe befördert, ähnlich wie ein großer Löffel, der unaufhörlich durch einen Topf voll Wasser rührt. Ich nenne es den 'Wasserwirbler'!~
	END
	IF~~THEN REPLY ~Wie funktioniert das genau?~ EXTERN AC#IL53G waterlifter_02	
	IF~~THEN REPLY ~Ich muss mich verabschieden.~ EXTERN AC#IL53G bye
	
		CHAIN IF ~~ THEN AC#IL53G waterlifter_02
		~Stellt Euch vor, ein spiralförmiges Rohr, das sich wie die Schnecken in unseren Minen windet. Das untere Ende taucht ins Wasser, und wenn man es dreht, klettert das Wasser die Spirale hinauf, ganz ohne Zauberei! Nur reine, ehrliche Mechanik.~
		END
		IF~~THEN REPLY ~Das klingt wie eine nützliche Erfindung. Wofür verwendet Ihr sie?~ EXTERN AC#IL53G waterlifter_03	
		IF~~THEN REPLY ~Ich muss mich verabschieden.~ EXTERN AC#IL53G bye
		
		CHAIN IF ~~ THEN AC#IL53G waterlifter_03
		~Ach, sie ist für alles Mögliche nützlich! Vom Bewässern unserer pilzigen Gärten bis hin zum schnellen Entleeren überfluteter Stollen. Kein Zwerg muss mehr mit Eimer und Kelle bewaffnet tief in die Erde steigen.~
		END
		IF~~THEN REPLY ~Ich bin beeindruckt, Grumnir.~ EXTERN AC#IL53G waterlifter_04	
		IF~~THEN REPLY ~Ich muss mich verabschieden.~ EXTERN AC#IL53G bye
		
			CHAIN IF ~~ THEN AC#IL53G waterlifter_04
			~Ich bin gerade dabei, noch die Drehgeschwindigkeit genauer zu justieren – manchmal übertreibt es die Schnecke und verwandelt alles in einen kleinen See. So ist das Leben eines Erfinders – manchmal feucht, aber immer erfüllend!~
			EXIT

CHAIN IF ~~ THEN AC#IL53G bye
~Nun denn, mögen Eure Wege unter und über der Erde sicher sein. Und vergesst nicht, Euren Blick auch immer einmal wieder in die Ferne schweifen zu lassen, egal wie verzweigt der Tunnel sein mag!~
EXIT

// Scheinwerfer dwarf Borin Glimmlicht

BEGIN AC#IL53L

CHAIN IF ~NumTimesTalkedToGT(0)~ THEN AC#IL53L hello_02
~He, Ihr! Wollt wohl meine neueste Erfindung bestaunen? Ich nenne sie den 'Lichtfänger'.~
END 
IF~~THEN REPLY ~Erklärt mir, was das soll.~ EXTERN AC#IL53L waterlifter_01	
IF~~THEN REPLY ~Kein Interesse.~ EXTERN AC#IL53L bye

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#IL53L hello_01
~He, Ihr! Wollt wohl meine neueste Erfindung bestaunen? Ich nenne sie den 'Lichtfänger'.~
END
IF~~THEN REPLY ~Das klingt interessant. Was habt Ihr da genau entwickelt?~ EXTERN AC#IL53L waterlifter_01	
IF~~THEN REPLY ~Kein Interesse.~ EXTERN AC#IL53L bye

	CHAIN IF ~~ THEN AC#IL53L waterlifter_01
	~Der 'Lichtfänger' ist ein großartiges Werkzeug, um Licht auf dunkle Orte zu werfen, wo es sonst schwer hinkommt. Es nutzt einen polierten Metallspiegel, in dessen Mitte man eine Kerze stellt. Das Licht der Kerze wird reflektiert und konzentriert, so dass es weit und präzise strahlt.~
	END
	IF~~THEN REPLY ~Das klingt zur Abwechslung ganz nützlich.~ EXTERN AC#IL53L waterlifter_02	
	IF~~THEN REPLY ~Ich muss mich verabschieden.~ EXTERN AC#IL53L bye
	
		CHAIN IF ~~ THEN AC#IL53L waterlifter_02
		~Die Idee kam mir, als ich durch unsere dunkelsten Minen wanderte und sah, wie schwierig es war, in gewisse Ecken Licht zu bringen. Mit dem 'Lichtfänger' können wir nun in jede noch so finstere Ecke leuchten. Und es ist hervorragend dazu geeignet, Drow zu blenden.~
		END
		IF~~THEN REPLY ~Ich muss mich verabschieden.~ EXTERN AC#IL53L bye

CHAIN IF ~~ THEN AC#IL53L bye
~Passt gut auf Euch auf und vergesst nicht: Selbst das kleinste Licht kann die tiefsten Schatten vertreiben.~
EXIT

// Astrolabium dwarf Durik Ebenenwirker

BEGIN AC#IL53E

CHAIN IF ~NumTimesTalkedToGT(0)~ THEN AC#IL53E hello_02
~Seid gegrüßt, werte Oberflächler! Wollt Ihr erneut die Geheimnisse des Multiversums entdecken?~
END 
IF~~THEN REPLY ~Gerne! Zeigt es mir.~ EXTERN AC#IL53E waterlifter_01	
IF~~THEN REPLY ~Kein Interesse.~ EXTERN AC#IL53E bye

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#IL53E hello_01
~Seid gegrüßt, werte Oberflächler! Ihr seht aus, als könntet Ihr ein wenig kosmische Weisheit vertragen. Wollt Ihr die Geheimnisse des Multiversums entdecken?~
END
IF~~THEN REPLY ~Kosmische Weisheit? Das klingt interessant. Was habt Ihr denn da?~ EXTERN AC#IL53E waterlifter_01	
IF~~THEN REPLY ~Kein Interesse.~ EXTERN AC#IL53E bye

	CHAIN IF ~~ THEN AC#IL53E waterlifter_01
	~Ich präsentiere Euch den Ebenenglobus, meine jüngste Erfindung, der das Muster der Existenzebenen – von den inneren Ebenen wie Feuer und Wasser bis zu den äußeren Ebenen wie Mechanus und Elysium – in einem einzigen, dreh- und verstehbaren Modell darstellt.~
	END
	IF~~THEN REPLY ~Wie funktioniert das Gerät?~ EXTERN AC#IL53E waterlifter_02	
	IF~~THEN REPLY ~Ich muss mich verabschieden.~ EXTERN AC#IL53E bye
	
		CHAIN IF ~~ THEN AC#IL53E waterlifter_02
		~Nun, es verwendet eine Serie von ineinandergreifenden Ringen und Scheiben, die sich in harmonischer Präzision drehen. Jeder Ring repräsentiert eine Ebene, und zusammen zeigen sie die Verbindungen und Beziehungen zwischen den Ebenen auf. Ein echtes Wunderwerk zwergischer Handwerkskunst und arkanen Wissens!~
		= ~Lasst uns die Ringe in Bewegung setzen. Beobachtet, wie die Ebenen sich entfalten und das Multiversum sich vor Euren Augen öffnet. Es ist, als würde man durch ein Fenster in die Unendlichkeit blicken.~
		END
		IF~~THEN REPLY ~Habt Ihr eine der dargestellten Ebenen bereits besucht?~ EXTERN AC#IL53E traveled_planes
		IF~~THEN REPLY ~Ich muss mich verabschieden.~ EXTERN AC#IL53E bye
		
			CHAIN IF ~~ THEN AC#IL53E traveled_planes
			~Oh, nein, nein, das wäre viel zu gewagt für einen alten Zwerg wie mich! Ich habe die Ebenen nur durch die Seiten alter Bücher und Schriftrollen bereist. Es ist sicherer, und ehrlich gesagt, ich ziehe es vor, meine Erkundungen vom Komfort meines Werkstattstuhls aus zu machen. Das wirkliche Reisen überlasse ich mutigeren Seelen – oder den Jüngeren. Meine Aufgabe ist es, zu verstehen und darzustellen, nicht zu besuchen. Der Ebenenglobus ermöglicht mir, die Schönheit und Komplexität aller Ebenen zu erfassen, ohne je meinen Fuß vor die Tür zu setzen!~
			END
			IF~~THEN REPLY ~Ich muss mich verabschieden.~ EXTERN AC#IL53E bye

CHAIN IF ~~ THEN AC#IL53E bye
~Mögen die Wege der Ebenen Euch stets klare Einsichten bieten und Eure Neugier nie erlöschen. Reist sicher, und haltet die Augen offen für die Wunder des Kosmos.~
EXIT
