/*******************************************************************************************************
Dialogue amnish guard in ACIL04 after the events in ACIL09 (Axebridge)
*******************************************************************************************************/

BEGIN ~AC#04AG1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_01
SAY ~He! Ihr! Bürger! Was ist geschehen? Warum ist die Straße nach Osten nicht mehr passierbar?~
IF ~~ THEN REPLY ~Eine Gruppe Wegelagerer hatte einen Hinterhalt an der Axtbrücke vorbereitet und die Straße blockiert.~ GOTO highwaymen_01
IF ~~ THEN REPLY ~Eine Karawane an der Axtbrücke ist überfallen worden. Die Gegend um die Axtbrücke steht in Flammen.~ + caravan_burning
IF ~~ THEN REPLY ~An der Axtbrücke ist ein großes Feuer ausgebrochen.~ + axebridge_fire
IF ~IsValidForPartyDialog("Anomen")~ THEN EXTERN ~ANOMENJ~ Anomen_gives_orders
END

	IF ~~ THEN BEGIN highwaymen_01
	SAY ~Wegelagerer sagt Ihr? Was ist mit ihnen geschehen?~
	IF ~~ THEN REPLY ~Ich habe sie alle getötet.~ GOTO kill_all
	END
	
		IF ~~ THEN BEGIN kill_all
		SAY ~Gute Arbeit, Bürger! Wenn es nur mehr von Eurer Sorte gäbe, dann hätten wir nicht mehr soviel zu tun. Los Männer, jetzt ist es an uns, den Weg wieder freizuräumen.~
		IF ~~ THEN GOTO bye
		IF ~IsValidForPartyDialog("Nalia")~ THEN EXTERN ~NALIAJ~ Nalia_amn_guards
		END
		
		IF ~~ THEN BEGIN Anomen_gives_orders_02
		SAY ~Ihr habt die Banditen bereits beseitigt? Gute Arbeit. Los Männer, jetzt ist es an uns, den Weg wieder freizuräumen!~
		IF ~~ THEN GOTO bye
		IF ~IsValidForPartyDialog("Nalia")~ THEN EXTERN ~NALIAJ~ Nalia_amn_guards
		END

	IF ~~ THEN BEGIN caravan_burning 
	SAY ~Jemand hat einen Händler angegriffen? Und es brennt? Wer hat das Feuer gelegt?~
	IF ~~ THEN REPLY ~Das weiß ich nicht.~ GOTO dunno
	END
	
		IF ~~ THEN BEGIN dunno
		SAY ~Wie dem auch sei. Was ist mit den Angreifern geschehen?~
		IF ~~ THEN REPLY ~Ich habe sie alle getötet.~ GOTO kill_all
		END
	
	IF ~~ THEN BEGIN axebridge_fire
	SAY ~Ein Feuer? Um diese Jahreszeit? Im Süden brennen die Wälder häufig, aber hier im Norden Amns?~
	IF ~~ THEN REPLY ~Es schien kein normales Feuer gewesen zu sein. Außerdem haben Wegelagerer die Straße versperrt.~ GOTO highwaymen_01
	END
	
	IF ~~ THEN BEGIN bye
	SAY ~Holt den Tross mit den Sträflingen, damit sie die Straße wieder passierbar machen. Wir anderen löschen das Feuer, nicht, dass die Flammen noch auf die umliegenden Wälder übergreifen.~
	IF ~~ THEN DO ~SetGlobal("Guard_Spawn","ACIL04",10)
	EscapeArea()~ EXIT 
	END
/*******************************************************************************************************
Dialog Boy in ACIL04
*******************************************************************************************************/

BEGIN ~AC#S#BY1~

/*
IF ~Global("BoySeenDragon","ACIL04",1)~ THEN BEGIN hello_seen_dragon
SAY ~Aber es ist wahr! Ich habe einen echten Drachen gesehen!~
IF ~~ THEN DO ~SetGlobal("BoySeenDragon","ACIL04",10)~ GOTO chain_seen_dragon
END
*/

