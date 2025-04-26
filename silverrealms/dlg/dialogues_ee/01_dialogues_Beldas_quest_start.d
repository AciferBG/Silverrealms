// ---------------------------------------------
// Beldas start-Dialoge
// ---------------------------------------------

// Beldas

BEGIN ~ac#dwf00~

IF ~GlobalGT("AC#IltkazarQuest#2","GLOBAL",0)~ THEN BEGIN hello_bookquest
SAY ~Ihr kehrt zurück! Habt Ihr das gestohlene Buch gefunden?~
IF ~~ THEN REPLY ~Nein, ich suche noch danach.~ GOTO nothing_new
IF ~Global("AC#IltkazarQuest#2","GLOBAL",2)~ THEN REPLY ~Ich suche noch nach ihm.~ + search_thief
END

	IF ~~ THEN BEGIN search_thief
	SAY ~Danke, dass Ihr Euch der Sache annehmt. Wir werden hier warten und ich versuche immer noch, etwas über den Zugang ins Unterreich in Erfahrung zu bringen.~
	IF ~~ THEN EXIT
	END

IF ~GlobalGT("AC#BeldasPlotStart","GLOBAL",3)~ THEN BEGIN hello_again
SAY ~Seid gegrüßt, <CHARNAME>! Habt Ihr bereits etwas in Erfahrung bringen können?~
++ ~Nein, ich habe noch nichts Neues zu berichten.~ + nothing_new
IF ~PartyHasItem("AC#SR#R1")~ THEN REPLY ~Vielleicht habe ich einen Hinweis gefunden, wo ein Zugang ins Unterreich zu finden ist.~ GOTO pc_found_dwarven_runestone
//IF ~Global("AC#MountTurboldMap","GLOBAL",1)~ THEN REPLY ~Ich konnte etwas herausfinden, wo vielleicht ein Zugang ins Unterreich zu finden ist.~ GOTO pc_found_dwarven_map
END

	IF ~~ THEN BEGIN nothing_new
	SAY ~Wir warten hier, bis Ihr uns Neuigkeiten bringt.~
	IF ~~ THEN EXIT
	END
	/*
	IF ~~ THEN BEGIN pc_found_dwarven_map
	SAY ~Wirklich? Das sind ja erfreuliche Neuigkeiten!~
	IF ~~ THEN EXIT
	END
	*/
	
	IF ~~ THEN BEGIN pc_found_dwarven_runestone
	SAY ~Wirklich? Das sind ja erfreuliche Neuigkeiten! Was habt Ihr zu berichten?~
	++ ~Ich habe an der alten Zwergenbrücke diesen Runenstein gefunden. Er scheint von Zwergenhand geschaffen zu sein.~ + pc_found_dwarven_runestone_02
	END
	
		IF ~~ THEN BEGIN pc_found_dwarven_runestone_02
		SAY ~Ein Runenstein? Zeigt einmal her! Der sollte sich leicht entziffern lassen!~
		IF ~~ THEN DO ~TakePartyItem("AC#SR#R1")~ + pc_found_dwarven_runestone_03
		END
		
			IF ~~ THEN BEGIN pc_found_dwarven_runestone_03
			SAY ~Hmm...  die Zwergenschrift hier ist in sehr altem Zwergisch verfasst. Noch dazu in einer Untersprache des Clan Korolnor...~
			=
			~Hier steht: "Alle Eingänge nach Shanatar nördlich von Korolnor wurden versiegelt. Turbold und seine Kuldar halten den Weg unter den Berggipfeln des Kuldin offen, kämpfen aber auf verlorenem Posten."~
			++ ~Könnt Ihr mit dieser Beschreibung etwas anfangen?~ + does_it_work
			END
			
				IF ~~ THEN BEGIN does_it_work
				SAY ~Ich hoffe schon. Schwierig ist, herauszufinden, welche Berggipfel gemeint sind. Die Menschen gaben den Bergen andere Namen als wir Zwerge, und viele der ursprünglichen Orte sind mittlerweile in Vergessenheit geraten. Ich werde mich etwas belesen müssen, um zu verstehen, wo der auf dem Runenstein erwähnte Ort heute liegen könnte.~
				IF ~~ THEN GOTO mount_turbold_01
				IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ Jaheira_kuldinpeaks_02
				IF ~IsValidForPartyDialog("Valygar")~ THEN EXTERN ~VALYGARJ~ Valygar_kuldinpeaks_02
				END
				
				IF ~~ THEN BEGIN beldas_kuldinpeaks_02
				SAY ~Oh! Das ist ein guter Hinweis, dem ich nachgehen werde! Mich interessiert zunächst der Name "Turbold". Turbold ist uns Zwergen wohlbekannt. Er war ein legendärer Hauptmann der alten Zwergenarmeen Shanatars. Den Erzählungen nach hielt er mit einem Dutzend seiner Krieger eine große feindliche Übermacht in Schach, bis sie schließlich von angreifenden Riesen überrannt wurden. ~
				IF ~~ THEN EXTERN ~AC#DWF30~ thradear_turbold_01
				END
								
					IF ~~ THEN BEGIN mount_turbold_01
					SAY ~Es nützt unserem König nichts, wenn wir hier oben alle den Heldentod sterben, Thradear. Turbold soll jedoch der Sage nach auf dem höchsten Berg derjenigen Bergkette begraben sein, an der er im Kampfe fiel. Wenn die Runentafel die Wahrheit sagt, sollte sich dort ein Zugang ins Unterreich finden lassen.~
					++ ~Auf einem Berggipfel soll sich der Zugang ins Unterreich befinden?~ + CHAIN_underdark_highest_peak
					IF ~IsValidForPartyDialog("Minsc")~ THEN EXTERN ~MINSCJ~ Minsc_kuldin_peaks	
					END						
											
						IF ~~ THEN BEGIN book_stolen
						SAY ~Ich habe es nicht verloren - es ist mir gestohlen worden!~
						IF ~~ THEN REPLY ~Ihr redet nicht zufällig von dem Buch, das Ihr in Kerzenburg erworben habt?~ EXTERN ~AC#DWF30~ thradear_book_candlekeep
						IF ~~ THEN REPLY ~Welches Buch meint Ihr?~ EXTERN ~AC#DWF30~ thradear_book_candlekeep_02
						END
												
						IF ~~ THEN BEGIN elf_stole_book
						SAY ~Es ist alles meine Schuld. Ich hatte mich gestern mit diesem Elfen unterhalten, der schon länger in der Taverne herumlungerte. Gestern abend war er plötzlich sehr redselig, und ich freute mich, mehr von ihm über die Oberfläche zu erfahren.~
						IF ~~ THEN EXTERN ~AC#DWF30~ thradear_never_trust_elf 
						END
						
						
						IF ~~ THEN BEGIN elf_stole_book_gone
						SAY ~Jedenfalls habe ich erst viel zu spät gemerkt, dass er mir das Buch entwendet hat. Und am Morgen ist er in aller Frühe abgereist.~
						IF ~~ THEN REPLY ~Ich schätze, ihn ausfindig zu machen ist wieder meine Aufgabe, richtig?~ EXTERN ~AC#DWF20~ gormar_find_elf 
						IF ~IsValidForPartyDialog("Nalia")~ THEN EXTERN ~NALIAJ~ Nalia_book_thief	
						END
						
						
						IF ~~ THEN BEGIN beldas_please_retrieve_book
						SAY ~Ohne das Buch können wir unmöglich nach Iltkazar zurückkehren. Bitte, sucht diesen flüchtigen Dieb und bringt es uns. Ich versuche derweil, den Ort ausfindig zu machen, der uns schnell zurück in unsere Stadt bringt, wenn Ihr das Buch wiedererlangt habt.~
						IF ~~ THEN EXTERN ~AC#DWF30~ thradear_killed_thief
						END						
						
						IF ~~ THEN BEGIN beldas_where_is_the_elf
						SAY ~Das wissen wir leider nicht. Fragt am Besten zunächst einmal den Schankwirt, vielleicht kann der Euch Genaueres sagen.~
						IF ~~ THEN DO ~SetGlobal("AC#BeldasPlotStart","GLOBAL",10)
						SetGlobal("AC#IltkazarQuest#2","GLOBAL",1)
						EraseJournalEntry(@20009)
						AddJournalEntry(@20060,QUEST)~ EXIT
						END

							
IF ~!InMyArea(Player1)~ THEN BEGIN hello_where_is_charname
SAY ~Seid gegrüßt, <RACE>! Wir suchen einen <PRO_RACE> mit Namen <CHARNAME>. Solltet Ihr ihn zufälligerweise kennen und gesehen haben, schickt ihn Bitte zu uns.~
IF ~~ THEN DO ~SetNumTimesTalkedTo(0)~ EXIT
END

