

/*******************************************************************************************************
Dialog Vronia cre#2 in Iltkazar, Quest-Start
*******************************************************************************************************/

BEGIN ~ac#vron2~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY  ~<CHARNAME>, dürfte ich einen Augenblick mit Euch sprechen? Mein Name ist Vronia Eisenbieger.~
++ ~Ihr wart auch im Regentschaftsrat mit dabei, nicht wahr?~ + 2
++ ~Worum geht es?~ + 2
++ ~In dieser Stadt will jemand mit mir sprechen?~ + 2
END

IF ~~THEN BEGIN 2
SAY ~Ich bin als Runenwirkerin der Stadt Mitglied des Regentschaftsrates und bedauere, wie Euer erstes Gespräch dort abgelaufen ist. Die meisten Zwerge Iltkazars sind zäher als Adamant, wenn es um das Festhalten an alten Traditionen geht. Und bei den Mitgliedern des Regentschaftsrates ist diese Haltung besonders schlimm.~
=
~Ich habe jedoch nicht hier auf Euch gewartet, um über die Vorgänge im Ratsgebäude zu sprechen. Dies steht mir nicht zu, und ich empfehle Euch, den Anweisungen des Rates penibler als ein Diamantschleifer zu folgen. Ich bin hier, weil ich Euch in einer Angelegenheit um Hilfe bitten möchte.~
++ ~Um was für eine Angelegenheit handelt es sich denn?~ + 3
++ ~Dann lasst mal hören.~ + 3
END

IF ~~THEN BEGIN 3
SAY ~Dies sollten wir nicht hier draußen besprechen. Mein Haus ist nicht weit entfernt von hier, das letzte Haus in der zweiten Straße im Osten. Sucht mich dort auf, und ich werde Euch darlegen, was ich von Euch brauche.~
++ ~Gut, ich werde Euch dort aufsuchen.~ + 4
++ ~Wenn ich gerade in der Nähe bin, vielleicht.~ + 4
++ ~Bin gerade nicht in der besten Stimmung für Besuche.~ + 4
END

IF ~~THEN BEGIN 4
SAY ~Vielleicht gelingt es Euch auch, durch Eure Taten hier in Iltkazar den Rat von Euren Fähigkeiten zu überzeugen. Da käme die Frage, die wir in meinem Haus besprechen werden, gerade recht. Ich warte auf Euch an meinem *runedar*, wie wir Zwerge unser Heim zu nennen pflegen.~
   IF ~~ THEN DO ~SetGlobal("AC#Vronia_Quest","GLOBAL",1)
AddJournalEntry(@50600,QUEST)
EscapeAreaObject("TrACIL5Q")~  EXIT
END

/*******************************************************************************************************
Dialog Vronia cre#4 in ACIL50, Iltkazar, wenn Magier tot
*******************************************************************************************************/

BEGIN ~ac#vron4~

