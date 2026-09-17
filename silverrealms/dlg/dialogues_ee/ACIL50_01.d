

// ---------------------------------------------
// Dunnabar Steinschulter
// ---------------------------------------------

BEGIN ~ac#dun50~

IF ~Global("AC#Iltkazar_Council_Second_Quest","GLOBAL",1)~ THEN BEGIN go_council
  SAY ~Heda, <PRO_RACE> von der Oberfläche! Der Rat möchte mit Euch sprechen!~
   IF ~~ THEN REPLY ~So? Ist mein unwürdiger Arrest damit endlich aufgehoben?~ GOTO arrest_finished
END

IF ~~ THEN BEGIN arrest_finished
  SAY ~Das kann ich Euch nicht sagen. Wichtig für Euch wäre jedenfalls, dass Ihr den Rat nicht lange warten lassen solltet! Geht am Besten gleich ins Ratsgebäude im Norden - Ihr wart ja schon einmal da und werdet es hoffentlich wieder finden.~
   IF ~~ THEN DO ~
   SetGlobal("AC#Iltkazar_Council_Second_Quest","GLOBAL",2)
   AddJournalEntry(@55101,QUEST)
   EscapeAreaObject("Tracil62")
   ~ EXIT
END


// ---------------------------------------------
// Bresk Steinschulter
// ---------------------------------------------

BEGIN ~AC#BRES1~

IF ~Global("Duergar_Threat","ACIL50",1)~ THEN BEGIN hello_duergar_threat_01
  SAY ~<CHARNAME>!Nur damit Ihr's wisst: Eine große Duergar-Streitmacht ist aus Norden im Anmarsch. Die Lumpen sind zwar noch ein gutes Stück entfernt, aber Ihr solltet dennoch schauen, dass Ihr im Unterreich außerhalb Iltkazars alles abschließt, was Ihr Euch so vorgenommen habt. Sonst könntet Ihr Euch eine blutige Nase holen. Vielleicht sehe ich mich auch gezwungen, die Tore schließen zu lassen, bevor ein verkleideter Duergar-Späher sich in unsere schöne Stadt hineinschleicht. Seht also zu, dass Ihr Eure Siebensachen beisammen habt, bevor es ungemütlich wird.~
  IF ~~ THEN REPLY ~Ich werde es beherzigen.~ GOTO duergar_threat_02
END

		IF ~~ THEN BEGIN duergar_threat_02
		SAY ~Elern hier wartet mit mir zusammen hier. Ihr solltet für sie ja auch dieses komische unzwergische Buch bergen, aber je nach dem könnten die Tore dann schon geschlossen sein.~
		IF ~~ THEN DO ~SetGlobal("Duergar_Threat","ACIL50",10)~EXIT
		END

IF ~Global("AC#BreskGoodbye","ACIL50",2)~ THEN BEGIN bresk_goodbye_02
  SAY ~Und, seid Ihr jetzt bereit aufzubrechen?~
  IF ~~ THEN REPLY ~Ja, jetzt geht es los.~ GOTO ready_to_leave_02
  IF ~~ THEN REPLY ~Noch nicht. Ich werde Euch Bescheid sagen, bevor ich gehe.~ GOTO not_ready_to_leave
END

		IF ~~ THEN BEGIN ready_to_leave_02
		SAY ~Hmm.. Ihr scheint es ja wirklich ernst zu meinen. Hatte mich schon an Euren Anblick hier in der Stadt gewöhnt!~									
		//IF ~PartyHasItem("AC#BOOKB")~ THEN REPLY ~Ja, ich habe es bei mir.~ GOTO ready_to_leave_03
		//IF ~!PartyHasItem("AC#BOOKB")~ THEN REPLY ~Nein, noch nicht.~ GOTO nope_bresk_dont_have_borthuns_book
		IF ~~ THEN GOTO chain_reveal_dragoncem
		END
		
		IF ~~ THEN BEGIN nope_bresk_dont_have_borthuns_book
		SAY ~Dann solltet Ihr schleunigst zu Anthan Diamantklinge gehen und es holen, <CHARNAME>! Ich warte hier solange auf Euch.~
		IF ~~ THEN EXIT 
		END

		IF ~~ THEN BEGIN ready_to_leave_03
		SAY ~Also gut. Kommt alle, wir begleiten Euch vor die Tore!~
		IF ~~ THEN DO ~SetGlobal("AC#Goodbye_Iltkazar","GLOBAL",2)~
		EXIT
		END

IF ~Global("AC#BreskGoodbye","ACIL50",1)~ THEN BEGIN bresk_goodbye_01
  SAY ~Elern meint also, Ihr seid bereit für die Rückkehr an die Oberfläche?~
  IF ~~ THEN REPLY ~Das ist richtig. Ich werde meine Suche dort fortsetzen müssen.~ GOTO yes_goodbye_iltkazar
END

	IF ~~ THEN BEGIN yes_goodbye_iltkazar
	SAY ~Sagt mir Bescheid, wenn Ihr uns wirklich verlassen wollt. Dann werde ich Euch vor die Tore begleiten. Außerdem wollen wir Euch einen würdigen Abschied bereiten. Hätte nicht gedacht, dass ich das einmal sagen würde - aber ich werde es vermissen, Euch hier als Oberflächen-<PRO_RACE> durch die Stadt laufen zu sehen!~
	IF ~~ THEN REPLY ~Eigentlich bin ich gerade schon auf dem Weg aus der Stadt heraus.~ GOTO yes_ready_to_leave
	IF ~~ THEN REPLY ~Ich werde Euch Bescheid sagen, bevor ich gehe.~ GOTO not_ready_to_leave
	END
	
		IF ~~ THEN BEGIN not_ready_to_leave
		SAY ~Ist gut. Dass Ihr Euch ja nicht einfach so davonschleicht, versteht Ihr?~
		IF ~~ THEN DO ~SetGlobal("AC#BreskGoodbye","ACIL50",2)~EXIT
		END
		
		IF ~~ THEN BEGIN yes_ready_to_leave
		SAY ~Oh, was, jetzt schon? Seid Ihr Euch da sicher? Wir werden hinter Euch die Tore verschließen. Es könnte sein, dass Ihr nicht mehr so schnell zurück in die Stadt könnt.~
		IF ~~ THEN REPLY ~Wenn ich es mir recht überlege, bräuchte ich auch noch ein wenig Zeit, um die Reise vorzubereiten.~ GOTO not_ready_to_leave
		IF ~~ THEN REPLY ~Warum wollt Ihr die Tore verschließen, sobald ich weg bin?~ GOTO why_close_gates
		END
		
			IF ~~ THEN BEGIN why_close_gates
			SAY ~Aus dem Norden naht eine größere Streitmacht der Duergar. Die kommen ab und zu hier vorbei und holen sich blutige Bärte. Nichts ungewöhnliches, aber mir wäre es wichtig, dass die Tore verschlossen sind, damit kein Späher seinen Weg hinein findet.~			
			IF ~~ THEN REPLY ~Wollt Ihr nicht, dass ich Euch gegen die Duergar helfe?~ GOTO help_duergar
			IF ~~ THEN REPLY ~Gut zu wissen.~ + no_need_to_hurry 
			END
			
				IF ~~ THEN BEGIN help_duergar
				SAY ~Keine Bange, <PRO_GIRLBOY>, damit kommen wir alleine zurecht. Diese Stadt hat schon gegen so ziemlich alles Krieg geführt, was das Unterreich an Scheußlichkeiten aufzubieten hat, und ist stets siegreich geblieben. So wird es auch diesmal sein. Ihr helft uns mehr, wenn Ihr an der Oberfläche nach Antworten sucht und uns bei solchen Dingen hier unten nicht im Weg rumsteht.~
				IF ~~ THEN REPLY ~Gut zu wissen.~ + no_need_to_hurry 
				END
			
			IF ~~ THEN BEGIN no_need_to_hurry
			SAY ~Ihr braucht Euch aber nicht zu beeilen. Es wird noch einige Zeit dauern, bis sie hier eintreffen. Und wenn Ihr wieder zurückkehrt, werden nur ein paar weitere Duergar-Skelette vor unseren Toren liegen.~
			IF ~~ THEN REPLY ~Wenn ich es mir recht überlege, bräuchte ich auch noch ein wenig Zeit, um die Reise vorzubereiten.~ GOTO not_ready_to_leave
			  IF ~~ THEN REPLY ~Ich bin jetzt bereit, die Stadt zu verlassen.~ GOTO ready_to_leave_02
			END


// Quest: Kuo-Toa Bresk start
IF ~GlobalGT("AC#RC_Sorni_Fourth","GLOBAL",0)
Global("AC#KuoToaStone","GLOBAL",1)
Global("AC#StoneMelter","ACIL50",0)~ THEN BEGIN hello_boats_wait_svirfnebli
  SAY ~Und, habt Ihr schon mit den Gnomen gesprochen?~
  IF ~PartyHasItem("AC#WAND7")~ THEN REPLY ~Der Gnom gab mir einen Stab, der Fels in Schlamm verwandelt. Er soll uns den Weg zum Kuo-Toa-Lager öffnen.~ DO ~SetGlobal("AC#StoneMelter","ACIL50",11)
  SetGlobal("AC#KuoToaStone","GLOBAL",10)~ GOTO use_that_staff
  IF ~~ THEN REPLY ~Es gibt noch nichts Neues zu berichten.~ + not_talked_to_svrirfs_yet
END

			IF ~~ THEN BEGIN use_that_staff
			SAY ~Ha, das ist gut. Nicht so elegant wie mit einem Hammer, aber sei's drum.~ 
			IF ~GlobalLT("AC#RC_Sorni_Fourth","GLOBAL",3)~ THEN + not_talked_to_sorni_yet
			IF ~Global("AC#RC_Sorni_Fourth","GLOBAL",3)~ THEN + yes_talked_to_sorni_yet
			END
			
				IF ~~ THEN BEGIN not_talked_to_sorni_yet
				SAY ~Habt Ihr auch bereits mit Sorni wegen der Boote gesprochen?~ 
				IF ~~ THEN REPLY ~Nein, noch nicht.~ + not_talked_to_sorni_yet_bye
				END
				
					IF ~~ THEN BEGIN not_talked_to_sorni_yet_bye
					SAY ~Dann solltet Ihr schleunigst mit Sorni sprechen. Die Tunnel nach Osten bleiben so lange versiegelt.~
					IF ~~ THEN EXIT 
					END
			
			IF ~~ THEN BEGIN yes_talked_to_sorni_yet
			SAY ~Also gut, hier ist der Plan. Ihr versucht, die Kuo-Toa zu verjagen und den Steinkreis auszuschalten. Sobald die Höhle sicher ist, rücken wir mit den Booten nach.~
			IF ~~ THEN REPLY ~Ihr lasst mich wieder die Drecksarbeit machen.~ GOTO drecksarbeit
			IF ~~ THEN REPLY ~Ein guter Plan!~ GOTO bresk_ready_to_leave
			END
			
				IF ~~ THEN BEGIN drecksarbeit
				SAY ~Wie? Aber nein! Glaubt mir, ich wäre auch lieber da draußen und würde ein paar Fischköpfe abhacken, als hier mit den Booten zu warten. Aber ich habe Verantwortung für meine Leute, deshalb fällt diese Ehre Euch zu.~
				IF ~~ THEN GOTO bresk_ready_to_leave
				END
			
			IF ~~ THEN BEGIN bresk_ready_to_leave
			  SAY ~Alle bereit zum Aufbruch? Elern ist schon ganz nervös!~
			  IF ~~ THEN EXTERN ~AC#ELER2~ elern_hello_boats_02
			END
			
			IF ~~ THEN BEGIN not_talked_to_svrirfs_yet
			SAY ~Die Tunnel nach Osten bleiben solange versiegelt, bis Ihr eine Lösung gegen das Kuo-Toa Problem gefunden habt.~
			IF ~~ THEN EXIT 
			END

IF ~GlobalGT("AC#RC_Sorni_Fourth","GLOBAL",0)
Global("AC#KuoToaStone","GLOBAL",0)~ THEN BEGIN hello_kuo_toa_problem
  SAY ~<CHARNAME>! Ist ja interessant, dass Euch der Regentschaftsrat jetzt nach Barak... in diese alte verfluchte Duergar-Heimstatt schicken will... doch ganz so einfach, wie es sich der Rat vorstellt, wird es nicht.~
  IF ~~ THEN REPLY ~Warum?~ GOTO what_boat_problems
