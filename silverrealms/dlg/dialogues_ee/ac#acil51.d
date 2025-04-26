// ---------------------------------------------
// Dialog Anthan Diamondblade
// ---------------------------------------------

BEGIN ~AC#ANT01~

	IF ~GlobalGT("AC#CondolenceAnthan","GLOBAL",1)~ THEN BEGIN hello_what_else
	  SAY ~Wollt Ihr noch etwas?~ 
	  IF ~Global("AC#Clans_Parting","GLOBAL",2)~ THEN REPLY ~Ich würde gerne einen Blick in das Tagebuch Eures Ahnen Borthun werfen.~ GOTO take_a_look_at_borthuns_book
	  IF ~~ THEN REPLY ~Nein, nichts mehr.~ GOTO no_nothing_else
	  IF ~OR(2)
	  Dead("AC#CHARV")
	  Dead("AC#CHARR")
	  Global("AC#AnthanDragon","GLOBAL",0)~ THEN REPLY ~Ich habe den Drachen getötet.~ + killed_dragon
	END
	
		IF ~~ THEN BEGIN killed_dragon
		SAY ~Ihr habt was? Ihr habt wirklich den Drachen erschlagen, der meinen Sohn ermordet hatte?~
		IF ~~ THEN REPLY ~Ja. Mit meinen eigenen Händen. Und vielleicht etwas Magie.~ GOTO killed_dragon_02 
		END
		
			IF ~~ THEN BEGIN killed_dragon_02
			SAY ~Ich bin nicht imstande auszudrücken, wie sehr diese Nachricht mein Vaterherz mit Freude erfüllt, <CHARNAME>!~
			IF ~~ THEN GOTO killed_dragon_03 
			END
			
				IF ~~ THEN BEGIN killed_dragon_03
				SAY ~Nun kann ich wieder besser ruhen. Gleiches wurde mit Gleichem vergolten. Eines Tages werde ich meinen Sohn in der Seelenschmiede wiedersehen! Von jetzt an werde ich ihm wieder in die Augen schauen können. Habt Dank dafür! Und nun entschuldigt mich, ich muss einige stille Worte an den Allvater richten. Möge der Erbauer der Zwerge Euch für diese gute Tat segnen!~
				IF ~~ THEN DO ~SetGlobal("AC#AnthanDragon","GLOBAL",1)
				EraseJournalEntry(@51100)~ EXIT 
				END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_firsttime_late
  SAY ~Ihr seid der <PRO_RACE> von der Oberfläche, der meinen Sohn getroffen hat, bevor er starb. Ihr kommt reichlich spät, um mir von seinem Tod zu berichten.~
  IF ~~ THEN REPLY ~Das tut mir wirklich sehr leid.~ GOTO im_sorry
  IF ~~ THEN REPLY ~Ich bin so schnell gekommen wir ich konnte.~ GOTO im_sorry
  IF ~~ THEN REPLY ~Ich hatte vorher einfach nicht die Zeit.~ GOTO no_time