IF ~True()~ THEN BEGIN hello_what_happened
SAY  ~<CHARNAME>! Meine Runen zeigten einen starken Ausbruch magischer Energie in Ellhimars Haus! Was ist geschehen?~
IF ~~ THEN REPLY ~Der Magier war ein Drow! Seht, ich habe seine Leiche hier bei mir.~ + vronia4_ellhimar_drow_corpse
END

	IF ~~THEN BEGIN vronia4_ellhimar_drow_corpse
	SAY ~Berronar sei uns gnädig! Lasst einmal sehen. In der Tat, das ist ein *azanolv*, ein Nachtelf. Dies soll die Leiche des Ellhimar sein, den wir kannten?~
	IF ~~ THEN REPLY ~Ja. Er griff mich plötzlich an. Nach seinem Tode verwandelte er sich in einen Drow zurück.~ DO ~TakePartyItem("AC#DDROW")~ GOTO shapechange_drow
	END
	
		IF ~~THEN BEGIN shapechange_drow
		SAY ~Ich spüre die Wahrheit in Eurer Stimme. Das ist eine schlimme Nachricht für die Stadt. Ein Dunkelelf-Spion in unseren Reihen!~
		++ ~Es kommt noch schlimmer. In einer geheimen Kammer befand sich ein Spiegel, mit dem der Drow mit einem Gedankenschinder kommunizieren konnte.~ + mindflayer_mirror
		END
		
			IF ~~THEN BEGIN mindflayer_mirror
			SAY ~Ein *caradhak*! Das sind fürwahr schreckliche Nachrichten! Wie gut, dass Ihr Schlimmeres verhindern konntet, <CHARNAME>.~
			IF ~Global("AC#Arrested","GLOBAL",1)~ THEN REPLY ~Ist damit mein Arrest aufgehoben?~ + arrest_finished
			++ ~Gerne geschehen.~ + council
			END
			
				IF ~~THEN BEGIN arrest_finished
				SAY ~Das weiß ich nicht. Das müssen andere entscheiden.~
				IF ~~ THEN  GOTO council
				END
				
					IF ~~THEN BEGIN council
					SAY ~Ich muss umgehend zum Ratsgebäude zurückkehren. Ellhimars Haus werde ich bewachen und untersuchen lassen, auch wenn ich befürchte, dass wir diesen *caradhak* nicht mehr zu Gesicht bekommen werden und damit nicht in Erfahrung bringen können, wo er sich aufhält.~
					IF ~Global("AC#RC_Ellhimar_First","GLOBAL",0)~ THEN GOTO council_02 //when the party has not the regency council's quest to solve ellhimar's mystery
					IF ~Global("AC#RC_Ellhimar_First","GLOBAL",1)~ THEN GOTO meet_me_council_02 // when the party has the quest by the regency council
					END
					
					// Regency Council quest NOT given
					IF ~~THEN BEGIN council_02
					SAY ~Habt Dank für Eure wertvolle Hilfe, <CHARNAME>, die ich Euch niemals vergessen werde! Wir sehen uns bald im Regentschaftsrat wieder.~
					IF ~~ THEN DO ~SetGlobal("AC#Vronia_Quest","GLOBAL",12)
					SetGlobal("AC#Vronia_Alert","GLOBAL",10)
					IncrementGlobal("AC_Iltkazar_Reputation","GLOBAL",3)
					AddexperienceParty(1000)
					AddJournalEntry(@50612,QUEST_DONE)
					DisplayStringNoName(Player1,@1021)
					EscapeArea()~ EXIT
					END
					
					// Regency Council quest IS given
					IF ~~THEN BEGIN meet_me_council_02
					SAY ~Habt Dank für Eure wertvolle Hilfe, <CHARNAME>, die ich Euch niemals vergessen werde! Ich werde zum Rat zurückkehren und berichten, was sich zugetragen hat. Ihr solltet dort auch vorstellig werden!~
					IF ~~ THEN DO ~SetGlobal("AC#Vronia_Quest","GLOBAL",12)
					SetGlobal("AC#Vronia_Alert","GLOBAL",10)
					IncrementGlobal("AC_Iltkazar_Reputation","GLOBAL",3)
					AddexperienceParty(1000)
					AddJournalEntry(@62061,QUEST)
					AddJournalEntry(@50612,QUEST_DONE)
					DisplayStringNoName(Player1,@1021)
					EscapeArea()~ EXIT
					END

/*******************************************************************************************************
Dialog Vronia cre#3 in ihrem Haus ACIL5Q
*******************************************************************************************************/

BEGIN ~ac#vron3~