END

IF ~~ THEN BEGIN what_boat_problems
  SAY ~Der Seeweg ist voller Wasserelementare und Kuo-Toa. Meine Kundschafter glauben, dass die Fischwesen diese Elementare über einen alten Steinkreis kontrollieren. Das Kuo-Toa Lager muss ganz in dessen Nähe liegen, aber die Biester erreichen es durch überflutete Tunnel, die für uns unpassierbar sind.~
  IF ~~ THEN REPLY ~Und wie sollen wir hineinkommen?~ GOTO find_kuotoa_lair
END

IF ~~ THEN BEGIN find_kuotoa_lair
  SAY ~Wenn man als Zwerg nicht mehr mit dem Kopf durch die Wand kommt, sollte man einen Gnom zu Rate ziehen. Wo wir unsere Hämmer und Meißel einsetzen, verwenden sie ihre merkwürdige Magie. Die Tiefengnome verstehen mehr von Gesteinsverformung als wir. Fragt Schnotnell Samrynarr in Gaerdals Heiligtum in der Bronzemaske um Hilfe.~
  IF ~~ THEN REPLY ~Gut. Ich werde mit ihm sprechen.~ GOTO ask_svirfnebli_bye
END

/*
			IF ~~ THEN BEGIN what_boat_problems
			SAY ~Meine Kundschafter haben an den Ufern des Sees, der Euch nach Barakuir bringen soll, zahlreiche Wasser-Elementarwesen angetroffen, die jedesmal aufs Neue an das Ufer kriechen, sobald eines dieser Monster erschlagen wurde.~
			IF ~~ THEN GOTO boat_problem_02
			END
			
				IF ~~ THEN BEGIN boat_problem_02
				SAY ~Dort am Ufer steht ein alter Steinkreis, der diese Kreaturen anzuziehen scheint. Als wäre das nicht schon schlimm genug, ist das ganze Gebiet verseucht mit widerlichen Kuo-Toa, die aus den überfluteten Bereichen ständig wieder emporzutauchen scheinen.~
				IF ~~ THEN REPLY ~Was bedeutet das für unsere Expedition?~ GOTO boat_problem_03
				END
				
					IF ~~ THEN BEGIN boat_problem_03
					SAY ~Ich glaube kaum, dass Ihr einen unterirdischen See überqueren wollt, in dem unzählige Elementare und Fischwesen nach Eurem Leben trachten.~
					IF ~~ THEN REPLY ~Was müssen wir tun?~ GOTO boat_problem_04
					END
					
						IF ~~ THEN BEGIN boat_problem_04
						SAY ~Die Kuo-Toa scheinen durch einen alten Steinkreis jene Elementare kontrollieren zu können. Wenn wir das Lager der Kuo-Toa fänden, böte sich uns auch die Möglichkeit, die Elemente des Sees wieder zu beruhigen.~
						IF ~~ THEN GOTO find_kuotoa_lair
						END
						
							IF ~~ THEN BEGIN find_kuotoa_lair
							SAY ~Meine Männer haben die Tunnel nach einem versteckten Durchgang abgesucht, sind aber nicht fündig geworden. Sie mussten sich schließlich unter dem Druck der ständigen Attacken der Kuo-Toa wieder zurückziehen. Wir haben vorerst die östlichen Tunnel mit Steinen und Metall versiegelt, damit uns die Biester in Ruhe lassen.~
							=							
							~Ich bin mir jedoch sicher, dass sich ganz in der Nähe der für uns erreichbaren Passagen ein geheimes Lager der Kuo-Toa befindet! Sie nutzen die unter Wasser liegenden Areale, um sich ungehindert fortzubewegen. Diese Möglichkeit bleibt uns verwehrt.~
							IF ~~ THEN REPLY ~Und wie soll ich dabei helfen?~ GOTO find_kuotoa_lair_02
							IF ~~ THEN REPLY ~Ihr verlangt wohl kaum von mir, dass ich durch die Höhlen tauche?~ GOTO find_kuotoa_lair_02
							END
							
								IF ~~ THEN BEGIN find_kuotoa_lair_02
								SAY ~Mein Bruder Hathar meinte, wir sollten einfach die ganzen verdammten Höhlendecken über dem See zum Einsturz bringen. Das würde aber erstens zu lange dauern und zweitens uns einen wertvollen Durchgang verbauen. Wir brauchen eine andere Möglichkeit, um das Lager der Kuo-Toa zu erreichen.~ 
								=								
								~Die Tiefengnome unserer Stadt sind Meister in Gesteinsverformung. Wo wir unsere Hämmer und Meißel einsetzen, verwenden sie ihre merkwürdige Magie. Vielleicht haben sie ja eine Idee, den versperrten Zugang zu dem Kuo-Toa-Heiligtum zu öffnen.~
								IF ~~ THEN GOTO ask_svirfnebli_01
								END
								
									IF ~~ THEN BEGIN ask_svirfnebli_01
									SAY ~Die Svirfnebli wären uns daher eine große Hilfe. Wenn man als Zwerg nicht mehr mit dem Kopf durch die Wand kommt, sollte man einen Gnom zu Rate ziehen! Fragt den Anführer der Svirfnebli in Gaerdals Tempel. Sein Name ist Schnotnell Samrynarr. Er sollte wissen, wie wir weiterkommen.~
									IF ~~ THEN REPLY ~Wo finde ich ihn?~ GOTO ask_svirfnebli_02
									IF ~~ THEN REPLY ~Gut, ich werde ihn um Rat fragen.~ GOTO ask_svirfnebli_bye
									END
									
									IF ~~ THEN BEGIN ask_svirfnebli_02
									SAY ~Die Gnome haben in der Bronzemaske, der Heimstatt meines Clans, zu Ehren ihres Gottes Gaerdal ein Heiligtum errichtet.~
									IF ~~ THEN REPLY ~Dann werde ich dort nach diesem Schnotnell suchen.~ GOTO ask_svirfnebli_bye
									END
*/									
									IF ~~ THEN BEGIN ask_svirfnebli_bye
									SAY ~Wir warten hier auf Euch. Ich bin mir sicher, dass der Anführer der Tiefengnome einen Einfall hat, wie wir das Kuo-Toa-Lager erreichen können.~
									IF ~~ THEN DO ~SetGlobal("AC#KuoToaStone","GLOBAL",1)
									AddJournalEntry(@56100,QUEST)~ EXIT
									END

// Quest: Kuo-Toa Bresk finished		
IF ~Global("AC#RC_Sorni_Fourth","GLOBAL",3)
Global("AC#KuoToaStone","GLOBAL",10)~ THEN BEGIN bresk_hello_boats
  SAY ~Da seid Ihr ja endlich, <CHARNAME>! Elern hier neben mir ist schon ganz nervös geworden!~
  IF ~~ THEN EXTERN ~AC#ELER2~ elern_hello_boats_02
END

IF ~GlobalGT("AC#BreskDrowPriestess","GLOBAL",2)
GlobalLT("AC#BreskDrowPriestess","GLOBAL",10)~ THEN BEGIN drow_quest_finished
  SAY ~Na, habt Ihr Euch um die Drow eigentlich schon gekümmert?~
  IF ~PartyHasItem("AC#DROHE")~ THEN REPLY ~Ja, ich habe den Kopf der Priesterin hier dabei.~ GOTO drow_quest_yes_finished
  IF ~!PartyHasItem("AC#DROHE")~ THEN REPLY ~Nein, noch nicht.~ GOTO drow_quest_not_finished
END

		IF ~~ THEN BEGIN drow_quest_yes_finished
		SAY ~Schön! Zeigt einmal her...~
		IF ~~ THEN DO ~TakePartyItem("AC#DROHE")
		DestroyItem("AC#DROHE")~ GOTO drow_quest_yes_finished_02
		END
		
			IF ~~ THEN BEGIN drow_quest_yes_finished_02
			SAY ~Gut gemacht. Was für hässliche Dinger diese Drow doch sind, mit ihren großen Augen, glatten Gesichtern und weißen Haaren!~
			=
			~Also, hier ist Eure wohlverdiente Belohnung. Macht Spaß, mit Euch zusammenzuarbeiten!~
			IF ~~ THEN DO ~SetGlobal("AC#BreskDrowPriestess","GLOBAL",10)
			GiveItemCreate("MISC43",Player1,3,0,0)
			AddJournalEntry(@50022,QUEST_DONE)~ EXIT
			END
			
			IF ~~ THEN BEGIN drow_quest_not_finished
			SAY ~Naja, vielleicht sind sie eh' schon weitergezogen. Wenn Ihr Ihnen begegnet, macht sie einen Kopf kürzer!~
			IF ~~ THEN EXIT
			END

IF ~Global("AC#BreskDrowPriestess","GLOBAL",2)~ THEN BEGIN drow_quest_01
  SAY ~He, <RACE>! Ich hätte da eine Aufgabe für Euch, wenn Ihr Lust auf einen kleinen Kampf für die gerechte Sache habt!~
  IF ~~ THEN REPLY ~Was für ein Kampf soll das sein?~ GOTO drow_quest_02
END

	IF ~~ THEN BEGIN drow_quest_02
	SAY ~Vor der Stadt wurden ein paar weitere Drow gesichtet. Nicht weiter schlimm, doch diesmal scheint eine Priesterin Lolths dabeizusein. Sie sind weitergezogen, müssten aber noch in der Nähe sein. Ich kann keinen meiner Männer entbehren, deshalb dachte ich an Euch, um die Dunkelelfen zur Strecke zu bringen.~	
	IF ~~ THEN REPLY ~Das klingt nach einer schönen Abwechslung. Wo wurden die Drow das letzte Mal gesehen?~ GOTO yes_drowquest
	IF ~~ THEN REPLY ~Dafür habe ich derzeit keine Zeit.~ GOTO no_drow_quest
	END
	
		IF ~~ THEN BEGIN no_drow_quest
		SAY ~War ja nur ein Vorschlag. Sollten sie Euch dennoch einmal über den Weg laufen, würde ich mich über den Kopf der Priesterin für meine Sammlung freuen.~
		IF ~~ THEN DO ~SetGlobal("AC#BreskDrowPriestess","GLOBAL",3)~ EXIT
		END
		
		IF ~~ THEN BEGIN yes_drowquest
		SAY ~Sie waren auf dem Weg nach Norden. Vielleicht könnt Ihr sie dort erwischen, bevor sie wieder verschwinden. Bringt mir den Kopf der Priesterin, und ich werde Euch als Dank ein paar Juwelen geben!~
		IF ~~ THEN DO ~SetGlobal("AC#BreskDrowPriestess","GLOBAL",3)
		MoveToPointNoInterrupt([1761.1785])
		AddJournalEntry(@50020,QUEST)~ EXIT
		END