END

	IF ~~ THEN BEGIN no_time
	  SAY ~Nicht die Zeit? Das wäre ja wohl das Mindeste gewesen, einen Vater vom Tode seines Sohnes zu unterrichten!~ 
	  IF ~~ THEN REPLY ~Ich hatte gehört, Ihr standed Euch ohnehin nicht mehr sehr nahe.~ GOTO didnt_like_your_son
	  IF ~~ THEN REPLY ~Im Nachhinein betrachtet ja, tut mir leid.~ GOTO im_sorry
	END
	
		IF ~~ THEN BEGIN didnt_like_your_son
		SAY ~Das ist richtig. Er hat die alten Wege verlassen und den Preis dafür gezahlt.~
		IF ~~ THEN GOTO im_sorry
		END
	
		IF ~~ THEN BEGIN im_sorry
		SAY ~Nun, davon wird er jetzt auch nicht mehr lebendig. Sagt mir wenigstens Eines: Ist er als Held oder als Feigling gestorben?~ 
		IF ~~ THEN REPLY ~Als Held.~ GOTO died_as_hero
		IF ~~ THEN REPLY ~Als Feigling.~ GOTO died_as_coward
		IF ~~ THEN REPLY ~Was spielt denn das für eine Rolle?~ GOTO why_matter
		END
		
			IF ~~ THEN BEGIN why_matter
			SAY ~Es spielt eine Rolle für die Ehre des Clans, dem ich schon ein Leben lang vorstehe! So antwortet mir: Starb er als Held oder als Feigling?~ 
			IF ~~ THEN REPLY ~Als Held.~ DO ~EraseJournalEntry(@51200) AddJournalEntry(@51201,QUEST_DONE)~ GOTO died_as_hero
			IF ~~ THEN REPLY ~Als Feigling.~ DO ~EraseJournalEntry(@51200) AddJournalEntry(@51201,QUEST_DONE)~ GOTO died_as_coward
			END
		
			IF ~~ THEN BEGIN died_as_coward
			SAY ~Das habe ich mir schon gedacht. So ergeht es einem, der nicht auf die Regeln seiner Rasse hört!~
			IF ~~ THEN REPLY ~Er begegnete einem roten Drachen, überließ aber mir das Kämpfen.~ GOTO coward_fighting_a_dragon
			END
			
				IF ~~ THEN BEGIN coward_fighting_a_dragon
				SAY ~So blieb ihm denn auch ein anständiges Begräbnis verwehrt. Habt Dank, dass Ihr mich über die Umstände seines Todes unterrichtet habt, auch wenn dies für mich keine guten Neuigkeiten waren und ich nichts anderes erwartet hatte.~
				IF ~~ THEN REPLY ~Gerne geschehen.~ DO ~SetGlobal("AC#CondolenceAnthan","GLOBAL",2)~ GOTO what_else
				END
		
			IF ~~ THEN BEGIN died_as_hero
			SAY ~Als Held? Das kann ich kaum glauben. Aber es würde mein Vaterherz mit Freude füllen, wenn Ihr denn die Wahrheit sprächet.~
			IF ~~ THEN REPLY ~Er fiel im Kampf gegen einen roten Drachen.~ GOTO died_fighting_a_dragon
			END
			
				IF ~~ THEN BEGIN died_fighting_a_dragon
				SAY ~Gegen einen *durgarn*? *Mein* Beldas hat gegen einen *bardurgarn* gekämpft?~
				IF ~~ THEN REPLY ~Ja, in einem alten zwergischen Wachposten an der Oberfläche, oben auf einer Bergspitze. Er hat dort im Rahmen seiner Ahnen seine letzte Ruhe gefunden.~ DO ~SetGlobal("AC#CondolenceAnthan","GLOBAL",2)
				SetGlobal("AC#AnthanBeldasTruth","GLOBAL",1)~ GOTO died_fighting_a_dragon_02
				END
				
					IF ~~ THEN BEGIN died_fighting_a_dragon_02
					SAY ~So hat er also doch noch seinem Clan zur Ehre gereicht. Nun, da ich weiß, dass mein Sohn als Held gestorben ist, kann ich wieder ruhiger schlafen. Habt Dank, Ihr habt einem alten Zwerg sehr geholfen.~
					IF ~~ THEN REPLY ~Gerne geschehen.~ GOTO what_else
					END
					
	IF ~~ THEN BEGIN what_else
	  SAY ~Ihr seht so aus, als wolltet Ihr sonst noch etwas von mir.~ 
	  IF ~Global("AC#Clans_Parting","GLOBAL",2)~ THEN REPLY ~Ich würde gerne einen Blick in das Tagebuch Eures Ahnen Borthun werfen.~ GOTO take_a_look_at_borthuns_book
	  IF ~~ THEN REPLY ~Nein, nichts mehr.~ GOTO no_nothing_else
	END

			IF ~~ THEN BEGIN take_a_look_at_borthuns_book
			SAY ~Was? Auf keinen Fall! Diese verfluchte Buch hat jedem, der es bisher gelesen hat, nichts als Pech und Verderben gebracht.~
			IF ~~ THEN REPLY ~Was soll das bedeuten?~ GOTO book_nothing_but_bad_luck
			END
			
				IF ~~ THEN BEGIN book_nothing_but_bad_luck
				SAY ~Mein Urahn Borthun ist nie ins Unterreich zurückgekehrt, nachdem er das Buch geschrieben hatte. König Mith Barak erwachte nicht mehr aus seinem Schlaf, als er einen Blick darauf warf. Und mein Sohn Beldas hat auf der Oberfläche einen garstigen Tod gefunden. Alles nur, nachdem sie in dieses verfluchte Buch geschaut haben! Dies ist ein Zeichen, dass wir Zwerge nichts mit der Oberfläche zu schaffen haben sollten. Unsere Götter schätzen es nicht, wenn wir unter der Sonne wandeln, anstelle unserer Aufgabe in den Tiefen der Berge nachzukommen. Borthuns, Beldas' und letztendlich Mith Baraks Schicksal ist eine Strafe für ihren *mulg*, zu meinen, wir hätten an der Oberfläche etwas zu schaffen.~
				IF ~~ THEN REPLY ~Ich glaube nicht, dass das stimmt.~ GOTO show_me_the_book
				IF ~~ THEN REPLY ~Das mag stimmen, doch ich bin kein Zwerg des Unterreiches. Deshalb könntet Ihr mich ja gefahrlos einen Blick in das Buch werfen lassen.~ GOTO show_me_the_book
				END	
				
					IF ~~ THEN BEGIN show_me_the_book
					SAY ~Nur, damit Ihr es allen herumerzählt? Nein, damit könntet Ihr die Stadt noch mehr ins Verderben stürzen.~
					IF ~~ THEN REPLY ~Vielleicht wäre es aber auch eine Möglichkeit für Euch, dieses Buch loszuwerden  - indem Ihr es mir geben würdet und ich es an die Oberfläche bringe.~ GOTO show_me_the_book_02
					END
					
						IF ~~ THEN BEGIN show_me_the_book_02
						SAY ~Wozu? Hier in der Schmiede ist es doch mehr als sicher verwahrt.~
						IF ~~ THEN REPLY ~Denkt Ihr nicht, dass es jetzt, da klar ist, dass auch Beldas darin gelesen hat, einen noch größeren Reiz auf weitere Zwerge ausüben könnte, darin zu lesen?~ GOTO show_me_the_book_03
						END
						
							IF ~~ THEN BEGIN show_me_the_book_03
							SAY ~Hmm... He, Ihr seid ja zäher als ein *kuldar*! Nun gut, Ihr mögt vielleicht Recht haben.~
							IF ~~ THEN REPLY ~Ich möchte wirklich nur das Beste für Euer Volk, Anthan.~ GOTO give_me_the_book_01
							IF ~~ THEN REPLY ~Natürlich habe ich das. Wäret Ihr jetzt so freundlich, mir das Buch zu geben?~ GOTO give_me_the_book_01
							END
							
								IF ~~ THEN BEGIN give_me_the_book_01
								SAY ~Na schön. Macht damit, was Ihr wollt. Und wenn es Euch kein Glück bringt, behauptet nicht, ich hätte Euch nicht gewarnt!~
								IF ~~ THEN DO ~GiveItemCreate("AC#BOOKB",Player1,1,0,0)~ GOTO have_the_book_01
								END
							
									IF ~~ THEN BEGIN have_the_book_01
									SAY ~Eigentlich bin ich auch ganz froh, dass ich dieses Ding los bin.~
									IF ~~ THEN REPLY ~Ihr habt es die ganze Zeit bei Euch getragen?~ GOTO have_the_book_02
									END
									
										IF ~~ THEN BEGIN have_the_book_02
										SAY ~Natürlich. Nachdem mein eigener Sohn hinter meinem Rücken herumgeschnüffelt hatte, habe ich es lieber an mich genommen. Jetzt tragt Ihr die Verantwortung dafür, <PRO_RACE>! Geht mit dieser Verantwortung weise um.~
										IF ~~ THEN DO ~EraseJournalEntry(@64102)
										//AddJournalEntry(@64103,QUEST)
										//SetGlobal("AC#Clans_Parting","GLOBAL",3)
										SetGlobal("AC#Clans_Parting","GLOBAL",4)
										//EraseJournalEntry(@64103)
										AddJournalEntry(@64104,QUEST)
										RevealAreaOnMap("ACIL70")~ EXIT
										END

	IF ~~ THEN BEGIN no_nothing_else 
	SAY ~Möge der Erbauer über Euch wachen. Und über meinen toten Sohn!~
	IF ~~ THEN EXIT
	END	