//Quest: Place Runestone
IF ~GlobalGT("AC#Vronia_Quest","GLOBAL",6)~ THEN BEGIN hello_again_sorni
SAY  ~Seid gegrüßt, <CHARNAME>. Was habt Ihr zu berichten?~
IF ~~ THEN REPLY ~Ich habe bisher noch nichts erreichen können.~ + found_nothing
IF ~Global("AC#Vronia_Quest","GLOBAL",11)
PartyHasItem("AC#DDROW")~ THEN REPLY ~Der Magier war ein Drow! Seht, ich habe seine Leiche hier bei mir.~ + ellhimar_drow_corpse
IF ~Global("AC#Vronia_Quest","GLOBAL",11)
!PartyHasItem("AC#DDROW")~ THEN REPLY ~Der Magier war ein Drow und ich habe ihn getötet!~ + ellhimar_drow__no_corpse
END

	IF ~~THEN BEGIN ellhimar_drow__no_corpse
	SAY ~Wie Bitte? Bei Berronar, ich glaube, ich habe mich verhört! Ihr habt ihn umgebracht?~
	++ ~Er griff mich plötzlich an. Wie gesagt, nach seinem Tode verwandelte er sich in einen Drow zurück.~ + shapechange_drow
	END
	
	IF ~~THEN BEGIN ellhimar_drow_corpse
	SAY ~Berronar sei uns gnädig! Lasst einmal sehen. In der Tat, das ist ein *azanolv*, ein Nachtelf. Dies soll die Leiche des Ellhimar sein, den wir kannten?~
	IF ~~ THEN REPLY ~Ja. Er griff mich plötzlich an. Nach seinem Tode verwandelte er sich in einen Drow zurück.~ DO ~TakePartyItem("AC#DDROW")~ GOTO shapechange_drow
	END
	
		IF ~~THEN BEGIN shapechange_drow
		SAY ~Ich spüre die Wahrheit in Eurer Stimme. Das ist eine schlimme Nachricht für die Stadt. Ein Dunkelelf-Spion in unseren Reihen!~
		++ ~Es kommt noch schlimmer. In einer geheimen Kammer befand sich ein Spiegel, mit dem der Drow mit einem Gedankenschinder kommunizieren konnte.~ + mindflayer_mirror
		END
		
			IF ~~THEN BEGIN mindflayer_mirror
			SAY ~Ein *caradhak*! Das sind fürwahr schreckliche Nachrichten! Wie gut, dass Ihr Schlimmeres verhindern konntet, <CHARNAME>.~
			IF ~Global("AC#Arrested","GLOBAL",1)~ THEN REPLY ~Ist damit mein Arrest aufgehoben?.~ + arrest_finished
			++ ~Gerne geschehen.~ + council
			END
			
				IF ~~THEN BEGIN arrest_finished
				SAY ~Das weiß ich nicht. Das müssen andere entscheiden.~
				IF ~~ THEN  GOTO council
				END
				
					IF ~~THEN BEGIN council
					SAY ~Ich muss umgehend zum Ratsgebäude zurückkehren. Ellhimars Haus werde ich bewachen und untersuchen lassen, auch wenn ich befürchte, dass wir diesen *caradhak* nicht mehr zu Gesicht bekommen werden und damit nicht in Erfahrung bringen können, wo er sich aufhält.~
					IF ~Global("AC#RC_Ellhimar_First","GLOBAL",0)~ THEN GOTO council_02 //when the party has not the regency council's quest to solve ellhimar's mystery
					IF ~Global("AC#RC_Ellhimar_First","GLOBAL",1)~ THEN GOTO meet_me_council_02 // when the party has the quest by the regency council
					END
					
					// Regency Council quest NOT given
					IF ~~THEN BEGIN council_02
					SAY ~Habt Dank für Eure wertvolle Hilfe, <CHARNAME>, die ich Euch niemals vergessen werde! Wir sehen uns bald im Regentschaftsrat wieder.~
					IF ~~ THEN DO ~SetGlobal("AC#Vronia_Quest","GLOBAL",12)
					IncrementGlobal("AC_Iltkazar_Reputation","GLOBAL",3)
					AddexperienceParty(1000)
					AddJournalEntry(@50612,QUEST_DONE)
					DisplayStringNoName(Player1,@1021)
					EscapeArea()~ EXIT
					END
					
					// Regency Council quest IS given
					IF ~~THEN BEGIN meet_me_council_02
					SAY ~Habt Dank für Eure wertvolle Hilfe, <CHARNAME>, die ich Euch niemals vergessen werde! Ich werde zum Rat zurückkehren und berichten, was sich zugetragen hat. Ihr solltet dort auch vorstellig werden!~
					IF ~~ THEN DO ~SetGlobal("AC#Vronia_Quest","GLOBAL",12)
					IncrementGlobal("AC_Iltkazar_Reputation","GLOBAL",3)
					AddexperienceParty(1000)
					AddJournalEntry(@62061,QUEST)
					AddJournalEntry(@50612,QUEST_DONE)
					DisplayStringNoName(Player1,@1021)
					EscapeArea()~ EXIT
					END

