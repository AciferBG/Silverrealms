/*******************************************************************************************************
Dialog Bettargh Riftsong
*******************************************************************************************************/

BEGIN ~AC#BETT1~

IF ~Global("ElernSpawn","ACIL53",3)~ THEN BEGIN elern_will_tell_you
SAY ~Meine Tochter Elern wird Euch am Standbild von Borthun, dem Wanderer alles erklären.~
IF ~~ THEN EXIT
END	


IF ~OR(2)
GlobalGT("AC#Clans_Parting","GLOBAL",1)
GlobalGT("AC#BackToSurface","GLOBAL",1)~ THEN BEGIN hello_anything_achieved
SAY ~Der irrende Wanderer lächelt über Euch, <CHARNAME>! Habt Ihr schon etwas erreichen können?~
 IF ~Global("AC#Clans_Parting","GLOBAL",1)~ THEN REPLY ~Habt Ihr schon einmal von einem Drachenfriedhof gehört?~ + stone_clans_parting_01
 //IF ~Global("AC#BackToSurface","GLOBAL",1)~ THEN REPLY ~Wisst Ihr zufällig, wie ich wieder zurück an die Oberfläche komme?~ + back_to_surface_01
//IF ~PartyHasItem("AC#SRLAD")~ THEN REPLY ~Ich habe diese Leiter hier. Was genau soll ich noch einmal damit machen?~ + eyestalker_tunnels_01
//IF ~PartyHasItem("ac#eyebe") GlobalLT("AC#BackToSurface","GLOBAL",5)~ THEN REPLY ~Hier ist der Augenstiel eines Betrachters. Wie geht es jetzt mit dem Trank weiter?~ + have_eyestalk
//IF ~PartyHasItem("ac#eyebe") Global("AC#BackToSurface","GLOBAL",5)~ THEN REPLY ~Was soll ich nocheinmal mit dem Augenstiel machen?~ + what_do_with_eyestalk_again
IF ~PartyHasItem("AC#DRFT1")
	Global("AC#RepairDriftdisc","GLOBAL",1)~ THEN REPLY ~Ich habe eine Schwebescheibe der Drow in den Spinnenschächten gefunden. Wisst Ihr, wie ich sie wieder in Gang setzen könnte?~ GOTO found_driftdisc
IF ~~ THEN REPLY ~Derzeit nichts. Ich mache mich wieder auf den Weg.~ + keep_on_going_surface
END				

IF ~OR(2)
GlobalGT("AC#Clans_Parting","GLOBAL",0)
GlobalGT("AC#BackToSurface","GLOBAL",0)~ THEN BEGIN hello_surface_clansparting
SAY ~Seid gegrüßt, <CHARNAME>! Wie ich hörte, habt Ihr seit unserem letzten Zusammentreffen große Abenteuer bestanden und unserer Stadt einen großen Dienst erwiesen! Was kann ich für Euch tun?~
IF ~Global("AC#Clans_Parting","GLOBAL",1)~ THEN REPLY ~Habt Ihr schon einmal von einem Drachenfriedhof gehört?~ + stone_clans_parting_01
//IF ~Global("AC#BackToSurface","GLOBAL",1)~ THEN REPLY ~Wisst Ihr zufällig, wie ich wieder zurück an die Oberfläche komme?~ + back_to_surface_01
IF ~Global("AC#Ellhimar_Cernd","GLOBAL",3)
Global("Prison_Cernd","ACIL53",0)~ THEN REPLY ~Ich soll auf Geheiß von Vronia Cernd aus seiner Zelle befreien.~ + free_cernd
IF ~PartyHasItem("AC#DRFT1")
	Global("AC#RepairDriftdisc","GLOBAL",1)~ THEN REPLY ~Ich habe eine Schwebescheibe der Drow in den Spinnenschächten gefunden. Wisst Ihr, wie ich sie wieder in Gang setzen könnte?~ GOTO found_driftdisc