IF ~Global("AC#BeldasPlotStart","GLOBAL",3)~ THEN BEGIN hello
SAY ~Seid gegrüßt, <PRO_RACE>! Nach den Schilderungen, die uns bescheidenen Wanderern zu Ohren getragen wurden, steht vor uns gewiss <CHARNAME> aus Kerzenburg. Ist es so, dass Ihr jener seid, den wir suchen?~
IF ~~ THEN REPLY ~Wer will das wissen?~ GOTO 02
IF ~~ THEN REPLY ~Das bin ich, ja.~ GOTO 03
IF ~~ THEN REPLY ~Ihr habt aber gute Manieren für einen Zwerg!~ GOTO good_education
END
	
			IF ~~ THEN BEGIN good_education
			SAY ~Oh! Es freut mich, dass Ihr das sagt. Bei meiner Rasse komme ich mit meiner Art manchmal gar nicht gut an. Ich bin übrigens Beldas. Ich hatte in Athkatla einen Boten entsandt, der nach <CHARNAME> Ausschau halten sollte.~
			IF ~~ THEN + 03
			END
		
		IF ~~ THEN BEGIN 02
		SAY ~Ich bin Beldas. Ich hatte einen Boten entsandt, der nach <CHARNAME> Ausschau halten sollte.~
		IF ~~ THEN + 03
		END
		
			IF ~~ THEN BEGIN 03
			SAY ~Schön, dass Ihr offensichtlich den Brief gelesen habt und gekommen seid, <CHARNAME>. Wir haben einen Auftrag für Euch.~
			IF ~~ THEN DO ~TakePartyItem("ac#s#ms1")~ GOTO introduce
			END
			
				IF ~~ THEN BEGIN introduce
				SAY ~Erlaubt mir zunächst, uns drei Zwerge vorzustellen. Ich bin Beldas Diamantklinge, und dies hier sind Gormar vom Clan Talnoth und Thradear vom Clan Sorndar.~
				IF ~~ THEN EXTERN ~AC#DWF20~ gormar_hello
				END
			
					IF ~~ THEN BEGIN thraedear_say_hello_02
					SAY ~Bemüht Euch doch wenigstens um etwas Freundlichkeit, Thradear!~
					IF ~~ THEN EXTERN ~AC#DWF30~ thradear_hello
					END
			
				IF ~~ THEN BEGIN firstborn
				SAY ~Bitte entschuldigt das rüde Benehmen meines Begleiters, <CHARNAME>. Da, wo wir herkommen, ist jede Rasse außer einem Zwerg nicht besonders hoch angesehen.~
				IF ~~ THEN REPLY ~Wo kommt Ihr denn her?~ GOTO hail_from_iltkazar
				IF ~~ THEN REPLY ~Hier bei uns ist es eher umgekehrt.~ GOTO otherwise
				IF ~~ THEN REPLY ~Für einen Zwerg seid Ihr wirklich ganz schön freundlich.~ EXTERN ~AC#DWF30~ very_friendly_dwarf_01
				END
				
					IF ~~ THEN BEGIN otherwise
					SAY ~Fürwahr, diese Erfahrung haben wir auch schon gemacht!~
					IF ~~ THEN REPLY ~Wo kommt Ihr denn her?~ GOTO hail_from_iltkazar
					END
					
					IF ~~ THEN BEGIN very_friendly_dwarf_02
					SAY ~Jeder erwartet wohl, dass ich schimpfend und Axt schwingend durch die Gegend stapfe. Aber so bin ich nicht. Dort, wo ich herkomme, gelte ich als Gelehrter.~
					IF ~~ THEN REPLY ~Wo kommt Ihr denn her?~ GOTO hail_from_iltkazar
					IF ~~ THEN REPLY ~Ein gelehrter Zwerg ist eine willkommene Überraschung.~ GOTO educated_dwarf
					END
					
							IF ~~ THEN BEGIN educated_dwarf
							SAY ~In der Stadt, aus der wir stammen, ist ein gelehrter Zwerg etwas ganz Alltägliches.~
							IF ~~ THEN GOTO hail_from_iltkazar
							END
					
						IF ~~ THEN BEGIN hail_from_iltkazar
						SAY ~Wir stammen aus Iltkazar, einer Zwergenstadt im Unterreich.~
						IF ~~ THEN EXTERN ~AC#DWF20~ gormar_iltkazar
						END
						
							IF ~~ THEN BEGIN again_iltkazar_02
							SAY ~Ja, Gormar, und wir sind stolz darauf, aus dem schönen Iltkazar im Unterreich zu kommen. Man könnte allerdings auch sagen, dass wir aus Iltkazar, der letzten Zwergenstadt kommen, denn sie ist die Einzige der Zwergenstädte im südlichen Unterreich, die unserer Rasse noch geblieben ist.~
							IF ~~ THEN REPLY ~Ihr seid aus dem Unterreich bis hier nach Athkatla gekommen?~ GOTO hail_from_underdark
							IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ Jaheira_Iltkazar_01
							IF ~IsValidForPartyDialog("Korgan")~ THEN EXTERN ~KORGANJ~ Korgan_Iltkazar_01
							END
							
									IF ~~ THEN BEGIN Jaheira_Iltkazar_02
									SAY ~Eure Gefährtin hat Recht. Wir lebten fernab von jeglichen Verbindungen zur Oberfläche die vergangenen Jahrhunderte in unserer Stadt und waren froh, dass uns der Rest der Welt vergessen hatte.~
									IF ~~ THEN REPLY ~Ihr seid nun direkt aus dem Unterreich hierhergekommen?~ GOTO hail_from_underdark
									END
							
									IF ~~ THEN BEGIN Korgan_Iltkazar_02
									SAY ~Wie ich sehe, habt Ihr Euch da nicht gerade den hellsten Vertreter unserer Rasse von der Oberfläche ausgesucht, <CHARNAME>.~
									IF ~~ THEN EXTERN ~KORGANJ~ Korgan_Iltkazar_03
									END
									
									IF ~~ THEN BEGIN Korgan_Iltkazar_04
									SAY ~Oh, ich bin mir sicher, dass eine unserer Tiefenrothé Eure Gesellschaft in der Mithrilstadt sehr zu schätzen wissen wird.~
									IF ~~ THEN EXTERN ~KORGANJ~ Korgan_Iltkazar_05
									END
									
									IF ~~ THEN BEGIN Korgan_Iltkazar_06
									SAY ~Nein, Streit wollen wir wirklich nicht, *samman*. Dürfte ich vielleicht weiter fortfahren, <CHARNAME>?~
									IF ~~ THEN REPLY ~Wie dem auch sei. Ihr seid also direkt aus dem Unterreich hierhergekommen?~ GOTO hail_from_underdark
									END
						
								IF ~~ THEN BEGIN hail_from_underdark
								SAY ~In der Tat, wir sind den langen Weg durch das Unterreich auf der Suche nach Hilfe für unseren König bis hierher nach Amn gekommen.~
								IF ~~ THEN REPLY ~Euer König ist krank?~ GOTO king_ill
								IF ~~ THEN REPLY ~Was stimmt nicht mit ihm?~ GOTO whats_wrong_with_king
								IF ~~ THEN REPLY ~Ein weiter Weg, den Ihr für Euren König auf Euch genommen habt.~ GOTO whats_wrong_with_king
								END
								
									IF ~~ THEN BEGIN whats_wrong_with_king
									SAY ~Unser Monarch sitzt reglos wie schlafend zur Mithrilsäule erstarrt auf seinem Thron und lässt sich durch nichts und niemanden aus seinem seltsamen Zustand erwecken.~
									IF ~~ THEN REPLY ~Er ist zu einer Art Metallform erstarrt? Wie kann so etwas passieren?~ GOTO about_mithbarak_01
									IF ~~ THEN REPLY ~Ihr meint wie versteinert? Das Werk eines Basilisken vielleicht?~ GOTO about_mithbarak_01
									END
									
									IF ~~ THEN BEGIN king_ill
									SAY ~Wenn man es so sehen möchte, ja, er ist krank. Allerdings nicht im herkömmlichen Sinne. Er sitzt reglos wie schlafend zur Mithrilsäule erstarrt auf seinem Thron und lässt sich durch nichts und niemanden aus seinem seltsamen Zustand erwecken.~
									IF ~~ THEN REPLY ~Wie kann so etwas passieren?~ GOTO about_mithbarak_01
									END
									
										IF ~~ THEN BEGIN about_mithbarak_01
										SAY ~Was genau ihm fehlt, wissen wir leider nicht. Es ist kein herkömmlicher Zauber. Bevor ich Euch Genaueres berichte, möchte ich Euch mitteilen, warum wir Euch hergebeten haben und Eure Hilfe brauchen.~
										IF ~~ THEN GOTO tell_quest_01
										END
										
											IF ~~ THEN BEGIN tell_quest_01
											SAY ~Wir hoffen, dass Ihr uns helfen könnt, unseren König Mith Barak aus diesem mysteriösen Zustand zu befreien. Was die Gelehrten unserer Zwergengemeinde seit mehr als zwei Jahren nicht geschafft haben, könnte vielleicht einem <PRO_RACE> von der Oberfläche gelingen.~
											IF ~~ THEN REPLY ~Euer König ist schon seit zwei Jahren in dieser Form gefangen?~ GOTO mithbarak_sleeping_2years
											IF ~~ THEN REPLY ~Warum sollte gerade ich zu so etwas in der Lage sein?~ GOTO why_me
											IF ~~ THEN REPLY ~Die Situation klingt verzwickt. Ich bin bereit zu helfen, aber ich muss mehr über die Risiken und die erwarteten Schwierigkeiten wissen.~ GOTO city_not_as_expected
											IF ~~ THEN REPLY ~Warum nicht? Ich kann mir Euren König gerne einmal ansehen.~ + help_you
											IF ~~ THEN REPLY ~Tut mir leid, das klingt schon gleich zu Beginn so gar nicht nach meinem Geschmack. Ich bin Abenteurer und niemand, der einen König aus seinem Schlaf rütteln sollte.~ GOTO not_my_business
											END
											
											IF ~~ THEN BEGIN not_my_business
											SAY ~Oh! Damit hatte ich nicht gerechnet. Seid Ihr Euch sicher, dass Ihr uns nicht helfen wollt? Denn dann werden wir weiter unseres Weges ziehen.~
											IF ~~ THEN REPLY ~Ich habe es mir anders überlegt und möchte Euch helfen.~ + help_you
											IF ~~ THEN REPLY ~Ich habe wirklich kein Interesse.~ GOTO no_interest
											END
											
												IF ~~ THEN BEGIN help_you
												SAY ~Das freut mich! Wie gesagt, wir hoffen, dass Ihr uns helfen könnt, unseren König Mith Barak aus diesem mysteriösen Zustand zu befreien.~
												IF ~~ THEN REPLY ~Warum sollte gerade ich zu so etwas in der Lage sein?~ GOTO why_me
												IF ~~ THEN REPLY ~Ich habe schon einigen Bewohnern der Schwertküste geholfen - sogar einem todkranken Großherzog von Baldurs Tor!~ GOTO city_not_as_expected
												IF ~~ THEN REPLY ~Ein Versuch wäre es wert.~ GOTO city_not_as_expected
												END
											
												IF ~~ THEN BEGIN no_interest
												SAY ~Das ist Schade. Nun gut, kommt, Freunde, dann müssen wir uns eben an anderer Stelle nach Hilfe umsehen!~
												IF ~~ THEN DO ~ActionOverride("ac#dwf20",EscapeArea())
												ActionOverride("ac#dwf30",EscapeArea())
												EscapeArea()~ EXIT
												END
			
											IF ~~ THEN BEGIN mithbarak_sleeping_2years
											SAY ~Er sitzt bereits wesentlich länger reglos auf seinem Thron. Da wir alle anderen Möglichkeiten ausgeschöpft haben, die uns Zwergen einfallen, suchen wir nun an der Oberfläche nach Hilfe.~
											IF ~~ THEN REPLY ~Warum sollte gerade ich zu so etwas in der Lage sein?~ GOTO why_me
											IF ~~ THEN REPLY ~Warum nicht? Ich kann mir Euren König gerne einmal ansehen.~ + help_you
											IF ~~ THEN REPLY ~Tut mir leid, das klingt schon gleich zu Beginn so gar nicht nach meinem Geschmack. Ich bin Abenteurer und niemand, der einen König aus seinem Schlaf rütteln sollte.~ GOTO not_my_business
											END
											
												IF ~~ THEN BEGIN why_me
												SAY ~Das kann ich Euch ehrlich gesagt auch nicht sagen.~
												IF ~~ THEN GOTO city_not_as_expected
												END
												
												IF ~~ THEN BEGIN city_not_as_expected
												SAY ~Seht, unsere Stadt ist vielleicht nicht ganz genau das, was Ihr Euch unter einer typischen Zwergenstadt vorstellt. Wir sind ein Hort des Wissens und besitzen eine der größten Bibliotheken des Unterreiches. Ich selbst bin auch Gelehrter, kein Krieger - ein Diener Dugmarens, um genau zu sein.~ 
												=
												~Auf der Suche nach einem Heilmittel für Mith Barak habe ich die Aufzeichnungen des Königs und unsere eigene Büchersammlung studiert und bin auf diesem Wege auf Hinweise einer großen Bibliothek an der Oberfläche, die man Kerzenburg nennt, gestoßen. Ihr sollt aus Kerzenburg stammen, wie ich hörte.~
												IF ~~ THEN REPLY ~In einer von Iltkazars Notizen stand, dass ich aus Kerzenburg komme?~ GOTO hail_from_candlekeep
												IF ~~ THEN REPLY ~Mein Ruf eilt mir anscheinend bereits voraus bis hinab ins Unterreich...~ GOTO hail_from_candlekeep
												END
												
													IF ~~ THEN BEGIN hail_from_candlekeep
													SAY ~Nein, das nicht. Aber Mith Barak hatte sich vor seiner Schlafensperiode notiert, dass es dort jemanden geben könnte, der ihm helfen könnte.~
													IF ~~ THEN REPLY ~Er hat sein Schicksal vorausgesehen?~ GOTO Mithbarak_knows_sleep_periods
													IF ~~ THEN REPLY ~Mith Barak wusste bereits, dass er in einen Schlaf fallen würde?~ GOTO Mithbarak_knows_sleep_periods
													IF ~~ THEN REPLY ~Erzählt mir mehr.~ GOTO Mithbarak__sleep_periods_02
													END
													
													IF ~~ THEN BEGIN Mithbarak_knows_sleep_periods
													SAY ~Ja, natürlich, denn es war nicht seine erste Phase eines langen Schlafes, aus der man ihn nicht erwecken konnte.~
													IF ~~ THEN EXTERN ~AC#DWF20~ gormar_dont_understand_either
													IF ~IsValidForPartyDialog("Minsc")~ THEN EXTERN ~MINSCJ~ minsc_king_hibernating
													END
													
														IF ~~ THEN BEGIN Mithbarak__sleep_periods_02
														SAY ~Die Schlafensperioden unseres Königs sind seit vielen Jahrhunderten für Iltkazar zu etwas völlig Normalem geworden. Alle fünfundzwanzig Jahre fällt er in seinen fünfundsiebzig Jahre währenden Schlaf, aus dem er pünktlich wie von einer gnomischen Wasseruhr errechnet wieder erwacht.~
														IF ~~ THEN EXTERN ~ac#dwf30~ mithbarak_did_not_awake
														END
														
														IF ~~ THEN BEGIN mithbarak_did_not_awake_02
														SAY ~Zwei Jahre ist unser König überfällig, Thradear! Zwei Jahre sind auch für eine Rasse wie die unsere eine lange Zeit, wenn alle Regierungsangelegenheiten stillstehen, während die Stadt von Feinden umringt ist, die niemals ruhen! Oder würdet Ihr es bevorzugen, so wie der Regentschaftsrat einfach untätig herumzulamentieren?~
														IF ~~ THEN EXTERN ~ac#dwf30~ mithbarak_did_not_awake_03
														END
														
														IF ~~ THEN BEGIN mithbarak_did_not_awake_04
														SAY ~Seht Ihr. Und deshalb sind wir hier und bitten <CHARNAME> um Hilfe.~
														IF ~~ THEN REPLY ~Wie genau soll ich Euch denn helfen?~ GOTO how_can_i_help
														IF ~~ THEN REPLY ~Wie geht es jetzt weiter?~ GOTO how_can_i_help
														IF ~~ THEN REPLY ~Bei dieser langatmigen Geschichte muss man ja aufpassen, nicht selbst in einen tiefen Schlaf zu fallen!~ + how_can_i_help
														END
														
															IF ~~ THEN BEGIN how_can_i_help
															SAY ~Da muss ich wieder etwas ausholen. Wir weilten, bevor wir nach Amn weiterreisten, einige Tage in Kerzenburg. Mith Barak suchte in Kerzenburg nach einem Buch, welches wir nun als Abschrift bei uns tragen. Das Buch dürfte für Euch aber weniger von Interesse sein, sondern eher unseren Gelehrten in der Halle der Runensteine als Lektüre dienen.~
															=
															~Wir haben auf unserem beschwerlichen Weg Richtung  Kerzenburg erfahren, dass Ihr Euch für unsere Rasse bereits mehrmals verdient gemacht habt. Vor allem für den Orothiar-Clan und dessen Mine, die von einer bösen Menschenorganisation übernommen wurde. Aber auch Clan Steinklinge erwähnte Euren Namen bei der Beseitigung irgendeines Übels in der Heimstatt von Clan Trolltöter. Und, wie gesagt, zusätzlich hatte Mith Barak von irgendwoher die Information, dass ihm ein Bewohner von Kerzenburg einmal dienlich sein könnte.~
															=
															~So erfuhren wir Euren Namen von mehreren Gelehrten Kerzenburgs, die Euch alle in warmer Erinnerung halten. Es war nicht leicht, Eure Spur zu verfolgen, aber schlussendlich hörten wir, dass Ihr Euch in Athkatla aufhalten würdet.~
															IF ~~ THEN REPLY ~Das klingt nach einer langwierigen Suche. Und was genau wollt Ihr nun von mir?~ GOTO how_can_i_help_02
															IF ~~ THEN REPLY ~Bin auch nicht ganz freiwillig so weit im Süden gelandet.~ GOTO how_can_i_help_02
															IF ~~ THEN REPLY ~Dass Ihr so viel Mühen aufgewendet habt, um mich zu finden, ehrt mich.~ GOTO how_can_i_help_02
															END
															
																IF ~~ THEN BEGIN how_can_i_help_02
																SAY ~Wenn Mith Barak der Meinung gewesen ist, aus Kerzenburg Hilfe erhalten zu können, könnten wir vielleicht gemeinsam eine Möglichkeit finden, ihn aus seinem derzeitigen Zustand zu befreien.~
																IF ~~ THEN GOTO chain_travel_to_iltkazar
																END
																																															
																																
																			IF ~~ THEN BEGIN Charname_reward
																			SAY ~Iltkazar ist zwar eine Stadt der Gelehrten, doch wie alle Zwergenstädte haben auch wir große unterirdische Minen voller Edelsteine und seltener Metalle. Ihr werdet als reicher <PRO_RACE> an die Oberfläche zurückkehren, dessen könnt Ihr Euch sicher sein!~
																			IF ~~ THEN GOTO travel_to_iltkazar_02
																			END
																		
																		IF ~~ THEN BEGIN travel_to_iltkazar_02
																		SAY ~Also, was sagt Ihr?~
																		IF ~~ THEN REPLY ~In Eurem Brief erwähntet Ihr eine Belohnung. Was bietet Ihr mir im Ausgleich für meine Mühen?~ GOTO Charname_reward
																		IF ~~ THEN REPLY ~Nun gut, ich werde mit Euch nach Iltkazar reisen.~ GOTO Charname_accept_quest
																		IF ~~ THEN REPLY ~Tut mir leid, das klingt so gar nicht nach meinem Geschmack. Ich bin Abenteurer und niemand, der einen König aus seinem Schlaf rütteln sollte.~ GOTO not_my_business_02
																		END
																		
																		IF ~~ THEN BEGIN not_my_business_02
																		SAY ~Oh! Damit hatte ich nicht gerechnet. Seid Ihr Euch sicher, dass Ihr uns nicht helfen wollt? Denn dann werden wir weiter unseres Weges ziehen.~
																		IF ~~ THEN REPLY ~Ich habe es mir anders überlegt und möchte Euch helfen.~ + Charname_accept_quest
																		IF ~~ THEN REPLY ~Ich habe wirklich kein Interesse.~ GOTO no_interest
																		END
																		
																			IF ~~ THEN BEGIN Charname_accept_quest
																			SAY ~Wirklich? Ihr könnt Euch gar nicht vorstellen, wie sehr ich mich freue, dass Ihr uns begleiten werdet!~
																			IF ~~ THEN GOTO first_reward
																			END
																			
																			IF ~~ THEN BEGIN first_reward
																			SAY ~Alleine Euer Entschluss, dieses Abenteuer in Erwägung zu ziehen, ist mir einen Vorschuss auf Eure Belohnung wert. Ich gebe Euch hier drei Smaragde, die Euch als Währung für Ausrüstung für unsere Reise dienen sollen.~
																			IF ~~ THEN DO ~GiveItemCreate("MISC43",Player1,3,0,0)~ EXTERN ~ac#dwf30~ too_credulous
																			END
																			
																			IF ~~ THEN BEGIN treasures_worth
																			SAY ~Für das Leben unseres Königs soll uns jedes Opfer recht sein, Freunde!~
																			IF ~~ THEN REPLY ~Habt Dank.~ GOTO way_underdark
																			IF ~~ THEN REPLY ~Das bin ich mir auch wert.~ GOTO way_underdark
																			IF ~~ THEN REPLY ~Das wäre doch nicht nötig gewesen!~ GOTO way_underdark
																			IF ~~ THEN REPLY ~Um ein altes Zwergensprichwort zu bemühen: "Ich höre mich nicht nein sagen."~ GOTO way_underdark
																			END
																			
																				IF ~~ THEN BEGIN way_underdark
																				SAY ~Nun, da geklärt ist, dass Ihr uns bei unserem Unterfangen unterstützen werdet, müssen wir noch klären, wie wir wieder zurück nach Iltkazar gelangen.~
																				IF ~~ THEN GOTO way_underdark_02
																				END
																				
																					IF ~~ THEN BEGIN way_underdark_02
																					SAY ~Der Weg, den wir aus Iltkazar heraufgekommen sind, ist mittlerweile nämlich leider... versperrt.~
																					IF ~~ THEN REPLY ~Das bedeutet, Ihr kennt keinen Weg zurück?~ GOTO way_underdark_03
																					IF ~~ THEN REPLY ~Was meint Ihr mit versperrt?~ GOTO way_underdark_blocked
																					IF ~GlobalGT("Chapter","GLOBAL",5)~ THEN REPLY ~Ich war schon einmal im Unterreich und glaube, ich kenne einen Weg, der Euch zurückführen könnte.~ GOTO chapter6_know_way_underdark
																					END
																					
																						IF ~~ THEN BEGIN chapter6_know_way_underdark
																						SAY ~Wirklich? Das wäre ja eine doppelte Freude! Wo liegt dieser Eingang denn und wohin führt er?~
																						IF ~~ THEN REPLY ~Er liegt im Süden, im Tethyrwald, und führt in die Drow-Stadt Ust Natha.~ GOTO chapter6_too_westward
																						IF ~~ THEN REPLY ~Ich weiß es nicht mehr genau.~ GOTO chapter6_not_sure
																						END
																						
																							IF ~~ THEN BEGIN chapter6_not_sure
																							SAY ~Dann ist es zu unsicher. Im Unterreich kann man monatelang in eine falsche Richtung laufen, wenn man nicht aufpasst. Schade. Wir müssen einen anderen Eingang finden.~
																							IF ~~ THEN GOTO underdark_beldas_entry
																							END
																							
																							IF ~~ THEN BEGIN chapter6_too_westward
																							SAY ~Nach Ust Natha? Nein, das liegt leider viel zu weit westlich. Die Tunnel Richtung Osten sind schon lange nicht mehr passierbar, und auf den unterirdischen Flüssen gen Iltkazar zu rudern würde eine so kleine Gruppe wie wir nicht schaffen. Wir müssen einen anderen Eingang finden.~
																							IF ~~ THEN GOTO underdark_beldas_entry
																							END
																					
																						IF ~~ THEN BEGIN way_underdark_blocked
																						SAY ~Das würde jetzt zu weit führen. Wir werden auf unserer Reise genügend Gelegenheit haben, von unseren Abenteuern auf dem Weg an die Oberfläche zu berichten. Zunächst sollte unser dringlichstes Anliegen sein, unseren Weg zurück in die Mithrilstadt zu finden.~
																						IF ~~ THEN REPLY ~Ihr kennt keinen Weg zurück?~ GOTO way_underdark_03
																						IF ~~ THEN REPLY ~Ihr sitzt hier fest.~ GOTO stuck_in_tavern
																						IF ~IsValidForPartyDialog("Anomen")~ THEN EXTERN ~ANOMENJ~ Anomen_stuck_in_tavern
																						END																			
																				
																					IF ~~ THEN BEGIN way_underdark_03
																					SAY ~Nein. Zumindest *noch* nicht.~ 
																					IF ~~ THEN GOTO stuck_in_tavern
																					END																				
																					
																					IF ~~ THEN BEGIN stuck_in_tavern
																					SAY ~Die meisten Passagen, die zu vergangenen Zeiten in das Reich unserer Vorfahren führten, sind mittlerweile unwiderruflich verschlossen.~
																					IF ~~ THEN GOTO underdark_beldas_entry
																					END

																					IF ~~ THEN BEGIN underdark_beldas_entry
																					SAY ~Allerdings müssten noch einige Wege offen sein, die meine Urahnen bei ihrem Rückzug von der Oberfläche unversiegelt zurückgelassen haben. Mit etwas Glück sollte sich einer dieser Durchgänge in die unteren Lande wieder öffnen lassen.~
																						IF ~~ THEN REPLY ~Es bestehen von der Oberfläche noch Zugänge ins Unterreich?~ GOTO kuldin_peaks
																						IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ jaheira_kuldin_peaks
																						IF ~IsValidForPartyDialog("Nalia")~ THEN EXTERN ~NALIAJ~ Nalia_kuldin_peaks	
																						//IF ~IsValidForPartyDialog("Minsc")~ THEN EXTERN ~MINSCJ~ Minsc_kuldin_peaks																						
																						END
																				
																							IF ~~ THEN BEGIN kuldin_peaks
																							SAY ~So ist es. Einst lebte unsere Rasse an der Oberfläche dieser Länder, bevor sie sich unter dem Druck ihrer Feinde - vor allem der Menschen - wieder in ihr Stammland im Unterreich zurückziehen musste.~
																							IF ~~ THEN GOTO knowledge_gone
																							END

																							IF ~~ THEN BEGIN knowledge_gone
																							SAY ~Leider ist das Wissen um diese Passagen mit den letzten Zwergen, die ihre Heimat verteidigen wollten, verloren gegangen. Im Unterreich selbst - auch in Iltkazar - finden sich keine Aufzeichnungen darüber, sodass unsere gesamte Hoffnung auf den Relikten meiner Rasse an der Oberfläche liegt.~
																							IF ~~ THEN REPLY ~Das klingt nach einer schwierigen Suche. Sollen wir es nicht doch einmal mit dem Weg, den Ihr hergekommen seid, versuchen?~ EXTERN ~ac#dwf30~ no_means_no
																							IF ~~ THEN REPLY ~Wenn Ihr in Kerzenburg schon nichts gefunden habt - wer sollte darüber denn überhaupt Bescheid wissen?~ GOTO beldas_cromwell_sage
																							IF ~~ THEN REPLY ~Ich schätze, da komme wieder ich ins Spiel.~ GOTO axe_bridge_01
																							END
																							
																									IF ~~ THEN BEGIN beldas_cromwell_sage
																									SAY ~Dugmaren, der irrende Wanderer, wird uns schon wieder zurück nach Iltkazar führen, dessen bin ich mir sicher, Freunde.~
																									IF ~LevelGT(Player1,8)~ THEN + axe_bridge_01
																									IF ~LevelLT(Player1,9)~ THEN EXTERN ~ac#dwf20~ too_young_too_die
																									END
																									
																										IF ~~ THEN BEGIN beldas_too_young_too_die
																										SAY ~Da habt Ihr nicht ganz Unrecht, mein Freund. Entschuldigt unsere Sorge, <CHARNAME>, denn das Unterreich ist ein gefährlicher Ort, der einem keine Schwächen verzeiht. Wir wären Euch deshalb nicht böse, wenn Ihr Euch noch ein wenig ausrüsten möchtet, bevor wir uns gemeinsam ins Unterreich begeben.~ 
																										=
																										~Doch zurück zu unserem ersten Auftrag, denn noch haben wir ja keinen Weg zurück ins Unterreich gefunden.~
																										IF ~~ THEN GOTO axe_bridge_01
																										END
																									
																										IF ~~ THEN BEGIN axe_bridge_01
																										SAY ~Ganz in der Nähe gibt es eine Brücke, die über den Vudlur-Fluss führt. Die Wenigsten wissen, dass diese Brücke von Zwergenhand erbaut wurde. Die Menschen nennen sie ganz einfach "Axtbrücke". Wir nehmen an, dass sich an diesem für unsere Urahnen wichtigen Wegpunkt genauere Ortsangaben finden, an welchen Stellen unsere Stammväter Wege ins Unterreich angelegt haben.~
																										IF ~~ THEN GOTO axe_bridge_02
																										IF ~IsValidForPartyDialog("Nalia")~ THEN EXTERN ~NALIAJ~ Nalia_axe_bridge	
																										END
																										
																											IF ~~ THEN BEGIN axe_bridge_02
																											SAY ~Ich denke zwar nicht, dass von dieser Brücke direkt ein Weg in die tiefen Lande abzweigt. Aber mit etwas Glück lässt sich dort ein Hinweis auf einen Zugang in das Unterreich finden. Die Brücke ist nicht weit entfernt von hier, etwas weiter den Weg entlang im Osten. Wenn Ihr der Straße folgt, werdet Ihr unweigerlich auf sie treffen.~
																											IF ~~ THEN DO ~RevealAreaOnMap("ACIL06")~ GOTO axe_bridge_03 
																											END
																											
																																																
																												IF ~~ THEN BEGIN axe_bridge_03
																												SAY ~Sucht in der Umgebung dieser Brücke nach Hinweisen, die uns den Weg zurück in unsere schöne Stadt weisen könnten.~
																												IF ~~ THEN REPLY ~Warum sucht Ihr eigentlich nicht selbst danach?~ EXTERN ~AC#DWF20~ gormar_axe_bridge 
																												IF ~~ THEN REPLY ~Gut, ich sehe mir diese Brücke einmal an.~ + quest_axe_bridge
																												END
																												
																												
																												
																												IF ~~ THEN BEGIN beldas_gormar_pursuit
																												SAY ~Wir ziehen derzeit die Sicherheit der Taverne vor. Darum bitten wir jetzt Euch, diese Aufgabe durchzuführen.~
																												IF ~~ THEN GOTO quest_axe_bridge
																												END

																														IF ~~ THEN BEGIN quest_axe_bridge
																														SAY ~Wir werden hier in der Taverne auf Euch warten und hoffen, dass Ihr erfolgreich sein werdet. So aufregend die Zeit hier an der Oberfläche auch sein mag, wir sind alle froh, wenn wir wieder in unsere Heimat zurückgekehrt sind, um unserem König helfen zu können. Aber jetzt habe ich schon genug Eurer Zeit gestohlen. Ihr wisst, wo wir zu finden sind. Ich freue mich auf ein Wiedersehen!~
																														IF ~~ THEN DO ~SetGlobal("AC#BeldasPlotStart","GLOBAL",4)
																														RevealAreaOnMap("ACIL06")
																														EraseJournalEntry(@20000)
																														AddJournalEntry(@20002,QUEST)
																														AddJournalEntry(@20050,QUEST)
																														~ EXIT
																														END