//after talk with Neeritha, Priest of Oghma
IF ~GlobalGT("AC#Vronia_Quest","GLOBAL",4)~ THEN BEGIN hello_again_after_oghma
SAY  ~Und? Was sagt die Priesterin Oghmas zu dem Magier?~
IF ~~ THEN REPLY ~Ich habe noch nicht mit ihr gesprochen.~ + found_nothing
IF ~Global("AC#Vronia_Quest","GLOBAL",6)~ THEN REPLY ~Sie erzählte mir, dass Ellhimar wohl auf eigene Faust nach einem Weg suchte, Mith Barak zu helfen.~ + temple_oghma_01
END

	IF ~~THEN BEGIN temple_oghma_01
	SAY ~Das hatte ich mir schon fast gedacht. Aber das ist ja an sich noch nicht verwerflich, auch wenn er es abseits der Entscheidungen des Regentschaftsrates gemacht hat.~
	++ ~Er ist wohl dazu auch in eine Gegend vorgedrungen, die ihr die "Spinnenschächte" nennt.~ + spiderstalkings
	END
	
		IF ~~THEN BEGIN spiderstalkings
		SAY ~Die Spinnenhurgon? Das ist nicht gut. Dieses Gebiet ist seit vielen Jahren aufgrund der Gefahren, die dort lauern, versiegelt. Turbaern Ghalmrin, unser Hohepriester Dumathoins, hat selbst die Siegel angebracht. Nun ja, offensichtlich hat Ellhimar einen anderen Weg hineingefunden. Aber das allein wäre ja eher ein Beweis für seine guten Absichten, oder etwa nicht?~
		++ ~Nach seinem Ausflug in diese Gegend kam er wohl sehr übellaunig zurück und hat sich seither nicht mehr aktiv um den Schlaf Eures Königs gekümmert.~ + changed_personality
		END
		
			IF ~~THEN BEGIN changed_personality
			SAY ~Hmm... er scheint dort wohl etwas gefunden zu haben, was ihm nicht behagt hat.~
			++ ~Soll ich einmal in den Spinnenschächten nach Antworten suchen?~ + search_for_answers
			++ ~Was soll ich Eurer Meinung nach jetzt tun?~ + next_step
			END
			
				IF ~~THEN BEGIN search_for_answers
				SAY ~Nein! Es ist verboten, diesen unheiligen Ort zu besuchen.~
				IF ~Global("AC#Arrested","GLOBAL",1)~ THEN GOTO arrested
				IF ~!Global("AC#Arrested","GLOBAL",1)~ THEN GOTO next_step
				END
				
					IF ~~THEN BEGIN arrested
					SAY ~Ihr solltet ebenfalls bedenken, dass Ihr noch immer unter Arrest steht. Ich bin zwar ein Mitglied des Regentschaftsrates, aber die Entscheidung, wann dieser Arrest beendet sein wird, kann nur der Rat gemeinsam treffen.~
					IF ~~ THEN GOTO next_step
					END
					
				IF ~~THEN BEGIN next_step
				SAY ~Mich würde zunächst eher interessieren, was Ellhimar in den Spinnenschächten gesucht hat und was ihn derart verwandelt zurückkehren ließ. Ich fürchte, bei seiner Person kommen wir da nur nicht weiter.~
				IF ~~ THEN GOTO check_home
				END
	
