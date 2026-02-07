/*******************************************************************************************************
Dialog Vronia cre#6 in Iltkazar, Ellhimar's journal
*******************************************************************************************************/

BEGIN ~ac#vron6~

IF ~Global("JournalSpawn","ACIL50",3)~ THEN BEGIN hello_again_after_bloodmoon
SAY ~<CHARNAME>! Wart Ihr bei Eurer Suche erfolgreich?~
IF ~PartyHasItem("AC#23ELL")~ THEN REPLY ~Ja, ich habe Ellhimars Tagebuch gefunden.~ GOTO have_journal
IF ~!PartyHasItem("AC#23ELL")~ THEN REPLY ~Nein, leider nicht.~ GOTO dont_have_journal
END

IF ~Global("JournalSpawn","ACIL50",1)~ THEN BEGIN hello_after_bloodmoon
SAY ~<CHARNAME>! Ellhimars Zustand scheint sich zu verschlechtern!~
IF ~~ THEN REPLY ~Das sind keine guten Neuigkeiten. Inwiefern verschlechtert sich sein Zustand?~ GOTO talking_crap
END

	IF ~~ THEN BEGIN talking_crap
	SAY ~Er begann plötzlich zu reden. Das freute uns zunächst. Allerdings spricht er nur wirres Zeug! Von einem Blutmond, Statuen, Drachen und dergleichen.~
	IF ~~ THEN REPLY ~Ich denke nicht, dass dies wirres Zeug ist. Ich komme gerade von dem Ort, an dem Ellhimar verschleppt wurde und hatte ähnliche Visionen.~ GOTO visions
	END
	
		IF ~~ THEN BEGIN visions
		SAY ~Ihr meint, er beginnt sich zu erinnern?~
		IF ~~ THEN REPLY ~Vielleicht.~ GOTO need_journal
		END
		
			IF ~~ THEN BEGIN need_journal
			SAY ~Habt Ihr an diesem Ort irgendetwas gefunden, das uns helfen könnte, Ellhimar zu heilen?~
			IF ~PartyHasItem("AC#23ELL")~ THEN REPLY ~Ich habe dort sein Tagebuch gefunden.~ GOTO have_journal
			IF ~!PartyHasItem("AC#23ELL")~ THEN REPLY ~Nein, leider nicht.~ GOTO dont_have_journal
			END
			
				IF ~~ THEN BEGIN dont_have_journal
				SAY ~Das ist schade. Sollte Euch irgendetwas in die Hände fallen, das Hinweis auf seinen Zustand geben könnte, lasst es mich bitte wissen! Ich harre mit Ellhimar immer noch in Sharindlars Tempel aus. Sucht mich dort auf, wenn es Neuigkeiten jedweder Art gibt.~
				IF ~~ THEN DO ~SetGlobal("JournalSpawn","ACIL50",2)
				AddJournalEntry(@23011,QUEST)
				EscapeArea()~ EXIT 
				END
				
				IF ~~ THEN BEGIN have_journal
				SAY ~Oh! Das klingt gut! Ich werde einmal einen Blick darauf werfen...~
				IF ~~ THEN DO ~TakePartyItem("AC#23ELL")~ GOTO check_journal
				END
				
					IF ~~ THEN BEGIN check_journal
					SAY ~Was steht dort geschrieben? "Der uralte, mythalgleiche Zauber, der diesen Tempel einnimmt wie dichter Nebel ist auffällig. Es scheint so, dass die Erschaffer den Zauber gewebt haben, um in einen tiefen Schlaf fallen zu können. Geht es um Visionen?" Das hört sich genau nach dem Umstand an, von dem Ihr berichtet habt! Ich werde das Tagebuch mit zu Ellhimar nehmen und Khaernd bitten, auf der Grundlage seiner Niederschriften in Ellhimars Geist einzudringen, um ihn so vielleicht wieder auf den rechten Geisteszustand führen zu können! Trefft mich in Sharindlars Tempel in Haelas Hallen - wenngleich ich nicht weiß, ob und wann wir mit unseren Versuchen erfolgreich sein werden!~
					IF ~~ THEN DO ~SetGlobal("JournalSpawn","ACIL50",10)
					EraseJournalEntry(@23010)
					EraseJournalEntry(@23011)
					AddJournalEntry(@23012,QUEST_DONE)
					EscapeArea()~ EXIT 
					END

/*******************************************************************************************************
Dialog Vronia cre#5 in Iltkazar, Quest-Start: Help Ellhimar
*******************************************************************************************************/