// ---------------------------------------------
// Seelenschmied Vichorn Goldhammer
// ---------------------------------------------

BEGIN ~AC#51PR1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_firsttime
  SAY ~Seid gegrüßt, <RACE>. Ich bin Seelenschmied Vichorn Goldhammer, einer der Sonnlinnor, Priester des Moradin. Benötigt Ihr die Hilfe des Seelenschmiedes?~
  IF ~~ THEN REPLY #32297 /* ~Das tue ich.~ */ DO ~StartStore("AC#51MOR",LastTalkedToBy())~ EXIT
  IF ~~ THEN REPLY ~Ich würde Euch gerne einige Fragen stellen.~ GOTO question
  IF ~~ THEN REPLY #32298 /* ~Zur Zeit nicht.~ */ GOTO 1
END

IF ~True()~ THEN BEGIN hello_again
  SAY ~Seid gegrüßt, <RACE>. Benbötigt Ihr wieder die Hilfe des Seelenschmiedes?~
  IF ~~ THEN REPLY #32297 /* ~Das tue ich.~ */ DO ~StartStore("AC#51MOR",LastTalkedToBy())~ EXIT
  IF ~~ THEN REPLY ~Ich würde Euch gerne einige Fragen stellen.~ GOTO question
  IF ~~ THEN REPLY #32298 /* ~Zur Zeit nicht.~ */ GOTO 1