//after first talk with Ellhimar
IF ~Global("AC#Vronia_Quest","GLOBAL",4)~ THEN BEGIN hello_again
SAY  ~Da seid Ihr ja wieder. habt Ihr schon mit Ellhimar gesprochen?~
IF ~~ THEN REPLY ~Nein, ich habe noch nichts herausgefunden.~ + found_nothing
IF ~Global("AC#Vronia_Quest","GLOBAL",4)~ THEN REPLY ~Ich habe mit ihm gesprochen, ja.~ + ellhimar_suspicious
END

	IF ~~THEN BEGIN ellhimar_suspicious
	SAY ~Oh! Habt Ihr etwas erreichen können? Hat er sich Euch mehr geöffnet als uns Zwergen?~
	++ ~Ehrlich gesagt habe ich meine berechtigten Zweifel, ob er wirklich aus der Gegend stammt, die er vorgibt.~ + ellhimar_suspicious_02
	END

		IF ~~THEN BEGIN ellhimar_suspicious_02
		SAY ~Was? Wieso das denn?~
		++ ~Er schien keinen der Orte an der Oberfläche, die ich ihm genannt habe, zu kennen. Und ich meine wirklich *berühmte* Orte, von denen jedes Kind der Oberfläche schon etwas gehört haben sollte.~ + ellhimar_suspicious_03
		END

		IF ~~THEN BEGIN ellhimar_suspicious_03
		SAY ~Hmm, das ist wahrlich merkwürdig. Er legt doch ständig Wert darauf, zu betonen, was für ein weit gereister Mensch er ist...~
		IF ~ReputationGT(LastTalkedToBy,12)~ THEN GOTO reputation_high
		IF ~ReputationLT(LastTalkedToBy,13)~ THEN GOTO reputation_low
		END

		IF ~~THEN BEGIN reputation_low
		SAY ~Ihr mögt zwar nicht immer die edelsten Manieren an den Tag legen, <CHARNAME>, aber Eure Beweggründe sind für mich dennoch nachvollziehbar. Bei Ellhimar hingegen tappe ich im Dunkeln.~
		IF ~~ THEN GOTO further_investigation
		END

		IF ~~THEN BEGIN reputation_high
		SAY ~Ihr seid ein ehrenwerter <PRO_RACE>, <CHARNAME>. Ich sehe keinen Anlass, Euch zu misstrauen. Bei Ellhimar hingegen tappe ich im Dunkeln.~
		IF ~~ THEN GOTO further_investigation
		END

// Quest: Temple of Oghma

			IF ~~THEN BEGIN further_investigation
			SAY ~Eure Beobachtungen haben mich leider nicht beruhigt, sondern eher meine Zweifel genährt. Allerdings war Ellhimar bisher immer ein Mensch mit guten Absichten. Ich brauche die Meinung eines weiteren Bewohners Iltkazars, um sicher zu sein, dass ich dem Magier kein Unrecht tue.~
			=
			~Ganz am Rande der Stadt befindet sich ein kleiner Schrein, der dem Menschengott Oghma geweiht ist.~
			++ ~Ihr verehrt hier unten Oghma?~ + oghma_01
			END

			IF ~~THEN BEGIN oghma_01
			SAY ~Nur die wenigsten Zwerge. Iltkazar ist jedoch das Heim einiger weniger Oghmaanhänger, die seit Jahrhunderten zusammen mit uns leben. Eine davon ist Neeritha Runenschrift, eine Priesterin Oghmas. Ich bitte Euch, sie um Rat zu fragen, was sie von dieser ganzen Angelegenheit hält.~
			++ ~Nun gut, ich werde sie aufsuchen. Was soll ich ihr denn sagen?~ + go_to_oghma
			++ ~Warum redet Ihr nicht selbst mit ihr?~ + go_to_oghma
			END
			
			IF ~~THEN BEGIN go_to_oghma
			SAY ~Das Verhältnis von den meisten Zwergen mit den hier praktizierenden Oghmaanhängern war in der Vergangenheit nicht immer einfach. Was vor allem, zugegebenermaßen, an uns restlichen Zwergen gelegen hat. Deshalb habe ich auch bisher Euch ins Vertrauen gezogen und nicht Neeritha. Fragt sie einfach einmal, was sie von Ellhimar hält. Aber Bitte ohne gleich den Eindruck zu erwecken, ich hätte Euch geschickt. Meint Ihr, Ihr bekommt das hin?~
			++ ~Ich denke schon.~ + go_to_oghma_02
			END
			
			IF ~~THEN BEGIN go_to_oghma_02
			SAY ~Gut. Der Schrein Oghmas befindet sich im Südosten ganz am Rande der Stadt. Kehrt zu mir zurück, wenn Ihr etwas in Erfahrung bringen konntet.~
			   IF ~~ THEN DO ~SetGlobal("AC#Vronia_Quest","GLOBAL",5)
			AddJournalEntry(@50603,QUEST)~  EXIT
			END

