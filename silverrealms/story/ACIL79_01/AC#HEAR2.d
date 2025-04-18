BEGIN ~AC#HEAR2~

IF ~Global("AC#Heart","ACIL79",4)~ THEN BEGIN 0
  SAY ~Ihr hört das dumpfe Schlagen des Herzens, das die ganze Kammer erfüllt und durch Mark und Bein zu dringen scheint. Seltsame Gefühle und Geräusche durchdringen Euren Geist, als ein Teil der uralten Gottheit zu erwachen scheint. Gerade, als Ihr zu überlegen beginnt, wie man am Besten mit einem toten Gott kommunizieren könnte, erfüllt eine mächtige Stimme den Raum.~ 
  IF ~~ THEN GOTO 1
END

	IF ~~ THEN BEGIN 1 // from: 0.0
	  SAY ~Whedabra... marfedelom... thric vers, ergriff plythe... Svaust mi si?~ // [AC#KALZ1] 
	  IF ~~ THEN REPLY ~Ich verstehe Euch nicht, Drache.~  GOTO 2
	END

		IF ~~ THEN BEGIN 2 // from: 1.0
		  SAY ~Was für ein Wesen, das nicht der Sprache der Drachen mächtig ist, wagt es, mich aus meinem Schlaf zu erwecken und hier in meiner Essenz zu stehen? Ein <PRO_RACE>?~ 
		  IF ~~ THEN REPLY ~Ihr habt nicht geschlafen, Gottheit, Ihr wart tot.~ GOTO 3
		END

			IF ~~ THEN BEGIN 3 // from: 2.0
			  SAY ~Tot? Wie kann ich, der Hüter Dunkler Wunder, tot sein? Doch - ich erinnere mich... Die Zeit der Sorgen, die Avatare... die anderen Götter... dann der Schmerz und die Dunkelheit...~ 
			  IF ~~ THEN GOTO 4
			END

				IF ~~ THEN BEGIN 4 // from: 3.0
				  SAY ~(Eine mächtige Erschütterung geht durch die Kammer, so als durchlebe die Gottheit ihren eigenen Tod gerade noch einmal.)~ 
				  IF ~~ THEN DO ~SetGlobal("AC#Heart","ACIL79",5)~ EXIT
				END

IF ~Global("AC#Heart","ACIL79",6)~ THEN BEGIN 5 
  SAY ~Dunkelheit... Tod... keine Macht, nur Schwäche... Was wollt Ihr, bevor ich wieder in die ewige Ruhe verfalle?~ 
  IF ~~ THEN REPLY ~Sagt Euch der Name Mithbarakaz etwas?~  GOTO 6