END

IF ~~ THEN BEGIN 1 // from: 0.1
  SAY ~Möge der Erbauer über Euch wachen.~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN question
  SAY ~Wie kann ich Euch als treuer Diener des Allvaters behilflich sein?~
  IF ~~ THEN REPLY ~Ich benötige die Hilfe Eures Tempels und würde gerne Eure Dienste in Anspruch nehmen.~ GOTO shop
  IF ~~ THEN REPLY ~Erzählt mir über Moradin.~ GOTO moradin_1
  IF ~~ THEN REPLY ~Vielleicht ein andermal. Lebt wohl.~ GOTO 1
END

IF ~~ THEN BEGIN shop
  SAY ~Natürlich, dafür sind wir da. Lasst Moradin Euer Herz mit goldenem Glanz erstrahlen.~
  IF ~~ THEN DO ~StartStore("AC#51MOR",LastTalkedToBy())~ EXIT
END

IF ~~ THEN BEGIN moradin_1
  SAY ~Moradin ist der Erschaffer der Zwerge. In grauer Vorzeit formte er in seiner Schmiede den ersten Zwerg aus einem Stück Metall und hauchte ihm beim Abkühlen der noch glühenden Form mit seinem Atem Leben ein. Deshalb nennen wir Moradin auch den Allvater.~
  IF ~~ THEN REPLY ~Interessant. Ich habe noch eine weitere Frage.~ GOTO question
END

// ---------------------------------------------
// Heiliges Herz Miira Diamantklinge
// ---------------------------------------------

BEGIN ~AC#51PR2~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_firsttime
  SAY ~Seid gegrüßt, <PRO_RACE>. Ich bin Heiliges Herz Miira Diamantklinge, Priesterin der verehrten Mutter Berronar Wahrsilber. Und die trauernde Mutter von Beldas, meinem einzigen Sohn. Was für ein grausames Schicksal, das einzige Kind verlieren zu müssen! Er war ein guter Junge. Ihr seid der Oberflächen-<PRO_RACE>, welcher ihn in den letzten Stunden seines Lebens begleitet hat. Ich hoffe, er ruht in Frieden an einem sicheren Ort.~
  IF ~~ THEN REPLY ~Er ruht auf einem Berggipfel inmitten seiner Ahnen, ja.~ GOTO beldas_rip_01
  IF ~~ THEN REPLY ~Sein Ende war so heroisch, wie man es von jemandem erwarten könnte, der sich offensichtlich gerne in Gefahr begibt.~ GOTO beldas_rip_02
  IF ~~ THEN REPLY ~Das Leben an der Oberfläche ist hart und nicht jeder ist dafür gemacht, es bis zum Ende durchzustehen.~ GOTO beldas_rip_03