IF ~Global("AC#EndrikQuest","ACIL04",1)~ THEN BEGIN hello_again
SAY  ~Und? Habt Ihr meinen Drachen gefunden?~  
++ ~Nein, noch nicht.~ + exit
IF ~PartyHasItem("AC#S#DRR")~ THEN REPLY ~Ja, ich habe Euren Drachen hier bei mir.~ + dragon_retrieved
END

		IF ~~ THEN BEGIN dragon_retrieved
		SAY ~Wirklich? Lasst einmal sehen!~
		IF ~~ THEN DO ~TakePartyItem("AC#S#DRR")~ + monster_dead
		END
		
		IF ~~ THEN BEGIN dragon_already_retrieved
		SAY ~Ihr habt ihn gefunden, ohne dass ich Euch davon erzählt habe? Zeigt mal her!~
		IF ~~ THEN DO ~TakePartyItem("AC#S#DRR")~ + dragon_already_retrieved_02
		END
		
			IF ~~ THEN BEGIN dragon_already_retrieved_02
			SAY ~Jetzt kann ich wieder mit ihm üben! Und ich möchte Euch eine Geschichte erzählen.~
			IF ~~ THEN + greatest_dragonslayer
			END
				
			
			IF ~~ THEN BEGIN monster_dead
			SAY ~Er ist noch heil! Danke! Und, habt Ihr das Monster erschlagen?~
			++ ~Da war gar kein Monster in der Höhle, Endrik. Nur ein Haufen Blätter.~ EXTERN ~AC#S#GI1~ no_monster_there
			++ ~Du hast nicht untertrieben mit dem Monster. Ich konnte es nur schwer besiegen. In der Höhle hauste ein watschelnder Komposthaufen.~ EXTERN ~AC#S#GI1~ shmound
			END
			
				IF ~~ THEN BEGIN no_monster_there_02
				SAY ~Ich... ich... aber ich habe wirklich gedacht...~
				IF ~~ THEN EXTERN ~AC#S#GI1~ no_monster_there_03
				END
				
					IF ~~ THEN BEGIN no_monster_there_04
					SAY ~Naja, egal. Wenn ich groß bin, werde ich trotzdem Drachentöter werden! Der Größte von allen!~
					IF ~~ THEN + greatest_dragonslayer
					END
				
				IF ~~ THEN BEGIN shmound_02
				SAY ~Siehst Du, Arilyn! Ein Blättermonster, wie ich gesagt habe! Wenn Ich groß bin, werde ich ganz viele davon erschlagen! Und Drachen! Ich werde der größte aller Drachentöter werden!~
				IF ~~ THEN + greatest_dragonslayer
				END
				
					IF ~~ THEN BEGIN greatest_dragonslayer
					SAY ~Wisst Ihr, ich werde nämlich der berühmteste Drachentöter nach Tethir werden!~
					++ ~Was meinst Du mit Tethir, Kind?~ + what_tethir_02
					++ ~Du meinst doch eher, dass Du der berühmteste Drachentöter *in* Tethyr werden willst, oder?~ + what_tethir_02
					++ ~Wir sind doch hier in Amn und nicht in Tethyr, oder?~ + amn_not_tethyr_02
					END
					
						IF ~~ THEN BEGIN amn_not_tethyr_02
						SAY ~Ich weiß wohl, dass wir hier in Amn und nicht in Tethyr sind, <PRO_LADYLORD>!~
						IF ~~ THEN + what_tethir_02
						END
			
							IF ~~ THEN BEGIN what_tethir_02
							SAY ~Ich meine ja auch nicht das Land Tethyr, sondern den Drachentöter *Tethir*, nach dem das Land benannt ist! Davon handelt nämlich die Geschichte, die ich Euch erzählen wollte!~
							++ ~Woher weißt Du das alles?~ + from_book
							END

								IF ~~ THEN BEGIN from_book
								SAY ~Na, aus meinem Buch, das ich immer lese!~
								++ ~Du kannst lesen, Kind?~ + read_02
								++ ~Was ist das für ein Buch, von dem Du sprichst?~ + what_book_02
								END
				
									IF ~~ THEN BEGIN read_02
									SAY ~Natürlich kann ich lesen! Ihr etwa nicht, <PRO_LADYLORD>?~
									++ ~Selbstverständlich kann ich lesen.~ + what_book_02
									++ ~Was ist das für ein Buch, von dem Du sprichst?~ + what_book_02
									END
					
										IF ~~ THEN BEGIN what_book_02
										SAY ~Mein Buch erzählt die Geschichte von Tethir, dem ersten Drachentöter. Ich habe es schon zwanzig und ein Mal gelesen!~
										IF ~~ THEN EXTERN ~AC#S#04F~ mother_book
										END
										
										IF ~~ THEN BEGIN mother_book_02
										SAY ~Es ist keine Fabel! Der Ort, an dem Tethir die zwei Drachen erschlagen hat, ist hier ganz in der Nähe!~
										IF ~~ THEN EXTERN ~AC#S#04F~ mother_book_03
										END
										
											IF ~~ THEN BEGIN give_book_pc
											SAY ~Hmm, meinst Du wirklich?~
											++ ~Wenn es Dir so viel bedeutet, kannst Du es gerne behalten.~ + dont_need_to_give_the_book
											++ ~Immerhin eine dürftige Belohnung für meine Mühen. Gib' mir das Buch und ich verschwinde von hier.~ + give_me_the_book
											END
											
												IF ~~ THEN BEGIN dont_need_to_give_the_book
												SAY ~Wisst Ihr was? Ich kann es eh' schon auswendig. Und weil Ihr ein echter Abenteurer seid, braucht Ihr auch eine echte Belohnung!~
												IF ~~ THEN + reward_book
												END
												
												IF ~~ THEN BEGIN give_me_the_book
												SAY ~Ist ja gut. Ich kann es eh' schon auswendig.~
												IF ~~ THEN + reward_book
												END
										
					
						IF ~~ THEN BEGIN reward_book
						SAY ~Hier ist das Buch. Und nochmal Danke für Eure Hilfe! Vielleicht kann ich Euch ja irgendwann auch mal helfen, wenn ich groß bin!~
						IF ~~ THEN DO ~SetGlobal("AC#EndrikQuest","ACIL04",10)
						SetGlobal("AC#DragonToy","GLOBAL",10)
						GiveItemCreate("ac#s#bkt",Player1,1,0,0)
						AddJournalEntry(@20402,QUEST_DONE)
						~ EXIT
						END	
				
				

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_02
SAY  ~Seid Ihr ein echter Abenteurer, <PRO_LADYLORD>?~  
++ ~Ja, das bin ich.~ + i_am_adventurer
END

	IF ~~ THEN BEGIN i_am_adventurer
	SAY ~Oh, das ist toll! Ich werde auch einmal ein berühmter Abenteurer werden! Sagt, habt Ihr schon einmal einen Drachen erschlagen?~
	++ ~Warum fragst Du?~ + why_slay_dragon_02
	++ ~Nein, das habe ich bis jetzt noch nicht.~ + why_slay_dragon_02
	++ ~Natürlich habe ich schon Drachen erschlagen! Sonst wäre ich doch kein echter Abenteurer, oder?~ + why_slay_dragon_02
	END

		IF ~~ THEN BEGIN why_slay_dragon_02
		SAY ~Also, wenn ich einmal groß bin, möchte ich ein mächtiger Drachentöter werden und auf abgerichteten Drachen reiten!~
		IF ~~ THEN + dragon_figurine_01
		END
		
			IF ~~ THEN BEGIN dragon_figurine_01
			SAY ~Ich hatte nämlich schon einmal einen gezähmten Drachen, wisst Ihr?~
			IF ~~ THEN EXTERN ~AC#S#GI1~ not_a_real_dragon
			END
			
				IF ~~ THEN BEGIN dragonfigurine_gone
				SAY ~War sie nicht!~
				IF ~~ THEN EXTERN ~AC#S#GI1~ dragonfigurine_gone_02
				END
				
					IF ~~ THEN BEGIN dragonfigurine_gone_03
					SAY ~War sie nicht!~
					IF ~~ THEN REPLY ~Also...~ EXTERN ~AC#S#GI1~ dragonfigurine_gone_04
					END
										
						IF ~~ THEN BEGIN dragonfigurine_lost_01
						SAY ~Das stimmt gar nicht! Ein riesengroßes Monster hat sie mir weggenommen!~
						IF ~~ THEN EXTERN ~AC#S#GI1~ dragonfigurine_lost_02
						END
						
							IF ~~ THEN BEGIN dragonfigurine_lost_03
							SAY ~Bin ich nicht! Ich werde es beweisen! Schau, <PRO_HESHE> wird ihn mir sicher zurückbringen! Denn <PRO_HESHE> ist nämlich ein echter Abenteurer!~
							IF ~~ THEN EXTERN ~AC#S#04F~ mother_pc_other_things_todo
							END
							
								IF ~~ THEN BEGIN retrieve_toy_01
								SAY ~Sagt, <PRO_LADYLORD>, werdet Ihr mir meinen Drachen zurückholen?~
								++ ~Wie könnte ich einem Kind eine solche Bitte abschlagen?~ + yes_retrieve_dragon
								++ ~Nein, dafür habe ich keine Zeit.~ + not_retrieve_dragon
								IF ~PartyHasItem("AC#S#DRR")~ THEN REPLY ~Ich glaube, ich habe Euren Drachen bereits gefunden.~ + dragon_already_retrieved
								END
								
										IF ~~ THEN BEGIN not_retrieve_dragon
										SAY ~Oh wie schade! Dann habe ich ja keinen Drachen mehr zum Spielen!~
										IF ~~ THEN EXTERN ~AC#S#04F~ father_makes_new_one
										END							
										
											IF ~~ THEN BEGIN father_makes_new_one_02
											SAY ~Ja, aber das ist dann nicht derselbe!~
											IF ~~ THEN + exit_no_dragon
											END
											
												IF ~~ THEN BEGIN exit_no_dragon
												SAY ~Wie soll ich denn ohne Drache ein Drachentöter werden? *seufz*~
												IF ~~ THEN EXIT
												END
								
									IF ~~ THEN BEGIN yes_retrieve_dragon
									SAY ~Oh, das ist toll! Siehst Du, Arilyn?~
									IF ~~ THEN + retrieve_toy_02
									END
									
										IF ~~ THEN BEGIN retrieve_toy_02
										SAY ~Also hört zu. Hier in der Nähe gibt es eine tiefe Höhle.~
										IF ~~ THEN EXTERN ~AC#S#GI1~ not_go_to_cave
										END
										
											IF ~~ THEN BEGIN not_go_to_cave_02
											SAY ~Ich hab' doch keine Angst vor einer Höhle! Aber da drinnen, da war es schon sehr gruselig. Und gestunken hat es! Alles war voll von Matsch und faulen Blättern. Ich hatte meinen Drachen gerade abgestellt, als sich plötzlich... plötzlich...~
											++ ~Was ist passiert, Endrik?~ + moving_leaves
											END
											
												IF ~~ THEN BEGIN moving_leaves
												SAY ~Die Blätter haben begonnen sich zu bewegen! Da bin ich schnell nach draußen gerannt und hab' meinen Drachen drin vergessen.~
												++ ~Du bist vor ein paar Blättern davongerannt?~ EXTERN ~AC#S#GI1~ moving_leaves_02
												END
												
													IF ~~ THEN BEGIN moving_leaves_03
													SAY ~Aber unter den Blättern war ein großes Monster, ich schwör's!~
													++ ~Also gut, Endrik. Ich werde einmal in der Höhle unter den Blättern nachschauen und Dir Dein Spielzeug zurückbringen. Wenn das *Monster* davon noch etwas übriggelassen hat.~ + accept_quest_01
													END
													
														IF ~~ THEN BEGIN accept_quest_01
														SAY ~Oh, das würdet Ihr für mich machen?~
														++ ~Ja. Jetzt erkläre mir bitte noch, wo diese Höhle ist, bevor ich es mir wieder anders überlege.~ + wheres_the_cave
														++ ~Aber klar doch! Wo finde ich die Höhle mit dem Blättermonster?~ + wheres_the_cave
														++ ~Vielleicht.~ + wheres_the_cave
														END
														
															IF ~~ THEN BEGIN wheres_the_cave
															SAY ~Die Höhle ist gleich da die Straße entlang, im Westen!~
															IF ~~ THEN EXTERN ~AC#S#GI1~ cave_east
															END
															
																IF ~~ THEN BEGIN cave_east_02
																SAY ~Meinte ich ja. Also die Höhle ist im Osten.~
																IF ~~ THEN + book_reward
																END
																
																	IF ~~ THEN BEGIN book_reward
																	SAY ~Ihr seid so nett, dass Ihr mir meinen Drachen wiederholt! Wisst Ihr was? Als Belohnung erzähle ich Euch dann eine Geschichte über den ersten Drachentöter Faeruns!~
																	++ ~Gut. Ich werde in diese Höhle gehen, das Blättermonster erschlagen und Deinen Drachen wiederbeschaffen.~ + timora_01
																	END
														
																			IF ~~ THEN BEGIN timora_01
																			SAY ~Vielen Dank, <PRO_LADYLORD>! Ich werde ein Gebet an Timora schicken, dass Euch das Monster nicht auffrisst!~
																			IF ~~ THEN EXTERN ~AC#S#GI1~ timora_02
																			END
																			
																			IF ~~ THEN BEGIN timora_03
																			SAY ~Dann eben an Tymora, Du dumme Lamia! Und Euch viel Glück bei diesem Abenteuer, <PRO_LADYLORD>!~
																			IF ~~ THEN DO ~SetGlobal("AC#EndrikQuest","ACIL04",1)
																			SetGlobal("AC#DragonToy","GLOBAL",1)
																			AddJournalEntry(@20400,QUEST)
																			~ EXIT
																			END	
																			