IF ~Global("AC#RegencyQuest","GLOBAL",1)
Global("AC#BreskWatches","ACIL50",1)~ THEN BEGIN short_visit
  SAY ~Na, war ja ein ganz schön kurzer Besuch vor unserem Rat, was?~ [AC#ILBR3]
  =
  ~Nur, dass Ihr's gleich wisst: Ich mag Euch übrigens auch nicht. Aber das tut jetzt nichts zur Sache.~
=~Ich habe meinen Wachen mitgeteilt, dass Ihr hier überall ein- und ausgehen könnt, soviel Ihr wollt. Nur: Wenn Ihr hier meint, eins auf langen Bart machen zu müssen, landet Ihr im Kerker. Ist das klar?~
  IF ~~ THEN EXTERN ~AC#ELER2~ help_party
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_firsttime
  SAY ~Ihr müsst die Gruppe von der Oberfläche sein, von der der Bote meines Bruders berichtet hat. Ich bin Bresk vom Clan Steinschulter, der Kriegsmeister von Iltkazar und verantwortlich für die Sicherheit der Stadt.~ [AC#ILBR1]
  IF ~~ THEN REPLY ~Die Nachricht über mein Kommen verbreitet sich aber schnell. Ich bin ja eben erst durch dieses Tor gekommen, und Ihr wisst schon über mich Bescheid?~ GOTO fast
  IF ~~ THEN REPLY ~Seid gegrüßt, Bresk. Mein Name ist <CHARNAME>.~ + pleasantries
END

	IF ~~ THEN BEGIN pleasantries
	SAY ~Spart Euch Eure Höflichkeiten für jemand anderen auf. Hab' schon längst gewusst, wie Ihr heißt und woher Ihr kommt!~
	IF ~~ THEN GOTO fast
	END

IF ~Global("AC#Bresk_Teleport","ACIL50",2)~ THEN BEGIN move_to_council
  SAY ~Hier ist der Eingang in unsere heiligen Hallen. Und jetzt rein mit Euch, bevor ich Euch wieder ganz aus der Stadt rauswerfe!~
  IF ~~ THEN DO ~SetGlobal("AC#Bresk_Teleport","ACIL50",3)~ EXIT
END

// party is under arrest in iltkazar
IF ~Global("AC#Arrested","GLOBAL",1)~ THEN BEGIN hello_arrested
SAY ~Ich habe all meine Wachen angewiesen, Euch hier im Auge zu behalten, Oberflächen-<PRO_RACE>!~
IF ~~ THEN REPLY ~Was kann ich tun, um Euer Misstrauen zu überwinden?~ GOTO arrested_mistrust
IF ~~ THEN REPLY ~Schon gut. Ich gehe ja wieder.~ + arrested_goodbye
IF ~Global("Bresk_tallysheet","ACIL50",1)~ THEN REPLY ~Bei wieviel Strichen auf Eurer Ansehensliste bin ich gerade?~ GOTO how_much_reputation
END

	IF ~~ THEN BEGIN arrested_mistrust
	SAY ~Mein Misstrauen überwinden? Dass ich nicht lache. Mein Rat: Macht nichts kaputt, fangt keinen Streit an, und verschwindet schnell wieder aus unserer Stadt.~
	IF ~~ THEN GOTO arrested_increase_reputation
	END
	
		IF ~~ THEN BEGIN arrested_increase_reputation
		SAY ~In der Zwischenzeit könntet Ihr Euch aber auch ein wenig nützlich in der Stadt machen. Wenn Ihr den Leuten helft, mögen sie Euch vielleicht ein bisschen mehr. Und das erzählen sie anderen Zwergen, zum Beispiel mir. Ich führe übrigens eine Strichliste über Euer Benehmen in der Stadt.~
		IF ~~ THEN REPLY ~Ihr führt eine Strichliste über mich?~ DO ~SetGlobal("Bresk_tallysheet","ACIL50",1)~ GOTO arrested_increase_reputation_02
		END
		
			IF ~~ THEN BEGIN arrested_increase_reputation_02
			SAY ~Na klar! Will doch wissen, was Ihr so treibt. Wenn genügend Striche beisammen sind, könnte der Rat vielleicht den Arrest aufheben.~
			IF ~~ THEN REPLY ~Was kann ich tun, um das Ansehen der Leute zu gewinnen?~ GOTO what_can_i_do_to_increase_rep
			IF ~~ THEN REPLY ~Ab wieviel Strichen könnte mein Arrest aufgehoben werden?~ + reputation_arrest_end
			IF ~~ THEN REPLY ~Bei wieviel Strichen auf Eurer Ansehensliste bin ich gerade?~ GOTO how_much_reputation
			END
			
				IF ~~ THEN BEGIN how_much_reputation
				SAY ~Hmm... lasst mal sehen...~ 
				IF ~Global("AC_Iltkazar_Reputation","GLOBAL",0)~ THEN GOTO tally_sheet_0
				IF ~!Global("AC_Iltkazar_Reputation","GLOBAL",0)~ THEN GOTO tally_sheet_1
				END
				
				IF ~~ THEN BEGIN tally_sheet_0
				SAY ~Ich habe noch keinen Strich auf meiner Liste.~
				IF ~~ THEN GOTO reputation_low
				END
				
				IF ~~ THEN BEGIN tally_sheet_1
				SAY ~Derzeit seid Ihr bei <AC_ILREP> Strichen.~
				IF ~GlobalLT("AC_Iltkazar_Reputation","GLOBAL",5)~ THEN GOTO reputation_low
				IF ~GlobalGT("AC_Iltkazar_Reputation","GLOBAL",4)~ THEN GOTO reputation_high
				END
									
					IF ~~ THEN BEGIN reputation_low
					SAY ~Nicht gerade viel, würde Ich sagen. Ihr müsst Euch schon ein bisschen anstrengen, wenn Ihr hier in unserer Stadt bleiben wollt!~
					IF ~~ THEN REPLY ~Was kann ich tun, um das Ansehen der Leute zu gewinnen?~ GOTO what_can_i_do_to_increase_rep
					IF ~~ THEN REPLY ~Ab wieviel Strichen könnte mein Arrest aufgehoben werden?~ + reputation_arrest_end
					IF ~~ THEN REPLY ~Das ist gut zu wissen. Gehabt Euch wohl.~ GOTO arrested_goodbye
					END
					
					IF ~~ THEN BEGIN reputation_high
					SAY ~Das ist ja schonmal nicht schlecht für den Anfang.~
					IF ~~ THEN REPLY ~Was kann ich tun, um das Ansehen der Leute zu gewinnen?~ GOTO what_can_i_do_to_increase_rep
					IF ~~ THEN REPLY ~Das ist gut zu wissen. Gehabt Euch wohl.~ GOTO arrested_goodbye
					END
					
					IF ~~ THEN BEGIN what_can_i_do_to_increase_rep
					SAY ~Wie schon gesagt - macht Euch nützlich!~
					IF ~~ THEN REPLY ~Bei wieviel Strichen auf Eurer Ansehensliste bin ich gerade?~ GOTO how_much_reputation
					IF ~~ THEN REPLY ~Das ist gut zu wissen. Gehabt Euch wohl.~ GOTO arrested_goodbye
					END
					
					IF ~~ THEN BEGIN reputation_arrest_end
					SAY ~Hmm. Das ist nicht meine Entscheidung. Ich denke aber, dass Euch der Rat wieder vorladen könnte, wenn Ihr zwei Handvoll Striche auf meiner Liste gesammelt habt. Aber nochmal: Ist nicht meine Sache.~
					IF ~~ THEN REPLY ~Was kann ich tun, um das Ansehen der Leute zu gewinnen?~ GOTO what_can_i_do_to_increase_rep
					IF ~~ THEN REPLY ~Bei wieviel Strichen auf Eurer Ansehensliste bin ich gerade?~ GOTO how_much_reputation
					IF ~~ THEN REPLY ~Das ist gut zu wissen. Gehabt Euch wohl.~ GOTO arrested_goodbye
					END

	IF ~~ THEN BEGIN arrested_goodbye
	SAY ~Hm. Und passt auf, dass Ihr den Höhlenboden nicht noch dreckiger macht, als er ohnehin schon ist!~
	IF ~~ THEN EXIT 
	END

IF ~Global("AC#Ruvan_Treason","GLOBAL",2)~ THEN BEGIN hello_ruvan_treason
SAY ~<CHARNAME>! Ihr seid wohlauf. Ihr hörte von dem Verrat. Wenn mein Onkel wirklich dahintersteckt, soll er sich vor dem Regentschaftsrat verantworten. Schnell, geht in die Ratshalle und berichtet alles, was Ihr erfahren habt!~
IF ~~ THEN EXIT
END
/* IF Timer of 20 Minutes is not yet expired */
IF ~Global("AC#Bresk_Council","LOCALS",2)
/*GlobalTimerNotExpired("waiting_council","LOCALS")*/~ THEN BEGIN go_on
  //SAY ~An Eurer Stelle würde ich den Regentschaftsrat nicht zu lange warten lassen, <CHARNAME>!~
  SAY ~Wenn Ihr etwas für Iltkazar tun könnt, dann tut es. Die Feinde Shanatars schlafen niemals. Vergesst das nicht, <CHARNAME>.~
  IF ~~ THEN EXIT
END

IF ~Global("AC#Bresk_Council","LOCALS",3)~ THEN BEGIN still_there
  SAY ~Hatte ich Euch nicht angewiesen, umgehend das Ratsgebäude aufzusuchen? Los jetzt, ich werde Euch eben selbst dorthinbringen, auch wenn ich eigentlich Wichtigeres zu erledigen habe! Folgt mir.~
  IF ~~ THEN DO ~SetGlobal("AC#Bresk_Council","LOCALS",4)
  SetGlobal("AC#Bresk_Teleport","ACIL50",1)~ EXIT
END


IF ~~ THEN BEGIN fast
  SAY ~Diese Stadt hat auch deshalb so lange im Unterreich überlebt, weil ihre Bewohner immer schon vorher genau wussten, was in Kürze auf sie zukommt. So ist es immer gewesen, und so ist es auch diesmal.~ 
  =
  ~Normalerweise würde ich Euch zunächst eingehend befragen, doch wie mein Bruder mir weiter berichtete, habt Ihr wichtige Informationen für unsere Ratsherren. Ihr solltet Euch umgehend im Ratsgebäude melden und Bericht erstatten. Die Halle des Rates befindet sich im Nordosten der Stadt. Nehmt am Besten die großen Treppen, die hinter der Brücke steil die Höhle hinaufgehen, dann könnt Ihr das Gebäude kaum verfehlen.~
  IF ~~ THEN REPLY ~Es freut mich, dass Ihr mir Vertrauen schenkt und mich alleine diese schöne Stadt erkunden lasst.~ GOTO no_guards
  IF ~~ THEN REPLY ~Ich werde den Weg schon finden. Gehabt Euch wohl.~ GOTO no_guards
END

	IF ~~ THEN BEGIN no_guards
	SAY ~Glaubt nicht, dass ich Euch aus blindem Vertrauen hier alleine herumspazieren lasse! Unsere Stadt ist durch mächtige Runen unserer Vorfahren geschützt. Wenn Ihr hier irgendwelche bösen Absichten verfolgen solltet, wird dieser Ort Euer Grab werden.~ 
	IF ~~ THEN GOTO regency_council_quickly
	IF ~InParty("viconia") !StateCheck("viconia",CD_STATE_NOTVALID)~ THEN GOTO bresk_viconia_01
	END
	
		IF ~~ THEN BEGIN bresk_viconia_01
		SAY ~Und die Tatsache, dass Ihr hier mit einer Drow herumspaziert, gereicht Euch auch nicht gerade zum Vorteil. Nun gut, die Drow hat die Spinnengöttin verflucht. Das hören wir immer gerne. Aber wenn eines Tages eine Drowarmee vor unseren Toren steht und den Kopf Eurer Dunkelelfe fordert, werde ich ihr diesen höchstpersönlich selbst abschlagen. Gleiches gilt, wenn Ihr den leisesten Anschein erweckt, hier krumme Dinger drehen zu wollen.~ 
		IF ~~ THEN GOTO regency_council_quickly
		END
	
IF ~~ THEN BEGIN regency_council_quickly
SAY ~Schon deshalb solltet Ihr jetzt schleunigst die Halle des Regentschaftsrates aufsuchen - zu Eurer eigenen Sicherheit! Der Rat wird entscheiden, wie es mit Euch weitergehen soll, und meine Aufgabe wird es dann sein, diese Entscheidung in die Tat umzusetzen.~ [AC#ILBR2]
  IF ~~ THEN DO ~SetGlobal("AC#Bresk_Council","LOCALS",1)
  SetGlobal("AC#BreskMoves01","ACIL50",1)~ EXIT
END

IF ~~ THEN BEGIN no_trust
  SAY ~Ihr seid mir viel zu vertrauensselig, Elern. Ihr habt auch viel Zeit mit diesem Beldas verbracht, und was hat es ihm und Euch gebracht? Jetzt ist er tot.~
  IF ~~ THEN EXTERN ~AC#ELER2~ elern_bye
END

	IF ~~ THEN BEGIN hrmpf
	  SAY ~Hrmpf. Wie gesagt, der Zugang zum See ist vorerst versiegelt. Wir können ihn wieder öffnen, wenn Ihr bereit zum Aufbruch seid. Sagt uns hier Bescheid, wenn's los gehen soll.~
	  IF ~~ THEN DO ~EraseJournalEntry(@62041)
	AddJournalEntry(@62042,QUEST)~EXIT
	END

		IF ~~ THEN BEGIN bresk_ready
		  SAY ~Von mir aus kann es losgehen.~
		  IF ~~ THEN EXTERN ~AC#ELER2~ elern_one_word
		END
	/*	
			IF ~~ THEN BEGIN what_ruvan
			SAY ~Was? Die Männer meines Onkels begleiten <CHARNAME>? Warum das denn? Hätte ich das gewusst, hätte ich einige Mitglieder der Garnison bereitstellen können.~
			IF ~~ THEN EXTERN ~AC#ELER2~ chain_ruvan
			END
			*/
			
			IF ~~ THEN BEGIN what_ruvan 
			SAY ~Onkel Ruvans Männer? Hätte ich das gewusst, hätte ich besser einige Mitglieder der Garnison bereitgestellt!~ 
			IF ~~ THEN EXTERN ~AC#ELER2~ chain_ruvan 
			END

IF ~True()~ THEN BEGIN go_on
  SAY ~Wenn Ihr etwas für Iltkazar tun könnt, dann tut es. Die Feinde Shanatars schlafen niemals. Vergesst das nicht, <CHARNAME>.~
  IF ~~ THEN EXIT
END
// ---------------------------------------------
// Elern Riftsong: Diamondblade book questline
// ---------------------------------------------
BEGIN ~AC#ELER6~

IF ~Global("AC#Goodbye_Iltkazar","GLOBAL",1)~ THEN BEGIN talk_to_bresk
SAY ~Sprecht Bresk an, wenn Ihr bereit zum Aufbruch seid. Ich hoffe, dass ich bis dahin auch das Buch in neues Zwergisch übersetzt habe und Euch sagen kann, wohin Euch der Weg zum Drachenfriedhof führen wird.~
IF ~~ THEN EXIT	
END

IF ~Global("WaitForDriftdisc","ACIL50",1)~ THEN BEGIN hello_have_driftdisc
SAY ~Habt Ihr schon mit meiner Mutter über die Rückkehr an die Oberfläche gesprochen?~
IF ~OR(2)
PartyHasItem("AC#DRFT2")
GlobalGT("AC#Driftdisc","GLOBAL",0)~ THEN REPLY ~Ja, das habe ich.~ + yes_ready_for_back_to_surface
IF ~~ THEN REPLY ~Nein, noch nicht.~ + not_ready_for_back_to_surface
END

IF ~GlobalGT("AC#Clans_Parting","GLOBAL",1)
Global("ElernWaitsBookAnthan","ACIL50",0)~ THEN BEGIN already_talked_to_anthan
SAY ~Habt Ihr schon mit Anthan über Borthuns Buch gesprochen?~
IF ~GlobalGT("AC#Clans_Parting","GLOBAL",2)~ THEN REPLY ~Ja, das habe ich.~ + yes_talked_to_anthan
IF ~~ THEN REPLY ~Nein, noch nicht.~ + not_talked_to_anthan
END

	IF ~~ THEN BEGIN not_talked_to_anthan
	SAY ~Naja, jedenfalls wünsche ich Euch viel Glück dabei.~
	IF ~~ THEN EXIT
	END
	
	IF ~~ THEN BEGIN yes_talked_to_anthan
	SAY ~Oh! Und? Hat er es Euch gegeben?~
	IF ~~ THEN REPLY ~Mit einigem Widerwillen - ja.~ DO ~SetGlobal("ElernWaitsBookAnthan","ACIL50",1)~ + chain_yes_talked_to_anthan_02
	IF ~~ THEN REPLY ~Nach etwas Überzeugungsarbeit hat er es mir überlassen.~ DO ~SetGlobal("ElernWaitsBookAnthan","ACIL50",1)~ + chain_yes_talked_to_anthan_02
	IF ~~ THEN REPLY ~Offenbar kann selbst ein Zwerg manchmal vernünftige Entscheidungen treffen.~ DO ~SetGlobal("ElernWaitsBookAnthan","ACIL50",1)~ + chain_yes_talked_to_anthan_02
	IF ~~ THEN REPLY ~Das Buch befindet sich nun jedenfalls in meinem Besitz.~ DO ~SetGlobal("ElernWaitsBookAnthan","ACIL50",1)~ + chain_yes_talked_to_anthan_02
	END
				


// ---------------------------------------------
// Elern Riftsong: KuoToa questline
// ---------------------------------------------

BEGIN ~AC#ELER2~

// Quest: Kuo-Toa Elern Start
IF ~Global("AC#RC_Sorni_Fourth","GLOBAL",3)
Global("AC#KuoToaStone","GLOBAL",0)~ THEN BEGIN hello_boats_problem
  SAY ~<CHARNAME>! Schön, Euch zu sehen. Bresk meint, es gibt Probleme mit dieser Expedition.~
  IF ~~ THEN REPLY ~Probleme?~ GOTO what_boat_problems
END

	IF ~~ THEN BEGIN what_boat_problems
		SAY ~Irgendwelche Monster sind in den Tunneln gesichtet worden. Sprecht mit ihm, er wird es Euch genauer erklären können.~
	  IF ~~ THEN EXIT
	END

// Quest: Kuo-Toa Elern Finished
IF ~Global("AC#RC_Sorni_Fourth","GLOBAL",3)
Global("AC#KuoToaStone","GLOBAL",10)~ THEN BEGIN hello_boats
  SAY ~Da seid Ihr ja, <CHARNAME>! Schön, Euch zu sehen. Seid Ihr bereit, nach Barakuir aufzubrechen?~
  IF ~~ THEN REPLY ~Ich brauche noch etwas Zeit, um mich vorzubereiten.~ GOTO need__more_time
  IF ~~ THEN REPLY ~Ich bin bereit, aufzubrechen.~ GOTO ready_to_go
END

IF ~Global("AC#RC_Sorni_Fourth","GLOBAL",3)
Global("AC#KuoToaStone","GLOBAL",1)
Global("AC#StoneMelter","ACIL50",0)~ THEN BEGIN hello_elern_boats_wait_svirfnebli
  SAY ~Hallo! Wir warten hier, bis Ihr die Sache mit den Svirfnebli geregelt habt, <CHARNAME>.~
 IF ~~ THEN EXIT
END

	IF ~~ THEN BEGIN elern_hello_boats_02
  SAY ~Wie immer ein Muster an Feingefühl, Bresk. Also, <CHARNAME>, seid Ihr bereit?~
  IF ~~ THEN REPLY ~Ich brauche noch etwas Zeit, um mich vorzubereiten.~ GOTO need__more_time
  IF ~~ THEN REPLY ~Ich bin bereit, aufzubrechen.~ GOTO ready_to_go
	END

	IF ~~ THEN BEGIN need__more_time
		SAY ~Sicher doch. Wir warten hier so lange auf Euch und unterhalten uns prächtig, nicht wahr, Bresk?~
	  IF ~~ THEN EXTERN ~AC#BRES1~ hrmpf
	END
	
	IF ~~ THEN BEGIN ready_to_go
		SAY ~Das ist gut. Bresk, seid Ihr auch bereit?~
	  IF ~~ THEN EXTERN ~AC#BRES1~ bresk_ready
	END
	/*
		IF ~~ THEN BEGIN elern_one_word
		  SAY ~Eine Sache noch. Ich hatte Euch versprochen, dass die Anhänger des Dugmaren Euch begleiten werden - alles treue Diener unserer Familie Abgrundlied.~
		  =
		  ~Der Rat hat auf Antrag von Ruvan Steinschulter anders beschlossen. Es werden nun seine persönlichen Krieger die Expedition anführen und Euch begleiten. Laut Protokoll muss ich mich dem beugen.~
			IF ~~ THEN EXTERN ~AC#BRES1~ what_ruvan
		END
		*/
		
		IF ~~ THEN BEGIN elern_one_word 
		SAY ~Eine Sache noch: Ich hatte Euch versprochen, dass die Anhänger des Dugmaren von Clan Abgrundlied Euch begleiten werden. Doch der Rat hat anders entschieden.~ 
		= 
		~Auf Antrag Ruvan Steinschulters werden nun seine Männer die Expedition anführen.~ 
		IF ~~ THEN EXTERN ~AC#BRES1~ what_ruvan 
		END

IF ~~ THEN BEGIN help_party
  SAY ~Ist ja gut, Bresk. Vielleicht sind sie ja auch unsere letzte Hoffnung?~
  =
  ~<CHARNAME>, ich setze wirklich große Hoffnung in Euch. Mein Gefühl sagt mir, dass Ihr noch eine wichtige Rolle für unsere Stadt spielen werdet.~
  IF ~PartyHasItem("AC#SRBK1")~ THEN GOTO deliver_book
  IF ~!PartyHasItem("AC#SRBK1")~ THEN GOTO what_else
END

IF ~~ THEN BEGIN deliver_book
  SAY ~Da Ihr das Buch, das Beldas für unseren König besorgen wollte, noch habt, solltet Ihr es zur Halle der Runensteine im Westen der Stadt bringen. Dort weiß mein Vater Bettargh, Beldas' Lehrmeister, sicher etwas damit anzufangen.~
IF ~~ THEN DO ~AddJournalEntry(@62101,QUEST)~ GOTO what_else
END

IF ~~ THEN BEGIN what_else
  SAY ~Ansonsten rate ich Euch, Euch hier bei uns einmal umzuschauen. Die anderen Zwerge werden Euch großes Misstrauen entgegenbringen, aber vielleicht schafft Ihr es ja, den einen oder anderen von Euren guten Absichten zu überzeugen, indem Ihr ihnen Eure Hilfe anbietet?~
  =
  ~Nun schaut doch nicht so grimmig drein, Bresk.~
  IF ~~ THEN EXTERN ~AC#BRES1~ no_trust
END

IF ~~ THEN BEGIN start_barakuir_adventure
  SAY ~Ich hätte nicht gedacht, dass ich einmal ein so großes Abenteuer erleben würde! Los geht's!~
  IF ~~ THEN DO ~AddJournalEntry(@27000,QUEST)
          ClearAllActions()
        StartCutSceneMode()
        SetGlobal("AC#RC_Sorni_Fourth","GLOBAL",5)
        FadeToColor([15.0],0)
        Wait(1)
        StartCutScene("ac#ct50B")~ EXIT
END

						CHAIN IF ~~ THEN AC#ELER2 elern_bye
						~Bitte... sprecht das jetzt hier nicht an, Kriegsmeister. Dass Beldas nicht mehr unter uns weilt, erfüllt viele mit Trauer, besonders mich. Dabei fällt mir ein - jemand sollte Beldas' Vater, Anthan Diamantklinge, von dem Tod seines Sohnes unterrichten. ~ 
						== AC#BRES1 ~Ihr wisst, dass dies bei uns immer die Aufgabe desjenigen ist, der den Gefallenen in seinem letzten Atemzug begleitet hat.~ 
						== AC#ELER2 ~Dies wäret dann Ihr, <CHARNAME>. Sucht bitte Anthan Diamantklinge, unseren Hohepriester Moradins, in der "Uralten Schmiede" im Westen der Stadt auf und unterrichtet ihn vom Tod seines Sohnes.~ 
						== AC#BRES1 ~Keine leichte Aufgabe, aber so will es unsere Tradition.~ 
						== AC#ELER2 ~Geht behutsam vor, <CHARNAME>. Anthan ist ohnehin schon ein verbitterter alter Zwerg.~ 
						== AC#ELER2 ~Ich werde wieder zurück ins Ratsgebäude gehen, <CHARNAME>, und versuchen, auf die anderen Mitglieder einzuwirken. Gehabt Euch wohl, <PRO_RACE> von der Oberfläche.~
						== AC#BRES1 ~Ich behalte hier unseren neuen "Gast" im Auge. Also, Ihr habt's gehört, <PRO_RACE>: Macht es Euch hier nicht allzu bequem, sondern macht Euch nützlich!~
						END
						IF ~~ THEN DO ~SetGlobal("AC#BreskWatches","ACIL50",2)
						AddJournalEntry(@51200,QUEST)
						SetGlobal("AC#BreskMoves02","ACIL50",1)
						ActionOverride("AC#ELER2",EscapeArea())
						~ EXIT
// ---------------------------------------------
// Bootschmied
// ---------------------------------------------

BEGIN ~AC#50BSM~

IF ~True()~ THEN BEGIN hello
  SAY ~Wir haben zwei Boote für Euch geschmiedet, <CHARNAME>. Wenn Ihr bereit seid, sprecht mit Ratsherrin Elern oder dem Kriegsmeister Bresk.~
  IF ~~ THEN REPLY ~Ich sehe keine Boote.~ GOTO where_are_boats
  IF ~~ THEN REPLY ~Gut. Habt Dank für Euren Einsatz.~ GOTO thank_you
END

	IF ~~ THEN BEGIN where_are_boats
	  SAY ~Wir können sie erst richtig direkt am See zusammensetzen. Einige Teile haben wir bei uns, andere werden durch Lastenaufzüge von den Wachtürmen vor der Stadt heruntergelassen. Vertraut uns, es ist alles vorbereitet.~
		IF ~~ THEN REPLY ~Gut. Habt Dank für Euren Einsatz.~ GOTO thank_you
	END	

	IF ~~ THEN BEGIN thank_you
			SAY ~He, Ihr rettet hier unsere Stadt! Da ist es uns eine Ehre, Euch zu helfen!~
	  IF ~~ THEN DO ~~ EXIT
	END

// ---------------------------------------------
// Crael, glowstone seller
// ---------------------------------------------

BEGIN ~AC#50STY~

IF ~GlobalGT("AboutGlowstone","ACIL50",0)~ THEN BEGIN hello_again
SAY ~Die Neuankömmlinge von der Oberfläche! Na, Interesse an einem Leuchtstein?~
IF ~PartyGoldGT(4)~ THEN REPLY ~Ich hätte gerne einen Leuchtstein.~ GOTO buy_glowstone   
IF ~PartyGoldLT(5)~ THEN REPLY ~Ich kann mir keinen Leuchtstein leisten.~ GOTO too_poor 
IF ~~ THEN REPLY ~Ich möchte keinen Leuchtstein kaufen.~ + bye  
END

	IF ~~ THEN BEGIN too_poor
	SAY ~Ihr seid ja ärmer wie eine Minenmaus! Nun denn, Verdient Geld, dann bekommt Ihr auch Euren Leuchtstein.~
	IF ~~ THEN EXIT 
	END

IF ~GlobalGT("AC#Arrested","GLOBAL",0)
Global("AboutGlowstone","ACIL50",0)~ THEN BEGIN hello_1
SAY ~Seid gegrüßt, Oberflächler! Crael, der Leuchtsteinverkäufer Iltkazars, zu Euren Diensten.~
IF ~~ THEN REPLY ~Was ist ein Leuchtstein?~ GOTO glowstone_01
END

	IF ~~ THEN BEGIN glowstone_01
	SAY ~Ein Leuchtstein ist ein natürlich leuchtender Kristall, den wir Styrnae nennen. So wie der Blaue neben mir. Ich habe sie durch verschiedene Flechten derart verändert, dass sie eine zeitlang schweben können. Wir benutzen die Steine, um dunkle Tunnel und Kavernen zu beleuchten und immer den Weg zurückzufinden.~
	IF ~~ THEN DO ~SetGlobal("AboutGlowstone","ACIL50",1)~ GOTO glowstone_02 
	END
	
		IF ~~ THEN BEGIN glowstone_02
		SAY ~Ich verkaufe die Steine hier. Die großen Styrnae sind nur den Patrouillen und Mineuren vorbehalten. Doch die Kristalle können Neuankömmlingen auch den Weg durch Iltkazar weisen! Ich habe verschiedene Sorten zur Auswahl, die Euch zu den verschiedenen Zitadellen führen können. Möchtet Ihr einen Stein kaufen?~
		IF ~~ THEN REPLY ~Was würde mir das bringen?~ GOTO why_glowstone
		END
		
			IF ~~ THEN BEGIN why_glowstone
			SAY ~Wenn Ihr Euch in der Stadt im Schlafe auskennt gar nichts. Wenn Ihr aber einmal nicht mehr wisst, wo Ihr hin sollt, ist ein Leuchtstein genau das Richtige. Ihr nennt mir Euer Ziel, ich gebe Euch den passenden Stein, und schon schwebt er los. Ihr müsst ihm nur hinterherlaufen. Die Magie hält nicht lange an, deshalb bewahre ich die Steine in speziellen Behältern auf. Sobald ich den Stein einmal herausgeholt habe, solltet Ihr ihm folgen. Möchtet Ihr das einmal ausprobieren? Kostet Euch nur fünf Goldmünzen.~
			IF ~PartyGoldGT(4)~ THEN REPLY ~Ich probiere es einmal aus und hätte gerne einen Leuchtstein.~ GOTO buy_glowstone 
			IF ~PartyGoldLT(5)~ THEN REPLY ~Ich kann mir keinen Leuchtstein leisten.~ GOTO too_poor
			IF ~~ THEN REPLY ~Ich möchte keinen Leuchtstein kaufen.~ + bye
			END
			
				IF ~~ THEN BEGIN buy_glowstone
				SAY ~Sehr gut! Wo soll's denn hingehen?~
				IF ~~ THEN REPLY ~In die Uralte Schmiede.~ GOTO move_acil51
				IF ~~ THEN REPLY ~In Haelas Hallen.~ GOTO move_acil52
				IF ~~ THEN REPLY ~Zu der Halle der Runensteine.~ GOTO move_acil53
				IF ~~ THEN REPLY ~Zum blutigen Bollwerk.~ GOTO move_acil54
				IF ~~ THEN REPLY ~Zur Arnschädelhalle.~ GOTO move_acil55
				IF ~~ THEN REPLY ~In die Bronzemaske.~ GOTO move_acil56
				IF ~~ THEN REPLY ~In die Halle der Omlare.~ GOTO move_acil58
				IF ~~ THEN REPLY ~In die Halle des Regentschaftsrates.~ GOTO move_acil62
				IF ~GlobalGT("AC#Vronia_Quest","GLOBAL",4)~ THEN REPLY ~Zum Tempel Oghmas.~ GOTO move_acil5o
				IF ~GlobalGT("AC#Vronia_Quest","GLOBAL",0)~ THEN REPLY ~Zu Vronias Haus.~ GOTO move_acil5Q
				IF ~GlobalGT("AC#Vronia_Quest","GLOBAL",2)~ THEN REPLY ~Zu Ellhimars Haus.~ GOTO move_acil5E
				IF ~~ THEN REPLY ~Könnt Ihr mich auch zu einer Person bringen?~ + search_person
				IF ~~ THEN REPLY ~Ich habe es mir anders überlegt und möchte doch keinen Leuchtstein kaufen.~ + bye
				END
				
				IF ~~ THEN BEGIN move_acil51
				SAY ~Zur Uralten Schmiede? Ihr wollt Moradin die Ehre erweisen, sehr klug! Nun denn, los gehts, macht dann fünf Goldmünzen, und schon erscheint Euer Styrnae!~
				IF ~~ THEN DO ~TakePartyGold(5)
				CreateCreature("AC#50G51",[-1.-1],10)~ EXIT 
				END
				
				IF ~~ THEN BEGIN move_acil52
				SAY ~Haelas Hallen! Nun denn, los gehts, macht dann fünf Goldmünzen, und schon erscheint Euer Styrnae!~
				IF ~~ THEN DO ~TakePartyGold(5)
				CreateCreature("AC#50G52",[-1.-1],10)~ EXIT 
				END
				
				IF ~~ THEN BEGIN move_acil53
				SAY ~Unsere Bibliothek ist ein guter Ort für einen Neuankömmling wie Euch. Nun denn, los gehts, macht dann fünf Goldmünzen, und schon erscheint Euer Styrnae!~
				IF ~~ THEN DO ~TakePartyGold(5)
				CreateCreature("AC#50G53",[-1.-1],10)~ EXIT 
				END
				
				IF ~~ THEN BEGIN move_acil54
				SAY ~Das blutige Bollwerk, Kopfschmerzen inklusive! Nun denn, los gehts, macht dann fünf Goldmünzen, und schon erscheint Euer Styrnae!~
				IF ~~ THEN DO ~TakePartyGold(5)
				CreateCreature("AC#50G54",[-1.-1],10)~ EXIT 
				END
				
				IF ~~ THEN BEGIN move_acil55
				SAY ~Die Arnschädelhalle? Was will ein <RACE> wie Ihr denn an solch einem Ort? Nun denn, los gehts, macht dann fünf Goldmünzen, und schon erscheint Euer Styrnae!~
				IF ~~ THEN DO ~TakePartyGold(5)
				CreateCreature("AC#50G55",[-1.-1],10)~ EXIT 
				END
				
				IF ~~ THEN BEGIN move_acil56
				SAY ~Die Bronzemaske? Ich warne Euch: Die Wächter dort verstehen alles, nur keinen Spaß. Nun denn, los gehts, macht dann fünf Goldmünzen, und schon erscheint Euer Styrnae!~
				IF ~~ THEN DO ~TakePartyGold(5)
				CreateCreature("AC#50G56",[-1.-1],10)~ EXIT 
				END
				
				IF ~~ THEN BEGIN move_acil58
				SAY ~Die Halle der Omlare? Wollt Euch wohl unsere Krypten ansehen, was? Nun denn, los gehts, macht dann fünf Goldmünzen, und schon erscheint Euer Styrnae!~
				IF ~~ THEN DO ~TakePartyGold(5)
				CreateCreature("AC#50G58",[-1.-1],10)~ EXIT 
				END
				
				IF ~~ THEN BEGIN move_acil62
				SAY ~Ihr findet nicht alleine die Halle des Regentschaftsrates? Also Ihr seid mir ja einer. Nun denn, los gehts, macht dann fünf Goldmünzen, und schon erscheint Euer Styrnae!~
				IF ~~ THEN DO ~TakePartyGold(5)
				CreateCreature("AC#50G62",[-1.-1],10)~ EXIT 
				END
				
				IF ~~ THEN BEGIN move_acil5o
				SAY ~Oghma? Als gäbe es hier nicht schon genug Wissen. Muss es denn unbedingt ein Menschengott sein? Nun denn, los gehts, macht dann fünf Goldmünzen, und schon erscheint Euer Styrnae!~
				IF ~~ THEN DO ~TakePartyGold(5)
				CreateCreature("AC#50G5o",[-1.-1],10)~ EXIT 
				END
				
				IF ~~ THEN BEGIN move_acil5Q
				SAY ~Unsere liebe Runenwirkerin Vronia ist wirklich immer einen Besuch wert. Nun denn, los gehts, macht dann fünf Goldmünzen, und schon erscheint Euer Styrnae!~
				IF ~~ THEN DO ~TakePartyGold(5)
				CreateCreature("AC#50G5Q",[-1.-1],10)~ EXIT 
				END
				
				IF ~~ THEN BEGIN move_acil5E
				SAY ~Brr.. Magier, die noch dazu Menschen sind, sind so gar nicht meine Sache. Aber das müsst Ihr von Oberfläche ja besser wissen. Nun denn, los gehts, macht dann fünf Goldmünzen, und schon erscheint Euer Styrnae!~
				IF ~~ THEN DO ~TakePartyGold(5)
				CreateCreature("AC#50G5E",[-1.-1],10)~ EXIT 
				END
				
					IF ~~ THEN BEGIN search_person
					SAY ~Eine bestimmte Person wird schwierig. Das geht nur bei solchen, von denen ich weiß, wo sie sich aufhalten. Wen sucht Ihr denn?~
					IF ~GlobalGT("AC#Vronia_Quest","GLOBAL",0)~ THEN REPLY ~Ich suche Vronia.~ + search_vronia
					IF ~~ THEN REPLY ~Ich suche dann doch lieber nach einem Ort in Iltkazar.~ + buy_glowstone
					IF ~~ THEN REPLY ~Ich habe es mir anders überlegt und möchte doch keinen Leuchtstein kaufen.~ + bye
					END
					
						IF ~~ THEN BEGIN search_vronia
						SAY ~Vronia ist entweder in ihrem Haus oder im Regentschaftsrat. Dafür würde ich keinen Stein verschwenden, wenn Ihr Euch nicht sicher seid, wo sie ist.~
						IF ~~ THEN REPLY ~Ich habe es mir anders überlegt und möchte doch keinen Leuchtstein kaufen.~ + bye
						IF ~~ THEN REPLY ~Ich suche eine andere Person.~ + search_person
						IF ~~ THEN REPLY ~Ich suche dann doch lieber nach einem Ort in Iltkazar.~ + buy_glowstone
						END
				
				IF ~~ THEN BEGIN bye
				SAY ~Wie Ihr möchtet. Ihr wisst, wo ich zu finden bin, solltet Ihr Eure Meinung einmal ändern.~
				IF ~~ THEN EXIT
				END

IF ~Global("AC#Arrested","GLOBAL",0)~ THEN BEGIN hello_0
SAY ~Ich kenne Euch nicht. Solange Euch der Rat nicht gesehen hat, kann ich nichts für Euch tun.~
IF ~~ THEN EXIT
END

// ---------------------------------------------
// Dulman Ironrist, town guide
// ---------------------------------------------

BEGIN ~AC#50TGU~

IF ~NumTimesTalkedToGT(0)~ THEN BEGIN hello_locations
SAY ~Schön, Euch wiederzusehen, <RACE>! Wie kann ich Euch helfen?~
IF ~~ THEN REPLY ~Warum kann ich alle hier in der Stadt so gut verstehen, obwohl ich von der Oberfläche komme?~ + understand
IF ~~ THEN REPLY ~Welche Zitadellen gibt es hier?~ GOTO citadels
IF ~~ THEN REPLY ~Ihr besitzt doch hier sicher gute Schmiede. Wo kann ich Waffen kaufen?~ + weapon_shops
IF ~~ THEN REPLY ~Ich suche Rüstungen und Schilde.~ + armor_shops
IF ~~ THEN REPLY ~Ich benötige Heilung.~ + need_healing
IF ~~ THEN REPLY ~Ich suche nach magischen Schriftrollen und dergleichen.~ + scrolls
IF ~~ THEN REPLY ~Zeigt mir Bitte einen guten Ort zum Ausruhen.~ + rest
IF ~~ THEN REPLY ~Wo kann ich meinen Vorrat an Tränken aufstocken?~ + potionseller
IF ~Global("AC#Vronia_Quest","GLOBAL",5)~ THEN REPLY ~Ich suche den Tempel des Oghma.~ + seek_oghma_temple
IF ~~ THEN REPLY ~Ich verabschiede mich wieder von Euch.~ GOTO bye
END

IF ~~ THEN BEGIN locations
SAY ~Aber natürlich! Was möchtet Ihr wissen?~
IF ~~ THEN REPLY ~Warum kann ich alle hier in der Stadt so gut verstehen, obwohl ich von der Oberfläche komme?~ + understand
IF ~~ THEN REPLY ~Welche Zitadellen gibt es hier?~ GOTO citadels
IF ~~ THEN REPLY ~Ihr besitzt doch hier sicher gute Schmiede. Wo kann ich Waffen kaufen?~ + weapon_shops
IF ~~ THEN REPLY ~Ich suche Rüstungen und Schilde.~ + armor_shops
IF ~~ THEN REPLY ~Ich benötige Heilung.~ + need_healing
IF ~~ THEN REPLY ~Ich suche nach magischen Schriftrollen und dergleichen.~ + scrolls
IF ~~ THEN REPLY ~Zeigt mir Bitte einen guten Ort zum Ausruhen.~ + rest
IF ~~ THEN REPLY ~Wo kann ich meinen Vorrat an Tränken aufstocken?~ + potionseller
IF ~Global("AC#Vronia_Quest","GLOBAL",5)~ THEN REPLY ~Ich suche den Tempel des Oghma.~ + seek_oghma_temple
IF ~Global("AC#Vronia_Quest","GLOBAL",7)~ THEN REPLY ~Ich suche Sorni Arnschädel.~ + seek_sorni_01
IF ~~ THEN REPLY ~Ich verabschiede mich wieder von Euch.~ GOTO bye
END

	IF ~~ THEN BEGIN seek_sorni_01
	SAY ~Oh! Sorni! Da müsst Ihr aber aufpassen! Die hat ganz schön Hizagkuur auf den Zähnen!~
	IF ~~ THEN REPLY ~Was ist Hizagkuur?~ GOTO hizagkuur_01
	IF ~~ THEN REPLY ~Ich muss sie trotzdem finden.~ + seek_sorni_02 
	END
	
		IF ~~ THEN BEGIN hizagkuur_01
		SAY ~Ein seltenes Metall, das wir hier in der Stadt verarbeiten. Es ist elektrisch geladen. Jeder, der unvorsichtig damit umgeht, bekommt eine geschmiert. Wie bei Sorni.~
		IF ~~ THEN REPLY ~Ich muss sie trotzdem finden.~ + seek_sorni_02 
		END
		
		IF ~~ THEN BEGIN seek_sorni_02
		SAY ~Wie Ihr meint! Sie ist meistens in einer der großen Schmiedehallen des Arnschädel-Clans. Ihr müsst am Fluss entlang Richtung Westen gehen und die Brücke überqueren. Dann geht Ihr in die Arnschädel-Halle herunter. Meist müsst Ihr noch einen Stock tiefer in die Azerkyn-Halle, wo sie meistens die Arbeit an den großen Hochöfen überwacht.~
		IF ~~ THEN REPLY ~Ich würde gerne noch etwas anderes fragen.~ + locations
		IF ~~ THEN REPLY ~Danke für die Auskunft. Ich verabschiede mich wieder von Euch.~ GOTO bye
		END

	IF ~~ THEN BEGIN seek_oghma_temple
	SAY ~Dieses Gebäude ist wahrlich schwer zu finden! Der Tempel dieses Menschengottes liegt ganz im Südosten unserer Stadt. Am Besten, Ihr geht hier die große Treppe herunter, dann nach Osten in Richtung des "Blutigen Bollwerk", dann weiter östlich die Treppen herauf und bei den großen Kristallen wieder die Treppe herunter. Dann steht Ihr direkt vor dem Gebäude.~
	IF ~~ THEN REPLY ~Ich würde gerne etwas anderes fragen.~ + locations
	IF ~~ THEN REPLY ~Ich verabschiede mich wieder von Euch.~ GOTO bye
	END

	IF ~~ THEN BEGIN weapon_shops
	SAY ~Die meisten Läden für solche Dinge findet Ihr in der Zitadelle "Zum Blutigen Bollwerk" im Südosten von hier.~
	IF ~~ THEN REPLY ~Vielen Dank für Eure Antwort. Nun muss ich weiterziehen.~ GOTO bye
	IF ~~ THEN REPLY ~Ich würde gerne etwas anderes fragen.~ + locations
	END
	
	IF ~~ THEN BEGIN armor_shops
	SAY ~Neben den Läden im "Blutigen Bollwerk" könnt Ihr auch einmal in unseren verschiedenen Tempeln vorbeisehen, die alle Rüstungen und Schilde verschiedener Ausführung zum Verkauf anbieten.~
	IF ~~ THEN REPLY ~Vielen Dank für Eure Antwort. Nun muss ich weiterziehen.~ GOTO bye
	IF ~~ THEN REPLY ~Ich würde gerne etwas anderes fragen.~ + locations
	END
	
	IF ~~ THEN BEGIN need_healing
	SAY ~Die Segnungen unserer Tempel stehen Euch sicher immer zur Verfügung! Ihr könnt unsere Priester in der Uralten Schmiede, der Bronzemaske, Haelas Hallen und in der Halle der Omlare aufsuchen, um Heilung zu erbitten.~
	IF ~~ THEN REPLY ~Vielen Dank für Eure Antwort. Nun muss ich weiterziehen.~ GOTO bye
	IF ~~ THEN REPLY ~Erzählt mir über die Uralte Schmiede.~ GOTO ancient_forge
	IF ~~ THEN REPLY ~Erzählt mir über die Bronzemaske.~ GOTO bronzemask
	IF ~~ THEN REPLY ~Was sind Haelas Hallen?~ GOTO haelas_halls
	IF ~~ THEN REPLY ~Halle der Omlare?~ GOTO hall_of_omlars
	IF ~~ THEN REPLY ~Ich würde gerne etwas anderes fragen.~ + locations
	END

	IF ~~ THEN BEGIN scrolls
	SAY ~Magie? So etwas haben wir hier nicht, bedaure. Wobei - ich hörte, dass irgendwer von außerhalb solche Dinge hier zum Verkauf anbietet... Ich weiß leider nur nicht mehr, wer das gewesen sein könnte. Da müsst Ihr Euch selbst auf die Suche machen.~
	IF ~~ THEN REPLY ~Vielen Dank für Eure Antwort. Nun muss ich weiterziehen.~ GOTO bye
	IF ~~ THEN REPLY ~Ich würde gerne etwas anderes fragen.~ + locations
	END
	
	IF ~~ THEN BEGIN rest
	SAY ~Da kann ich Euch den "Zwitschernden Kanarienvogel" empfehlen. Er befindet sich in der Zitadelle "Zum Blutigen Bollwerk".~
	IF ~~ THEN REPLY ~Vielen Dank für Eure Antwort. Nun muss ich weiterziehen.~ GOTO bye
	IF ~~ THEN REPLY ~Das "Blutige Bollwerk"?~ GOTO bulwark
	IF ~~ THEN REPLY ~Ich würde gerne etwas anderes fragen.~ + locations
	END
	
	IF ~~ THEN BEGIN potionseller
	SAY ~Ein Tiefengnom namens Chiksul Braustein betreibt in der Zitadelle "Zum Blutigen Bollwerk" einen Alchemistenladen.~
	IF ~~ THEN REPLY ~Vielen Dank für Eure Antwort. Nun muss ich weiterziehen.~ GOTO bye
	IF ~~ THEN REPLY ~Das "Blutige Bollwerk"?~ GOTO bulwark
	IF ~~ THEN REPLY ~Hier leben auch Tiefengnome?~ + deep_gnomes
	IF ~~ THEN REPLY ~Ich würde gerne etwas anderes fragen.~ + locations
	END
	
		IF ~~ THEN BEGIN deep_gnomes
		SAY ~Hier leben viele Tiefengnome! Ihr Anführer ist Schnotlell Samrynarr, der einen Tempel zu ehren ihres Gottes Gaerdal in der Zitadelle zur Bronzemaske betreibt.~
		IF ~~ THEN REPLY ~Vielen Dank für Eure Antwort. Nun muss ich weiterziehen.~ GOTO bye
		IF ~~ THEN REPLY ~Erzählt mir über die Bronzemaske.~ GOTO bronzemask
		IF ~~ THEN REPLY ~Ich würde gerne etwas anderes fragen.~ + locations
		END
	
	IF ~~ THEN BEGIN understand
	SAY ~Iltkazar wird beschützt durch mächtige Runen. Einige dieser Runen enthalten Zauber, die es uns ermöglichen, jede Sprache der Reiche zu verstehen. Dies verbessert den Handel und unsere Sicherheit.~
	IF ~~ THEN REPLY ~Vielen Dank für Eure Antwort. Nun muss ich weiterziehen.~ GOTO bye
	IF ~~ THEN REPLY ~Ich habe Fragen zu weiteren Orten in Iltkazar.~ + locations
	END

	IF ~~ THEN BEGIN citadels
	SAY ~Wir haben hier sieben große Zitadellen, die alle unterschiedlichen Clans gehören. Von West nach Ost sind das die Arnschädelhalle, die Uralte Schmiede, die Bronzemaske, das Blutige Bollwerk, Haelas Hallen, die Halle der Runensteine und die Halle der Omlare.~
	IF ~~ THEN REPLY ~Erzählt mir über die Arnschädelhalle.~ GOTO hall_of_arnskulls
	IF ~~ THEN REPLY ~Erzählt mir über die Uralte Schmiede.~ GOTO ancient_forge
	IF ~~ THEN REPLY ~Erzählt mir über die Bronzemaske.~ GOTO bronzemask
	IF ~~ THEN REPLY ~Das "Blutige Bollwerk"?~ GOTO bulwark
	IF ~~ THEN REPLY ~Was sind Haelas Hallen?~ GOTO haelas_halls
	IF ~~ THEN REPLY ~Mich interessiert die Halle der Runensteine.~ GOTO hall_of_runestones
	IF ~~ THEN REPLY ~Halle der Omlare?~ GOTO hall_of_omlars
	END
	
		IF ~~ THEN BEGIN hall_of_arnskulls
		SAY ~Die Arnschädelhalle liegt ganz im Westen der Stadt, jenseits der Brücke über den Dhalnadar-Fluss. Sie gehört Clan Arnschädel und beherbergt die größten Schmieden und Schmelzöfen unserer Stadt.~
		IF ~~ THEN REPLY ~Ich möchte über eine andere Zitadelle reden.~ GOTO citadels
		IF ~~ THEN REPLY ~Ich habe Fragen zu weiteren Orten in Iltkazar.~ + locations
				IF ~~ THEN REPLY ~Vielen Dank für Eure Antwort. Nun muss ich weiterziehen.~ GOTO bye
		END
		
		IF ~~ THEN BEGIN ancient_forge
		SAY ~Die Uralte Schmiede liegt im Westen der Stadt, in der Nähe unserer Flüsse. Sie ist das Zentrum der Verehrung von Moradin, unseres Allvaters. In Ihr lebt und arbeitet Clan Diamantklinge.~ 
		IF ~~ THEN REPLY ~Ich möchte über eine andere Zitadelle reden.~ GOTO citadels
		IF ~~ THEN REPLY ~Ich habe Fragen zu weiteren Orten in Iltkazar.~ + locations
		IF ~~ THEN REPLY ~Vielen Dank für Eure Antwort. Nun muss ich weiterziehen.~ GOTO bye
		END
		
		IF ~~ THEN BEGIN bronzemask
		SAY ~Die Bronzemaske befindet sich im Nordwesten, neben dem Drakkalor-Tor. Nicht ganz zufällig hat sich Clan Steinschulter diesen Ort ausgesucht, ist doch das Drakkalor-Tor in der Vergangenheit immer Einfallstor für allerlei Gesindel gewesen. Clan Steinschulter ist betraut mit dem Schutz unserer schönen Stadt. In der Zitadelle befindet sich ein großer Tempel zu Ehren unseres Gottes Gorm, des Beschützers.~ 
		IF ~~ THEN REPLY ~Ich möchte über eine andere Zitadelle reden.~ GOTO citadels
		IF ~~ THEN REPLY ~Ich habe Fragen zu weiteren Orten in Iltkazar.~ + locations
		IF ~~ THEN REPLY ~Vielen Dank für Eure Antwort. Nun muss ich weiterziehen.~ GOTO bye
		END
		
		IF ~~ THEN BEGIN bulwark
		SAY ~He, wir sind eine Zwergenstadt, oder? Wir haben zwar viele Bücherwürmer, aber auch mindestens genau so viele tapfere Krieger, die sich nach einem langen Tag in den Tunneln einfach nur mit Met und Bier vollsaufen möchten. Dafür ist das Blutige Bollwerk da. Daneben gibt es in dieser Zitadelle auch noch Betten für Gäste und Läden, in denen Ihr Euch mit Ausrüstung eindecken könnt. Das "Blutige Bollwerk" liegt im Süden der Stadt, neben der Brücke zum Ultoksamrin-Tor.~ 
		IF ~~ THEN REPLY ~Ich möchte über eine andere Zitadelle reden.~ GOTO citadels
		IF ~~ THEN REPLY ~Ich habe Fragen zu weiteren Orten in Iltkazar.~ + locations
		IF ~~ THEN REPLY ~Vielen Dank für Eure Antwort. Nun muss ich weiterziehen.~ GOTO bye
		END
		
		IF ~~ THEN BEGIN haelas_halls
		SAY ~Haelas Hallen liegen südöstlich von hier. Ein großer Tempel zu Ehren von Haela Leuchtaxt gibt dieser Zitadelle ihren Namen. Neben diesem Tempel findet Ihr dort auch einen Kristallgarten und einen Tempel Sharindlars, den wir "Den Gnädigen Hof" nennen. Unser Archivar Shagretor betreibt dort eine Ausstellung, in der er die glorreiche Geschichte Shanatars darstellt.~ 
		IF ~~ THEN REPLY ~Ich möchte über eine andere Zitadelle reden.~ GOTO citadels
		IF ~~ THEN REPLY ~Ich habe Fragen zu weiteren Orten in Iltkazar.~ + locations
		IF ~~ THEN REPLY ~Vielen Dank für Eure Antwort. Nun muss ich weiterziehen.~ GOTO bye
		END
		
		IF ~~ THEN BEGIN hall_of_runestones
		SAY ~Oh ja, danach fragen viele. Die Halle der Runensteine ist unsere große Bibliothek, die von Clan Abgrundlied betrieben wird. Sie ist gleich neben der Halle des Regentschaftsrates östlich von hier. Wenn Ihr irgendwelche alten Schriften wälzen wollt, hilft Euch einer der Bibliothekare gerne weiter.~ 
		IF ~~ THEN REPLY ~Ich möchte über eine andere Zitadelle reden.~ GOTO citadels
		IF ~~ THEN REPLY ~Ich habe Fragen zu weiteren Orten in Iltkazar.~ + locations
		IF ~~ THEN REPLY ~Vielen Dank für Eure Antwort. Nun muss ich weiterziehen.~ GOTO bye
		END

		IF ~~ THEN BEGIN hall_of_omlars
		SAY ~Omlare sind die besonderen Edelsteine, die wir hier abbauen. Die Halle der Omlare ist - neben unserem Thronsaal - in die reichsten Vorkommen dieser seltenen Mineralien hineingebaut. Der ganze Komplex ist dem Schutzpatron aller Schildzwerge, Dumathoin, gewidmet. Da der Hüter unter dem Berge auch über unsere Toten wacht, liegen unter der Halle der Omlare unsere Krypten. Unser Hoher Omlar Turbaern Ghalmrin ist der Hohepriester Dumathoin und steht dieser Zitadelle vor. Tief unter dieser Höhle sollen sich in der Halle der Omlare auch die mächtigsten Runensteine befinden, die unsere Stadt vor Eindringlingen schützen.~ 
		IF ~~ THEN REPLY ~Ich möchte über eine andere Zitadelle reden.~ GOTO citadels
		IF ~~ THEN REPLY ~Ich habe Fragen zu weiteren Orten in Iltkazar.~ + locations
		IF ~~ THEN REPLY ~Vielen Dank für Eure Antwort. Nun muss ich weiterziehen.~ GOTO bye
		END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
SAY ~Oh! Hallo! Neu in der Stadt?~
IF ~~ THEN REPLY ~Ja.~ GOTO new_in_town
IF ~~ THEN REPLY ~Ein wenig.~ GOTO new_in_town
IF ~~ THEN REPLY ~Bin nur auf der Durchreise.~ GOTO new_in_town
END

	IF ~~ THEN BEGIN new_in_town
	SAY ~Es kommen nicht oft Fremde hierher. Vor allem nicht solche von Oben.~
	IF ~~ THEN REPLY ~Wer seid Ihr?~ GOTO who_are_you
	IF ~~ THEN REPLY ~Bin auch nicht ganz freiwillig hier.~ GOTO trader
	IF ~~ THEN REPLY ~Dahin möchte ich auch schnell wieder zurück. Lebt wohl.~ GOTO bye
	END
	
		IF ~~ THEN BEGIN who_are_you
		SAY ~Ich? Ich bin Dulman vom Clan Eisenriss.~
		IF ~~ THEN REPLY ~Was macht Ihr hier?~ GOTO trader
		IF ~~ THEN REPLY ~Mehr wollte ich nicht wissen. Lebt wohl.~ GOTO trader
		END
		
			IF ~~ THEN BEGIN trader
			SAY ~In Zeiten, in denen unser König noch wach war, überwachte ich den Handel in dieser Stadt. Nur seit sich der König nicht mehr regt, gibt es für mich nicht viel hier zu tun. Die Stadt ist ausgestorben. Viele sind weggezogen, in die großen Zitadellen im Norden, weil es hier nicht mehr sicher ist. Und Karawanen aus den anderen Städten des Unterreichs kommen hier längst nicht mehr vorbei.~
			IF ~~ THEN GOTO sightseeing
			END
			
			IF ~~ THEN BEGIN sightseeing
			SAY ~Aber he, wenn Ihr Mühe habt, Euch in der Stadt zurechtzufinden, könnte ich Euch helfen!~
			IF ~~ THEN REPLY ~Wie könnt Ihr mir dabei helfen?~ GOTO sightseeing_02 
			IF ~~ THEN REPLY ~Ich komme bei Gelegenheit darauf zurück.~ GOTO bye 
			END
			
				IF ~~ THEN BEGIN sightseeing_02
				SAY ~Ich kenne jeden Winkel in diesen Höhlen. Schließlich war es meine Aufgabe, die Händler in die jeweiligen Zitadellen zu weisen. Wenn Ihr nicht wisst, wo Ihr hinwollt, wendet Euch an mich.~
				IF ~~ THEN REPLY ~Ich werde das beherzigen. Vorerst muss ich weiterziehen.~ GOTO bye
				IF ~~ THEN REPLY ~Ich habe Fragen zu Orten in Iltkazar.~ + locations
				END
		
		IF ~~ THEN BEGIN bye
		SAY ~Natürlich! Und denkt daran: "Wenn Ihr nicht mehr weiterwisst, fragt einfach Dulman Eisenriss."~
		IF ~~ THEN EXIT 
		END

//----------------------------------------
// CHAIN
// ---------------------------------------
			CHAIN AC#ELER6 chain_yes_talked_to_anthan_02
			~Das ist gut! Jetzt werden wir dem Schlaf Mith Baraks einen entscheidenden Schritt näher kommen.~
			== AC#BRES1 ~Nur damit Ihr's wisst: Ich werde bald befehlen, alle Tore Iltkazars zu verriegeln. Es wird unruhig draußen im Unterreich. Die Streitmacht der Duergar nähert sich. Ihr solltet sehen, dass Ihr hier in der Stadt alles Wichtige erledigt und dann schleunigst an die Oberfläche aufbrechen.~
			END
			IF ~~ THEN REPLY ~Soll ich Euch im anstehenden Kampf gegen die Grauzwerge nicht besser helfen?~ EXTERN AC#BRES1 chain_help_with_duergar	
			IF ~~ THEN REPLY ~Ich habe nicht die Absicht, vor ein paar Grauzwergen davonzulaufen.~ EXTERN AC#BRES1 chain_help_with_duergar	
			IF ~~ THEN REPLY ~Schade. Ein Krieg vor den Toren hätte die Stimmung etwas aufgelockert.~ EXTERN AC#BRES1 chain_help_with_duergar	
			IF ~~ THEN REPLY ~Dann sollte ich wohl keine Zeit verlieren.~ EXTERN AC#ELER6 do_you_know_how_to_get_to_dragoncem	
			IF ~~ THEN REPLY ~Verstehe. Ich werde meine Angelegenheiten in Iltkazar rasch zu Ende bringen.~ EXTERN AC#ELER6 do_you_know_how_to_get_to_dragoncem	

			CHAIN AC#BRES1 chain_help_with_duergar
			~Pah! Damit kommen wir schon alleine zurecht. Ihr helft uns mehr, wenn Ihr an der Oberfläche nach diesem... diesem scheußlichen Drachenfriedhof sucht.~
			END
			IF ~~ THEN EXTERN AC#ELER6 do_you_know_how_to_get_to_dragoncem
						
			CHAIN AC#ELER6 do_you_know_how_to_get_to_dragoncem
			~Wisst Ihr, wo sich dieser Drachenfriedhof befindet? Dies wird Euer nächster Schritt sein.~ 
			END
			IF ~~ THEN REPLY ~Es soll in diesem Buch stehen. Allerdings scheint es in sehr altem Zwergisch verfasst zu sein.~ EXTERN AC#BRES1 elern_knows_to_read_book
			
			CHAIN AC#BRES1 elern_knows_to_read_book
			~Da seid Ihr bei Elern genau richtig. Sie ist schließlich in einer Bibliothek aufgewachsen!~
			== AC#ELER6 ~Bresk hat nicht ganz unrecht. Lasst mich einmal das Buch sehen...~
			END
			IF ~~ THEN DO ~TakePartyItem("AC#BOOKB")~ EXTERN AC#ELER6 elern_knows_to_read_book_02
			
			CHAIN AC#ELER6 elern_knows_to_read_book_02
			~Hmm... Das ist zu schaffen. Ein dicker Wälzer, aber übersichtlich geordnet. Ja, ich denke, dass wir den Ort schnell herausfinden werden.~ 
			END
			IF ~~ THEN EXTERN AC#ELER6 mother_talk_back_surface
			
			CHAIN AC#ELER6 mother_talk_back_surface
			~Habt Ihr denn eigentlich mit meiner Mutter gesprochen, wie Ihr wieder zurück an die Oberfläche gelangen könntet?~
			END
			IF ~OR(2)
			PartyHasItem("AC#DRFT2")
			GlobalGT("AC#Driftdisc","GLOBAL",0)~ THEN REPLY ~Ja. Ich habe mit der Hilfe Eurer Mutter eine Drow-Schwebescheibe repariert, mit der ich an die Oberfläche zurückkehren kann.~ EXTERN AC#ELER6 yes_ready_for_back_to_surface
			IF ~Global("AC#Driftdisc","GLOBAL",0) !PartyHasItem("AC#DRFT2")~ THEN REPLY ~Nein, noch nicht. Ich suche immer noch nach einer Möglichkeit, zurück an die Oberfläche zu gelangen.~ EXTERN AC#ELER6 not_ready_for_back_to_surface
			
			CHAIN AC#ELER6 not_ready_for_back_to_surface
			~Wie bereits erwähnt; sprecht mit meiner Mutter Dorna Abgrundlied in Dugmarens Tempel in unserer Bibliothek, der Halle der Runensteine. Wir werden solange hier am Platz auf Euch warten.~
			END
			IF ~~ THEN DO ~SetGlobal("WaitForDriftdisc","ACIL50",1)~ EXIT			
		
			CHAIN AC#ELER6 yes_ready_for_back_to_surface
			~Das ist gut! Ich wünsche unserer Stadt und unserem König, dass Ihr bald mit Antworten wieder zu uns zurückkehren werdet.~
			=
			~Wir würden Euch gerne gebührend verabschieden. Rüstet Euch für den Rückweg gut aus. Sprecht Bresk an, wenn Ihr fertig seid. Er wird uns Bescheid sagen und wir werden Euch alle Lebewohl sagen. Ich hoffe, dass ich bis dahin auch das Buch in neues Zwergisch übersetzt habe und Euch sagen kann, wohin Euch der Weg zum Drachenfriedhof führen wird.~
			END
			IF ~~ THEN DO ~SetGlobal("AC#Goodbye_Iltkazar","GLOBAL",1)
			AddJournalEntry(@64300,QUEST)~ EXIT	
			
			CHAIN AC#BRES1 chain_reveal_dragoncem
			~Elern, Ihr solltet <CHARNAME> nun sagen, wo er an der Oberfläche nach diesem Drachenfriedhof suchen soll. Er kann ja schließlich nicht im Dunkeln tappen.~
			== AC#ELER6 ~Aber natürlich, <CHARNAME>. Also hört gut zu.~
			END
			IF ~~ THEN EXTERN AC#ELER6 cloudpeaks_01
			
			CHAIN AC#ELER6 cloudpeaks_01
			~Es war leicht zu finden, da sich Mith Barak an der betreffenden Stelle zahlreiche Notizen gemacht hatte.~
			=
			~Der Drachenfriedhof liegt am Rande eines Gebirges, welches Borthun als "Die Wolkengipfel" bezeichnet.~
			== AC#BRES1 ~Ein garstiger Name!~
			== AC#ELER6 ~Kennt Ihr vielleicht dieses Gebirge?~
			END
			IF ~~ THEN REPLY ~Die Wolkengipfel? Aber natürlich!~ EXTERN AC#ELER6 cloudpeaks_02
			IF ~~ THEN REPLY ~Natürlich kenne ich sie. Man muss schon sein ganzes Leben unter einem Stein verbracht haben, um noch nie von ihnen gehört zu haben.~ EXTERN AC#ELER6 cloudpeaks_02
			IF ~~ THEN REPLY ~Wer kennt sie nicht? Sie sind an der Oberfläche kaum zu übersehen.~ EXTERN AC#ELER6 cloudpeaks_02
			
			CHAIN AC#ELER6 cloudpeaks_02
			~Das ist ja fantastisch!~
			=
			~Bei den Wolkengipfeln gibt es im Osten einen Gebirgsausläufer, der nur als "der Grat" bezeichnet wird. Dieser Ort war früher den Elfen heilig, denn dort erschlug Tethir, der erste Drachentöter, vor vielen Jahrtausenden zwei Rote Drachen. Die zwei Skelette der ersten erschlagenen Drachen sollen sich noch immer an diesem Ort befinden.~
			=
			~Dort soll jedoch auch ein alter Tempel eines alten Drachengottes gelegen sein. Borthun berichtet, dass sich früher Drachen zum Sterben an diesen Ort zurückgezogen haben. Warum, sagt er nicht.~
			== AC#BRES1 ~Na, da bleibe ich doch lieber in meinem schönen, sicheren Unterreich.~
			== AC#ELER6 ~Jedenfalls muss dies der Ort sein, den Ihr aufsuchen müsst. Mith Barak war überzeugt, dass dort die Ursache seines Schlafes beseitigt werden könne.~
			END
			IF ~~ THEN DO ~RevealAreaOnMap("ACIL70")~ EXTERN AC#BRES1 ready_to_leave_03

CHAIN IF ~~ THEN AC#ELER2 chain_ruvan
~Der Rat ist der Meinung, dass Eure Männer hier zur Verteidigung der Stadt benötigt werden.~
== AC#BRES1 ~Pah! Es gibt einen einfachen Grund, warum mein Vater, mein Bruder und ich die Verteidigung dieser Stadt übernehmen. Die Hände meines Onkels Ruvan taugen doch nur zum Gold zählen!~
== AC#ELER2 ~Ich hätte ebenfalls anders entschieden, Bresk. Aber der Beschluss steht.~
== AC#BRES1 ~Nun, <CHARNAME>, ich habe meine Meinung über Euch ohnehin geändert. Ihr seid ein feiner <PRO_RACE> und könnt gut auf Euch selbst aufpassen. Ich traue Euch zu, auch mit schlechter Begleitung heil zurückzukommen.~
== AC#ELER2 ~Dann sind wir uns zumindest darin einig. Sind alle bereit aufzubrechen?~
== AC#50BSM ~Wir sind bereit.~
== AC#BRES1 ~Bereit. Hört zu, <CHARNAME>: Mein Bruder Hathar bringt Euch vor den versiegelten Bereich und räumt den Weg frei. Ihr beseitigt die Kuo-Toa und legt den Steinkreis still. Wir folgen mit den Booten und sichern den Rückweg. Danach treffen wir uns am Seeufer und lassen die Boote zu Wasser.~
END
IF ~~ THEN EXTERN ~AC#ELER2~ start_barakuir_adventure

/*
// Chain after Ellhimar mirror quest, Ellhimar alive and kidnapped
CHAIN IF ~Global("AC#EllhimarGith","GLOBAL",2)
Global("AC#GithKillEllhimar","GLOBAL",0)~ THEN AC#VRON7 chain_ellhimar_alive_gith
~Bresk! Was ist hier gerade passiert?~
== AC#BRES7 ~Githyanki sind in die Stadt eingedrungen. Sie haben Ellhimar!~
== AC#GROM7 ~Wie konnten unsere Runen so etwas zulassen?~
== AC#BETT7 ~Sie sind durch Ellhimars Spiegel gekommen, richtig?~
== AC#BRES7 ~So ist es. Der Spiegel ist jetzt zerstört, die Gith mit dem Magier verschwunden.~
== AC#GROM7 ~Weshalb bei den Neun Höllen hatte Ellhimar den Spiegel wieder in Gang gesetzt?~
END
IF ~~ THEN REPLY ~Er wollte mir durch den Spiegel etwas zeigen. Er schien herausgefunden zu haben, wer für Mith Baraks Zustand verantwortlich ist.~ EXTERN ~AC#BETT7~ ellhimar_mirror_01 

// Chain after Ellhimar mirror quest, Ellhimar dead 
CHAIN IF ~Global("AC#EllhimarGith","GLOBAL",2)
Global("AC#GithKillEllhimar","GLOBAL",1)~ THEN AC#VRON7 chain_ellhimar_dead_gith
~Bresk! Was ist hier gerade passiert?~
== AC#BRES7 ~Githyanki sind in die Stadt eingedrungen. Sie haben Ellhimar getötet!~
== AC#GROM7 ~Bei den Göttern!~
== AC#VRON7 ~Oh nein! Der arme Magier!~
== AC#BETT7 ~Sie sind durch Ellhimars Spiegel gekommen, richtig?~
== AC#BRES7 ~So ist es. Der Spiegel ist jetzt zerstört, die Gith verschwunden und der Magier tot.~
== AC#VRON7 ~Könnten wir ihn in einem Tempel wieder zum Leben erwecken, Bettargh?~
== AC#BETT7 ~Ohne Kopf? Nein, das ist nicht möglich. Uns bleibt nur, seinem Leichnam ein würdiges Begräbnis zu ermöglichen.~
== AC#GROM7 ~Weshalb bei den Neun Höllen hatte Ellhimar den Spiegel wieder in Gang gesetzt?~
END
IF ~~ THEN REPLY ~Er wollte mir durch den Spiegel etwas zeigen. Er schien herausgefunden zu haben, wer für Mith Baraks Zustand verantwortlich ist.~ EXTERN ~AC#BETT7~ ellhimar_mirror_01 

CHAIN IF ~~ THEN AC#BRES7 chain_bresk_gith
~Jedenfalls ist jetzt klar, wer unsere Patrouille umgebracht und die Illithidenköpfe platziert hat.~
== AC#GROM7 ~Die Illithiden könnten den Machenschaften der Githyanki auf die Schliche gekommen sein.~
== AC#BETT7 ~Königreich Torglor führte einen jahrhundertelangen Krieg gegen die Illithiden. Es wäre naheliegend, dass sich dort jetzt Githyanki eingenistet haben, um ihren Erzfeinden eine empfindliche Niederlage beizubringen. Nur was hat unser König mit alldem zu tun? Ich werde mich über unser ehemaliges Nachbarkönigreich Torglor belesen. Vielleicht finde ich etwas heraus.~
END
IF ~~ THEN EXTERN ~AC#GROM7~ gromi_bye_2_charname 
*/

// Bystanders encounter

BEGIN AC#50SP1 
BEGIN AC#50SP2 
BEGIN AC#50SP3 
BEGIN AC#50SP4 
BEGIN AC#50SP5 

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#50SP1 chain_bystanders_01
~Bei den Bärten der Ahnen, was für ein seltsamer Anblick!~
== AC#50SP2 ~Sieht aus, als hätten wir Besuch. Hoffentlich bringen sie ihr eigenes Bier mit.~
== AC#50SP3 ~Ihre Kleidung ist so... scheußlich farbenfroh. Haben die kein gutes Grau?~
== AC#50SP4 ~Schaut nur, wie sie blinzeln! Das Licht hier unten muss ihnen schwer zu schaffen machen.~
== AC#50SP5 ~Seht, Mutter! Der eine von ihnen ist ja ganz nackt im Gesicht!~
== AC#50SP4 ~Geh schnell ins Haus, Liebes. Dieser Anblick ist nichts für Dich, sonst träumst Du wieder wildes Zeug.~
== AC#50SP1 ~Der eine hat ja so lange Beine wie eine Hakenschrecke!~
== AC#50SP2 IF ~InParty("viconia") !StateCheck("viconia",CD_STATE_NOTVALID)~ THEN ~Und eine dreckige Drow ist sogar dabei!~
== AC#50SP1 IF ~InParty("viconia") !StateCheck("viconia",CD_STATE_NOTVALID)~ THEN ~Pfui! Ein Drow ist wie eine schlechte Ader im Erz, sie verdirbt alles, was sie berührt.~
== AC#50SP4 IF ~InParty("viconia") !StateCheck("viconia",CD_STATE_NOTVALID)~ THEN ~Drow? Ich würde eher einem Goblin mein Kind anvertrauen als einer von denen.~
== AC#50SP1 IF ~InParty("viconia") !StateCheck("viconia",CD_STATE_NOTVALID)~ THEN ~Drow in der Nähe bedeutet, dass Ärger nicht weit ist. Sie bringen Dunkelheit, wohin sie auch gehen.~
== AC#BRES1 ~Geht weiter, Leute! Hier gibt es nichts zu sehen! Das ist doch nicht das erste Oberflächenwesen, das Ihr hier zu Gesicht bekommt!~
== AC#50SP2 ~Ich wette, keiner von denen hat je eine richtige Axt geschwungen.~
== AC#BRES1 ~Ich sag's nicht noch mal! Verzieht Euch, Bürger! Und hört auf, so dumm herum zu gaffen! Das ziemt sich nicht für einen Zwerg.~
== AC#BRES1 ~Und Ihr, <CHARNAME>, rasch die Treppe hoch zum Regentschaftsrat, bevor Ihr hier noch mehr Unruhe verbreitet!~
END
IF~~THEN DO ~SetGlobal("Bystanders","ACIL50",10)~ EXIT	