IF ~~ THEN REPLY ~Derzeit nichts. Ich mache mich wieder auf den Weg.~ + keep_on_going_surface
END

	IF ~~ THEN BEGIN found_driftdisc
	SAY ~Hmm... Lasst mich einmal sehen...~
	=
	~Das Gerät wäre in der Tat gut geeignet, um Euch den Schacht, den Ihr heruntergekommen seid, wieder nach oben zu bringen. Wenn die Scheibe denn fliegen würde!~
	IF ~~ THEN REPLY ~Was muss ich tun, damit das Ding wieder fliegt?~ GOTO get_driftdisc_to_work 
	END
	
		IF ~~ THEN BEGIN get_driftdisc_to_work
		SAY ~Tja, und da bin ich mit meinem Zwergisch am Ende. Ihr benötigt einen mächtigen Zauber, dessen bin ich mir sicher! Ich fürchte nur, es wird in Iltkazar keinen Zwerg geben, der solch arkane Magie anwenden könnte.~
		=
		~Wartet! Aber vielleicht könnte Euch Ellhimar helfen!~
		IF ~~ THEN REPLY ~Ellhimar?~ GOTO driftdisc_ellhimar
		END
		
			IF ~~ THEN BEGIN driftdisc_ellhimar
			SAY ~Wenn jemand imstande ist, solch einen Zauber zu wirken, dann der Menschenmagier! Ich weiß nur nicht, inwieweit dies in seinem ... Zustand... möglich ist.~
			IF ~~ THEN REPLY ~Gut, dann sollte ich einmal schauen, ob ich Ellhimar dazu bewegen kann, diese Scheibe zu verzaubern.~ GOTO driftdisc_ellhimar_02 
			END
			
			IF ~~ THEN BEGIN driftdisc_ellhimar_02
			SAY ~Tut das. Ich wünsche Euch viel Glück.~
			IF ~Global("ElernSpawn","ACIL53",0)~ THEN DO ~SetGlobal("AC#RepairDriftdisc","GLOBAL",10)
			EraseJournalEntry(@20802)
			AddJournalEntry(@20803,QUEST)~ GOTO need_something_else 
			IF ~GlobalGT("ElernSpawn","ACIL53",0)~ THEN DO ~SetGlobal("AC#RepairDriftdisc","GLOBAL",10)
			EraseJournalEntry(@20802)
			AddJournalEntry(@20803,QUEST)~ EXIT 
			END
			
		IF ~~ THEN BEGIN need_something_else
		SAY ~Ihr seht so aus, als ob Ihr noch etwas mit mir besprechen wolltet.~
		IF ~~ THEN REPLY ~Habt Ihr schon einmal von einem Drachenfriedhof gehört?~ + stone_clans_parting_01
		END	

	IF ~~ THEN BEGIN keep_on_going_surface
	SAY ~Gut. Sagt mir Bescheid, wenn Ihr etwas von mir benötigt.~
	IF ~~ THEN DO ~~ EXIT 
	END
	
	IF ~~ THEN BEGIN stone_clans_parting_01
	SAY ~Ein Drachenfriedhof? Um welchen Ort im Unterreich soll es sich dabei handeln?~
	++ ~So weit ich verstehe, handelt es sich um einen für Elfen heiligen Ort an der Oberfläche.~ + stone_clans_parting_02 
	END
	
		IF ~~ THEN BEGIN stone_clans_parting_02
		SAY ~Elfen und Drachen? Jetzt, wo Ihr es erwähnt, erinnere ich mich an etwas...~
		=
		~Elern, Liebes, würdest Du bitte einmal zu mir und unserem Gast von der Oberfläche kommen?~
		IF ~~ THEN DO ~SetGlobal("ElernSpawn","ACIL53",1)~ EXIT
		END
		
	
	IF ~~ THEN BEGIN back_to_surface_01
	SAY ~Ihr wollt uns wieder verlassen?~
	++ ~Um Eurer Stadt zu helfen, muss ich an der Oberfläche weiter nach Antworten suchen.~ + back_to_surface_02
	END
	
		IF ~~ THEN BEGIN back_to_surface_02
		SAY ~Ich verstehe. Hmm. Ihr seid auf Eurem Weg den tiefen Schacht heruntergeschwebt, der zu einer Höhle an der Oberfläche führt, nicht wahr?~
		++ ~Ja. Die Höhle heißt Ravimors Höhle. Ich habe den Fall dank eines Federfalltrankes schadlos überstanden.~ + back_to_surface_03
		END
		
			IF ~~ THEN BEGIN back_to_surface_03
			SAY ~Ich hörte von diesem Schacht. Niemand weiß, wie tief er wirklich ist. Deshalb ist es schwierig, ihn nach oben zu schweben. Man könnte Leviatationszauber auf Euch wirken, aber wenn die Wirkung des Zaubers nachlässt und Ihr noch nicht oben angekommen wäret, würdet Ihr unweigerlich wieder hinab in die Tiefe stürzen.~
			++ ~Gibt es denn keinen Gegenstand oder ein Artefakt, welches mir das Hinaufschweben erleichtern würde?~ + back_to_surface_artifact
			++ ~Was schlagt Ihr also vor?~ + back_to_surface_artifact
			END
			
				IF ~~ THEN BEGIN back_to_surface_artifact
				SAY ~Die Drow benutzen Gegenstände mit Schwebe- und Levitationszauber häufig. Unsere Krieger haben von einem Feldzug gegen die Dunkelelfen sogar eine ihrer berühmten Schwebescheiben erbeutet.~
				++ ~Schwebescheibe?~ + driftdisc_01
				//++ ~Was schlagt Ihr also vor?~ + back_to_surface_04
				END
				
					IF ~~ THEN BEGIN driftdisc_01
					SAY ~Ja. Diese Gegenstände sind aus einem seltsamen Fels geschlagen und aufwändig verziert. Sie ermöglichen es den Drow, willentlich nach oben und unten zu schweben und dabei auch einiges an Gewicht transportieren zu können.~
					++ ~Und Ihr habt eine solche hier bei Euch?~ + driftdisc_02
					END
					
						IF ~~ THEN BEGIN driftdisc_02
						SAY ~Wir hatten sie eine zeitlang hier in der Bibliothek im Einsatz, ja. Bei dem tiefen zentralen Schacht bot sich ihre Verwendung förmlich an. Ich fand den Gegenstand eigentlich recht nützlich, aber die anderen Zwerge - selbst die Anhänger Dugmarens! - standen einem Drow-Hilfsmittel äußerst skeptisch gegenüber. Irgendwann haben wir das Ding ausgemustert und zu Shagretor ins " Vermächtnis" gebracht, wo es immer noch herumliegen sollte. Je mehr ich gerade darüber nachdenke, desto besser finde ich die Idee, dass Ihr mit Hilfe dieser Scheibe wieder an die Oberfläche zurückkehren könntet.~
						++ ~Wo ist das "Vermächtnis"?~ + driftdisc_legacy_01
						END
						
							IF ~~ THEN BEGIN driftdisc_legacy_01
							SAY ~Im Norden von Haelas Hallen. Fragt Shagretor, den Inhaber vom "Vermächtnis" danach. Wenn Ihr sagt, dass ich Euch geschickt habe, wird er es Euch überlassen. Damit werdet Ihr wieder an die Oberfläche zurückschweben können.~
							++ ~Und Ihr meint, dass diese... Scheibe noch immer funktionieren wird?~ + driftdisc_still_ready
							END
							
								IF ~~ THEN BEGIN driftdisc_still_ready
								SAY ~Das müsstet Ihr Shagretor fragen. Er sammelt immer allen möglichen alten Krempel und kennt sich damit am Besten aus.~
								++ ~Gut, ich werde ihn aufsuchen und versuchen, diese Scheibe in Betrieb zu nehmen.~ + driftdisc_goodbye
								END
								
									IF ~~ THEN BEGIN driftdisc_goodbye
									SAY ~Tut das. Wenn Ihr Fragen habt, wisst Ihr, wo ich zu finden bin.~
									IF ~~ THEN DO ~SetGlobal("AC#BackToSurface","GLOBAL",4)
									EraseJournalEntry(@64200)
									AddJournalEntry(@64207,QUEST)~ EXIT
									END	
				