BEGIN ~AC#VRON5~

IF ~Global("AC#Gromi_Cernd","ACIL52",10)~ THEN BEGIN hello_ellhimar_gone
SAY  ~So ist nun auch für mich hier alles getan. Ich wünsche Euch viel Erfolg, <CHARNAME>.~
IF ~~ THEN DO ~EscapeArea()~  EXIT
END

IF ~Global("AC#Gromi_Cernd","ACIL52",4)~ THEN BEGIN hello_cernd_gone
SAY  ~Was für eine schöne Wendung das Schicksal doch genommen hat!~
//IF ~~ THEN REPLY ~Wegen der Scheibe...~ GOTO still_need_help_driftdisc
END

/*
	IF ~~THEN BEGIN still_need_help_driftdisc
	SAY ~Ach richtig, die Scheibe! Was braucht Ihr, um den Zauber zu wirken, Ellhimar?~
	IF ~~ THEN EXTERN ~AC#ILEL9~ ellhimar_needs_spellbook
	END

IF ~Global("AC#Ellhimar_Cernd","GLOBAL",5)~ THEN BEGIN hello_cernd_here_02
SAY  ~Seid gegrüßt, <CHARNAME>! Khaernd Schüttergeist versucht immer noch, Ellhimar zu heilen.~
IF ~PartyHasItem("AC#DRFT1")~ THEN REPLY ~Ich habe hier eine Schwebescheibe der Drow, mit der ich an die Oberfläche zurückkehren könnte, wenn sie neu verzaubert wäre. Ich bräuchte jetzt wirklich Ellhimars Hilfe.~ + driftdisc_01
IF ~!PartyHasItem("AC#DRFT1")
Global("Wait_for_Cernd","ACIL52",1)~ THEN REPLY ~Wie geht es Ellhimar?~ + cernd_driftdisc_no
IF ~!PartyHasItem("AC#DRFT1")
Global("Wait_for_Cernd","ACIL52",0)~ THEN REPLY ~Wie geht es Ellhimar?~ + cernd_driftdisc_no_exit
IF ~GlobalGT("AC#EllhimarJournal","GLOBAL",0)~ THEN REPLY ~Hat Ellhimars Tagebuch keine Wirkung gezeigt?~ + journal_useful
IF ~~ THEN REPLY ~Ich muss weiter.~ + cernd_driftdisc_no
END

	IF ~~THEN BEGIN driftdisc_01
	SAY ~Oh! Das ist ja einmal eine gute Idee! Aber bei der Verzauberung bräuchten wir in der Tat Ellhimars Unterstützung.~
	++ ~Könnte Khaernd ihn nicht einmal langsam heilen?~ + cernd_driftdisc_no
	IF ~Global("AC#RepairDriftdisc","GLOBAL",10)~ THEN REPLY ~Khaernd, könntet Ihr nicht alle Kraft, die Euch zur Verfügung steht, einsetzen, um Ellhimar zu heilen?~ EXTERN ~AC#CERN1~ cernd_go_on
	END
	
	IF ~~THEN BEGIN cernd_driftdisc_no
	SAY ~Ich fürchte, wir müssen weiter abwarten. Wenn Ihr andere wichtige Aufgaben zu erledigen habt, wäre jetzt ein guter Zeitpunkt. Wir werden derweil hier versuchen, Ellhimars Geist mit Cernds Hilfe weiter zu stabilisieren.~
	IF ~~ THEN EXIT
	END
	
	IF ~~THEN BEGIN cernd_driftdisc_no_exit
	SAY ~Leider gibt es immer noch nichts zu berichten. Ich fürchte, wir müssen weiter abwarten. Wenn Ihr andere wichtige Aufgaben zu erledigen habt, wäre jetzt ein guter Zeitpunkt. Wir werden derweil hier versuchen, Ellhimars Geist mit Cernds Hilfe weiter zu stabilisieren.~
	IF ~~ THEN DO ~EraseJournalEntry(@50701)
		AddJournalEntry(@50702,QUEST_DONE)
		SetGlobal("Wait_for_Cernd","ACIL52",1)~  EXIT
		END
		
	IF ~~ THEN BEGIN journal_useful
	SAY ~Bis jetzt leider noch nicht, nein.~
	IF ~PartyHasItem("AC#DRFT1")~ THEN REPLY ~Ich habe hier eine Schwebescheibe der Drow, mit der ich an die Oberfläche zurückkehren könnte, wenn sie neu verzaubert wäre. Ich bräuchte jetzt wirklich Ellhimars Hilfe.~ + driftdisc_01
	IF ~!PartyHasItem("AC#DRFT1")
	Global("Wait_for_Cernd","ACIL52",1)~ THEN REPLY ~Wie geht es Ellhimar?~ + cernd_driftdisc_no
	IF ~!PartyHasItem("AC#DRFT1")
	Global("Wait_for_Cernd","ACIL52",0)~ THEN REPLY ~Wie geht es Ellhimar?~ + cernd_driftdisc_no_exit
	IF ~~ THEN REPLY ~Ich muss weiter.~ + cernd_driftdisc_no
	END	

IF ~GlobalGT("AC#Ellhimar_Cernd","GLOBAL",2)~ THEN BEGIN hello_again
SAY  ~Habt Ihr bereits mit Khaernd gesprochen?~
++ ~Nein, noch nicht.~ + talk_to_cernd_immediatly
END

	IF ~~THEN BEGIN talk_to_cernd_immediatly
	SAY ~Beeilt Euch, bitte! Ihr seht, in was für einem Zustand Ellhimar hier ist.~
	IF ~~ THEN EXIT
	END
*/
// in Area ACIL50
IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY  ~Hallo <CHARNAME>. Ich bräuchte wieder Eure Hilfe.~
++ ~Wenn Ihr wollt, dass ich von diesem Hirnlappen probiere: Vergesst es.~ + not_tasting_lobe
++ ~Ihr habt eine Idee, wie wir in der Suche weiterkommen, richtig?~ + fate_of_the_king
++ ~Geht es um den schlafenden König?~ + fate_of_the_king
END

	CHAIN AC#VRON5 not_tasting_lobe
	~Das kann ich gut verstehen. Lasst es mich ein wenig ausführen.~
	END
	IF ~~ THEN EXTERN AC#VRON5 fate_of_the_king

	CHAIN AC#VRON5 fate_of_the_king
	~Ihr wisst, dass mir das Schicksal des Königs am Herzen liegt. Sein derzeitiger Zustand schmerzt mich.~
	END
	IF ~~ THEN REPLY ~Was kann ich tun?~ EXTERN AC#VRON5 about_gromi_khaernd


		CHAIN AC#VRON5 about_gromi_khaernd
		~Ihr habt vielleicht mitbekommen, wie gereizt Gromi auf Gedankenschinder reagiert hat. Nach alldem, was seinem Sohn widerfahren ist, ist das nur allzu verständlich.~
		END
		IF ~~ THEN REPLY ~Was ist mit seinem Sohn passiert?~ EXTERN AC#VRON5 what_happened_to_cernd

				
			CHAIN AC#VRON5 what_happened_to_cernd
			~Gromis Sohn heißt Khaernd. Einst war er der fähigste Zardazil-Schmied Iltkazars und als ältester Sohn Gromi Arnschädels dazu auserkoren, die legendäre Arnschädelhalle zu führen. Doch das Schicksal meinte es nicht gut mit dem armen Jungen.~
			END
			IF ~~ THEN REPLY ~Was ist ihm widerfahren?~ EXTERN AC#VRON5 what_happened_to_cernd_02

			
				CHAIN AC#VRON5 what_happened_to_cernd_02
				~Er führte eine Patrouille auf der Suche nach neuen Erzvorkommen an. Irgendwo im Osten wurde er von Gedankenschindern verschleppt.~
				END
				IF ~~ THEN EXTERN AC#VRON5 what_happened_to_cernd_05
				
							CHAIN AC#VRON5 what_happened_to_cernd_05
							~Die *caradhak* haben finstere Experimente an ihm durchgeführt. Offensichtlich wollten sie ihn in einen der Ihren umwandeln.~
							END
							IF ~~ THEN REPLY ~Sie wollten aus Gromis Sohn einen Gedankenschinder machen?~ EXTERN AC#VRON5 cernd_ceremorphosis
							
								CHAIN AC#VRON5 cernd_ceremorphosis
								~Ja. Allein seinem starken Willen war es zu verdanken, dass das Experiment fehlschlug. Aus irgendwelchen unerfindlichen Gründen schaffte es Khaernd, aus der Stadt der Gedankenschinder zu fliehen und tauchte eines Tages wieder vor den Toren Iltkazars auf. Obschon von den Qualen stark gezeichnet, war sein Geist klar. Allerdings war er nicht mehr wiederzuerkennen.~
								END
								IF ~~ THEN EXTERN AC#VRON5 cernd_ceremorphosis_02
								
									CHAIN AC#VRON5 cernd_ceremorphosis_02
									~Er war zwar äußerlich noch ein Zwerg, aber anstelle seines Mundes ragten ihm diese... scheußlichen Saugnäpfe eines Illithiden aus dem Gesicht! Ihr könnt Euch vorstellen, wie entsetzt Gromi bei dem Anblick seines geliebten Sohnes war, der offensichtlich als ein Mischwesen - halb Zwerg, halb Illithide, aus der Gefangenschaft der *caradhak* entflohen war.~
									END
									IF ~~ THEN REPLY ~Das ist ja scheußlich! Was habt Ihr danach mit ihm gemacht?~ EXTERN AC#VRON5 cernd_prison_01

									
										CHAIN AC#VRON5 cernd_prison_01
										~Wie Ihr Euch vorstellen könnt, gab es lange Diskussionen im Regentschaftsrat. Viele glaubten nicht an seine zufällig geglückte Flucht aus den Fängen der Gedankenschinder und hielten ihn für einen Spion. Gerade auch dadurch, weil Khaernd nicht nur äußerlich, sondern auch von seinen Fähigkeiten einem Gedankenschinder glich. Er hatte, als er zurückkehrte, psionische Fähigkeiten erlangt.~
										END
										IF ~~ THEN EXTERN AC#VRON5 cernd_prison_02

										
											CHAIN AC#VRON5 cernd_prison_02
											~Jedenfalls hat der Rat dann beschlossen, den armen Khaernd in der Halle der Runensteine, unserer großen Bibliothek, für den Rest seiner Tage in einen Käfig zu sperren. Dort sitzt er noch immer und wird bewacht.~
											END
											IF ~~ THEN REPLY ~Ihr wollt, dass ich ihn befreie?~ EXTERN AC#VRON5 free_cernd_01

											
												CHAIN AC#VRON5 free_cernd_01
												~Ich habe schon mit Bettargh gesprochen. Er ist mit mir einer Meinung, dass wir Khaernd nicht mehr eingesperrt lassen sollten. Zum Einen, weil es unzwergisch ist, zum Anderen, weil vielleicht nur er uns helfen kann, bei der Suche nach dem schlafenden König zu helfen.~
												END
												IF ~~ THEN REPLY ~Was sagt Gromi als Cernds Vater dazu?~ EXTERN AC#VRON5 gromi_cernd

												
													CHAIN AC#VRON5 gromi_cernd
													~Ganz einfach: Wir haben ihn nicht gefragt.~
													END
													IF ~~ THEN REPLY ~Ihr wollt, dass ich mich über einen Entschluss des Rates hinwegsetze?~ EXTERN AC#VRON5 act_against_rc_01

													
														CHAIN AC#VRON5 act_against_rc_01
														~Der Rat hatte die letzten drei Jahre Zeit zu zeigen, dass er imstande ist, unsere gegenwärtige Krise zu lösen. Wenn wir weiter darauf vertrauen, dass sich alles zum Guten wendet, indem wir einfach so weitermachen, werden wir keinen Erfolg haben. Wir müssen andere Wege gehen, am Rat vorbei. Uns läuft die Zeit davon. König Mith Barak hätte dies mit Sicherheit ebenfalls so gewollt. Warum sonst hättet Ihr in unsere Stadt kommen sollen? Nur, um den Willen des Rates umzusetzen? Das können die Zwerge hier auch ohne Euch. Nein, wir brauchen Euch, weil Ihr Dinge *anders* macht als die Zwerge Iltkazars!~
														END
														IF ~~ THEN REPLY ~Und was soll ich tun?~ EXTERN AC#VRON5 free_cernd_02

														
															CHAIN AC#VRON5 free_cernd_02
															~Geht in die Halle der Runensteine, besucht Khaernd in seiner Zelle im Westen der großen Bibliothek und bittet ihn darum, einen Blick auf den Lappen des Ältestenhirns zu werfen.~ 
															=
															~Ich warte auf Euch im Gnädigen Hof, dem Tempel Sharindlars in Haelas Hallen. Bettargh Abgrundlied, der der großen Bibliothek vorsteht und für die Beaufsichtigung Cernds zuständig ist, hat Euch seine Erlaubnis dazu gegeben. Er wird vielleicht so tun, als wüsste er von nichts, um Gromi nicht zu verärgern. Insgeheim denkt er aber genau so wie ich.~
															END
															IF ~~ THEN REPLY ~Gut, ich werde mit Khaernd reden.~ EXTERN AC#VRON5 free_cernd_exit


																CHAIN AC#VRON5 free_cernd_exit
																~Eure Hilfe freut mich sehr. Ich werde mit Isdlara im Tempel Sharindlars warten, bis Khaernd endlich aus seinem Käfig befreit ist.~
																END
																IF ~~ THEN DO ~SetGlobal("AC#Ellhimar_Cernd","GLOBAL",3)
																AddJournalEntry(@50700,QUEST)
																EscapeAreaObject("TrACIL52")~  EXIT