IF ~True()~ THEN BEGIN hello_true
SAY  ~Wenn ich groß bin werde ich ein echter Abenteurer und Drachentöter!~  
IF ~~ THEN EXIT
END																			

// Old Start: Book before Dragon figurine
/*
IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_01
SAY  ~Seid Ihr ein echter Abenteurer, <PRO_LADYLORD>?~  
++ ~Ja, das bin ich.~ + 3
END
*/

IF ~~ THEN BEGIN 3
SAY ~Oh, das ist toll! Ich werde auch einmal ein berühmter Abenteurer werden! Sagt, habt Ihr schon einmal einen Drachen erschlagen?~
++ ~Warum fragst Du?~ + why_slay_dragon
++ ~Nein, das habe ich bis jetzt noch nicht.~ + why_slay_dragon
++ ~Natürlich habe ich schon Drachen erschlagen! Sonst wäre ich doch kein echter Abenteurer, oder?~ + why_slay_dragon
END

	IF ~~ THEN BEGIN why_slay_dragon
	SAY ~Also, wenn ich einmal groß bin, werde ich der berühmteste Drachentöter nach Tethir werden!~
	++ ~Was meinst Du mit Tethir, Kind?~ + what_tethir
	++ ~Du meinst doch eher, dass Du der berühmteste Drachentöter *in* Tethyr werden willst, oder?~ + what_tethir
	++ ~Wir sind doch hier in Amn und nicht in Tethyr, oder?~ + amn_not_tethyr
	END
	
		IF ~~ THEN BEGIN amn_not_tethyr
		SAY ~Ich weiß wohl, dass wir hier in Amn und nicht in Tethyr sind, <PRO_LADYLORD>!~
		IF ~~ THEN + what_tethir
		END
		
			IF ~~ THEN BEGIN what_tethir
			SAY ~Ich meine ja auch nicht das Land Tethyr, sondern den Drachentöter *Tethir*, nach dem das Land benannt ist! Das steht nämlich alles in meinem Buch!~
			++ ~Du kannst lesen, Kind?~ + read
			++ ~Was ist das für ein Buch, von dem Du sprichst?~ + what_book
			END
			
				IF ~~ THEN BEGIN read
				SAY ~Natürlich kann ich lesen! Ihr etwa nicht, <PRO_LADYLORD>?~
				++ ~Selbstverständlich kann ich lesen.~ + what_book
				++ ~Was ist das für ein Buch, von dem Du sprichst?~ + what_book
				END
				
					IF ~~ THEN BEGIN what_book
					SAY ~Mein Buch erzählt die Geschichte von Tethir, dem ersten Drachentöter. Ich habe es schon zwanzig und ein Mal gelesen!~
					++ ~Dürfte ich einmal einen Blick in Dein Buch werfen?~ + look_into_book
					END
					
						IF ~~ THEN BEGIN look_into_book
						SAY ~Natürlich! Eigentlich kann ich es auch schon auswendig.~
						IF ~~ THEN + give_book
						END
						
							IF ~~ THEN BEGIN give_book
							SAY ~Ich habe es Kramklax immer vorgelesen, als er noch bei mir war.~
							++ ~Wer ist das denn schon wieder?~ + who_is_toy
							END
							
							IF ~~ THEN BEGIN who_is_toy
							SAY ~Mein Drache!~
							IF ~~ THEN + exit
							END
	