// OLD Mount Turbold Quest																														
																															
																							IF ~~ THEN BEGIN to_mount_turbold
																							SAY ~Wir sollten also sehen, ob zumindest der Zugang am Turboldberg noch passierbar ist. Meine Gefährten und ich brechen schnellstmöglichst dorthin auf. Ihr trefft uns am Fuße des Berges. Von dort werden wir den Aufstieg gemeinsam mit Euch meistern. Ich werde unseren Treffpunkt auf Eurer Karte markieren.~
																							IF ~~ THEN DO ~RevealAreaOnMap("ACIL0A")~ GOTO to_mount_turbold_02
																							END
																							
																								IF ~~ THEN BEGIN to_mount_turbold_02
																								SAY ~Ich bin mir sicher, dass Ihr noch viele Fragen habt, <CHARNAME>. Wenn wir einmal den Eingang in Richtung Iltkazar gefunden haben, werden wir auf dem Weg durch das Unterreich alle Zeit der Welt haben, uns zu unterhalten.~
																								IF ~~ THEN REPLY ~Einverstanden. Wir werden uns am Fuße des Turboldberges treffen und die weiteren Schritte planen.~ GOTO goodbye_to_cromwell
																								END
																									
																								IF ~~ THEN BEGIN goodbye_to_cromwell
																								SAY ~Wohlan, Freunde, nun ist der Zeitpunkt gekommen, Lebewohl zu sagen!~
																								IF ~~ THEN + goodbye_02
																								END
																																														
																			
																									IF ~~ THEN BEGIN goodbye_02
																									SAY ~<CHARNAME>, rüstet Euch noch in aller Ruhe für die Reise, bevor Ihr zu uns stoßt. Wenn wir einmal im Unterreich sind, werdet Ihr länger nicht mehr an die Oberfläche zurückkehren können. Deshalb nehmt Euch die Zeit, die Ihr braucht, um Euch entsprechend vorzubereiten. Das Einzige, das uns passieren könnte, wenn wir zu lange warten, wäre, dass unser König bereits erwacht ist, bis wir nach Iltkazar zurückgekehrt sind.~
																									IF ~~ THEN GOTO exit
																									END
																									
																								IF ~~ THEN BEGIN exit
																								SAY ~Kommt, Freunde, lasst uns gehen!~
																								IF ~~ THEN DO ~SetGlobal("AC#BeldasPlotStart","GLOBAL",10)
																								EraseJournalEntry(@20000)
																								AddJournalEntry(@20010,QUEST)
																								ActionOverride("ac#dwf20",EscapeArea())
																								ActionOverride("ac#dwf30",EscapeArea())
																								EscapeArea()~ EXIT
																								END