/*
	IF ~~THEN BEGIN ellhimar_awake
	SAY ~Ellhimar! Ellhimar, könnt Ihr mich verstehen?~
	IF ~~ THEN EXTERN ~AC#ILEL9~ ellhimar_awake_02
	END
	
	IF ~~THEN BEGIN ellhimar_awake_03
	SAY ~Er ist wieder bei klarem Verstand! Ellhimar, Ihr seid hier in Sharindlars Tempel!~
	IF ~~ THEN EXTERN ~AC#ILEL9~ ellhimar_awake_04
	END
	
	IF ~~THEN BEGIN ellhimar_awake_05
	SAY ~Hier sind keine Illithiden, Menschenmagier. Dies ist Khaernd, der Euch mit Hilfe seiner psionischen Kräfte aus dem finsteren Wahnsinn befreit hat!~
	IF ~~ THEN REPLY ~Ich weiß, der Moment ist etwas unpassend, aber ich bräuchte recht schnell Eure Hilfe, Ellhimar.~ EXTERN ~AC#ILEL9~ ellhimar_need_help
	END	
	
	IF ~~THEN BEGIN vronia_yes_thats_charname
	SAY ~Ja, das ist <CHARNAME>, der uns behilflich ist, König Mith Barak aus seinem Schlaf zu retten.~
	IF ~~ THEN EXTERN ~AC#ILEL9~ ellhimar_mithbarak
	END
	
	IF ~~THEN BEGIN vronia_later_01
	SAY ~Das klären wir später. Wichtig ist, dass Ellhimar wieder bei klarem Verstand ist. Und wir müssen immer noch unseren König retten!~
	IF ~~ THEN DO ~SetGlobal("AC#Gromi_Cernd","ACIL52",1)~  
	EXIT
	END
	
	IF ~~THEN BEGIN gromi_vronia_cernd_01
	SAY ~Auf meine Anweisung und mit Bettarghs Einverständnis.~
	IF ~~ THEN EXTERN ~AC#GROM6~ gromi_vronia_cernd_02
	END
	
	IF ~~THEN BEGIN vronia_cernd_gromi_son_03
	SAY ~Gebt Euch einen Ruck, Gromi. So könnt Ihr Euren Sohn doch nicht bis ans Ende Eurer Tage leben lassen!~
	IF ~~ THEN EXTERN ~AC#GROM6~ cernd_gromi_son_03
	END
	
	IF ~~THEN BEGIN vronia_bring_son_home
	SAY ~Er hat schon genug Gutes für uns getan. Nehmt ihn mit nach Hause, Gromi.~
	IF ~~ THEN EXTERN ~AC#GROM6~ gromi_take_son_home
	END
		
	IF ~~THEN BEGIN vronia_carry_ellhimar
	SAY ~Kommt, Ellhimar, lasst mich Euch tragen.~
	IF ~~ THEN EXTERN ~AC#ILEL9~ no_need_to_walk
	END
	

// Ellhimar
BEGIN ~AC#ILEL9~

IF ~Global("AC#Ellhimar_Cernd","GLOBAL",7)~ THEN BEGIN hello_i_am_healed
SAY  ~Uhh... mein Kopf...~
IF ~~ THEN EXTERN ~ac#vron5~ ellhimar_awake
END

	IF ~~THEN BEGIN ellhimar_awake_02
	SAY ~Vronia? Wo... wo bin ich?~
	IF ~~ THEN EXTERN ~ac#vron5~ ellhimar_awake_03
	END
	
	IF ~~THEN BEGIN ellhimar_awake_04
	SAY ~Ich... erinnere mich... Bei Azuth, noch mehr Illithiden?~
	IF ~~ THEN EXTERN ~ac#vron5~ ellhimar_awake_05
	END
		
	IF ~~THEN BEGIN ellhimar_need_help
	SAY ~Ihr... Ihr seid nicht von... Ihr kommt von der Oberfläche!~
	IF ~~ THEN EXTERN ~ac#vron5~ vronia_yes_thats_charname
	END
	
	IF ~~THEN BEGIN ellhimar_mithbarak
	SAY ~Der König... schläft noch immer... Aber gut, dass Ihr da seid, <CHARNAME>! Was benötigt Ihr von mir, um Eure Aufgabe fortzusetzen?~
	IF ~~ THEN REPLY ~Ich habe hier eine Schwebescheibe der Drow bei mir, mit deren Hilfe ich Ravimors Höhle wieder bis hinauf in die Oberfläche schweben könnte.~ + ellhimar_ravimor
	END
	
		IF ~~THEN BEGIN ellhimar_ravimor
		SAY ~Ihr seid über Ravimors Höhle herabgekommen... das ist gut.~
		IF ~~ THEN REPLY ~Oder kennt Ihr einen anderen Weg zurück ins Licht?~ + ellhimar_another_way_surface
		END
		
			IF ~~THEN BEGIN ellhimar_another_way_surface
			SAY ~Nein... der Weg, den Ihr gewählt habt, ist der sicherste. Was ist mit der Schwebescheibe?~
			IF ~~ THEN REPLY ~Sie schwebt nicht.~ + ellhimar_driftdisc_not_drifting
			END
			
				IF ~~THEN BEGIN ellhimar_driftdisc_not_drifting
				SAY ~Dann sind die Zauber, die sie in der Luft hielten, wohl erloschen. Man könnte sie aber neu wirken. Ich kenne sogar den Zauber, der dafür nötig ist. Er nennt sich "Tensers schwebende Scheibe".~
				IF ~~ THEN REPLY ~Könntet Ihr diesen Zauber wirken? Möglichst schnell?~ + ellhimar_spell_tenser
				END
				
					IF ~~THEN BEGIN ellhimar_spell_tenser
					SAY ~Das könnte ich in der Tat. Dazu bräuchte ich aber mein Zauberbuch, welches hoffentlich noch in meinem Zuhause liegt.~
					IF ~~ THEN REPLY ~Ja stimmt, Euer Zuhause...~ EXTERN ~ac#vron5~ vronia_later_01
					END
	
	IF ~~THEN BEGIN ellhimar_gromi_01
	SAY ~Das bin ich, Meister Gromi. Dank der Hilfe Eures Sohnes hier.~
	IF ~~ THEN EXTERN ~AC#GROM6~ gromi_cernd_01
	END

	IF ~~THEN BEGIN ellhimar_gromi_son_healed_me
	SAY ~Euer Sohn hat mich geheilt, Gromi! Ohne seine Hilfe wäre ich immer in dem erbärmlichen Zustand, in welchem Ihr mich aufgefunden habt!~
	IF ~~ THEN REPLY ~Ich finde auch, Ihr solltet Eurem Sohn gegenüber mehr Dankbarkeit zeigen, Gromi.~ EXTERN ~AC#CERN1~ cernd_gromi_son_02
	IF ~~ THEN REPLY ~(Nichts sagen.)~ EXTERN ~AC#CERN1~ cernd_gromi_son_02
	END	
	
	IF ~~THEN BEGIN ellhimar_needs_spellbookellhimar_needs_spellbook
	SAY ~Mein Zauberbuch. Ich habe es gut versteckt und denke, dass es sich ... trotz der ganzen Widrigkeiten noch immer an seinem angestammten Platz befinden könnte.~
	IF ~~ THEN REPLY ~Dann lasst uns zu Euch nach Hause gehen.~ EXTERN ~ac#vron5~ vronia_carry_ellhimar
	END
	
	
		IF ~~ THEN BEGIN no_need_to_walk
		SAY ~Kein Grund zu laufen, Vronia. Ich... spüre... wie meine Erinnerungen... und meine Kräfte zurückkommen. Gebt mir die Scheibe, <CHARNAME>. Ich werde mich mit Ihr zu seinem Haus zurückteleportieren.~
		IF ~~ THEN REPLY ~Nun gut, hier ist sie.~ DO ~TakePartyItem("AC#DRFT1")
		DestroyItem("AC#DRFT1")~ + see_you_at_home
		END
		
		IF ~~ THEN BEGIN see_you_at_home
		SAY ~Sucht mich in meinem Zuhause auf, es dürfte schnell gehen, die Scheibe erneut zu verzaubern. Danach werde ich mich immer noch ausruhen können.~		
		IF ~~ THEN DO ~ClearAllActions()
		StartCutSceneMode()
		EraseJournalEntry(@64209)
		AddJournalEntry(@64210,QUEST)
		SetGlobal("AC#Ellhimar_Cernd","GLOBAL",10)
		SetGlobal("AC#Gromi_Cernd","ACIL52",5)
		CreateVisualEffectObject("SPDIMNDR",Myself) 
		Wait(1)	
		EndCutSceneMode()		
		DestroySelf()~ EXIT
		END

IF ~True()~ THEN BEGIN hihihi
SAY ~(wirres Lachen)~ [AC#ELLHC]
IF ~~ THEN EXIT
END
				
// ---------------------------------------------
// Gromi Arnskull 
// ---------------------------------------------					
BEGIN ~AC#GROM6~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY  ~Was geht hier vor, Vronia? Ellhimar! Ihr seid erwacht?~
IF ~~ THEN EXTERN ~ac#ILEL9~ ellhimar_gromi_01
END

	IF ~~THEN BEGIN gromi_cernd_01
	SAY ~Meines Sohnes?~
	=
	~Khaernd? Khaernd! Was hat das zu bedeuten, Vronia? Wer hat Khaernd freigelassen?~
	IF ~~ THEN REPLY ~Ich war das.~ EXTERN ~AC#vron5~ gromi_vronia_cernd_01
	END
	
	IF ~~THEN BEGIN gromi_vronia_cernd_02
	SAY ~Ihr.. Ihr habt was? Ihr habt Euch über die Entscheidung des rates hinweggesetzt und diesen... diesen... freigelassen?~
	IF ~~ THEN REPLY ~So redet man nicht von seinem eigenen Sohn, Gromi.~ EXTERN ~ac#ILEL9~ ellhimar_gromi_son_healed_me
	IF ~~ THEN REPLY ~Ich fand es auch unangenehm, aber mir blieb keine andere Wahl.~ EXTERN ~ac#ILEL9~ ellhimar_gromi_son_healed_me
	END
	
	
	IF ~~THEN BEGIN cernd_gromi_son_03
	SAY ~Ich... ich...~
	=
	~*Seufzt*. Ihr habt Recht. So kann es nicht ewig weitergehen.~
	=
	~Khaernd, mein Sohn! Es... es tut mir leid. Ich - nein, die ganze Stadt! - hat Euch unrecht getan. Ihr habt bewiesen, dass Ihr nicht das... das Monster seid, für das wir Euch nach Eurer Rückkehr aus Oryndoll gehalten haben.~
	=
	~Ich werde mich bei dem Rat einsetzen, dass Ihr Euch frei in der Stadt bewegen dürft. Und... ich würde mich freuen, wenn Ihr wieder bei uns, in unserem *faern*, leben würdet. Mit uns zusammen!~
	IF ~~ THEN EXTERN ~AC#CERN1~ happy_family
	END
	
	IF ~~THEN BEGIN gromi_still_need_help_driftdisc
	SAY ~Das ist richtig. Wenn Ihr die Hilfe meines Sohnes benötigt...~
	IF ~~ THEN EXTERN ~AC#vron5~ vronia_bring_son_home
	END
	
	IF ~~THEN BEGIN gromi_take_son_home
	SAY ~Kommt mit, Khaernd, mein Sohn! Eure Mutter wird Augen machen. Lasst uns durch die Stadt gehen und jedem zeigen, dass Khaernd Arnschädel, Gromis Sohn, in die Zitadelle seines Clans zurückgekehrt ist!~
	IF ~~ THEN DO ~SetGlobal("AC#Gromi_Cernd","ACIL52",3)
	ActionOverride("AC#CERN1",EscapeArea())
	EscapeArea()~  EXIT
	END
	
*/					
// ---------------------------------------------
// Khaernd Shattermind 
// ---------------------------------------------