IF ~~ THEN BEGIN exit
SAY ~Wie Ihr meint. Gehabt Euch wohl, <PRO_LADYLORD>!~
   IF ~~ THEN EXIT
END

/*******************************************************************************************************
Dialog Girl in ACIL04
*******************************************************************************************************/

BEGIN ~AC#S#GI1~

IF ~True()~ THEN BEGIN hello_dumbass
SAY ~Ihr seid genauso doof wie mein Bruder!~
IF ~~ THEN EXIT
IF ~IsValidForPartyDialog("Minsc")
Global("MinscGirl","ACIL04",0)~ THEN EXTERN ~MINSCJ~ minsk_boo_girl 
END

	IF ~~ THEN BEGIN girl_minsk_hamster
	SAY ~Hamster sind auch doof! Ich hatte mal einen, und der hat sooo viel gefressen, bis er geplatzt ist!~
	IF ~~ THEN DO ~SetGlobal("MinscGirl","ACIL04",1)~ EXIT 
	END

	IF ~~ THEN BEGIN not_a_real_dragon
	SAY ~Jeder weiß doch, dass das nur eine von Vater geschnitzte Drachenfigur war, Du alter Angeber!~
	IF ~~ THEN EXTERN ~AC#S#BY1~ dragonfigurine_gone
	END
	
		IF ~~ THEN BEGIN dragonfigurine_gone_02
		SAY ~War sie doch!~
		IF ~~ THEN EXTERN ~AC#S#BY1~ dragonfigurine_gone_03
		END
		
			IF ~~ THEN BEGIN dragonfigurine_gone_04
			SAY ~Naja, ist ja eh' egal, hast sie ja vor Kurzem beim Spielen verloren!~
			IF ~~ THEN EXTERN ~AC#S#BY1~ dragonfigurine_lost_01
			END
			
				IF ~~ THEN BEGIN dragonfigurine_lost_02
				SAY ~Pah! Das glaubt Dir kein Ork! Du bist so ein schlechter Lügner, Endrik!~
				IF ~~ THEN EXTERN ~AC#S#BY1~ dragonfigurine_lost_03
				END
				
				IF ~~ THEN BEGIN not_go_to_cave
				SAY ~Du weißt genau, dass Du da nicht reingehen darfst, Endrik!~
				IF ~~ THEN EXTERN ~AC#S#BY1~ not_go_to_cave_02
				END
				
					IF ~~ THEN BEGIN moving_leaves_02
					SAY ~Siehst Du, Endrik? Nicht mal <PRO_HESHE> glaubt Dir die Geschichte!~
					IF ~~ THEN EXTERN ~AC#S#BY1~ moving_leaves_03
					END
					
					IF ~~ THEN BEGIN cave_east
					SAY ~Im Osten, Endrik! Die Höhle ist im Osten. Da, wo die Sonne aufgeht.~
					IF ~~ THEN EXTERN ~AC#S#BY1~ cave_east_02
					END
					
					IF ~~ THEN BEGIN timora_02
					SAY ~Die Göttin heißt Tymora, Endrik.~
					IF ~~ THEN EXTERN ~AC#S#BY1~ timora_03
					END
					
					IF ~~ THEN BEGIN no_monster_there
					SAY ~Ha! Da hast Du es, Endrik! Du bist vor einem Haufen Blätter davongerannt.~
					IF ~~ THEN EXTERN ~AC#S#BY1~ no_monster_there_02
					END
					
					IF ~~ THEN BEGIN shmound
					SAY ~EIN WATSCHELNDER KOMPOSTHAUFEN? Was soll das denn für ein komisches Monster sein?~
					IF ~~ THEN EXTERN ~AC#S#BY1~ shmound_02
					END
					
					IF ~~ THEN BEGIN no_monster_there_03
					SAY ~Siehst Du, Endrik! Du bist einfach noch zu klein für so etwas.~
					IF ~~ THEN EXTERN ~AC#S#BY1~ no_monster_there_04
					END
					
					