// Quest: investigate Ellhimars Home
		
		IF ~~THEN BEGIN check_home
		SAY ~Sämtliche Erkenntniszauber, die ich in der Vergangenheit bereits auf ihn gewirkt hatte, haben nichts Auffälliges ergeben. Ich möchte nun aber doch genauer wissen, ob Ellhimar etwas zu verbergen hat. Wenn an seiner Person nichts zu finden ist, könnten wir uns einmal sein Zuhause näher ansehen.~
		++ ~Ihr verlangt doch nicht etwa von mir, bei ihm einzubrechen?~ + check_home_02
		END

		IF ~~THEN BEGIN check_home_02
		SAY ~Nein, auf keinen Fall! Ich habe hier jedoch eine Rune, die verborgene Magie aufspüren kann. Ich bitte Euch, diese in Ellhimars Schreibtisch abzulegen.~
		++ ~Und wenn er sie findet?~ + find_rune
		END

		IF ~~THEN BEGIN find_rune
		SAY ~Das wird er nicht. Aber stehlt auf keinen Fall etwas! Ich möchte nicht, dass er Verdacht schöpft. Außerdem würde ich solch ein Verhalten keinesfalls gut heißen.~
		++ ~Dann müsst Ihr mir nur noch sagen, wie ich diese Rune vor seinen Augen in den Schreibtisch schmuggeln soll.~ + place_rune
		END

		IF ~~THEN BEGIN place_rune
		SAY ~Ellhimar arbeitet ab und zu mit Sorni Arnschädel zusammen, um Gegenstände zu verzaubern. Sorni ist eine ehrenwerte Person. Weiht sie in unseren bisherigen Erkenntnisse ein. Vielleicht gelingt ihr es ja, ihn unter einem Vorwand wegzulocken.~
		++ ~Wo finde ich Sorni?~ + where_is_sorni
		END

		IF ~~THEN BEGIN where_is_sorni
		SAY ~Ihr findet sie in der Arnschädel- oder Azerkynhalle im Westen der Stadt. Fragt die Schmiede nach ihr, sie ist die Herrin der Schmiede. Jeder dort dürfte wissen, wo sie zu finden ist.~
		++ ~Gut, ich werde Sorni aufsuchen.~ + go_sorni
		END

		IF ~~THEN BEGIN go_sorni
		SAY ~Ich danke Euch. Sobald Sorni einverstanden ist, müsst Ihr Ellhimar aufsuchen und warten, bis er sein Haus verlässt. Hier ist der Runenstein, den Ihr am Schreibtisch platzieren sollt. Kehrt danach zu mir zurück, dann besprechen wir die nächsten Schritte.~
		   IF ~~ THEN DO ~SetGlobal("AC#Vronia_Quest","GLOBAL",7)
		GiveItemCreate("AC#5QRUN",Player1,1,0,0)
		AddJournalEntry(@50607,QUEST)~  EXIT
		END

//quest active, nothing found yet
IF ~Global("AC#Vronia_Quest","GLOBAL",3)~ THEN BEGIN hello_again
SAY  ~Da seid Ihr ja wieder. habt Ihr schon mit Ellhimar gesprochen?~
IF ~~ THEN REPLY ~Nein, ich habe noch nichts herausgefunden.~ + found_nothing
END

	IF ~~ THEN BEGIN found_nothing
	SAY ~Ich möchte Euch auch nicht hetzen. Ich werde hier warten und mich um meinen kranken Mann kümmern.~
	IF ~~ THEN DO ~~ EXIT
	END