END

	IF ~~ THEN BEGIN 6 
	  SAY ~Mith... barakazzz... der Silberne. Der Verfluchte. Der Zwergenfreund.~ 
	  IF ~~ THEN REPLY ~Genau der. Er war vor einiger Zeit hier an diesem Ort, genau wie ich jetzt.~ GOTO 7
	END

		IF ~~ THEN BEGIN 7 
		  SAY ~Er stand hier vor mir... in mir... Wie lange mag das her sein? Ich vermag es nicht zu sagen... die Zeit steht still an diesem Ort...~ 
		  IF ~~ THEN REPLY ~Das tut jetzt nichts zur Sache. Sagt mir Bitte, was er von Euch wollte und wo er jetzt ist.~  GOTO 8
		END

			IF ~~ THEN BEGIN 8 
			  SAY ~Er ist nicht mehr hier.~ 
			  IF ~~ THEN REPLY ~Das sehe ich auch. Er suchte Euch auf, um von dem Fluch befreit zu werden, richtig?~  GOTO 9
			END

				IF ~~ THEN BEGIN 9 
				  SAY ~Der Fluch... er wurde... vor Äonen ausgesprochen, aber bleibt immer noch wirksam... Strafe für Ungehorsam und Verrat...~ 
				  IF ~~ THEN REPLY ~Warum habt Ihr Mithbarakaz verflucht?~ GOTO 10
				END

					IF ~~ THEN BEGIN 10 
					  SAY ~Er bewahrte Wissen, das Kraft meiner Domäne mir zugestanden hätte. Da er es mir vorenthielt, belegte ich den Silbernen mit einem Fluch. Ich war der Hüter dunklen Wissens, Flüche waren Teil meiner Macht.~ 
					  IF ~~ THEN REPLY ~Welches Wissen wolltet Ihr von ihm erhalten?~  GOTO 11
					END

						IF ~~ THEN BEGIN 11 
						  SAY ~Ich... erinnere mich nur schwer... wartet... jetzt wird es klarer...~ 
						  IF ~~ THEN GOTO dracolich
						END

							IF ~~ THEN BEGIN dracolich 
							  SAY ~Ich suchte nach ewigem Leben. Und wollte dies an meine Anhänger, meine Kinder weitergeben. Mithbarakazzz hat mich davon abgehalten.~ 
							  IF ~~ THEN REPLY ~Ich habe gehört, Ihr wolltet Drachen in Leichname verwandeln.~ GOTO 13
							END

								IF ~~ THEN BEGIN 13 
								  SAY ~Und ihnen damit ewiges Leben schenken! Dieses Geschenk hätte auch mich unsterblich gemacht.~
								  IF ~~ THEN REPLY ~Stattdessen seid Ihr jetzt tot.~  GOTO 14
								END

									IF ~~ THEN BEGIN 14 
									  SAY ~Und was hat es Mithbarakaz gebracht? Tiamat, die Habgierige, ist dadurch stärker geworden. Sie war meine erbitterteste Feindin. Das Wissen wäre bei mir sicher gewesen, ich hätte es studieren können...~ 
									  IF ~~ THEN REPLY ~Ihr wolltet es wohl vor allem zu Eurem Vorteil nutzen, und Mithbarakaz hat das verhindert.~ GOTO 15
									END

										IF ~~ THEN BEGIN 15 
										  SAY ~Auch er war ein Gegner Tiamats, doch diente er nicht mir, sondern einem Anderen, Xymor, dem Bruder Tiamats, den die Sterblichen Bahamut nennen.~ 
										  IF ~~ THEN REPLY ~Mithbarakaz war ein Diener Bahamuts, der wiederum ein Bruder Tiamats ist?~  GOTO 16
										END

											IF ~~ THEN BEGIN 16 
											  SAY ~In der Tat, das war er, und sie haben viele Gemeinsamkeiten, der Gott und sein Diener. Die kranke Liebe zu den schwachen Völkern, der Hang, mit den Niederen zu verkehren...~ 
											  //IF ~GlobalGT("AC#Bahamut","GLOBAL",0)~ THEN REPLY ~Einem alten Mann mit Kanarienvögeln bin ich kürzlich begegnet! Das war Bahamut, der Drachengott?~  GOTO 17
											  //IF ~~ THEN REPLY ~Ich habe das Gefühl, dass ich wieder einmal der Spielball eines Gottes geworden bin.~  GOTO 17
											  IF ~~ THEN GOTO 17
											END

												IF ~~ THEN BEGIN 17 
												  SAY ~Bald seid Ihr verloren, wie all diejenigen, die sich in die Ränke der Götter einmischen... Doch ich, ich bin  müde... Ihr seid mir zu nichts nütze, kleiner <PRO_RACE>, lasst mich allein...~ 
												  IF ~~ THEN REPLY ~Wartet! Ich habe noch einige Fragen an Euch, bevor Ihr wieder in Eure Starre verfallt!~ GOTO 18
												END

													IF ~~ THEN BEGIN 18 
													  SAY ~Warum sollten für einen Gott die Wünsche eines Sterblichen von Belang sein?~ 
													  IF ~~ THEN REPLY ~Weil ich Euch im Austausch etwas anbieten kann, von dem möglicherweise Eure weitere Existenz abhängt. Schließlich hatte ich auch die Macht, Euch aus Eurem dämmernden Zustand zu erwecken.~  GOTO 19
													END

														IF ~~ THEN BEGIN 19 
														  SAY ~Ihr... droht... MIR? Mutig, aber auch töricht. So sagt mir, was habt Ihr als Sterblicher anzubieten, das für einen vergessenen Gott von Belang ist?~
														  IF ~~ THEN REPLY ~Ihr seid noch nicht ganz vergessen. Ihr habt einen letzten Anhänger auf Faerun, der Euch die Treue hält.~ + not_forgotten
														  IF ~~ THEN REPLY ~Seht Ihr diese Waffen in unseren Händen? Ich habe Euch einen einzigen funken Leben eingehaucht, aber wenn Ihr nicht tut, was ich sage, werden wir unsere Waffen tief in Euer Herz bohren.~ + kill_you
														END
														
															IF ~~ THEN BEGIN not_forgotten 
															SAY ~Was sagt Ihr da? Es besteht noch ein Funken Glaube an mich?~ 
															IF ~~ THEN REPLY ~Zuerst sagt Ihr, wo sich Mithbarakaz jetzt befindet.~  GOTO where_is_mithbarakaz
															END
															
																IF ~~ THEN BEGIN where_is_mithbarakaz 
																SAY ~Nun gut. Er war hier, und sie haben hier auf ihn gewartet... die Diener Tiamats. Sie haben ihn fortgeschleift, den stolzen Silbernen...~
																=
																~Ich kann sehen, wohin sie ihn brachten. Sie brachten ihn in den Palast der zerschmetterten Seelen.~
																IF ~~ THEN REPLY ~Den Palast der zerschmetterten Seelen?~  GOTO palace_of_shattered_souls
																END
																
																	IF ~~ THEN BEGIN palace_of_shattered_souls 
																	SAY ~Ein anderer Toter, vergessen, so wie ich. Doch dieser ruht schon seit Jahrtausenden, und niemand kennt mehr seinen Namen.~ 
																	IF ~~ THEN REPLY ~Sie haben ihn zu einem anderen toten Gott gebracht?~  GOTO palace_of_shattered_souls_02
																	END
																	
																		IF ~~ THEN BEGIN palace_of_shattered_souls_02 
																		SAY ~Ja. Dieser dort ist wirklich tot. Die Githyanki haben ihn besiedelt, doch wieder verlassen. Jetzt dient die Festung als Mithbarakaz' Gefängnis.~ 
																		IF ~~ THEN REPLY ~Wie komme ich dorthin?~ DO ~SetGlobal("AC#RevealACIL80","GLOBAL",1)
																		AddJournalEntry(@80000,QUEST)~ GOTO how_do_i_get_there
																		END
																		
																			IF ~~ THEN BEGIN how_do_i_get_there 
																			SAY ~Indem Ihr mit mir redet, wisst Ihr es bereits.~ 
																			IF ~~ THEN REPLY ~Gut. Das ist alles, was ich wissen wollte. Gehabt Euch wohl.~  GOTO leave_you_alone
																			IF ~~ THEN REPLY ~Ich danke Euch. Nun zu meinem Teil der Abmachung.~  GOTO last_follower_01
																			END
																			
																				IF ~~ THEN BEGIN leave_you_alone 
																				SAY ~Wartet! Was ist mit Eurem Teil der Abmachung?~ 
																				IF ~~ THEN REPLY ~Ich hatte niemals vor, meinen Teil einzuhalten. Ich würde sagen, Ihr seid auf einen Sterblichen hereingefallen!~  GOTO fooled_by_a_mortal
																				IF ~~ THEN REPLY ~Ihr seid noch nicht ganz vergessen. Ihr habt einen letzten Anhänger auf Faerun, der Euch die Treue hält.~ + not_forgotten_02
																				END
																				
																				IF ~~ THEN BEGIN not_forgotten_02 
																				SAY ~Was sagt Ihr da? Es besteht noch ein Funken Glaube an mich?~ 
																				IF ~~ THEN REPLY ~Das stimmt. Es gibt einen blauen Drachen namens Maldraedior, der Euch immer noch die Treue hält.~  GOTO last_follower_02
																				END
																				
																					IF ~~ THEN BEGIN fooled_by_a_mortal 
																					SAY ~Wie könnt Ihr es wagen, einen Gott zu betrügen!~ 
																					IF ~~ THEN REPLY ~Ach, das ist gar nicht so schwer. Gehabt Euch wohl.~  GOTO fooled_by_a_mortal_02
																					END
																					
																					IF ~~ THEN BEGIN fooled_by_a_mortal_02 
																					SAY ~IHR ELENDER, BETRÜGERISCHER <PRO_RACE>! ICH VERFLUCHE EUREN NAMEN!~ 
																					IF ~~ THEN REPLY ~Oh, da fällt mir ein, Ihr wolltet doch noch den Fluch von Mithbarakaz nehmen?~  GOTO fooled_by_a_mortal_curse
																					END
																					
																					IF ~~ THEN BEGIN fooled_by_a_mortal_curse 
																					SAY ~NIEMALS! MIT EURESGLEICHEN MACHE ICH KEINE GESCHÄFTE!~ 
																					IF ~~ THEN DO ~SetGlobal("AC#Heart","ACIL79",7)~ EXIT
																					END

																			IF ~~ THEN BEGIN last_follower_01 
																			SAY ~Ihr erwähntet, dass der Glaube an meine Kraft in der Welt noch nicht ganz erloschen ist?~ 
																			IF ~~ THEN REPLY ~Das stimmt. Es gibt einen blauen Drachen namens Maldraedior, der Euch immer noch die Treue hält.~  GOTO last_follower_02
																			END
																			
																				IF ~~ THEN BEGIN last_follower_02 
																				SAY ~Maldraedior der Blaue ... lebt?~ 
																				IF ~~ THEN REPLY ~Ja. Ich habe selbst mit ihm gesprochen.~ DO ~SetGlobal("AC#KalzareinadsFaith","GLOBAL",1)
																				EraseJournalEntry(@79600)
																				AddJournalEntry(@79601,QUEST_DONE)~ GOTO last_follower_03
																				END
																				
																					IF ~~ THEN BEGIN last_follower_03 
																					SAY ~Das sind... gute Nachrichten, die Ihr mir bringt. Ja... jetzt vernehme ich seine Gebete an mich... zum ersten Mal seit Jahrzehnten spüre ich wieder den Glauben an mich... es macht... mich stärker!~ 
																					IF ~~ THEN REPLY ~Dann könnt Ihr ja jetzt auch den Fluch von Mithbarakaz nehmen.~ GOTO cure_curse_02
																					IF ~~ THEN REPLY ~Schön zu wissen. Dann werde ich Euch einmal wieder alleine lassen.~ GOTO whats_next
																					END
																																											
																						
																						IF ~~ THEN BEGIN cure_curse_02 
																						SAY ~Warum sollte ich das tun?~ 
																						IF ~~ THEN REPLY ~Mithbarakaz hat lange genug gelitten.~ GOTO cure_curse_03
																						END
																						
																							IF ~~ THEN BEGIN cure_curse_03 
																							SAY ~Hat er das? Er trägt große Mitschuld an dem Zustand, an dem ich mich derzeit befinde.~ 
																							IF ~~ THEN REPLY ~Vielleicht ist dieser Akt der Gnade ja Euer erster Schritt zurück in die Göttlichkeit.~ GOTO cure_curse_04
																							IF ~~ THEN REPLY ~Hebt den Fluch auf, oder ich werde Eurem derzeitigen Zustand ein jähes Ende bereiten!~ GOTO curse_threat
																							END
																							
																								IF ~~ THEN BEGIN curse_threat 
																								SAY ~Ihr droht mir? Ihr, ein Sterblicher?~ 
																								IF ~~ THEN REPLY ~Ich stehe hier inmitten Eurer Eingeweide. Glaubt Ihr ernsthaft, ich könnte Euch keinen Schaden zufügen?~ GOTO cure_curse_05
																								END
																								
																								IF ~~ THEN BEGIN cure_curse_04 
																								SAY ~Hmm... Vielleicht habt Ihr Recht, sterbliches Wesen.~ 
																								IF ~~ THEN GOTO cure_curse_05
																								END
																								
																									IF ~~ THEN BEGIN cure_curse_05 
																									SAY ~Nun gut. Der Fluch, der auf Mithbarakaz' Schultern lastet, ist gelöst. Fortan möge er wieder frei auf der materiellen Ebene in seiner Drachengestalt wandeln können.~ 
																									IF ~~ THEN REPLY ~Ich danke Euch für diese Tat.~ DO ~SetGlobal("AC#MithbarakazCurse","GLOBAL",1)
																									AddJournalEntry(@79700,QUEST)
																									ReputationInc(1)
																									AddexperienceParty(7500)~ GOTO whats_next
																									END
																									
																					IF ~~ THEN BEGIN whats_next 
																					SAY ~Ich werde müde. Lasst mich nun in Ruhe weiter dämmern, Sterblicher.~ 
																					IF ~~ THEN DO ~SetGlobal("AC#Heart","ACIL79",7)~ EXIT
																					END
																			
															IF ~~ THEN BEGIN kill_you 
															SAY ~Ihr droht mir schon wieder?~ 
															IF ~~ THEN REPLY ~Genau. Sagt mir einfach, wo sich Mithbarakaz befindet, und ich lasse Euch in Frieden.~  GOTO where_is_mithbarakaz
															END
															