/*******************************************************************************************************
Dialog Mother in ACIL04
*******************************************************************************************************/

BEGIN ~AC#S#04F~			

IF ~True()~ THEN BEGIN hello
SAY ~Mein Sohn hat eine blühende Fantasie. Naja, solange er uns dennoch bei der Arbeit auf unserem Hof hilft, ist dagegen nichts einzuwenden.~
IF ~~ THEN EXIT
END

	IF ~~ THEN BEGIN mother_pc_other_things_todo
	SAY ~Ich denke, diese Abenteurer haben Wichtigeres zu tun, als Dir Dein verlorenes Spielzeug wiederzubringen, Endrik.~
	++ ~Ach, das ist schon in Ordnung.~ EXTERN ~AC#S#BY1~ retrieve_toy_01
	++ ~Da habt Ihr Recht, gute Frau.~ EXTERN ~AC#S#BY1~ retrieve_toy_01
	END	
	
	IF ~~ THEN BEGIN father_makes_new_one
	SAY ~Ich bin mir sicher, dass Vater Dir einen neuen bauen wird, wenn Du ihn fragst.~
	IF ~~ THEN EXTERN ~AC#S#BY1~ father_makes_new_one_02
	END
	
	IF ~~ THEN BEGIN mother_book
	SAY ~Mein Mann hatte ihm das Buch einst von einem Händler aus Athkatla mitgebracht. Der Junge ist seitdem ganz versessen darauf, dem Helden in der Fabel nachzueifern.~
	IF ~~ THEN EXTERN ~AC#S#BY1~ mother_book_02
	END

	IF ~~ THEN BEGIN mother_book_03
	SAY ~Endrik, Du hast dieses Buch doch schon so oft gelesen. Willst Du es nicht diesem Abenteurer schenken? Schließlich hat <PRO_HESHE> Dir Deinen Drachen zurückgebracht.~
	IF ~~ THEN EXTERN ~AC#S#BY1~ give_book_pc
	END	