END

	IF ~~ THEN BEGIN beldas_rip_01
	SAY ~Es bedeutet mir sehr viel, dass Ihr das sagt. Es war immer sein Traum, die Oberfläche und den Himmel sehen zu können. Dass er nun dort seinen Frieden gefunden hat, schenkt mir ein wenig Ruhe. Doch Ihr seid sicher nicht hergekommen, um einer trauernden Mutter Trost zu schenken. Dies hätte mein Sohn auch nie gewollt. Benötigt Ihr die heilende Hand der Mutter der Wahrheit und des Heims?~
	IF ~~ THEN REPLY #32297 /* ~Das tue ich.~ */ GOTO shop
	IF ~~ THEN REPLY ~Ich würde Euch gerne einige Fragen stellen.~ GOTO question
	IF ~~ THEN REPLY #32298 /* ~Zur Zeit nicht.~ */ GOTO 1
	END
	
	IF ~~ THEN BEGIN beldas_rip_02
	SAY ~In Gefahr begeben hat er sich gerne, das stimmt. Ich zweifle daran, ihm das Richtige beigebracht zu haben. Dies ist nun leider nicht mehr zu ändern - mit dieser Schuld muss ich den Rest meiner Tage in Zweifel verbringen. Doch Ihr seid sicher nicht hergekommen, um einer trauernden Mutter Trost zu schenken. Dies hätte mein Sohn auch nie gewollt. Benötigt Ihr die heilende Hand der Mutter der Wahrheit und des Heims?~
	IF ~~ THEN REPLY #32297 /* ~Das tue ich.~ */ GOTO shop
	IF ~~ THEN REPLY ~Ich würde Euch gerne einige Fragen stellen.~ GOTO question
	IF ~~ THEN REPLY #32298 /* ~Zur Zeit nicht.~ */ GOTO 1
	END
	
	IF ~~ THEN BEGIN beldas_rip_03
	SAY ~Diese Worte könnten von meinem *dornar* stammen. Es sind Worte wie diese, die meinen Sohn dazu getrieben haben, immer weiter vorwärts zu drängen. Doch Ihr seid sicher nicht hergekommen, um einer trauernden Mutter Trost zu schenken. Dies hätte mein Sohn auch nie gewollt. Benötigt Ihr die heilende Hand der Mutter der Wahrheit und des Heims?~
	IF ~~ THEN REPLY #32297 /* ~Das tue ich.~ */ GOTO shop
	IF ~~ THEN REPLY ~Ich würde Euch gerne einige Fragen stellen.~ GOTO question
	IF ~~ THEN REPLY #32298 /* ~Zur Zeit nicht.~ */ GOTO 1
	END

IF ~True()~ THEN BEGIN hello_again
  SAY ~Seid willkomen. Benötigt Ihr wieder die heilende Hand der Muttergöttin?~
  IF ~~ THEN REPLY #32297 /* ~Das tue ich.~ */ GOTO shop
  IF ~~ THEN REPLY ~Ich würde Euch gerne einige Fragen stellen.~ GOTO question
  IF ~~ THEN REPLY #32298 /* ~Zur Zeit nicht.~ */ GOTO 1
END

IF ~~ THEN BEGIN 1 // from: 0.1
  SAY ~Möge der Erbauer über Euch wachen.~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN question
  SAY ~Ihr wollt reden? Nur zu. Die Mutter von Heim und Herd hört Euch durch mich gerne zu.~
  IF ~~ THEN REPLY ~Ich benötige die Hilfe Eures Tempels und würde gerne Eure Dienste in Anspruch nehmen.~ GOTO shop
  IF ~~ THEN REPLY ~Ich möchte mehr über Berronar erfahren.~ GOTO berronar_1
  IF ~~ THEN REPLY ~Vielleicht ein andermal. Lebt wohl.~ GOTO 1
END

IF ~~ THEN BEGIN shop
  SAY ~Gerne. Berronar ist eine gütige und sorgende Mutter und unterstützt Euch jederzeit gerne, wenn Ihr Hilfe benötigt.~
  IF ~~ THEN DO ~StartStore("AC#51BER",LastTalkedToBy())~ EXIT
END

IF ~~ THEN BEGIN berronar_1
  SAY ~Berronar Wahrsilber ist die Frau Moradins des Allvaters und die Beschützerin des Heims. Sie ist die Schutzpatronin von Liebe und Hochzeit und die Göttin der Heilung. Jeder Zwerg, der ein Heim und seine Familie in Ehren hält, wendet sich in seinen Gebeten und Bitten an die Verehrte Mutter.~
  IF ~~ THEN REPLY ~Interessant. Ich habe noch eine weitere Frage.~ GOTO question
END

// ---------------------------------------------
// Künstler der Schmiede
// ---------------------------------------------

BEGIN ~AC#51DW3~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_firsttime
  SAY ~Stört mich nicht bei meiner Aufgabe, <RACE>. Ich überwache hier den ganzen Haufen Novizen und Adepten und muss aufpassen, dass sich keiner von denen vor lauter Dummheit beim Schmieden den Bart abbrennt.~
  IF ~~ THEN REPLY ~Darf ich Euch eine Frage stellen?~ GOTO question
  IF ~~ THEN REPLY ~Entschuldigt die Störung. Ich werde Euch wieder verlassen.~ GOTO 1
END