IF ~GlobalGT("AC#RC_Bettargh_Third","GLOBAL",1)~ THEN BEGIN hello_runestone_barakuir
SAY ~Seid gegrüßt, <CHARNAME>! Gibt es etwas Neues zu berichten?~
IF ~~ THEN REPLY ~Nein, ich arbeite aber daran.~ + keep_work_runstone_barakuir
IF ~PartyHasItem("ac#run53")~ THEN REPLY ~Ich habe die Runentafel für Euch besorgt - seht her!~ + have_runestone_barakuir
IF ~Global("AC#Ellhimar_Cernd","GLOBAL",3)
Global("Prison_Cernd","ACIL53",0)~ THEN REPLY ~Ich soll auf Geheiß von Vronia Cernd aus seiner Zelle befreien.~ + free_cernd
END

	IF ~~ THEN BEGIN free_cernd
	SAY ~Ssssscht! Nicht so laut! Das bleibt unser Geheimnis, ja? Cernds Zelle befindet sich im Westen dieser Bibliothek. Ich habe die Wachen bereits angewiesen, Euch durchzulassen. Und jetzt tut bitte so, als wüsstet Ihr von nichts, in Ordnung?~
	IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN keep_work_runstone_barakuir
	SAY ~Sagt mir Bescheid, wenn Ihr etwas braucht!~
	IF ~~ THEN DO ~~ EXIT 
	END
	
	IF ~~ THEN BEGIN have_runestone_barakuir
	SAY ~Da ist ja prächtig! Zeigt einmal her...~
	IF ~~ THEN DO ~TakePartyItem("ac#run53")~ + have_runestone_02 
	END
	
		IF ~~ THEN BEGIN have_runestone_02
		SAY ~"Der Den-Dunglor, der große See im Osten der Mithrilstadt, stellte für unsere Boote kein Hindernis dar. Die Wasser blieben ruhig, und so landeten wir nach einiger Zeit an den Ufern der anderen Seite, wo wir die Ausläufer der Stadt Barakuirs ausmachten. Unsere Suche nach Überlebenden blieb jedoch erfolglos." Das sind furchtbare Nachrichten, aber genau das, wonach wir suchen.~
		=
		~Der "Den-Dunglor" oder Eisensee liegt im Osten Iltkazars. An seinem anderen Ufer sollte ein Weg nach Barakuir zu finden sein. Zumindest, wenn die Überlieferung dieses Runensteines auch nach tausenden von Jahren seine Gültigkeit nicht verloren hat.~
		IF ~~ THEN REPLY ~Wie komme ich dorthin?~ + runestone_tell_rc 
		IF ~~ THEN REPLY ~Ich nehme an, Ihr stellt mir ein Boot zur Verfügung, oder soll ich dahin schwimmen?~ + runestone_tell_rc 
		END
		
			IF ~~ THEN BEGIN runestone_tell_rc
			SAY ~Diese Dinge muss wieder der Regentschaftsrat entscheiden. Überbringt den Ratsmitgliedern den Inhalt dieser Runentafel. Ihr wisst jetzt, was darin steht. Ich werde sie hier behalten und noch ein wenig weiter studieren.~
			=
			~Und haltet mich bei dieser Sache bitte auf dem Laufenden! Ich bin sehr gespannt, was Ihr in Barakuir finden werdet.~
			IF ~~ THEN DO ~SetGlobal("AC#RC_Bettargh_Third","GLOBAL",10)
			EraseJournalEntry(@62032)
			AddJournalEntry(@62033,QUEST)
			~ EXIT
			END

IF ~GlobalGT("AC#TalkedToBettargh","ACIL53",1)~ THEN BEGIN hello_after_first_talk
SAY ~Oh, seid gegrüßt, <CHARNAME>! Was kann ich für Euch tun?~
++ ~Derzeit nichts.~ + goodbye_02
IF ~PartyHasItem("AC#SRBK1")~ THEN REPLY ~Ich habe hier ein Buch, welches Beldas bis zu seinem Tode bei sich trug. Ich soll es Euch geben.~ + beldas_book
IF ~Global("AC#RC_Bettargh_Third","GLOBAL",1)~ THEN REPLY ~Der Regentschaftsrat schickt mich mit einer Bitte zu Euch. Ich soll Euch fragen ob Ihr einen Weg nach Barakuir kennt.~ + way_to_barakuir
END