/*******************************************************************************************************
Dialog Father in ACIL04
*******************************************************************************************************/

BEGIN ~AC#S#04M~			

IF ~True()~ THEN BEGIN hello
SAY ~Hier draußen haben wir unsere Ruhe. In Städten wie Athkatla oder Eshpurta gute Arbeit zu finden ist fast unmöglich, und hier können wir uns wenigstens selbst versorgen, auch wenn es für nicht viel mehr als zum Leben reicht.~
IF ~~ THEN EXIT
END	

/*******************************************************************************************************
Dialogue Merchant in distress in ACIL04
*******************************************************************************************************/

BEGIN ~AC#04MCH~
	
IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_help
SAY  ~Hilfe! Mein eigener Leibwächter greift mich an!~  
IF ~~ THEN DO ~SetGlobal("AttackMerchant","ACIL04",1)
ActionOverride("AC#04GUA",Enemy())
ActionOverride("AC#04GUA",AttackReevaluate("AC#04MCH",30))~ EXIT
END

IF ~!Dead("AC#04GUA")~ THEN BEGIN hello_please_kill_guard
SAY  ~Würdet Ihr vielleicht erst meinen ... ehemaligen Leibwächter töten, bevor er mich tötet?~  
IF ~~ THEN EXIT
END

IF ~Dead("AC#04GUA")~ THEN BEGIN hello_guard_dead
SAY  ~Danke, dass Ihr mich gerettet habt! Ich weiß nicht, was in diesen Menschen gefahren ist, dass er begann, mich plötzlich anzugreifen. Er hatte noch diesen Goblin erschlagen, der hier herumlungerte, und dann ist er auf mich losgegangen! Ich hatte ihn extra in Athkatla angeheuert, damit er mich auf meinem Weg nach Eshpurta beschützt. Sogar einen Helm habe ich ihm gekauft, damit er nicht von einem meiner Konkurrenten bestochen werden kann! Und dann so etwas.~  
IF ~PartyHasItemIdentified("AC#PLAT4")~ THEN REPLY ~Es lag nicht am Helm, sondern an der Rüstung.~ + not_helm_but_armor
++ ~Ich habe Euch aber nicht umsonst gerettet.~ + reward
++ ~Gern geschehen.~ + reward
END

	IF ~~ THEN BEGIN reward
	SAY ~Ach ja, die Belohnung... natürlich. Hier habt Ihr alle Goldmünzen, die ich gerade bei mir trage. Und jetzt gehabt Euch wohl, denn ich werde jetzt schleunigst alleine meine Reise fortsetzen.~
	IF ~~ THEN DO ~GiveGoldForce(800)
	SetGlobal("AttackMerchant","ACIL04",10) 
	EscapeArea()~ EXIT
	END
	
	IF ~~ THEN BEGIN not_helm_but_armor
	SAY ~Oh, verflucht! Nun, wie dem auch sei. Hier habt Ihr alle Goldmünzen, die ich gerade bei mir trage. Und jetzt gehabt Euch wohl, denn ich werde jetzt schleunigst alleine meine Reise fortsetzen.~
	IF ~~ THEN DO ~GiveGoldForce(800)
	SetGlobal("AttackMerchant","ACIL04",10) 
	EscapeArea()~ EXIT
	END
	
				