// Gormar

BEGIN ~ac#dwf20~

IF ~GlobalGT("AC#BeldasPlotStart","GLOBAL",3)
GlobalLT("Dwarf_joke","ACIL4I",3)~ THEN BEGIN joke_01
SAY ~He, Thradear, Lust auf einen Elfenwitz?~
IF ~~ THEN EXTERN ~AC#DWF30~ thradear_joke_01
END

IF ~True()~ THEN BEGIN hello
SAY ~*Mahal*, <RACE>. Sprecht mit unserem Anführer Beldas, wenn Ihr etwas Wichtiges zu sagen habt.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN gormar_joke_01
SAY ~Nun gut. Lasst mich einmal kurz überlegen...~
IF ~Global("Dwarf_joke","ACIL4I",0)~ THEN GOTO chain_joke_01
IF ~Global("Dwarf_joke","ACIL4I",1)~ THEN GOTO chain_joke_02
IF ~Global("Dwarf_joke","ACIL4I",2)~ THEN GOTO chain_joke_03
END

			IF ~~ THEN BEGIN gormar_hello
			SAY ~Seid gegrüßt.~
			IF ~~ THEN EXTERN ~AC#DWF30~ thraedear_say_hello_01
			END
			
			IF ~~ THEN BEGIN gormar_iltkazar
			SAY ~Nicht *einer* Zwergenstadt - *der* Zwergenstadt im Unterreich!~
			IF ~~ THEN EXTERN ~AC#DWF00~ again_iltkazar_02
			END
			
			IF ~~ THEN BEGIN gormar_dont_understand_either
			SAY ~Verzagt nicht, <CHARNAME>, mir fiel es anfangs auch schwer, das auf Anhieb zu verstehen.~
			IF ~~ THEN EXTERN ~AC#DWF00~ Mithbarak__sleep_periods_02
			END
			
			IF ~~ THEN BEGIN goodbye_gormar
			SAY ~Kal maerdh!~
			IF ~~ THEN EXTERN ~AC#DWF30~ goodbye_thradear
			END
						
			IF ~~ THEN BEGIN gormar_axe_bridge
			SAY ~Genau aus dem gleichen Grund, weswegen wir hier in dieser Menschentaverne in der Wildnis herumsitzen!~
			IF ~~ THEN EXTERN ~AC#DWF00~ beldas_gormar_pursuit
			END
			
			IF ~~ THEN BEGIN gormar_find_elf
			SAY ~Einen flüchtigen Elf in einem Land voller Menschen ausfindig zu machen gehört nicht gerade zu den Dingen, für die wir als Zwerge geeignet sind.~
			IF ~~ THEN EXTERN ~AC#DWF00~ beldas_please_retrieve_book
			END
			
			IF ~~ THEN BEGIN too_young_too_die
			SAY ~Beldas, jetzt, wo ich mir <CHARNAME> aus der Nähe ansehe, sieht <PRO_HESHE> noch ziemlich grün hinter den Ohren aus für einen <PRO_RACE>. Meint Ihr wirklich, dass <PRO_HESHE> dieser Aufgabe gewachsen ist? Wir können uns kein Scheitern erlauben.~
			IF ~~ THEN EXTERN ~AC#DWF00~ beldas_too_young_too_die
			END			
			