// first meeting with Vornia at her home
IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY  ~Schön, dass Ihr gekommen seid, <CHARNAME>. Darf ich Euch etwas Tee aus Kazardaern-Flechten anbieten?~
++ ~Nein, Danke.~ + 2
++ ~Ja, sehr gerne.~ + 2
END

	IF ~~THEN BEGIN 2
	SAY ~Wie bereits gesagt, brauche ich Eure Hilfe. Ich möchte betonen, dass dies keine Angelegenheit des Rates ist und bitte Euch, zwischen Euch und mir stillschweigen zu bewahren.~
	++ ~Selbstverständlich.~ + 3
	++ ~Ich soll für Euch etwas erledigen, bei dem Ihr Euch nicht die Hände schmutzig machen wollt?~ + 3
	END

		IF ~~THEN BEGIN 3
		SAY ~Es ist nichts Unehrenhaftes, um das ich Euch bitte. Hört gut zu.~
		IF ~~ THEN GOTO ellhimar01
		END

		IF ~~THEN BEGIN ellhimar01
		SAY ~Wir haben hier in der Stadt einen Magier namens Ellhimar, ein Mensch, der schon seit längerem unser Gast ist. Vielleicht habt Ihr schon von ihm gehört oder ein paar Worte mit ihm gewechselt.~
		IF ~Global("AC#TalkedToEllhimar","GLOBAL",0)~ THEN REPLY ~Nein, ich habe ihn noch nicht kennengelernt.~ + ellhimar02
		IF ~Global("AC#TalkedToEllhimar","GLOBAL",1)~ THEN REPLY ~Ich habe bereits kurz mit ihm gesprochen, ja.~ + ellhimar02
		END

		IF ~~THEN BEGIN ellhimar02
		SAY ~Er kam als Besucher in die Stadt, noch bevor unser König nicht mehr aus seinem Schlaf erwachte. Ich habe mich als Runenwirkerin zu Beginn gut mit ihm verstanden. Doch in letzter Zeit ist er etwas merkwürdig.~
		++ ~Was meint Ihr mit merkwürdig?~ + ellhimar_strange
		END

		IF ~~THEN BEGIN ellhimar_strange
		SAY ~Er ist anders, als er zu Beginn war. Nicht mehr so freundlich und zuvorkommend, sondern in sich gekehrt und missmutig. Er hat mir zu Beginn immer mit meinem kranken Mann geholfen, doch seit mehreren Herdfeuern scheint er kein Interesse mehr an einem Austausch mit mir zu haben.~
		=
		~Wisst Ihr, durch meine Magie bin ich in der Lage, ziemlich genau die Beweggründe eines *hurm* einschätzen zu können, doch bei diesem Magier beiße ich auf Granit.~
		IF ~~ THEN GOTO check_ellhimar
		END

		IF ~~THEN BEGIN check_ellhimar
		SAY ~Ihr seid doch, genau wie Ellhimar, von der Oberfläche. Könntet Ihr nicht einmal einige Worte mit ihm wechseln? Vielleicht ist er einem Oberflächenbewohner gegenüber aufgeschlossener als einer alten Zwergin.~
		++ ~Aber natürlich, ich kann gerne einmal mit ihm reden.~ + talk_2_ellhimar
		++ ~Denkt Ihr, dass Ellhimar nicht er selbst ist? Ich hatte in der Vergangenheit des Öfteren mit Doppelgängern zu tun.~ + shapechange_ellhimar
		END

		IF ~~THEN BEGIN shapechange_ellhimar
		SAY ~Diesen Verdacht hatte ich auch eine Weile, aber er besitzt immer noch seine Zauberkraft und hilft den Schmieden beim Verzaubern von Gegenständen und kleineren Gefälligkeiten. Ich glaube nicht, dass ein anderes Wesen dahintersteckt. Ich weiß einfach nicht, was mit ihm los ist.~
		IF ~~ THEN GOTO talk_2_ellhimar
		END

		IF ~~THEN BEGIN talk_2_ellhimar
		SAY ~Vielleicht findet Ihr einen Zugang zu ihm, da Ihr beide von der Oberfläche stammt - ich glaube, er stammt auch aus der selben Gegend wie Ihr, wenn ich mich nicht täusche. Sucht ihn am Besten einmal in seinem Haus ganz in der Nähe von hier, einige Treppen weiter oberhalb im Nordosten, auf. Redet mit ihm - es gibt gegebenenfalls Orte oder Personen, die Ihr beide kennt. Das wäre doch einmal eine gute Grundlage für ein Gespräch.~
		IF ~~ THEN GOTO 4
		END

		IF ~~THEN BEGIN 4
		SAY ~Fangt nur Bitte keinen Streit an, denn viele Zwerge haben mittlerweile Vertrauen in diesen Magier gefasst, so seltsam es auch scheinen mag. Kehrt zu mir zurück, wenn Ihr etwas herausgefunden habt - auch dann, wenn Ihr der Meinung seid, dass mit dem Menschen alles in Ordnung ist und alles nur ein Hirngespinst einer alten Zwergenfrau war. Ich werde hier auf Euch warten.~
		   IF ~~ THEN DO ~SetGlobal("AC#Vronia_Quest","GLOBAL",3)
		AddJournalEntry(@50601,QUEST)~  EXIT
		END