IF ~Global("AC#TalkedToBettargh","ACIL53",1)~ THEN BEGIN 1
SAY ~Oh, Ihr müsst der <RACE> von der Oberfläche sein! Seid gegrüßt, ich bin Bettargh, treuer Diener des Dugmaren Leuchtmantel. Schön, Euch in dieser Bibliothek willkommen zu heißen! Was kann ich für Euch tun?~ [AC#ILBEB]
IF ~~ THEN REPLY ~Ihr seid einer der wenigen Bewohner Iltkazars, der mir nicht mit Abneigung gegenübertritt.~ DO ~SetGlobal("AC#TalkedToBettargh","ACIL53",2)~ + abneigung
IF ~~ THEN REPLY ~Ich sehe mich hier nur einmal um.~ DO ~SetGlobal("AC#TalkedToBettargh","ACIL53",2)~ + bibliothek
IF ~PartyHasItem("AC#SRBK1")~ THEN REPLY ~Ich habe nach Euch gesucht. Ich habe ein Buch für Euch.~ DO ~SetGlobal("AC#TalkedToBettargh","ACIL53",2)~ + book_help_mithbarak
END

	IF ~~ THEN BEGIN abneigung
	SAY ~Der Irrende Entdecker lehrt uns, allem Fremden gegenüber aufgeschlossen zu sein.~
	++ ~Das ist für Zwerge ja fast ein revolutionärer Glaube.~ + faith
	END

		IF ~~ THEN BEGIN faith
		SAY ~In der Tat!~ 		
		IF ~~ THEN GOTO bibliothek
		END
		
		IF ~~ THEN BEGIN book_help_mithbarak
		SAY ~Oh, stimmt! Man erzählt sich in der Stadt, dass Ihr hier seid, um unserem König zu helfen.~
		IF ~~ THEN REPLY ~Ja, das bin ich.~  + how_help
		IF ~PartyHasItem("AC#SRBK1")~ THEN REPLY ~Ich habe hier ein Buch, welches Beldas bis zu seinem Tode bei sich trug. Ich soll es Euch geben.~ + beldas_book
		END
		
		IF ~~ THEN BEGIN bibliothek
		SAY ~Unter unserem weisen König ist diese Bibliothek zu einem Hort des Wissens und der Weltoffenheit geworden. Man erzählt sich, dass Ihr hier seid, um unserem König zu helfen?~
		IF ~~ THEN REPLY ~Ja, das bin ich.~ + how_help
		END

			IF ~~ THEN BEGIN how_help
			SAY ~Interessant! Wie gedenkt Ihr das denn zu bewerkstelligen?~ [AC#ILBEC]
			IF ~~ THEN REPLY ~Das weiß ich noch nicht genau.~ + how_help_02
			IF ~PartyHasItem("AC#SRBK1")~ THEN REPLY ~Ich habe hier ein Buch, welches Beldas bis zu seinem Tode bei sich trug. Ich soll es Euch geben.~ + beldas_book
			IF ~Global("AC#RC_Bettargh_Third","GLOBAL",1)~ THEN REPLY ~Der Regentschaftsrat schickt mich mit einer Bitte zu Euch. Ich soll Euch fragen ob Ihr einen Weg nach Barakuir kennt.~ + way_to_barakuir
			END

				IF ~~ THEN BEGIN how_help_02
				SAY ~Das ist schon einmal ein sehr guter Ansatz.~
				=
				~Die meisten meinen nämlich ganz genau zu wissen, was unserem König fehlt, und beißen sich derart an einer Spur fest, dass sie nicht merken, dass der Weg nicht mehr weiterführt. Der Irrende Entdecker lehrt uns, immer offenen Auges durch die Welt zu reisen und jede Möglichkeit, die sich einem bietet, in Betracht zu ziehen.~
				IF ~~ THEN DO ~~ GOTO no_idle_chatter
				END
				
					IF ~~ THEN BEGIN no_idle_chatter
					SAY ~Aber Ihr seid nicht hier, um mit mir hochtrabende Gespräche zu führen, richtig?~
					IF ~~ THEN REPLY ~Ich habe einige Fragen.~ + questions_01
					END
					
					// Dialog Block with Questions
					
						IF ~~ THEN BEGIN questions_01
						SAY ~Sicher! Was liegt Euch auf dem Herzen?~
						IF ~PartyHasItem("AC#SRBK1")~ THEN REPLY ~Ich habe hier ein Buch, welches Beldas bis zu seinem Tode bei sich trug. Ich soll es Euch geben.~ + beldas_book
						IF ~Global("AC#RC_Bettargh_Third","GLOBAL",1)~ THEN REPLY ~Der Regentschaftsrat schickt mich mit einer Bitte zu Euch. Ich soll Euch fragen ob Ihr einen Weg nach Barakuir kennt.~ + way_to_barakuir
						IF ~~ THEN REPLY ~Nichts mehr. Ich werde später wieder vorbeikommen.~ + goodbye_02
						END
						
						// The PCs ask about a way to Barakuir
						
							IF ~~ THEN BEGIN way_to_barakuir
							SAY ~Nach Barakuir? Macht Ihr Scherze?~
							IF ~~ THEN REPLY ~Ich hatte den Eindruck, dass es der Regentschaftsrat durchaus ernst meinte.~ + rc_barakuir_really
							END
							
								IF ~~ THEN BEGIN rc_barakuir_really
								SAY ~Es hat etwas mit dem mysteriösen Spiegel zu tun, den Ihr bei dem Magier gefunden habt, richtig?~
								IF ~~ THEN REPLY ~Ja. Ich hatte darin einen Gedankenschinder gesehen.~ + mirror_seen_mindflayer
								END
								
									IF ~~ THEN BEGIN mirror_seen_mindflayer
									SAY ~Und da die Gedankenschinder vor Jahrhunderten zum Untergang Barakuirs beigetragen haben, erhofft sich der Rat von einem Besuch an diesem Ort neue Erkenntnisse.~
									IF ~~ THEN REPLY ~Was genau hat es mit Barakuir auf sich?~ + tell_me_about_barakuir
									END
									
										IF ~~ THEN BEGIN tell_me_about_barakuir
										SAY ~Barakuir war eines der Unterkönigreiche Shanatars. Es soll irgendwo in der Nähe Iltkazars im Unterreich liegen, doch die Zugänge sind schon lange vergessen. Die ganze Geschichte darüber werde ich Euch nicht erzählen können. Dies würde ein Menschenleben oder länger dauern. Deshalb in aller Kürze: In Barakuir herrschte ein Zwergenclan, von dem Ihr sogar an der Oberfläche vielleicht schon etwas gehört haben könntet. Er hieß Clan Duergar.~
										IF ~~ THEN REPLY ~Die Duergar, die bösen Grauzwerge, lebten in Barakuir?~ + duergar_01
										END
										
											IF ~~ THEN BEGIN duergar_01
											SAY ~Ja. Einst war Clan Duergar ein Clan wie alle anderen von Shanatar auch. Die Zwerge des Clans waren unsere Brüder und Schwestern. Doch irgendwann kühlte das Verhältnis des Clans Duergar zu den anderen Unterkönigreichen ab.~
											=
											~Die Zwerge Barakuirs fühlten sich bei der Wahl des Großkönigs übergangen und zogen sich zurück. Doch irgendwann gelangten sie in starke Bedrängnis durch die Illithiden, die in der Nähe ihrer Clanfeste eine Stadt errichtet hatten. Die anderen Königreiche antworteten nicht auf die Hilfeersuchen aus Barakuir, und als sich doch eine Expedition aus Iltkazar anschickte, den Brüdern und Schwestern von Clan Duergar beizustehen, fand sie die Stadt verlassen vor. Der ganze Clan war von Illithiden versklavt und verschleppt worden. Die ehemals mächtige Stadt blieb zerstört und leer zurück.~
											IF ~~ THEN REPLY ~Und was befindet sich jetzt dort?~ + whats_in_barakuir_now
											END
											
												IF ~~ THEN BEGIN whats_in_barakuir_now
												SAY ~Das weiß keiner, denn niemand hat seither mehr einen Fuß in die verwunschene Stadt gesetzt. Später gelang dem Clan Duergar die Flucht aus der Gefangenschaft der *caradhak*, und seither schwören die Zwerge dieses Clans Rache an ihren Vettern für den Verrat, der damals ihrer Meinung nach an ihnen begangen wurde.~
												IF ~~ THEN REPLY ~Und warum soll ich dann dort nach Hinweisen suchen?~ + why_hints
												END
												
													IF ~~ THEN BEGIN why_hints
													SAY ~Wenn Ihr im Spiegel Ellhimars wirklich einen Gedankenschinder gesehen habt, könnte das bedeuten, dass sich die Illithiden erneut anschicken, einen Zwergenclan in die Sklaverei zu führen. Das wären dann wir.~
													IF ~~ THEN REPLY ~Und wie soll ich dorthin kommen, wenn niemand weiß, wo diese Stadt der Grauzwerge liegt?~ + how_to_get_to_barakuir
													END
																										
														IF ~~ THEN BEGIN how_to_get_to_barakuir
														SAY ~Wir bewahren in diesen Hallen sämtliche Aufzeichnungen der Geschichte Shanatars auf. Der Bericht der Gruppe, welche vor Jahrhunderten nach Barakuir aufgebrochen ist, müsste noch auf einer der alten Runentafeln in dieser Bibliothek zu finden sein.~
														IF ~~ THEN + not_much_time_left
														END
														
														// old - metagolem
														/*
															IF ~~ THEN BEGIN how_long_to_find_rune
															SAY ~Das ist die Schwierigkeit. Dieser Ort wurde dazu geschaffen, Wissen zu bewahren, nicht Wissen schnell verfügbar zu machen. Wir Zwerge schreiben deshalb auf Steintafeln unsere Geschichte nieder, um die Geschehnisse bis in die Ewigkeit in Erinnerung zu behalten. Schnell einen bislang eher unbedeutenden Bericht zu finden könnte lange dauern - auch, wenn ich diese Bibliothek in- und auswendig kenne.~
															IF ~~ THEN REPLY ~Ich fürchte aber, dass wir kein "Menschenleben" Zeit haben werden, um die Stadt und Euren König zu retten.~ + not_much_time_left
															IF ~~ THEN REPLY ~Nun ja, ich habe Zeit, Iltkazar aber weniger.~ + not_much_time_left
															END
														*/
															
																IF ~~ THEN BEGIN not_much_time_left
																SAY ~Da es dem Rat wichtig ist, werde ich alle verfügbaren Gelehrten auf die Suche nach den Aufzeichnungen schicken.~
																IF ~~ THEN DO ~~ GOTO bettargh_search_runestone_barakuir
																END
															
																	// old - metagolem
/*																	
																	IF ~~ THEN BEGIN bettargh_idea_meta_golem
																	SAY ~Vielleicht sind uns in diesem Dilemma endlich einmal die Tiefengnome Nebeluns von Nutzen, die bisher eher als *jarghs* in Erscheinung getreten sind.~
																	IF ~~ THEN DO ~~ GOTO bettargh_meta_golem_gnomes
																	END
																	*/
																	
																		// old - metagolem
																		/*
																		IF ~~ THEN BEGIN bettargh_meta_golem_gnomes
																		SAY ~Einer von ihnen versucht seit geraumer Zeit, einen Metagolem zu erschaffen.~
																		IF ~~ THEN REPLY ~Was ist ein Metagolem?~ + bettargh_whats_a_meta_golem
																		END
																		*/
																		
																			IF ~~ THEN BEGIN bettargh_search_runestone_barakuir
																			SAY ~Jorboud Hornfinger ist mein Aufseher am zentralen Schacht dieser Bibliothek. Er wird Euch die Runentafel am Schnellsten besorgen können. Geht und bittet ihn darum. Bringt die Tafel dann zurück zu mir, dann werde ich einen Blick darauf werfen.~
																			IF ~~ THEN DO ~SetGlobal("AC#RC_Bettargh_Third","GLOBAL",2)
																			EraseJournalEntry(@62030)
																			AddJournalEntry(@62031,QUEST)
																			~ + bettargh_talk_to_Jorboud
																			END
																			
																				IF ~~ THEN BEGIN bettargh_talk_to_Jorboud
																				SAY ~Ich werde derweil meine weiteren Gelehrten bitten, ebenfalls nach Tafeln zu Barakuir Ausschau zu halten.~
																				IF ~~ THEN REPLY ~Ich werde den Aufseher bald aufsuchen. Vorher habe ich noch weitere Fragen.~  + questions_01
																				IF ~~ THEN REPLY ~Ich werde mich sogleich auf den Weg machen.~ + goodbye_02																				
																				END
						
						// The PCs deliver Beldas' Book about the astral plane
							IF ~~ THEN BEGIN beldas_book
							SAY ~Der arme Beldas, ja. Ich habe von seinem Schicksal gehört. Er war ein guter Zwerg und ein formidabler Schüler. Lasst mich das Buch einmal sehen...~
							IF ~~ THEN DO ~SetGlobal("AC#BettarghHasBook","GLOBAL",1)
							TakePartyItem("AC#SRBK1")
							EraseJournalEntry(@62101)
							AddJournalEntry(@62102,QUEST_DONE)
							~ + beldas_book_02
							END
							
								IF ~~ THEN BEGIN beldas_book_02
								SAY ~"Die Astrale See, ein Reisebericht in das Reich aus Silber von Maskyr dem Einäugigen"? Das ist eine interessante Wahl. Dieses Buch besitzen wir in unserer Bibliothek noch nicht. Wo hatte es Beldas her?~
								IF ~~ THEN REPLY ~Aus Kerzenburg.~ + candlekeep01
								END
								
									IF ~~ THEN BEGIN candlekeep01
									SAY ~Kerzenburg! Wie gerne würde ich einmal einen Blick auf diese legendäre Bibliothek an der Oberfläche werfen!~
									IF ~~ THEN REPLY ~Ich stamme selbst aus Kerzenburg.~ + im_from_candlekeep
									END
									
										IF ~~ THEN BEGIN im_from_candlekeep
										SAY ~Beim wandernden Bastler! Warum sagt Ihr das nicht gleich! Dann seid Ihr ja hier in unseren Hallen doppelt willkommen!~
										IF ~~ THEN DO ~SetGlobal("AC#BettarghCandlekeep","ACIL53",1)~ GOTO beldas_book_03
										END
										
											IF ~~ THEN BEGIN beldas_book_03
											SAY ~Zurück zu dem Buch, das Beldas Euch gegeben hat. Ich bin mir sicher, dass er es nicht zufällig ausgewählt hatte. Er war besessen davon, unseren König aus seinem Schlaf zu befreien.~
											IF ~~ THEN REPLY ~Und hat dafür mit seinem Leben bezahlt.~ + beldas_book_04
											IF ~~ THEN REPLY ~Was könnte es mit dem Buch auf sich haben?~ + beldas_book_04
											END
											
												IF ~~ THEN BEGIN beldas_book_04
												SAY ~Es handelt von der Astralebene, soviel ist sicher. Wir benötigen aber Zeit, es zu studieren. Allerdings ist Zeit das Einzige, das wir angesichts der sorgenvollen Situation nicht im Überfluss haben. Ich werde es mehreren meiner besten Schreiber geben, auf dass sie eine Zusammenfassung der Kapitel erstellen mögen. Wir werden Euch umgehend mitteilen, falls wir etwas herausgefunden haben. Seid nochmals gedankt, dass Ihr die Mühen auf Euch genommen habt, das Buch hierher zu bringen.~
												IF ~~ THEN REPLY ~Gerne geschehen! Ich muss mich jetzt verabschieden.~ + goodbye_01
												IF ~~ THEN REPLY ~Ich habe noch weitere Fragen.~ + questions_01
												END
												
								IF ~~ THEN BEGIN goodbye_01
								SAY ~Dann werde ich nun in die Haupthalle gehen und mich wieder meinen Studien widmen. Ihr findet mich hier immer im Bereich des großen Schachtes in dieser Bibliothek.~
								IF ~~ THEN DO ~SetGlobal("BettarghMoves","ACIL53",1)~ EXIT 
								END
								
								IF ~~ THEN BEGIN goodbye_02
								SAY ~Dann werde ich mich wieder meinen Studien widmen.~
								IF ~~ THEN EXIT 
								END

// Chain #1: Bettargh begutachtet den Schaden, der durch die Explosion an der Bibliothek entstanden ist
CHAIN IF WEIGHT #-1 ~NumTimesTalkedTo(0)~ THEN AC#BETT1 1
~Bei dem wandernden Tüftler, da ist diesmal aber ein großer Schaden entstanden!~ [AC#ILBEA]
// DO ~SetGlobal("AC#Damage","ACIL53",1)~
== AC#XOTH1 ~Ja, Tiefer Shanavant Abgrundlied, durch die Explosion sind zahlreiche Bücher der Oberfläche zerstört worden.~
== AC#BETT1 ~Hat es auch Bücher getroffen, die unserem König wichtig waren?~
== AC#XOTH1 ~Das kann ich jetzt noch nicht überblicken, Meister Bettargh! Wir werden uns sogleich daran machen, den Schaden zu begutachten.~
== AC#KUKR1 ~Viele der Bücher sind wahrscheinlich unwiederbringlich verloren, aber bei dem ganzen Papier, das hier nun überall herumliegt, könnten wir zumindest versuchen, einige Seiten neu zu binden.~
== AC#BETT1 ~Das ist eine gute Idee. Und seht auch nach den Gnomen, Xothor. Ich glaube zwar nicht, dass dort unten jemand ernsthaft zu Schaden gekommen ist, aber das kann man nie wissen.~
END
IF ~~ THEN EXTERN ~AC#XOTH1~ jawohl

/*******************************************************************************************************
Dialog Elern 3 
*******************************************************************************************************/
BEGIN ~AC#ELER5~

IF ~~ THEN BEGIN okidok
SAY ~Wenn das so ist, ist das Ganze vielleicht doch noch für etwas nütze. Kommt, <CHARNAME>, folgt mir zu Borthuns Standbild im Osten der Bibliothek!~
IF ~~ THEN DO ~SetGlobal("ElernSpawn","ACIL53",3)
EraseJournalEntry(@64100)
AddJournalEntry(@64101,QUEST)
MoveToPointNoInterrupt([2755.920])~ EXIT
END

IF ~Global("ElernSpawn","ACIL53",4)~ THEN BEGIN already_talked_to_anthan
SAY ~Habt Ihr schon mit Anthan über Borthuns Buch gesprochen?~
IF ~GlobalLT("AC#Clans_Parting","GLOBAL",3)~ THEN REPLY ~Nein, noch nicht.~ + not_talked_to_anthan
IF ~GlobalGT("AC#Clans_Parting","GLOBAL",2)~ THEN REPLY ~Ja, das habe ich.~ + yes_talked_to_anthan
END

	IF ~~ THEN BEGIN not_talked_to_anthan
	SAY ~Naja, jedenfalls wünsche ich Euch viel Glück dabei.~
	IF ~~ THEN EXIT
	END
	
	IF ~~ THEN BEGIN yes_talked_to_anthan
	SAY ~Oh! Und? Hat er es Euch gegeben?~
	IF ~~ THEN REPLY ~Mit einigem Widerwillen - ja.~ + yes_talked_to_anthan_02
	END
	
		IF ~~ THEN BEGIN yes_talked_to_anthan_02
		SAY ~Das ist gut! Geht damit zu Gromi in den Thronsaal, er wird die nächsten Schritte mit Euch besprechen.~
		IF ~~ THEN EXIT
		END

IF ~Global("ElernSpawn","ACIL53",3)~ THEN BEGIN borthuns_monument
SAY ~Dies hier ist das Standbild von Borthun. Vielleicht habt Ihr es ja vorher schon einmal gesehen und Euch gefragt, was es damit auf sich hat.~
IF ~~ THEN REPLY ~Er hat so gar nichts Zwergenhaftes an sich.~ + borthuns_monument_02
IF ~~ THEN REPLY ~Lustige Schuhe für einen Zwerg.~ + borthuns_monument_02
END

	IF ~~ THEN BEGIN borthuns_monument_02
	SAY ~Borthun war zwar nicht der Gründer dieser Bibliothek, aber dank ihm ist sie heute das, was sie darstellt: Eine der größten Sammlungen von Runentafeln und Büchern im gesamten Unterreich.~
	IF ~~ THEN + borthuns_monument_03
	END

		IF ~~ THEN BEGIN borthuns_monument_03
		SAY ~Wir haben hier in unseren Archiven dank Borthuns Ehrgeiz viele Bücher von der Oberfläche. Er war ein berühmter Anhänger Dugmarens, der es sich zur Aufgabe gemacht hatte, die Länder über Iltkazar zu bereisen, zu kartografieren und soviel Wissen wie möglich für seinen Tempel zu sammeln. Sein Name war Borthun Diamantklinge, viele nannten ihn aber auch einfach Borthun, der Wanderer.~
		++ ~Erzählt weiter.~ + elern_beldas
		IF ~Global("AC#KnowBorthunDiamondblade","GLOBAL",1)~ THEN REPLY ~Beldas hat mir von diesem Borthun schon einmal erzählt.~ + already_know_borthun_beldas		
		END
	
			IF ~~ THEN BEGIN already_know_borthun_beldas
			SAY ~Das glaube ich gerne.~
			IF ~~ THEN + elern_beldas
			END
			
			IF ~~ THEN BEGIN elern_beldas
			SAY ~Borthun war der Ur-Ur-Urgroßvater von Beldas Diamantklinge. Dem Beldas, dem Ihr an der Oberfläche begegnet seid. Und der leider dort seinen Tod gefunden hat.~
			IF ~~ THEN REPLY ~Ach?~ GOTO beldas_borthun_grandpa
			IF ~~ THEN REPLY ~Fahrt fort.~ GOTO beldas_borthun_grandpa
			END
			
			IF ~~ THEN BEGIN beldas_borthun_grandpa
			SAY ~Beldas war ein glühender Verehrer Bortuns. Beide gehörten dem Clan Diamantklinge an. Beldas wollte ihm in jeglicher Hinsicht nacheifern. Leider hat ihm dies kein Glück gebracht, wie Ihr wisst.~			
			=
			~Ich muss Euch sagen, dass Beldas und ich vor vielen Jahren einmal ein Paar waren. Wir wollten heiraten und einen eigenen Clan gründen. Es war unsere große *taerin*.~
			++ ~Dann muss Euch sein Verlust also umso mehr schmerzen.~ + beldas_loss	
			++ ~Das hatte ich mir schon gedacht.~ + beldas_elern_hint
			END
			
				IF ~~ THEN BEGIN beldas_elern_hint
				SAY ~Es ist wohl nicht so leicht zu verbergen.~
				++ ~Dann muss Euch sein Verlust also umso mehr schmerzen.~ + beldas_loss	 
				END
			
				IF ~~ THEN BEGIN beldas_loss
				SAY ~Ja, das tut es. Wobei unsere Liebe schon vor seinem Aufbruch entzwei gegangen ist. Einerseits, weil er besessen davon war, die Oberfläche kennenzulernen. Und andererseits, weil sein Vater, Anthan Diamantklinge, unserer Ehe keinen Segen gegeben hat.~
				++ ~Warum nicht?~ + why_no_taerin	
				END
				
					IF ~~ THEN BEGIN why_no_taerin
					SAY ~Anthan hatte als Priester des Moradin für seinen Sohn wohl eine andere Frau vorgesehen als die Tochter eines Priesters, dessen Schutzgott von den alten Zwergen nur milde belächelt wird. Er gab auch mir die Schuld für Beldas' Sinneswandel, plötzlich kein Schmied mehr werden zu wollen. Das Verhalten von Borthun, dem Wanderer, der von seiner letzten Reise nicht mehr zurückgekehrt ist, gilt immer noch als Schande für Clan Diamantklinge und als mahnendes Beispiel, nicht die alten Wege zu verlassen.~
					IF ~~ THEN + back_to_borthun
					END
					
						IF ~~ THEN BEGIN back_to_borthun
						SAY ~Aber zurück zu Borthuns Buch. Er hat genaue Aufzeichnungen über seine Entdeckungen in den Ländern des Lichts geführt. Es würde mich wundern, wenn er dort nicht diesen Ort, den Mith Barak besucht hat, erwähnt hätte.~
						++ ~Dann brauchen wir also nur in seinem Tagebuch nachzuschauen, wo sich dieser Drachenfriedhof befindet?~ + check_borthuns_diary
						END
			
							IF ~~ THEN BEGIN check_borthuns_diary
							SAY ~Eigentlich schon. Nur leider befindet sich das Tagebuch nicht in dieser Bibliothek.~
							++ ~Warum nicht?~ + why_diary_not_here	
							END
				
								IF ~~ THEN BEGIN why_diary_not_here
								SAY ~Es befindet sich im Besitz von Clan Diamantklinge. Borthun war Angehöriger dieses Clans, und bevor er zu seiner letzten Reise an die Oberfläche aufbrach, vermachte er das Tagebuch seinem Sohn, dem Urgroßvater von Anthan Diamantklinge, des Priesters in der Uralten Schmiede. Anthan rückt es nicht heraus, weil er es als Schande für seine Familie ansieht, dass ein Zwerg an die Oberfläche strebt. Darum gab es schon lange Zeit Streit zwischen Mith Barak und Anthan, dem Clanältesten.~
								++ ~Mith Barak hat sich mit Anthan gestritten?~ + dont_know_anthan	
								END
								
									IF ~~ THEN BEGIN dont_know_anthan
									SAY ~Die Moradin-Priester halten sich ja ohnehin für die einzig wahren Sprecher für die zwergische Rasse, und unser Anthan steht dem in nichts nach. Wenn es nach ihm ginge, würden wir noch genauso leben wie vor zweitausend Jahren. Gegen diese alten Steinköpfe hatte es unser König besonders schwer, dabei war ihm wirklich daran gelegen, die Stadt nach vorne zu bringen. Aber ich schweife ab.~
									=
									~*Dornar* Mith Barak machte keinen Hehl daraus, dass er Borthuns Aufzeichnungen gerne in die Bibliothek aufgenommen hätte, aber Anthan hat sich strikt geweigert. Sie haben sich damals wohl so geeinigt, dass Mith Barak das besagte Buch im Tempel Moradins lesen durfte. Dies hatte mir Beldas erzählt, bevor Mith Barak nicht mehr aus seinem Schlaf erwachte. Ich hatte es damals so verstanden, dass Beldas gemeinsam mit Mith Barak das Buch studiert hatte und sich deshalb umso mehr bemüßigt fühlte, an der Oberfläche nach einem "Heilmittel" für Mith Baraks Schlaf zu suchen. Dass Mith Barak vielleicht selbst genau aus diesem Grunde ebenfalls in Borthuns Aufzeichnungen nachschlagen wollte, kam mir bis jetzt nicht in den Sinn. Aber so könnte es gewesen sein! Wenn Ihr also glaubt, dass in diesem Buch hilfreiche Anmerkungen zu Mith Baraks Schlaf enthalten sein könnten, müsstet Ihr Anthan überzeugen, Euch dasselbe Zugeständnis zu gewähren, Euch einen Blick in Borthuns Tagebuch werfen zu lassen.~
									=
									~Das wird nur alles andere als einfach, denn unter den Bewohnern Iltkazars gilt Anthan als der Sturste.~
									IF ~~ THEN + tell_anthan_about_beldas
									END
									
										IF ~~ THEN BEGIN tell_anthan_about_beldas
										SAY ~Habt Ihr Anthan eigentlich schon von dem *raugh*, dem Tod von seinem Sohn berichtet?~
										IF ~GlobalGT("AC#CondolenceAnthan","GLOBAL",1)~ THEN REPLY ~Ja, ich habe ihm bereits mein Beileid ausgesprochen.~ + yes_condolence_anthan
										IF ~GlobalLT("AC#CondolenceAnthan","GLOBAL",2)~ THEN REPLY ~Nein, bisher noch nicht.~ + no_condolence_anthan											
										END
										
											IF ~~ THEN BEGIN no_condolence_anthan
											SAY ~Dann solltet Ihr das vielleicht schleunigst tun, <CHARNAME>.~
											IF ~~ THEN + go_ask_anthan_about_borthun
											END
											
											IF ~~ THEN BEGIN yes_condolence_anthan
											SAY ~Gut. Das ist anständig. Und dürfte die Sache vielleicht etwas erleichtern.~
											IF ~~ THEN + go_ask_anthan_about_borthun
											END
								
								IF ~~ THEN BEGIN go_ask_anthan_about_borthun
								SAY ~Jedenfalls kann ich Euch keinen besseren Rat geben, als Anthan in der Uralten Schmiede, dem Tempel Moradins im Westen der Stadt, aufzusuchen und ihn zu bitten, dass er Euch einmal einen Blick in die Aufzeichnungen seines Ahnen Borthun werfen lässt. Kehrt am Besten zu mir zurück, wenn Ihr dabei keinen Erfolg hattet, denn ich könnte Euch vielleicht ein wenig weiterhelfen, mit den Gepflogenheiten von Clan Diamantklinge richtig umzugehen.~
								IF ~~ THEN DO ~SetGlobal("ElernSpawn","ACIL53",4)
								SetGlobal("AC#Clans_Parting","GLOBAL",2)
								EraseJournalEntry(@64101)
								AddJournalEntry(@64102,QUEST)
								~ EXIT 
								END
					
					
// Elern Chain #1: Elern taucht auf und spricht mit ihrem Vater
CHAIN IF WEIGHT #-1 ~NumTimesTalkedTo(0)~ THEN AC#ELER5 yes_dad_whats_up
~Ja, Vater, was ist? Oh, <CHARNAME>! Es ist schön, Euch wiederzusehen!~
== AC#BETT1 ~Meine Tochter habt Ihr ja im Regentschaftsrat schon kennengelernt.~
== AC#ELER5 ~Was kann ich für Euch tun?~
== AC#BETT1 ~Würdet Ihr <CHARNAME> zu der Statue von Borthun führen und etwas über ihn und dieses... Buch erzählen?~
== AC#ELER5 ~Wenn Ihr meint, Vater - doch die Erinnerung schmerzt mich noch immer.~
== AC#BETT1 ~Es ist wichtig, Liebes. <CHARNAME> braucht das Wissen für unsere Stadt.~
END
IF ~~ THEN EXTERN ~AC#ELER5~ okidok
/*******************************************************************************************************
Dialog Xothor 01 
*******************************************************************************************************/
BEGIN ~AC#XOTH1~

IF ~~ THEN BEGIN jawohl
SAY ~Jawohl, Meister Bettargh. Ich werde nach den Dienern Nebeluns sehen.~
IF ~~ THEN DO ~SetGlobal("AC#TalkedToBettargh","ACIL53",1)
SetGlobal("AC#Explosion","ACIL53",1)
EscapeArea()~ EXIT
END

/*
IF ~~ THEN BEGIN jawohl
SAY ~Jawohl, Meister Bettargh. Ich werde nach den Dienern Nebeluns sehen.~
IF ~~ THEN DO ~SetGlobal("AC#TalkedToBettargh","ACIL53",1)
SetGlobal("AC#Explosion","ACIL53",1)
MoveToPointNoInterrupt([1407.349])~ EXIT
END
*/