// Thradear

BEGIN ~ac#dwf30~

IF ~GlobalGT("AC#BeldasPlotStart","GLOBAL",3)
GlobalLT("Dwarf_joke","ACIL4I",3)~ THEN BEGIN joke_01
SAY ~He, Gormar, habt Ihr noch einen Eurer Elfenwitze auf Lager?~
IF ~~ THEN EXTERN ~AC#DWF20~ gormar_joke_01
END

IF ~~ THEN BEGIN thradear_joke_01
SAY ~Nur zu, Gormar, nur zu!~
IF ~~ THEN EXTERN ~AC#DWF20~ gormar_joke_01
END

IF ~True()~ THEN BEGIN hello
SAY ~...~
IF ~~ THEN EXIT
END

			IF ~~ THEN BEGIN thraedear_say_hello_01
			SAY ~...~
			IF ~~ THEN EXTERN ~AC#DWF00~ thraedear_say_hello_02
			END
			
			IF ~~ THEN BEGIN thradear_hello
			SAY ~Pah! Warum sollte ich hier an der Oberfläche zu einem *jargh* nett sein? Ihr wisst, dass ich Euch nur begleite, um auf Euch aufzupassen, Beldas!~
			IF ~~ THEN EXTERN ~AC#DWF00~ firstborn
			END
						
			IF ~~ THEN BEGIN very_friendly_dwarf_01
			SAY ~Das sage ich ihm auch immer, aber auf mich hört er ja nicht!~
			IF ~~ THEN EXTERN ~AC#DWF00~ very_friendly_dwarf_02
			END
			
			/*
			IF ~~ THEN BEGIN nice_you_know_dwarvish
			SAY ~Schön, dass Ihr hier an der Oberfläche noch etwas von unserer Sprache behalten habt, Cromwell!~
			IF ~~ THEN EXTERN ~WSMITH01~ Cromwell_dwarvish
			END
			*/
			
			IF ~~ THEN BEGIN mithbarak_did_not_awake
			SAY ~Nur diesmal ist er eben nach fünfundsiebzig Jahren nicht wieder aufgewacht. Ich hätte ja vorgeschlagen, wir warten einfach noch ein kleines Bisschen länger, ob er sich von selbst wieder regt. Aber Beldas hatte sogleich die tolle Idee, umgehend an der Oberfläche nach Hilfe zu suchen!~
			IF ~~ THEN REPLY ~Ihr mögt keine schnellen Entscheidungen, was?~ GOTO no_fast_decisions
			IF ~~ THEN REPLY ~(Nichts sagen.)~ EXTERN ~ac#dwf00~ mithbarak_did_not_awake_02
			END
			
				IF ~~ THEN BEGIN no_fast_decisions
				SAY ~Es gibt ein altes zwergisches Sprichwort, <GIRLBOY>, das Ihr Euch einmal hinter Eure Oberflächenohren schreiben solltet: "Ein Mensch braucht einen Tag, um eine Entscheidung zu treffen, lebt aber nicht lange genug, um die ganze Tragweite seiner Entscheidung kennenzulernen. Ein Zwerg braucht ein Jahrzehnt, um sich für eine Sache zu entscheiden, trägt diesen Entschluss dann aber ein Leben lang. Und ein Elf kann sich grundsätzlich nie für irgendwas entscheiden."~
				IF ~~ THEN EXTERN ~ac#dwf00~ mithbarak_did_not_awake_02
				END
			
			IF ~~ THEN BEGIN mithbarak_did_not_awake_03
			SAY ~Hrmpf! Der Regentschaftsrat besteht doch nur aus einem Haufen *mulgvaldar*!~
			IF ~~ THEN EXTERN ~ac#dwf00~ mithbarak_did_not_awake_04
			END
			
			IF ~~ THEN BEGIN too_credulous
			SAY ~Ihr seid wie immer zu gutgläubig, Beldas! Wir kennen diesen <PRO_RACE> erst seit drei Hammerschlägen und Ihr überhäuft ihn schon mit Schätzen?~
			IF ~~ THEN EXTERN ~ac#dwf00~ treasures_worth
			END

			IF ~~ THEN BEGIN no_means_no
			SAY ~Nein heißt nein, <PRO_RACE>. Wir müssen einen anderen Weg zurück suchen.~
			IF ~~ THEN EXTERN ~AC#DWF00~ beldas_cromwell_sage
			END
			
			IF ~~ THEN BEGIN goodbye_thradear
			SAY ~Kal maerdh.~
			IF ~~ THEN EXTERN ~AC#DWF00~ goodbye_02
			END
			
			IF ~~ THEN BEGIN thradear_turbold_01
			SAY ~Der Sage nach soll er eine mächtige Streitaxt geschwungen haben, die er selbst nach seinem Tode noch fest umklammert in der Hand hält. Dieser Zwerg hat alles richtig gemacht in seinem Leben. Viel würde ich dafür geben, inmitten meiner getöteten Feinde den letzten Atemzug auszuhauchen! Stattdessen stehen wir hier nur dumm herum.~
			IF ~~ THEN EXTERN ~AC#DWF00~ mount_turbold_01 
			END

			IF ~~ THEN BEGIN thradear_book_candlekeep
			SAY ~Genau dieses Buch. Eigentlich war das Buch ja der Grund, weswegen wir überhaupt an die Oberfläche gekommen sind! Und jetzt ist es weg. Gestohlen von diesem verfluchten Elf!~
			IF ~~ THEN REPLY ~Ein Elf hat das Buch gestohlen?~ EXTERN ~AC#DWF00~ elf_stole_book
			END
			
			IF ~~ THEN BEGIN thradear_book_candlekeep_02
			SAY ~Na, das Buch, das wir in Eurer Oberflächenbibliothek erworben hatten! Eigentlich war dieses Buch ja der einzige Grund, weswegen wir überhaupt an die Oberfläche gekommen sind! Und jetzt ist es weg. Gestohlen von diesem verfluchten Elf!~
			IF ~~ THEN REPLY ~Ein Elf hat das Buch gestohlen?~ EXTERN ~AC#DWF00~ elf_stole_book
			END
			
			IF ~~ THEN BEGIN thradear_never_trust_elf
			SAY ~Trau' niemals einem Elf!~
			IF ~~ THEN REPLY ~Eure Vorurteile sind wieder einmal bestätigt, was?~ EXTERN ~AC#DWF00~ elf_stole_book_gone
			IF ~~ THEN REPLY ~(Zuhören.)~ EXTERN ~AC#DWF00~ elf_stole_book_gone
			END
						
			IF ~~ THEN BEGIN thradear_killed_thief
			SAY ~...und den Dieb zur Strecke gebracht habt!~
			IF ~~ THEN REPLY ~Wo könnte sich der Elf denn gerade aufhalten?~ EXTERN ~AC#DWF00~ beldas_where_is_the_elf
			END