/*******************************************************************************************************
Dialogue peasant Onnor in ACIL04
*******************************************************************************************************/

BEGIN ~AC#IL04O~

IF ~Global("TalkedToOnnor","ACIL04",1)~ THEN BEGIN hello_again
SAY ~Hallo! Möge Chauntea heute auf Euch herabscheinen.~
IF ~~ THEN EXIT 
END

IF ~True()~ THEN BEGIN hello
SAY ~Seid gegrüßt, <RACE>! Möge Chauntea heute auf Euch herabscheinen.~
IF ~~ THEN REPLY ~Das wünsche ich Euch auch.~ GOTO bye
IF ~Global("AC#IltkazarQuest#2","GLOBAL",2)
Global("TalkedToOnnor","ACIL04",0)~ THEN REPLY ~Ich suche nach einem Elfen, der vor Kurzem früh morgens aus der Taverne aufgebrochen sein müsste. Wisst Ihr, wohin er gegangen ist?~ + missing_elf
END	

	IF ~~ THEN BEGIN missing_elf
	SAY ~Ein Elf? Ja, den habe ich gesehen. Unfreundlicher Kerl! Er hat die Straße in Richtung Eshpurta genommen. Ich habe ihn noch gefragt, ob er für seine Reise etwas Proviant haben möchte. Da hat er nur geschnaubt und meinte, so weit wäre seine Reise auch nicht! Er fragte mich, wie weit es zu dem alten Steinbruch wäre.~
	IF ~~ THEN REPLY ~Ein Steinbruch?~ GOTO quarry
	END
	
		IF ~~ THEN BEGIN quarry
		SAY ~Ja, etwa eine Wegstunde von hier entfernt im Osten. Der Granit wurde früher dazu verwendet, die Stadtmauern Keczullas zu verstärken erzählt man sich. Jetzt ist er aber schon lange Zeit verlassen.~
		IF ~~ THEN REPLY ~Dann werde ich dort einmal nach dem Elfen suchen. Danke.~ GOTO elf_bye
		END
		
		IF ~~ THEN BEGIN elf_bye
					SAY ~Gern geschehen. Aber dort gibt es wirklich nicht viel zu sehen.~
					IF ~~ THEN DO ~SetGlobal("TalkedToOnnor","ACIL04",1)
					SetGlobal("AC#IltkazarQuest#2","GLOBAL",3)
					RevealAreaOnMap("ACIL4M")
					AddJournalEntry(@20066,QUEST)~ EXIT 
					END