BEGIN ~AC#CERN1~

// Khaernd in Area ACIL52



	IF ~~ THEN BEGIN cernd_gromi_son_02
	  SAY ~(Cernds Blicke werden unruhig und seine Augen gehen nervös hin- und her.)~
	//IF ~~ THEN REPLY ~Los, Gromi, heißt Euren Sohn in Iltkazar willkommen!~ EXTERN ~AC#GROM6~ cernd_gromi_son_03
	//IF ~~ THEN REPLY ~(Immer noch nichts sagen.)~ EXTERN ~AC#vron5~ vronia_cernd_gromi_son_03
	END
	
	IF ~~ THEN BEGIN cernd_go_on
	  SAY ~(Der Zwerg lässt die Schultern hängen. Offensichtlich scheint er nicht mehr an einen Erfolg zu glauben.)~
	IF ~~ THEN REPLY ~Bitte, Khaernd, Ihr müsst es noch einmal versuchen! Nicht für mich, sondern für Iltkazar!~ GOTO cernd_go_on_02
	END
	
	IF ~~THEN BEGIN cernd_go_on_02
	SAY ~(Die Augen des Zwerges verengen sich zu schlitzen und seine Tentakel zucken nervös hin- und her. Dann, mit einem Mal, scheint sich seine gesamte aufgestaute psionische Energie zu entladen...)~
	IF ~~ THEN DO ~SetGlobal("AC#Ellhimar_Cernd","GLOBAL",6)~  EXIT
	END
	
	IF ~~ THEN BEGIN happy_family
	  SAY ~(Khaernd zieht seine Tentakel nach oben. Ihr könnt Euch vorstellen, dass seine Art sein könnte, ein Lächeln auszudrücken.)~
	//IF ~~ THEN REPLY ~Es freut mich, dass Khaernd wieder im Kreise der Familie aufgenommen ist. Allerdings müssen wir immer noch den König retten.~ EXTERN ~AC#GROM6~ gromi_still_need_help_driftdisc
	END
	