// Chain book
						CHAIN IF ~~ THEN AC#DWF00 CHAIN_underdark_highest_peak
						 ~Wir Zwerge sind schon komische Gesellen, mein Freund. Meist findet sich der Zugang in unser Reich an der Stelle, an der man es am wenigsten erwartet. Ich denke also, dass wir bald zu diesem Berg aufbrechen könnten. Allerdings gibt es noch ein weiteres Problem.~
						== ac#dwf20 ~Wir wären nämlich fast bereit zur Rückkehr in unsere geliebte Stadt...~
						== ac#dwf30 ~...wenn Beldas nicht das Buch verloren hätte!~
						END
						IF ~~ THEN + book_stolen

// CHAIN Joke #1

CHAIN IF ~~ THEN AC#DWF20 chain_joke_01
~Was bekommt man, wenn man einen Elfen mit seiner Axt spaltet?~
== ac#dwf30 ~Hmm... einen blutigen Bart?~
== ac#dwf20 ~Einen Halbelfen! Hahaha!~
== ac#dwf30 ~Hahaha! Ihr seid der Beste, Gormar!~
END
IF ~~ THEN DO ~SetGlobal("Dwarf_joke","ACIL4I",1)~ EXIT

// CHAIN Joke #2

CHAIN IF ~~ THEN AC#DWF20 chain_joke_02
~Was bekommt man, wenn man einen Halbling mit seiner Axt spaltet?~
== ac#dwf30 ~Kommt, sagt es mir, Gormar, sagt es mir!~
== ac#dwf20 ~Einen Vierteling!~
== ac#dwf30 ~Muahaha!~
== ac#dwf00 ~Seid doch bitte etwas leiser, Freunde!~
END
IF ~~ THEN DO ~SetGlobal("Dwarf_joke","ACIL4I",2)~ EXIT