IF ~True()~ THEN BEGIN hello_again
  SAY ~Stört mich nicht bei meiner Aufgabe, <RACE>. Ich überwache hier den ganzen Haufen Novizen und Adepten und muss aufpassen, dass sich keiner von denen vor lauter Dummheit beim Schmieden den Bart abbrennt.~
  IF ~~ THEN REPLY ~Darf ich Euch eine Frage stellen?~ GOTO question
  IF ~~ THEN REPLY ~Entschuldigt die Störung. Ich werde Euch wieder verlassen.~ GOTO 1
END

IF ~~ THEN BEGIN 1 // from: 0.1
  SAY ~Tut das. Wenn Ihr Hilfe vom Tempel braucht, bin ich eh der Falsche. Sprecht mit dem Seelenschmied Vichorn Goldhammer, er kann Euch alle Dienste, die Ihr braucht, anbieten.~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN question
  SAY ~Ich muss mir schon den ganzen Tag die dummen Fragen meiner Novizen anhören, und jetzt auch noch Ihr? Nun gut, fragt schnell, vielleicht kann ich Euch das eine oder andere beibringen, <RACE>.~
  IF ~~ THEN REPLY ~Erzählt mir über Moradin.~ GOTO moradin_1
  IF ~~ THEN REPLY ~Ich höre hier immer von Adepten des Amboss, Unbearbeiteten und Ähnlichem. Was bedeuten diese Namen?~ GOTO moradin_priesthood
  IF ~~ THEN REPLY ~Vielleicht ein andermal. Lebt wohl.~ GOTO 1
END

IF ~~ THEN BEGIN moradin_1
  SAY ~Moradin ist der Erschaffer der Zwerge. In grauer Vorzeit formte er in seiner Schmiede den ersten Zwerg aus einem Stück Metall und hauchte ihm beim Abkühlen der noch glühenden Form mit seinem Atem Leben ein. Deshalb nennen wir Moradin auch den "Allvater"~
  IF ~~ THEN REPLY ~Interessant. Ich habe noch eine weitere Frage.~ GOTO question
END

IF ~~ THEN BEGIN moradin_priesthood
  SAY ~Wir Priester des Moradin - oder Sonnlinnor, wie wir von Unseresgleichen auch genannt werden - haben verschiedene Ränge. Jeder dieser Ränge hat einen Titel. Bei den ersten, niederen Rängen legen die Novizen ihren Namen ab und werden nur mit ihrem Titel angesprochen. Diejenigen, die keine Ahnung vom Schmiedehandwerk haben und gerade das erste Mal ihren Bart geflochten haben -wie dieser Kerl da drüben- nennt man die Unbearbeiteten. Die, die schon etwas weiter sind, bekommen hier einen eigenen Amboss zugewiesen. Wir nennen sie die Adepten des Amboss, und sie lernen zunächst einmal die Grundlagen des Schmiedehandwerks - welche unterschiedlichen Hämmer und Zangen es gibt, wie man Eisen bearbeitet und Werkstücke zusammenfügt. Danach kommen die Hämmerer des Krieges, die sich in der Bearbeitung von Stahl weiterbilden müssen.~
  = 
  ~Ich bin der Ausbilder dieses ganzen Haufens und werde Künstler der Schmiede genannt. Meine Aufgabe ist es, aus den jungen Burschen gute Waffen- und Rüstungsschmiede zu machen. Irgendwann werde ich zu einem Runenhandwerker aufsteigen. Das zweithöchste Amt in unserem Tempel hier hat der Seelenschmied Vichorn Goldhammer, der den Tempelbetrieb überwacht, inne. Unser geschätzter Anführer ist der Hohe Seelenschmied Anthan Diamantklinge, höchster unseres Ordens und ein Meister an der Schmiede und dem Hammer. Es gibt niemanden hier in Iltkazar, der Werkstücke von so großer Schönheit und Macht erschaffen kann wie Anthan, Sohn des Thratur, Leiter der Uralten Schmiede und Auserwählter des Moradin.~
  IF ~~ THEN REPLY ~Interessant. Ich habe noch eine weitere Frage.~ GOTO question
  IF ~~ THEN REPLY ~Wo kann ich Anthan Diamantklinge finden?~ GOTO anthan
END

IF ~~ THEN BEGIN anthan
  SAY ~Er hält sich meistens hier im Tempel in der Nähe von Moradins Statue auf, manchmal ist er jedoch auch in den anderen Zitadellen Iltkazars unterwegs.~
  IF ~~ THEN REPLY ~Interessant. Ich habe noch eine weitere Frage.~ GOTO question
  IF ~~ THEN REPLY ~Entschuldigt die Störung. Ich werde Euch wieder verlassen.~ GOTO 1
END
