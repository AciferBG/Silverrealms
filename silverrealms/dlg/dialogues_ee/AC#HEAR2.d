BEGIN ~AC#HEAR2~

IF ~Global("AC#Heart","ACIL79",4)~ THEN BEGIN 0
  SAY ~(Ihr hört das dumpfe Schlagen des Herzens, das die ganze Kammer erfüllt und durch Mark und Bein zu dringen scheint. Seltsame Gefühle und Geräusche durchdringen Euren Geist, als ein Teil der uralten Gottheit zu erwachen scheint. Gerade, als Ihr zu überlegen beginnt, wie man am Besten mit einem toten Gott kommunizieren könnte, erfüllt eine mächtige Stimme den Raum.)~ 
  IF ~~ THEN GOTO 2
END

		IF ~~ THEN BEGIN 2 
		  SAY ~Was für ein Wesen wagt es, hier inmitten meiner Essenz zu stehen und mich aus meinem Schlaf zu erwecken?~ [AC#KALZ1]
		  IF ~~ THEN REPLY ~Ihr habt nicht geschlafen, Gottheit, Ihr wart tot.~ GOTO 3		  
		  IF ~~ THEN REPLY ~Mein Name ist <CHARNAME>. Und ich habe Euch zurück ins Leben geholt. Zumindest ein wenig.~ GOTO 3
		  IF ~~ THEN REPLY ~Ich habe einen langen Weg hinter mich gebracht, um Euren toten Körper zu finden.~ GOTO 3
		  IF ~~ THEN REPLY ~Ich habe Euch vom Tode erweckt. Das verschafft mir zumindest das Recht, eine Frage zu stellen.~ GOTO 3
		END

			IF ~~ THEN BEGIN 3 
			  SAY ~Ich soll tot gewesen sein? Ich, der Hüter Dunkler Wunder? Was für ein Frevel!~
			  =
			  ~Doch - ich erinnere mich... Die Zeit der Sorgen, die Avatare... die anderen Götter... dann der Schmerz und die Dunkelheit...~ 
			  IF ~~ THEN GOTO 4
			END

				IF ~~ THEN BEGIN 4
				  SAY ~(Eine mächtige Erschütterung geht durch die Kammer, so als durchlebe die Gottheit ihren eigenen Tod gerade noch einmal.)~ 
				  IF ~~ THEN DO ~SetGlobal("AC#Heart","ACIL79",5)~ EXIT
				END

IF ~Global("AC#Heart","ACIL79",6)~ THEN BEGIN 5 
  SAY ~Dunkelheit... Tod... keine Macht mehr, nur noch Schwäche... Lange werde ich nicht wach bleiben können. So sprecht schnell, bevor ich wieder in die ewige Ruhe verfalle: Warum habt Ihr mich erweckt?~ 
  IF ~~ THEN REPLY ~Ich bin wegen Mithbarakaz, dem Silberdrachen, hier.~  GOTO 6
  IF ~~ THEN REPLY ~Ruhe könnt Ihr später haben. Zuerst beantwortet Ihr meine Fragen zu König Mith Barak!~ GOTO 6
  IF ~~ THEN REPLY ~Es geht um den Silberdrachen, den Ihr verflucht habt.~ GOTO 6
END

	IF ~~ THEN BEGIN 6 
	  SAY ~Mith... barakazzz... der Silberne. Mith Barak, der Zwergenfreund. Der Verfluchte!~ 
	  IF ~~ THEN REPLY ~Genau der. Er war vor einiger Zeit hier an diesem Ort, genau wie ich jetzt.~ GOTO 7
	  IF ~~ THEN REPLY ~Was wurde aus ihm?~ GOTO 7
	  IF ~~ THEN REPLY ~Helft mir, ihn zu finden.~ GOTO 7
	END

		IF ~~ THEN BEGIN 7 
		  SAY ~Er stand hier vor mir... in mir... Wie lange mag das her sein? Ich vermag es nicht zu sagen... die Zeit steht still an diesem Ort...~ 
			IF ~~ THEN REPLY ~Sagt mir, was er von Euch wollte und wo er jetzt ist.~  GOTO 9 
			IF ~~ THEN REPLY ~Er suchte Euch auf, um von dem Fluch befreit zu werden, richtig?~  GOTO 9
			IF ~~ THEN REPLY ~Seine Spur hat mich bis hierher geführt. Wo endet sie?~ GOTO 9
			END

				IF ~~ THEN BEGIN 9 
				  SAY ~Der Fluch... er wurde... vor Äonen ausgesprochen, aber bleibt immer noch wirksam... Strafe für Ungehorsam und Verrat...~ 
				  IF ~~ THEN REPLY ~Warum habt Ihr Mithbarakaz verflucht?~ GOTO 10
				  IF ~~ THEN REPLY ~Was für einen Verrat soll Mithbarakaz denn begangen haben?~ GOTO 10
				  IF ~~ THEN REPLY ~Eine Strafe? Wofür?~ GOTO 10
				END

					IF ~~ THEN BEGIN 10 
					  SAY ~Der Silberne verweigerte mir Wissen, das mir zustand. Wissen, das kein Sterblicher vor einem Gott verbergen sollte! Für diese Anmaßung belegte ich ihn mit dem Fluch. Ich war Kalzareinad, Hüter dunklen Wissens. Flüche waren Teil meiner Domäne.~ 
					  IF ~~ THEN REPLY ~Von welchem Wissen sprecht Ihr?~ GOTO 11
					  IF ~~ THEN REPLY ~Welches Geheimnis war so wertvoll, dass Ihr einen Silberdrachen dafür verflucht habt?~ GOTO 11
					END

						IF ~~ THEN BEGIN 11 
						  SAY ~Ich... erinnere mich nur schwer... wartet... jetzt wird es klarer...~ 
						  IF ~~ THEN GOTO dracolich
						END

							IF ~~ THEN BEGIN dracolich 
							  SAY ~Ich suchte nach ewigem Leben. Und wollte dies an meine Anhänger weitergeben. Mithbarakaz hat mich davon abgehalten.~ 
							  IF ~~ THEN REPLY ~Ich habe gehört, Ihr wolltet Drachen in Untote verwandeln.~ GOTO 13
							  IF ~~ THEN REPLY ~Ihr wolltet den Tod besiegen. Für einen zu hohen Preis nehme ich an.~ GOTO 13
							  IF ~~ THEN REPLY ~Das ist schon eine gewisse Ironie. Ihr suchtet ewiges Leben und seid gestorben.~ GOTO 14							  
							  //IF ~~ THEN REPLY ~Dann war Mithbarakaz vielleicht klüger als Ihr dachtet.~ GOTO 14
							END

								IF ~~ THEN BEGIN 13 
								  SAY ~Und damit ewiges Leben erlangen! Diese Gabe hätte mich unsterblich gemacht.~
								  IF ~~ THEN REPLY ~Stattdessen seid Ihr jetzt tot.~  GOTO 14
								  IF ~~ THEN REPLY ~Ihr seid also an Eurem Streben nach Unsterblichkeit gescheitert.~ GOTO 14
								  IF ~~ THEN REPLY ~Vielleicht fürchtete Mithbarakaz weniger das Wissen als denjenigen, der es besitzen wollte.~ GOTO 15	
								END

									IF ~~ THEN BEGIN 14 
									  SAY ~Und was hat es Mithbarakaz gebracht? Tiamat, die Habgierige, ist dadurch stärker geworden. Sie war meine erbittertste Feindin. In meinen Händen wäre dieses Wissen bewahrt, verstanden und beherrscht worden...~ 
									  IF ~~ THEN REPLY ~Ihr wolltet es wohl vor allem zu Eurem Vorteil nutzen.~ GOTO 15
									  IF ~~ THEN REPLY ~Vielleicht hat Mith Barak erkannt, dass niemand über ein solches Wissen verfügen sollte.~ GOTO 15
									  IF ~~ THEN REPLY ~Ihr gebt Mithbarakaz die Schuld für Euren Ab- und Tiamats Aufstieg? Das erscheint mir etwas bequem.~ GOTO 15										  								  
									  IF ~~ THEN REPLY ~Dann habt Ihr beide versagt. Ihr konntet das Wissen nicht erlangen, und er konnte es nicht für immer verbergen.~ GOTO 15
									END

										IF ~~ THEN BEGIN 15 
										  SAY ~Auch Mithbarakaz kämpfte gegen Tiamat. Doch seine Treue galt nicht mir, sondern Bahamut, dem Platinvater. Dem selbsternannten Beschützer der Schwachen. Dem Bruder Tiamats.~ 
										  IF ~~ THEN REPLY ~Mithbarakaz war ein Diener Bahamuts, der wiederum ein Bruder Tiamats ist?~  GOTO 16
										  IF ~~ THEN REPLY ~Deshalb stellte er sich gegen Eure Pläne.~ GOTO 16
										  IF ~~ THEN REPLY ~Oh. Das scheint ein ziemlich großer Konflikt zu sein, in den wir hier hineingeraten sind. Euch ist er jedenfalls nicht gut bekommen.~ GOTO 16
										END

											IF ~~ THEN BEGIN 16 
											  SAY ~Mithbarakaz stand fest an Bahamuts Seite in diesem uraltem Krieg. Als Diener des Platinvaters misstraute er allem, was mit Macht, Unsterblichkeit und dunklem Wissen zu tun hatte. Deshalb stellte er sich gegen mich. Dadurch stärkte er letztlich nur Tiamat, meine Feindin. Bahamut und seine Diener teilen dieselbe Schwäche. Sie vergeuden ihre Kraft an die Niederen. Sie schützen die Schwachen, statt über sie zu herrschen. Sie halten Mitgefühl für eine Tugend. Und genau deshalb werden sie stets von jenen besiegt, die bereit sind, Macht zu nutzen. Wie Tiamat.~
											  //IF ~GlobalGT("AC#Bahamut","GLOBAL",0)~ THEN REPLY ~Einem alten Mann mit Kanarienvögeln bin ich kürzlich begegnet! Das war Bahamut, der Drachengott?~  GOTO 17
											  //IF ~~ THEN REPLY ~Ich habe das Gefühl, dass ich wieder einmal der Spielball eines Gottes geworden bin.~  GOTO 17
											  IF ~~ THEN GOTO 17
											END

												IF ~~ THEN BEGIN 17 
												  SAY ~Bald seid Ihr verloren, wie all diejenigen, die sich in die Ränke der Götter einmischen... Doch ich, ich bin  müde... Ihr seid mir zu nichts nütze, kleiner <PRO_RACE>, lasst mich allein...~ 
												  IF ~~ THEN REPLY ~Wartet! Ich habe noch einige Fragen an Euch, bevor Ihr wieder in Eure Starre verfallt.~ GOTO 18
												  IF ~~ THEN REPLY ~Bevor Ihr geht, müssen wir noch einige Dinge klären.~ GOTO 18
												  IF ~~ THEN REPLY ~Ihr schuldet mir zumindest ein paar Antworten. Schließlich habe ich Euch geweckt.~ GOTO 18
												END

													IF ~~ THEN BEGIN 18 
													  SAY ~Warum sollten für einen Gott die Wünsche eines Sterblichen von Belang sein?~ 
													  IF ~~ THEN REPLY ~Weil ich Euch im Austausch etwas anbieten kann, von dem möglicherweise Eure weitere Existenz abhängt.~  GOTO 19
													  IF ~~ THEN REPLY ~Schließlich hatte ich die Macht, Euch aus Eurem erbärmlichen Zustand zu erwecken.~  GOTO 19
													  IF ~~ THEN REPLY ~Weil ich ansonsten die letzte Seele sein werde, die mit Euch gesprochen hat.~ GOTO 19
													  IF ~~ THEN REPLY ~Ihr seid gerade nicht in der Position, das zu entscheiden.~ GOTO 19
													  IF ~~ THEN REPLY ~Vor Euch steht kein Sterblicher. In mir fließt auch das Blut der Götter!~ GOTO 19
													END

														IF ~~ THEN BEGIN 19 
														  SAY ~Ihr... droht... MIR? Mutig. Mutig, aber auch töricht. So sagt mir, was habt Ihr als Sterblicher anzubieten, das für einen vergessenen Gott von Belang ist?~
														  IF ~~ THEN REPLY ~Ihr seid noch nicht ganz vergessen. Ihr habt einen letzten Anhänger auf Faerun, der Euch die Treue hält.~ + not_forgotten
														  IF ~~ THEN REPLY ~Seht Ihr diese Waffen in unseren Händen? Ich habe Euch einen einzigen funken Leben eingehaucht, aber wenn Ihr nicht tut, was ich sage, werden wir unsere Waffen tief in Euer Herz bohren.~ + kill_you
														END
														
															IF ~~ THEN BEGIN not_forgotten 
															SAY ~Was sagt Ihr da? Es besteht noch ein Funken Glaube an mich?~ 
															IF ~~ THEN REPLY ~Zuerst sagt Ihr, wo sich Mithbarakaz jetzt befindet.~  GOTO where_is_mithbarakaz
															END
															
																IF ~~ THEN BEGIN where_is_mithbarakaz 
																SAY ~Mir ist es gleich. Was kümmert mich noch Mithbarakaz' Schicksal? Er war hier, ich spürte ihn. Doch er konnte mich nicht erwecken. Nicht so wie Ihr. Er zog unverrichteter Dinge wieder von dannen. Draußen haben sie auf ihn gewartet...~ 
																=
																~...die Diener Tiamats! Sie haben ihn fortgeschleift, den stolzen Silbernen... tief in meinem Schlaf konnte ich es hören. Ich weiß, wohin sie ihn brachten.~
																IF ~~ THEN REPLY ~Wohin?~  GOTO palace_of_shattered_souls
																END
																
																	IF ~~ THEN BEGIN palace_of_shattered_souls 
																	SAY ~Zu einem anderen Toten, vergessen, so wie ich. Doch dieser andere ruht schon seit Jahrtausenden, und niemand kennt mehr seinen Namen. Keine Macht kann ihn zurückbringen. Dort halten sie Mithbarakaz gefangen.~ 
																	IF ~~ THEN REPLY ~Sie haben ihn zu einem anderen toten Gott gebracht?~  GOTO palace_of_shattered_souls_02
																	END
																	
																		IF ~~ THEN BEGIN palace_of_shattered_souls_02 
																		SAY ~Ja. Die Githyanki hatten ihn besiedelt, doch wieder verlassen. Jetzt dient die Festung als Mithbarakaz' Gefängnis.~ 
																		IF ~~ THEN REPLY ~Wie komme ich dorthin?~ DO ~SetGlobal("AC#RevealACIL80","GLOBAL",1)
																		AddJournalEntry(@80000,QUEST)~ GOTO how_do_i_get_there
																		END
																		
																			IF ~~ THEN BEGIN how_do_i_get_there 
																			SAY ~Indem Ihr mit mir gesprochen habt, kennt Ihr bereits den Ort. Ihr könnt auf der Astralebene jederzeit dorthin reisen. So, wie Ihr zu mir gelangt seid.~ 
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
																					IF ~~ THEN REPLY ~Es fiel mir offenbar leichter, als Ihr geglaubt habt.~ GOTO fooled_by_a_mortal_02
																					IF ~~ THEN REPLY ~Betrachtet dies einfach als eine Lektion in Demut.~ GOTO fooled_by_a_mortal_02
																					END
																					
																					IF ~~ THEN BEGIN fooled_by_a_mortal_02 
																					SAY ~IHR ELENDER, BETRÜGER! ICH VERFLUCHE EUREN NAMEN!~ 
																					IF ~~ THEN REPLY ~Oh, da fällt mir ein, Ihr wolltet doch noch den Fluch von Mithbarakaz nehmen?~  GOTO fooled_by_a_mortal_curse
																					IF ~~ THEN REPLY ~Euer Fluch hat keine Macht über mich. Ihr seid tot und werdet es bleiben.~ GOTO fooled_by_a_mortal_bye
																					IF ~~ THEN REPLY ~Regt Euch nur weiter auf. Mir ist es gleich.~ GOTO fooled_by_a_mortal_bye
																					IF ~~ THEN REPLY ~Ihr habt mich unterschätzt. Das war Euer Fehler.~ GOTO fooled_by_a_mortal_02
																					IF ~~ THEN REPLY ~Wenn es Euch tröstet: Es ist nichts Persönliches.~ GOTO fooled_by_a_mortal_02
																					END
																					
																						IF ~~ THEN BEGIN fooled_by_a_mortal_curse 
																						SAY ~NIEMALS! MIT EURESGLEICHEN MACHE ICH KEINE GESCHÄFTE!~ 
																						IF ~~ THEN REPLY ~So lebt denn wohl, zumindest noch ein wenig.~ GOTO fooled_by_a_mortal_bye
																						IF ~~ THEN REPLY ~Ihr werde Euch jedenfalls jetzt verlassen.~ GOTO fooled_by_a_mortal_bye
																						END
																						
																						IF ~~ THEN BEGIN fooled_by_a_mortal_bye 
																						SAY ~GEHT! LASST MICH IN DER DUNKELHEIT ZURÜCK! BALD WERDET AUCH IHR NUR NOCH EIN NAME SEIN, VERGESSEN VON DER WELT UND VERLOREN IN DER LEERE!~ 
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
																									AddJournalEntry(@79700,QUEST_DONE)
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
															IF ~~ THEN REPLY ~Dies ist meine letzte Drohung, bevor Taten folgen.~  GOTO where_is_mithbarakaz
															END
															