// CHAIN Joke #2

CHAIN IF ~~ THEN AC#DWF20 chain_joke_03
~Also gut, passt auf, Thradear. Das ist der letzte Elfenwitz, der mir einfällt. Auf Dich rennen ein Troll, ein Oger und ein Elf zu. Du hast aber nur noch zwei Bolzen in deiner Armbrust. Was tust Du?~
== ac#dwf30 ~Hmm...~
== ac#dwf20 ~Ist doch klar: Zweimal auf den Elf schießen!~
== ac#dwf30 ~Hahahaha!~ 
= ~Und den Troll erschlage ich dann mit meinen Fäusten.~
== ac#dwf20 ~So sieht's aus, Thradear.~
== ac#dwf00 ~So, jetzt reicht es aber mit den Witzen. Wir riskieren noch, aus der Taverne geworfen zu werden.~
== ac#dwf20 ~Mehr Witze fallen mir ohnehin nicht mehr ein.~
== ac#dwf30 ~Zweimal auf den Elf schießen. Der war gut!~
END
IF ~~ THEN DO ~SetGlobal("Dwarf_joke","ACIL4I",3)~ EXIT
		
// Chain NPC Reaction: accept quest?

CHAIN IF ~~ THEN AC#DWF00 chain_travel_to_iltkazar
~Kommt mit uns ins Unterreich nach Iltkazar. Seht Euch dort unseren König an.~
== AnomenJ IF ~InParty("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN ~Ich weiß nicht, <CHARNAME>. Das klingt einerseits nach einem ehrenvollen Auftrag, andererseits finde ich, dass die Völker des Unterreiches Ihre Angelegenheiten besser selber regeln sollten. Hier an der Oberfläche mangelt es uns wahrlich nicht an Aufgaben, um unsere Tapferkeit unter Beweis zu stellen!~
== ViconiJ IF ~InParty("viconia") !StateCheck("viconia",CD_STATE_NOTVALID)~ THEN ~Was für eine schwache Rasse. Kriechen aus ihren Löchern hervor an die Oberfläche, anstatt ihre Probleme selbst zu lösen!~
== MazzyJ IF ~InParty("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN ~Es steht außer Frage, dass wir meinen kleinen Vettern bei dieser Sache helfen müssen, <CHARNAME>!~
== KeldorJ IF ~InParty("keldorn") !StateCheck("keldorn",CD_STATE_NOTVALID)~ THEN ~Ein Monarch, der seine Stadt nicht führen kann, lebt im Unterreich meist nicht lange. Zwerge sind zwar stur, aber meist auch ehrbare Leute. Lasst uns diesem Volk helfen.~
== AerieJ IF ~InParty("aerie") !StateCheck("aerie",CD_STATE_NOTVALID) GlobalGT("Chapter","GLOBAL",5)~ THEN ~Oh nein, <CHARNAME>, mir tun die Zwerge zwar leid, aber lasst uns nicht wieder zurück in dieses fürchterliche, lichtlose Unterreich zurückkehren!~
== AerieJ IF ~InParty("aerie") !StateCheck("aerie",CD_STATE_NOTVALID) GlobalLT("Chapter","GLOBAL",6)~ THEN ~Wir... wir sollen gemeinsam mit diesen Zwergen durch das Unterreich reisen? Ich mag die Zwerge und ich vertraue ihnen sehr, aber stellt Euch einmal vor, welch finstere Gestalten wir dort drunten noch so alles zu Gesicht bekämen!~
== MinscJ IF ~InParty("minsc") !StateCheck("minsc",CD_STATE_NOTVALID)~ THEN ~Das Problem der Zwerge lässt sich sicher leicht lösen, <CHARNAME>. Wir werden diesen... diesen schlafenden Zwerg schon wieder wach bekommen!~
== YoshJ IF ~InParty("yoshimo") !StateCheck("yoshimo",CD_STATE_NOTVALID)~ THEN ~Wenn die Belohnung stimmt, könnten wir uns in der Stadt der Zwerge eine goldene Nase verdienen.~
== JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN ~Es steht außer Frage, dass dieser König unsere Hilfe braucht, <CHARNAME>. Die Zwerge haben in der Vergangenheit in Tethyr zudem für große Stabilität gesorgt. Wenn Iltkazar fallen sollte, nur weil es keinen Monarchen mehr hat, würde diese Region des Unterreiches sicher von den bösen Rassen wie Drow oder Betrachtern in Beschlag genommen, was das Gleichgewicht auch an der Oberfläche empfindlich stören würde.~
== BEDWIN IF ~InParty("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN ~Was interessiert uns das Schicksal dieser Zwerge? Das ist doch alles die Mühe nicht wert.~
== ValygarJ IF ~InParty("valygar") !StateCheck("valygar",CD_STATE_NOTVALID)~ THEN ~Wir sollten vorsichtig vorgehen, <CHARNAME>. Wenn selbst die Zwerge, die sich im Unterreich bestens auskennen, diese Situation nicht meistern können, scheint etwas wahrlich Übles dahinterzustecken.~
== KORGANJ IF ~InParty("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN ~Für mich ist das endlich mal ein Abenteuer nach meinem Geschmack. Ich bin dabei.~
== JANJ IF ~InParty("Jan") !StateCheck("Jan",CD_STATE_NOTVALID)~ THEN ~Meine Familie hatte auch einmal das Problem, dass der alte Vormin ständig eingeschlafen ist. Zu den unpassendsten Gelegenheiten! Hat sogar die Beerdigung seiner eigenen Frau verschlafen. Ein Glück, dass sie dann als Wiedergängerin zurückgekehrt ist, dann konnte er ihr etwas verspätet dennoch Lebewohl sagen, bevor sie ihn gefressen hat.~
== NALIAJ IF ~InParty("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN ~Arme kleine Leute! Eine Stadt ohne einen Monarchen!~
== HAERDAJ IF ~InParty("HaerDalis") !StateCheck("HaerDalis",CD_STATE_NOTVALID)~ THEN ~Ein grausiges Schicksal, nicht mehr Herr seines eigenen Körpers sein zu können! Selbst für einen Zwerg...~
== CERNDJ IF ~InParty("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN ~Nicht mehr aus einem Schlaf zu erwachen ist ein unnatürlicher Vorgang. Welches Geschehen auch immer dahinterstecken mag - lasst uns einen Blick in diese Stadt werfen und sehen, wie wir helfen können.~
== IMOEN2J IF ~InParty("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN ~Die Zwerge haben sogar Kerzenburg besucht, um Hilfe für ihren Herrscher zu finden? Wir sollten ihnen folgen, <CHARNAME>. Das sind wir ihnen schuldig.~
END
IF~~THEN GOTO travel_to_iltkazar_02						
/*******************************************************************************************************
NPC-Dialoge
*******************************************************************************************************/

// Korgan
APPEND ~KORGANJ~
IF ~~ THEN BEGIN Korgan_Iltkazar_01
   SAY ~He, ist Iltkazar nicht die Stadt mit den silbernen Betten und den goldenen Weibern? Denen würde ich liebend gerne einmal einen Besuch abstatten!~
   IF ~~ THEN EXTERN ~ac#dwf00~ Korgan_Iltkazar_02
END

IF ~~ THEN BEGIN Korgan_Iltkazar_03
   SAY ~Egal was Ihr denkt, <CHARNAME>, bei dieser Mission bin ich dabei. Stellt Euch das mal vor: Eine Stadt voller Zwerginnen, die seit Jahrhunderten nichts als diese Bleichschnäbel aus den Minen zu Gesicht bekommen haben!~
   IF ~~ THEN EXTERN ~ac#dwf00~ Korgan_Iltkazar_04
END

IF ~~ THEN BEGIN Korgan_Iltkazar_05
   SAY ~He! Nicht gleich frech werden, Freundchen! Wenn Ihr Streit sucht, seid Ihr bei mir immer richtig!~
   IF ~~ THEN EXTERN ~ac#dwf00~ Korgan_Iltkazar_06
END


IF ~~ THEN BEGIN Korgan_aerie_quest
   SAY ~Jetzt heult mal nicht gleich wieder rum, nur weil es vielleicht etwas schlüpfriger und dunkler und feuchter ist, als es Euch lieb ist, Aerie!~
   IF ~~ THEN GOTO Korgan_accept_quest
END

IF ~~ THEN BEGIN Korgan_accept_quest
   SAY ~Für mich ist das endlich mal ein Abenteuer nach meinem Geschmack. Ich bin dabei.~
   IF ~~ THEN EXTERN ~ac#dwf00~ travel_to_iltkazar_02
   IF ~IsValidForPartyDialog("Anomen")~ THEN EXTERN ~ANOMENJ~ Anomen_accept_Quest
   IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ Jaheira_accept_quest
END
END

// Jaheira
APPEND ~JAHEIRAJ~
IF ~~ THEN BEGIN Jaheira_Iltkazar_01
   SAY ~Ich habe schon einmal von dieser Stadt gehört, <CHARNAME>. Der Legende nach soll sie unter dem südlichen Tethyr im Unterreich liegen. Die Zwerge, die einst dieses Gebiet besiedelten, haben durch ihre bewegte Geschichte viele Spuren hinterlassen, die heute noch die Landschaft Tethyrs prägen. Bisher ist nur niemand davon ausgegangen, dass von diesem uralten Zwergenreich irgendjemand bis zum heutigen Tage überlebt hat.~
   IF ~~ THEN EXTERN ~ac#dwf00~ Jaheira_Iltkazar_02
END

IF ~~ THEN BEGIN Jaheira_accept_quest
   SAY ~Es steht außer Frage, dass dieser König unsere Hilfe braucht, <CHARNAME>. Die Zwerge haben in der Vergangenheit in Tethyr zudem für große Stabilität gesorgt. Wenn Iltkazar fallen sollte, nur weil es keinen Monarchen mehr hat, würde diese Region des Unterreiches sicher von den bösen Rassen wie Drow oder Betrachtern in Beschlag genommen, was das Gleichgewicht auch an der Oberfläche empfindlich stören würde.~
   IF ~~ THEN EXTERN ~ac#dwf00~ travel_to_iltkazar_02
   IF ~IsValidForPartyDialog("Anomen")~ THEN EXTERN ~ANOMENJ~ Anomen_accept_Quest
END

IF ~~ THEN BEGIN jaheira_kuldin_peaks
   SAY ~Ganz Tethyr ist gespickt mit den Überbleibseln der Bauten der Zwerge. Viele Reisende wissen nicht, dass die Straße, die sie gerade benutzen, eigentlich vor Jahrtausenden von Zwergenhand erbaut wurde.~
   IF ~~ THEN EXTERN ~ac#dwf00~ kuldin_peaks
END

IF ~~ THEN BEGIN Jaheira_kuldinpeaks_02
   SAY ~In Tethyr gibt es eine Bergkette, die "Kuldingipfel" genannt wird. Ich selbst bin noch nie dort gewesen, hörte aber von den Schwierigkeiten, die die dortigen Bewohner mit Goblinoiden und dergleichen haben.~
   IF ~~ THEN EXTERN ~ac#dwf00~ beldas_kuldinpeaks_02
END

IF ~~ THEN BEGIN Jaheira_Nalia_book_thief
SAY ~...oder einen anderen Wert besitzen, der einen Diebstahl lohnenswert macht.~
IF ~~ THEN EXTERN ~ac#dwf00~ beldas_please_retrieve_book
END
END

// Anomen
APPEND ~ANOMENJ~
IF ~~ THEN BEGIN Anomen_accept_Quest
   SAY ~Ich weiß nicht, <CHARNAME>. Das klingt einerseits nach einem ehrenvollen Auftrag, andererseits finde ich, dass die Völker des Unterreiches Ihre Angelegenheiten besser selber regeln sollten. Hier an der Oberfläche mangelt es uns wahrlich nicht an Aufgaben, um unsere Tapferkeit unter Beweis zu stellen!~
   IF ~~ THEN EXTERN ~ac#dwf00~ travel_to_iltkazar_02
END

IF ~~ THEN BEGIN Anomen_stuck_in_tavern
SAY ~Das sind ja ein paar schöne Zwerge. Finden den Weg nicht mehr zurück in ihre Höhle!~
IF ~~ THEN EXTERN ~ac#dwf00~ stuck_in_tavern
END
END

// Nalia
APPEND ~NALIAJ~
IF ~~ THEN BEGIN Nalia_kuldin_peaks
   SAY ~Ich weiß, dass die Zwerge hier in dieser Gegend einst ein riesiges Reich an der Oberfläche besessen hatten. Ganz in der Nähe der Festung meiner Familie habe ich als Kind immer die alten Statuen der Zwerge bewundert, die seit Jahrtausenden wie Wächter aus einer vergangenen Zeit die Wegesränder zieren.~
   IF ~~ THEN EXTERN ~ac#dwf00~ kuldin_peaks
END

IF ~~ THEN BEGIN Nalia_book_thief
SAY ~Ein Dieb, der ein Buch stiehlt? So etwas habe ich ja noch nie gehört. Dann muss es ein ziemlich wertvolles Buch gewesen sein...~
IF ~~ THEN EXTERN ~ac#dwf00~ beldas_please_retrieve_book
IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ Jaheira_Nalia_book_thief
END

IF ~~ THEN BEGIN Nalia_axe_bridge
SAY ~Den Namen der Brücke habe ich schon einmal gehört. Die wichtigste Handelsstraße Amns führt aus Eshpurta über sie weiter nach Athkatla. Viele Händler ziehen mit ihren Waren gen Westen, um ihre Güter dann in der Stadt des Geldes zu verkaufen.~
IF ~~ THEN EXTERN ~ac#dwf00~ axe_bridge_02
END	
END

// Minsc
APPEND ~MINSCJ~
IF ~~ THEN BEGIN Minsc_kuldin_peaks
   SAY ~Jetzt ist Minsk verwirrt. Minsk dachte immer, Zwerge leben unter dem Berge und nicht obendrauf.~
   IF ~~ THEN EXTERN ~ac#dwf00~ CHAIN_underdark_highest_peak
END

IF ~~ THEN BEGIN minsc_king_hibernating
SAY ~Machen Zwerge Winterschlaf? Zwerge leben in Höhlen. Bären leben auch in Höhlen und machen Winterschlaf. Boo hat früher auch Winterschlaf gemacht, aber seit er mit Minsc zusammen ist, braucht Boo das nicht mehr.~
IF ~~ THEN EXTERN ~AC#DWF20~ gormar_dont_understand_either 
END
END

// Aerie
APPEND ~AERIEJ~
IF ~~ THEN BEGIN Aerie_accept_Quest_01
SAY ~Wir... wir sollen gemeinsam mit diesen Zwergen durch das Unterreich reisen? Ich mag die Zwerge und ich vertraue ihnen sehr, aber stellt Euch einmal vor, welch finstere Gestalten wir dort drunten noch so alles zu Gesicht bekämen!~
   IF ~~ THEN EXTERN ~ac#dwf00~ travel_to_iltkazar_02
   IF ~IsValidForPartyDialog("Anomen")~ THEN EXTERN ~ANOMENJ~ Anomen_accept_Quest
   IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ Jaheira_accept_quest
   IF ~IsValidForPartyDialog("Korgan")~ THEN EXTERN ~KORGANJ~ Korgan_aerie_quest
END

IF ~~ THEN BEGIN Aerie_accept_Quest_02
SAY ~Oh nein, <CHARNAME>, mir tun die Zwerge zwar leid, aber lasst uns nicht wieder zurück in dieses fürchertliche, lichtlose Unterreich zurückkehren!~
   IF ~~ THEN EXTERN ~ac#dwf00~ travel_to_iltkazar_02
END
END

// Valygar
APPEND ~VALYGARJ~
IF ~~ THEN BEGIN Valygar_kuldinpeaks_02
   SAY ~Ich hörte von einer Bergkette im Osten Tethyrs, die den Namen Kuldingipfel trägt, auch wenn ich noch nie selbst in dieser Gegend gewesen bin. Vielleicht hilft Euch das weiter, Zwerg.~
   IF ~~ THEN EXTERN ~ac#dwf00~ beldas_kuldinpeaks_02
END
END