// Khaernd in Area ACIL5U

IF ~Global("Cernd_Free","ACIL5U",2)~ THEN BEGIN hello_free
  SAY ~(Der Zwerg sieht Euch fragend an.)~
  IF ~~ THEN REPLY ~Ihr hättet die ganze Zeit schon diese Tür öffnen können? Warum seid Ihr in dem Käfig geblieben?~ DO ~SetGlobal("Cernd_Free","ACIL5U",3)~ GOTO why_didnt_you_leave
END

	IF ~~ THEN BEGIN why_didnt_you_leave
	  SAY ~(Khaernd zuckt mit den Schultern und sieht nach links und rechts zu den Wachen.)~
	IF ~~ THEN GOTO cernd_lets_go
	END
	
		IF ~~ THEN BEGIN cernd_lets_go
		  SAY ~(Dann streckt er seine Arme durch, malt mit seinen Fingern ein komplexes Zeichen in die Luft und ist verschwunden.)~
		IF ~~ THEN DO ~ClearAllActions()
		StartCutSceneMode()
		EraseJournalEntry(@50700)
		AddJournalEntry(@50701,QUEST)
		SetGlobal("AC#Ellhimar_Cernd","GLOBAL",4)
		CreateVisualEffectObject("SPDIMNDR",Myself) 
		Wait(1)	
		EndCutSceneMode()		
		DestroySelf()~ EXIT
		END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY ~(Vor Euch steht der sonderlichste Zwerg, der Euch je begegnet ist. Seine Haut ist grün, und anstelle eines Mundes ragen vier lange, sich stetig windende Tentakel aus seinem Gesicht heraus. Das Wesen schaut Euch aus seinen trüben Augen heraus traurig und resigniert an.)~
  IF ~~ THEN REPLY ~Seid Ihr Khaernd?~ GOTO are_you_cernd