IF ~~ THEN BEGIN bye
SAY ~Nun denn.~
IF ~~ THEN EXIT
END


// Anomen
APPEND ~ANOMENJ~
IF ~~ THEN BEGIN Anomen_gives_orders
   SAY ~Eine Gruppe Wegelagerer hatte die Axtbrücke besetzt. Ich und meine Gefährten haben sie beseitigt und das Gebiet gesichert. Eure Aufgabe, Soldat, ist es, die Straße wieder passierbar zu machen. Und löscht die Flammen! Irgendjemand hat dort ein Feuer gelegt.~
   IF ~~ THEN REPLY ~Ich hätte es selbst nicht besser sagen können...~ EXTERN ~AC#04AG1~ Anomen_gives_orders_02
   IF ~~ THEN REPLY ~So ist es gewesen.~ EXTERN ~AC#04AG1~ Anomen_gives_orders_02
END
END

// Nalia
APPEND ~NALIAJ~
IF ~~ THEN BEGIN Nalia_amn_guards
   SAY ~Endlich sind unsere Soldaten einmal zu etwas Nütze.~
   IF ~~ THEN EXTERN ~AC#04AG1~ bye
END
END

// Minsk
APPEND ~MINSCJ~
IF  ~~ THEN BEGIN minsk_boo_girl
   SAY ~Sieh mal her, Mädchen, ich habe hier einen schlauen Hamster!~
   IF ~~ THEN EXTERN ~AC#S#GI1~ girl_minsk_hamster
END
END