END

	IF ~~ THEN BEGIN are_you_cernd
	  SAY ~(Der Zwerg nickt langsam.)~
	IF ~~ THEN REPLY ~Ich heiße <CHARNAME>. Vronia schickt mich, um Euch hier abzuholen. Der Magier Ellhimar ist - wie Ihr selbst- von Gedankenschindern übel zugerichtet worden und braucht Eure Hilfe.~ GOTO cernd_help_ellhimar
	IF ~~ THEN REPLY ~Ihr habt da was im Gesicht.~ GOTO cernd_help_ellhimar
	END
	
		IF ~~ THEN BEGIN cernd_help_ellhimar
		  SAY ~(Die Augen des Zwerges verengen sich zu Schlitzen.)~
		IF ~~ THEN REPLY ~Könnt Ihr nicht sprechen?~ GOTO cernd_can_speak
		END
		
			IF ~~ THEN BEGIN cernd_can_speak
			  SAY ~(Khaernd schüttelt heftig den Kopf, wobei seine Tentakel wie ein Bart hin- und herschwingen.)~
			IF ~~ THEN GOTO cernd_open_door
			END
			
				IF ~~ THEN BEGIN cernd_open_door
				  SAY ~(Plötzlich macht er eine Bewegung, und die Käfigtür springt mit einem lauten Geräusch auf.)~
				IF ~~ THEN DO ~SetGlobal("Cernd_Free","ACIL5U",1)~ EXIT
				END

IF ~True()~ THEN BEGIN hello
SAY ~(Der Zwerg scheint Euch nicht zu beachten.)~
IF ~~ THEN EXIT
END	
