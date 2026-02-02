
/*******************************************************************************************************
Dialog mit Drow-Guard
*******************************************************************************************************/

BEGIN ~AC#24DR2~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
SAY ~Ihr seid ein *colnbluth*! Redet besser schnell mit unserem Anführer Daevion'lyr, wenn Ihr am Leben bleiben wollt!~
IF ~~ THEN EXIT
END

IF ~True()~ THEN BEGIN hello_1
SAY ~Mit Euch habe ich nichts zu schaffen, *colnbluth*!~
IF ~~ THEN EXIT
END

/*******************************************************************************************************
Dialog mit Drow-Guard 1
*******************************************************************************************************/

BEGIN ~AC#24DR1~

IF ~True()~ THEN BEGIN hello_1
SAY ~Mit Euch habe ich nichts zu schaffen, *colnbluth*!~
IF ~~ THEN EXIT
END

/*******************************************************************************************************
Dialog mit Drow-Magier, der getötet wird
*******************************************************************************************************/

BEGIN ~AC#24DR9~


/*******************************************************************************************************
Dialog mit Drow Vhaerauns-Anführer
*******************************************************************************************************/

BEGIN ~AC#24DAE~

IF ~Dead("AC#DROW6")~ THEN BEGIN hello_traitor_dead_lolth
SAY ~Ihr wart so töricht, Euch gegen meinen PLan zu stellen und habt die Priesterin Lolths getötet, *og'elend*! Unsere Vereinbarung ist hinfällig, und wir werden Euch dem Zorn Vhaerauns aussetzen, bevor wir von hier weiterziehen werden!~
IF ~~ THEN DO ~SetGlobal("Drowfight","ACIL24",1)
SetGlobal("AC#25_LolthPriestess","GLOBAL",10)
SetGlobal("AC#25PactLolthPriestess","GLOBAL",3)
Enemy()~ EXIT
END

IF ~Global("AC#25PactLolthPriestess","GLOBAL",2)~ THEN BEGIN hello_traitor_pact_lolth
SAY ~Denkt Ihr, ich weiß nicht längst, was Ihr vorhabt, *og'elend*? Meine Späher haben mir bereits von Eurem Verrat berichtet, welcher Euch teuer zu stehen kommen wird!~
IF ~~ THEN DO ~SetGlobal("Drowfight","ACIL24",1)
SetGlobal("AC#25_LolthPriestess","GLOBAL",10)
SetGlobal("AC#25PactLolthPriestess","GLOBAL",3)
Enemy()~ EXIT
END

IF ~GlobalGT("AC#25_LolthPriestess","GLOBAL",0)~ THEN BEGIN whats_up_with_priestess
SAY ~Na was ist? Habt Ihr das Lolth-Kälbchen schon überzeugen können?~
IF ~~ THEN REPLY ~Noch nicht, aber ich arbeite daran.~ + not_finished_yet
IF ~~ THEN REPLY ~Ich habe stattdessen beschlossen, Euch Drow-Abschaum auszurotten.~ + i_will_kill_you
IF ~Global("AC#25_LolthPriestess","GLOBAL",3)~ THEN REPLY ~Ja, die Priesterin Zilna ist wieder verschwunden und glaubt, dass die Magier sich hier eingenistet hatten.~ + yes_finished
END

	IF ~~ THEN BEGIN not_finished_yet
	SAY ~Ihr solltet Euch besser beeilen. Wenn die Priesterin hier auftaucht, ist es mit unserer Abmachung vorbei.~
	IF ~~ THEN EXIT
	END
	
	IF ~~ THEN BEGIN yes_finished
	SAY ~Spricht <HESHE> die Wahrheit, Qall?~
	IF ~~ THEN EXTERN ~AC#24MDF~ speaks_the_truth
	END
	
		IF ~~ THEN BEGIN job_finished
		SAY ~Gut. Dann zu meinem Teil der Vereinbarung. Ich hatte den Tempel im Norden der Schächte erwähnt. Nach allem, was ich weiß, wird dieser Ort "Halle des Blutmondes" genannt. Der Magier hat diesen Zwergentempel im Norden vor einiger Zeit betreten. Dies geht nur mit dem richtigen Passwort. Eine alte Zwergenstatue wird Euch nach diesem Wort fragen, welches bei den Zwergen Iltkazars sicher längst in Vergessenheit geraten ist.~
		=
		~Da dies ein alter Tempel Clangeddins ist, ist der erste Teil "Clangeddin", dieser schwächliche Zwergengott der Schlachten.~
		=
		~Das zweite ist etwas kniffliger. Allem Anschein nach war dies ein gemeinsamer Tempel der Zwerge und Menschen. Ihr müsst den Namen dieser Oberflächen-Göttin des Mondes aussprechen, wie war noch gleich ihr Name...~
		IF ~~ THEN REPLY ~Chauntea?~ + nope
		IF ~~ THEN REPLY ~Mielikki?~ + nope
		IF ~~ THEN REPLY ~Sune?~ + nope
		IF ~~ THEN REPLY ~Selune?~ + selune
		IF ~~ THEN REPLY ~Shar?~ + nope
		END
		
		IF ~~ THEN BEGIN nope
		SAY ~Nein, das war er nicht. Kennt Ihr Euch denn so wenig in der Mythologie der Oberfläche aus? Kein Wunder, dass Ihr Euch hier unten herumtreibt. Fallen Euch noch weitere Namen ein?~
		IF ~~ THEN REPLY ~Chauntea?~ + nope_02
		IF ~~ THEN REPLY ~Mielikki?~ + nope_02
		IF ~~ THEN REPLY ~Sune?~ + nope_02
		IF ~~ THEN REPLY ~Selune?~ + selune
		IF ~~ THEN REPLY ~Shar?~ + nope_02
		END
		
			IF ~~ THEN BEGIN nope_02
			SAY ~Wieder falsch. Bei dem maskierten Herrn, das kann doch nicht so schwer sein für einen <PRO_RACE> wie Euch!~
			IF ~~ THEN REPLY ~Chauntea?~ + nope_02
			IF ~~ THEN REPLY ~Mielikki?~ + nope_02
			IF ~~ THEN REPLY ~Sune?~ + nope_02
			IF ~~ THEN REPLY ~Selune?~ + selune
			IF ~~ THEN REPLY ~Shar?~ + nope_02
			END
			
		IF ~~ THEN BEGIN selune
		SAY ~Selune! Das war es! Mit diesen beiden Worten sollte sich die Türe öffnen.~
		IF ~~ THEN REPLY ~Ich muss also einfach nur den Namen Clangeddins und Selunes sagen und schon öffnet sich die Tür?~ + just_say_names
		END
		
			IF ~~ THEN BEGIN just_say_names
			SAY ~Schmückt es noch ein bisschen aus, fuchtelt mit den Händen umher- was auch immer Ihr für richtig haltet. So hat jedenfalls dieser Magier Ellhimar die uralte Tür geöffnet. Eine letzte Warnung noch: Auf diesem Tempel liegt ein Fluch.~
			IF ~~ THEN REPLY ~Wie bitte? Das sagt Ihr mir erst jetzt?~ + a_curse_01
			END
			
				IF ~~ THEN BEGIN a_curse_01
				SAY ~Kein besonders schlimmer Fluch- zumindest für uns nicht. Jeder, der den Tempel betritt, wird von übernatürlicher Müdigkeit betroffen und fällt in einen tiefen Schlaf. Daran ist auch Euer Vorgänger kläglich gescheitert.~
				IF ~~ THEN REPLY ~Müdigkeit? Könnte es sein, dass dies mit dem Schlaf des Königs zu tun?~ GOTO a_curse_02
				END
				
					IF ~~ THEN BEGIN a_curse_02
					SAY ~Ich denke nicht. Der Zauber des Tempels ist alt, viel älter als der älteste Zwerg. Nach allem, was wir wissen, war auch dieser König Mith Barak vor langer Zeit in diesem Tempel, hat ihn aber wieder unbehelligt verlassen. Sonst würde er jetzt nicht auf seinem Thron in der Zwergenstadt sitzen. Deshalb denke ich nicht, dass dieser Zauber etwas mit dem Schlaf zu tun hat - jedenfalls nicht direkt. Dieser Magier Ellhimar war jedoch überzeugt davon, dass der Zwergenkönig in diesem Tempel etwas versteckt haben könnte. Jedenfalls faselte er so etwas, bevor wir ihn den Illithiden übergaben.~
					IF ~~ THEN REPLY ~Könntet Ihr mir nicht helfen, Ellhimar wieder aus der Gewalt der Illithiden zurückzubekommen?~ GOTO bring_ellhimar_back_to_sanity
					END

				IF ~~ THEN BEGIN bring_ellhimar_back_to_sanity
				SAY ~Macht Ihr Witze? Die Illithiden lassen niemanden mehr gehen. Niemals. Ich rede hier schon viel zu viel. Genug davon. Los Männer, wir gehen weiter. Jeder pinkelt Lolth noch einmal ins Gesicht und dann ziehen wir los!~
				IF ~~ THEN REPLY ~Ihr bleibt nicht hier?~ + stay_here
				END
				
					IF ~~ THEN BEGIN stay_here
					SAY ~Hier? In diesem Drecksloch? Nein, mein *abbil*. Uns zieht es an die Oberfläche. Es wird Zeit, dass die Drow erneut die oberen Lande beherrschen! Nun, da uns die Häuser Guallidurths nicht mehr verfolgen, können wir uns dort mit den anderen gleichen Glaubens, die schon oben sind, ein großes Reich erobern.~
					=
					~Abmarsch! Und lasst nichts als *araj* an diesem *yath* zurück!~
					IF ~~ THEN DO ~
					SetGlobal("AC#25_LolthPriestess","GLOBAL",10)
					SetGlobal("VhaeraunLeaves","ACIL24",10)
					SetGlobal("AC#25_Bloodmoon","GLOBAL",1)
					EraseJournalEntry(@62026)
					AddJournalEntry(@62027,QUEST_DONE)
					AddJournalEntry(@23000,QUEST)
					CreateVisualEffectObject("SPDIMNDR",Myself)
					Wait(1)
					DestroySelf()~ EXIT
					END


IF ~Global("VhaeraunKillDrow","ACIL24",4)~ THEN BEGIN heres_your_dead_drow
SAY ~Hier habt Ihr Euren toten Drow.~
IF ~~ THEN REPLY ~Ihr habt gerade eine Eurer Leute umgebracht?~ + killed_one_of_your_people
END

	IF ~~ THEN BEGIN killed_one_of_your_people
	SAY ~Das? Das war Malagzmyr, ein Drow-Magier aus Sshamath. Die Magier dieser Stadt haben mit uns kooperiert. Ihr habt mit Caraf'nir einen ihrer Erzmagier umgebracht. Nun könnt Ihr Euch auch die Leiche seines Lehrlings genauer ansehen.~
	=
	~Die Magier dort geben ihren Lehrlingen immer ein Amulett, das ihre Magieresistenz senkt. Das Wissens darum hat mir gerade sehr zum Vorteil gereicht.~
	=
	~Hier ist seine Leiche.~
	IF ~~ THEN DO ~GiveItemCreate("AC#DDRO2",Player1,1,0,0)~
	GOTO go_seek_drow_priestess
	END
	
	IF ~~ THEN BEGIN go_seek_drow_priestess
		SAY ~Sucht die Lolth-Priesterin und übergebt ihr Malagzmyrs Leiche. Sie wird ihn anhand seiner Tätowierungen zweifelsfrei als Magier aus der Stadt der dunklen Gewebe identifizieren und denken, dass die Magier Sshamaths hinter den Aktivitäten der Dunkelelfen hier stecken.~
		=
		~Tötet sie keinesfalls, sondern lasst sie von dannen ziehen. Wenn sie fort ist, kehrt zu mir zurück, dann werde ich meinen Teil der Abmachung einhalten.~
		IF ~~ THEN DO ~
		SetGlobal("VhaeraunKillDrow","ACIL24",5)
		SetGlobal("AC#25_LolthPriestess","GLOBAL",1)
		EraseJournalEntry(@62022)
		AddJournalEntry(@62025,QUEST)~ EXIT
		END
	
IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY ~Ein *colnbluth* in unseren Hallen! Das kann ja nur bedeuten, dass mich Eure *haszakkin*-Freunde verraten haben, Qall.~
IF ~~ THEN EXTERN ~AC#24MDF~ or_your_friend
END

	IF ~~ THEN BEGIN whatsoever
	SAY ~Wie dem auch sei, Fremde. Ihr seid ganz offensichtlich hierher gekommen, weil Ihr nach mir gesucht habt. Was wollt Ihr hier?~
	IF ~~ THEN REPLY ~Was für ein Spiel treibt Ihr hier, Drow?~ + what_game
	IF ~~ THEN REPLY ~Sagt mir zuerst, was *Ihr* hier zu suchen habt!~ + narbondel
	IF ~~ THEN REPLY ~Ich suche nach der Ursache für den schlafenden König Iltkazars.~ + straight_to_the_point
	IF ~~ THEN REPLY ~Ihr habt den Drow-Magier in Iltkazar spionieren lassen!~ + 4
	END
	
		IF ~~ THEN BEGIN what_game
		SAY ~Spiel? Das beliebteste Spiel im ganzen Unterreich, es heißt "Wissen ist Macht".~
		IF ~~ THEN + narbondel
		END

		IF ~~ THEN BEGIN narbondel
		SAY ~Ich sehe, Ihr seid nicht der hellste Kristall am Narbondel. Also gut, ich schlage Euch einen Tausch vor.~
		IF ~~ THEN REPLY ~Lasst mich raten: Ich soll Euch etwas verraten, was Ihr begehrt, und Ihr verratet mir dafür eines Eurer Geheimnisse.~ + exchange_secrets
		IF ~~ THEN REPLY ~Was für ein Tausch soll das sein?~ + exchange_secrets
		END

			IF ~~ THEN BEGIN exchange_secrets
			SAY ~Das wäre das Naheliegendste, gewiss. Nein, ich schlage Euch etwas anderes vor.~ 
			IF ~~ THEN + exchange_secrets_02
			END
						
			IF ~~ THEN BEGIN exchange_secrets_02
			SAY ~Ich verrate Euch, warum *Ihr* hier seid. Und *Ihr* sagt mir, warum *ich* hier bin.~
			IF ~~ THEN REPLY ~Was für einen Sinn soll das denn haben?~ + what_sense
			IF ~~ THEN REPLY ~Dann los, heraus mit der Sprache.~ + straight_to_the_point
			IF ~~ THEN REPLY ~Nun gut.~ + what_sense
			END
			
				IF ~~ THEN BEGIN what_sense
				SAY ~Ihr werdet schon sehen. Zu wissen, was man sucht, ist schon die Hälfte der ganzen Jagd.~
				IF ~~ THEN + 3
				END
				
					IF ~~ THEN BEGIN straight_to_the_point
					SAY ~Ihr kommt gleich zur Sache. Das gefällt mir. Nun gut.~
					IF ~~ THEN + 3
					END
				
					IF ~~ THEN BEGIN 3
					SAY ~Ihr kommt von der Oberfläche und wollt den Zwergen helfen, ihren versteinerten König zu befreien. Ihr habt meinen Kontaktmann in Iltkazar, Caraf'nir, überführt.~
					IF ~~ THEN REPLY ~Ihr habt diesen Drow dort anstelle des Magiers platziert!~ + 4
					END
					
						IF ~~ THEN BEGIN 4
						SAY ~Und Ihr habt ihn getötet. Wisst Ihr, es ist nicht leicht, solch mächtige Drowmagier zu rekrutieren. Noch dazu muss ich mir jetzt überlegen, wie ich sein Ableben den *jabbuk* erklären soll.~
						=
						~Aber das tut nichts zur Sache. Ich denke, Ihr seid aus dem selben Grunde hier, weshalb dieser *faern* hier war. Wie war noch gleich sein Name - Ellhimar?~
						IF ~~ THEN REPLY ~Ellhimar war bei Euch?~ + 5
						END
						
							IF ~~ THEN BEGIN 5
							SAY ~Nicht direkt bei uns. Er suchte wohl auch nach einer Möglichkeit, diesem Mith Barak zu helfen. Seid Ihr an diesem alten Zwergentempel im Norden vorbeigekommen? Die Magie im Inneren ist ihm wohl nicht besonders gut bekommen. Dort haben wir ihn gefunden.~
							=
							~Ich weiß, wann sich mir eine unbezahlbare Gelegenheit bietet, und so habe ich diesen Magier den Freunden Qalls übergeben, nicht wahr, mein *abbil*?~
							IF ~~ THEN REPLY ~Ihr habt Ellhimar den Illithiden ausgeliefert.~ EXTERN ~AC#24MDF~ also_interest
							END
							
								/*
								IF ~~ THEN BEGIN 6
								SAY ~Ihr kommt von der Oberfläche und wollt den Zwergen helfen, ihren versteinerten König zu befreien. Ihr habt meinen Kontaktmann in Iltkazar, Caraf'nir, überführt.~
								IF ~~ THEN REPLY ~Ihr habt diesen Drow dort anstelle des Magiers platziert!~ + 6
								END
								*/
								
									IF ~~ THEN BEGIN power
									SAY ~Die Macht im Unterreich ist ein fragiles Gleichgewicht. Jede Verschiebung könnte sich zu unseren Ungunsten auswirken.~
									IF ~~ THEN REPLY ~Und das möchten die Priesterinnen Lolths natürlich nicht.~ + lolth_has_no_power
									IF ~~ THEN REPLY ~Ihr und Eure verdammte Spinnenkönigin mischen sich aber auch überall ein.~ + lolth_has_no_power
									IF ~~ THEN REPLY ~Und welcher Macht dient Ihr?~ + vhaeraun_flag
									END
									
										IF ~~ THEN BEGIN lolth_has_no_power
										SAY ~Lolth? Sie hat hier schon lange keine Macht mehr. Seht ihr ihre Statue auf der anderen Plattform zu meiner Linken? Sie stellte Lolth dar. Es war mir eine Freude, ihr den Kopf abzuschlagen. Wisst Ihr, was ich jeden Tag an der Statue als Erstes mache, nachdem ich gut gegessen habe?~
										IF ~~ THEN REPLY ~Das möchte ich mir lieber nicht vorstellen.~ + vhaeraun_flag
										IF ~IsValidForPartyDialog("Korgan")~ THEN EXTERN ~KORGANJ~ Korgan_lolth_statue
										END
										
											IF ~~ THEN BEGIN vhaeraun_flag
											SAY ~Seht Ihr die Banner hinter mir? Erkennt Ihr das Symbol?~											
											IF ~~ THEN REPLY ~Nein.~ + vhaeraun_flag_02
											IF ~~ THEN REPLY ~Ich bin mir nicht sicher.~ + vhaeraun_flag_02
											IF ~CheckStatGT(Player1,80,LORE)~ THEN REPLY ~Ich denke, ich habe solche Symbole bereits in meinen Studien in Kerzenburg gesehen. Sie gehören zur Drow-Gottheit Vhaeraun.~ + vhaeraun_flag_02
											IF ~IsValidForPartyDialog("Viconia")~ THEN EXTERN ~VICONIJ~ viconia_vhaeraun
											END
											
													IF ~~ THEN BEGIN viconia_vhaeraun_02
													SAY ~Was für ein kluges Mädchen Ihr da in Eurer Gruppe habt! Das ist richtig. Jeder gute Sohn würde versuchen, früher oder später seine Mutter zu töten. Unser Gott ist die beste Wahl für unser Geschlecht.~
													IF ~~ THEN GOTO vhaeraun_flag_02
													END
											
												IF ~~ THEN BEGIN vhaeraun_flag_02
												SAY ~Wir sind treue Diener Vhaerauns, unseres Herrn des Schattens. Die Priesterinnen der Spinnenkönigign würden uns gerne tot sehen, und so müssen wir uns nach neuen Verbündeten umsehen.~
												IF ~~ THEN + tell_about_me
												END
												
													IF ~~ THEN BEGIN tell_about_me
													SAY ~Ich merke, ich komme ins Plaudern. Dabei wäre das doch Euer Teil gewesen, <PRO_RACE>!~
													IF ~~ THEN REPLY ~Ihr seid also hier, weil Ihr vor den Dienerinnen der Spinnenkönigen geflohen seid!~ + tell_about_me_02
													END
													
														IF ~~ THEN BEGIN tell_about_me_02
														SAY ~So würde man es an der Oberfläche nennen, ja. Wir bevorzugen den Gedanken, dass wir uns hier unsere eigene kleine Existenz aufbauen.~
														IF ~~ THEN REPLY ~Was habt Ihr mit dem schlafenden König zu tun?~ GOTO sleeping_king
														IF ~~ THEN REPLY ~Habt Ihr den König in seinen Schlaf geschickt?~ GOTO sleeping_king
														END
														
															IF ~~ THEN BEGIN sleeping_king
															SAY ~Ach ja, dieser König Mith Barak. Seid versichert: Wir tappen bei dem Ursprung seines mysteriösen Schlafes genau so im Dunkeln wie Ihr. Allerdings haben wir - im Gegensatz zu Euch - auch nie ernsthaft versucht, es herauszufinden.~
															IF ~~ THEN REPLY ~Ich bin es langsam leid, einen Ort nach dem anderen im Unterreich abzuklappern, ohne eine Ursache für den schlafenden König zu finden!~ GOTO done_have_enough
															IF ~~ THEN REPLY ~Warum habt Ihr die Zwergenstadt dann ausspioniert?~ + all_clear
															END
															
																IF ~~ THEN BEGIN done_have_enough
																SAY ~Mitleid könnt Ihr hier nicht erwarten. Nicht von mir, nicht von den Haszakkin - auch nicht von den Zwergen.~
																IF ~~ THEN REPLY ~Warum habt Ihr die Zwergenstadt überhaupt ausspioniert?~ + all_clear
																END
														
														IF ~~ THEN BEGIN all_clear
														SAY ~Uns war nur daran gelegen, hier unsere Ruhe zu haben. Eine Ruhe, die Ihr gerade gestört habt, <PRO_RACE>!~
														IF ~~ THEN REPLY ~Jetzt ist also geklärt, warum wir beide hier sind.~ + whats_next
														END
														
															IF ~~ THEN BEGIN whats_next
															SAY ~Was uns zu der Frage bringt, was Ihr als nächstes zu tun gedenkt...~
															IF ~~ THEN REPLY ~Warum sollte ich Euch das sagen?~ + why_should_i_tell_you
															IF ~~ THEN REPLY ~Ich werde Euch töten.~ + kill_you
															END
															
																IF ~~ THEN BEGIN why_should_i_tell_you
																SAY ~Ihr wisst es nicht.~
																IF ~~ THEN REPLY ~Ich werde den Ort aufsuchen, an dem Ihr Ellhimar gefunden habt.~ + seek_place
																IF ~~ THEN REPLY ~Ich werde Euch töten.~ + kill_you
																END
																
																	IF ~~ THEN BEGIN kill_you
																	SAY ~Das wäre dumm von Euch. Ich befinde mich nämlich in der Position, dass ich Euch helfen könnte, sollte es *nicht* zu einem Kampf kommen.~
																	IF ~~ THEN + help_you
																	END
																	
																		IF ~~ THEN BEGIN help_you
																		SAY ~Ihr könntet den Ort aufsuchen, den auch dieser Menschenmagier aufgesucht hat.~
																		IF ~~ THEN REPLY ~Ihr meint den Zwergentempel, von dem Ihr gesprochen habt?~ + seek_place
																		END
																		
																			IF ~~ THEN BEGIN seek_place
																			SAY ~Dieser Zwergentempel könnte der einzige Hinweis darauf sein, was mit dem Zwergenkönig geschehen ist. Zufälligerweise weiß ich auch, wie man ihn betreten kann.~
																			IF ~~ THEN REPLY ~Und das würdet Ihr mir einfach so sagen?~ + tell_how_to_get_in
																			END
																			
																				IF ~~ THEN BEGIN tell_how_to_get_in
																				SAY ~Natürlich nicht. Erst müsst Ihr etwas für mich tun. Das ist auch der einzige Grund, warum wir hier noch miteinander reden. Qall bekommt schon ganz nervöse Tentakel.~
																				IF ~~ THEN REPLY ~Was möchtet Ihr dafür von mir haben?~ + kill_lolth_priestess 
																				IF ~~ THEN REPLY ~Ich werde einem Drow wie Euch bestimmt nicht helfen!~ + i_will_not_help_you
																				END
																				
																					IF ~~ THEN BEGIN i_will_not_help_you
																					SAY ~Viele andere Möglichkeiten habt Ihr, wenn Ihr weiterkommen wollt. Ihr solltet Euch anhören, was ich Euch vorschlage!~
																					IF ~~ THEN REPLY ~Dann lasst einmal hören.~ GOTO kill_lolth_priestess
																					IF ~~ THEN REPLY ~Ich bleibe dabei. Mit einem Drow mache ich keine Geschäfte. Zieht Eure Klinge und sterbt!~ + i_will_kill_you
																					END
																					
																					IF ~~ THEN BEGIN kill_lolth_priestess
																					SAY ~Die Zofen Lolths schicken immer wieder Späher und Priesterinnen ihrer Göttin aus, um nach so freiheitsliebenden Drow wie uns zu suchen.~
																					IF ~Dead("AC#DROW3")~ THEN REPLY ~Ich habe gerade eine Priesterin Lolths getötet.~ + already_killed_lolth_priestess 
																					IF ~!Dead("AC#DROW3")
																					GlobalGT("AC#BreskDrowPriestess","GLOBAL",4)~ THEN REPLY ~Vor Kurzem habe ich eine von ihnen am Leben gelassen.~ + not_killed_lolth_priestess 
																					IF ~~ THEN REPLY ~Was soll ich also tun?~ + what_do_about_lolth_priestess 
																					END
																					
																						IF ~~ THEN BEGIN already_killed_lolth_priestess
																						SAY ~Das hättet Ihr besser nicht tun sollen. Jetzt schnüffeln sie erst recht in dieser Gegend herum.~
																						IF ~~ THEN + task_seek_destroy
																						END
																						
																						IF ~~ THEN BEGIN not_killed_lolth_priestess
																						SAY ~Das hättet Ihr besser nicht tun sollen. Jetzt schnüffeln sie erst recht in dieser Gegend herum.~
																						IF ~~ THEN + task_seek_destroy
																						END
																						
																							IF ~~ THEN BEGIN what_do_about_lolth_priestess
																							SAY ~Also gut, passt auf.~
																							IF ~~ THEN + task_seek_destroy
																							END
																							
																								IF ~~ THEN BEGIN task_seek_destroy
																								SAY ~Meine Männer haben mir berichtet, dass die Tochter einer Mutter Oberin hier in der Nähe mit einigen Dienern herumschleicht. Sie kommt aus der Tempelstadt Guallidurth weiter im Süden.~
																								IF ~~ THEN REPLY ~Ich soll sie für Euch töten?~ + task_seek_destroy_02
																								IF ~~ THEN REPLY ~Nun gut, dann werde ich sie töten.~ + task_seek_destroy_02
																								IF ~Dead("AC#DROW3")~ THEN REPLY ~Also gut, die nächste Lolth-Priesterin, die über meine Klinge springt.~ + task_seek_destroy_02
																								END
																								
																									IF ~~ THEN BEGIN task_seek_destroy_02
																									SAY ~Nein, dann hätten wir hier ja nie unsere Ruhe. Ihr sollt sie überzeugen, dass hier keine Drow mehr sind.~
																									IF ~~ THEN REPLY ~Und wie soll ich das bitte machen?~ + how_to_convince
																									END
																									
																										IF ~~ THEN BEGIN how_to_convince
																										SAY ~Lasst sie glauben, Ihr hättet den letzten Drow getötet.~
																										IF ~~ THEN REPLY ~Und wie wollt Ihr das bewerkstelligen?~ + thats_my_part
																										IF ~~ THEN REPLY ~Klingt gut.~ + deal_lolth_priest
																										END
																										
																											IF ~~ THEN BEGIN thats_my_part
																											SAY ~Das soll meine Sorge ein.~ 
																											IF ~~ THEN REPLY ~Klingt gut.~ + deal_lolth_priest
																											END
																											
																											IF ~~ THEN BEGIN deal_lolth_priest
																											SAY ~Bevor ich Euch Näheres berichte, stelle ich Euch die entscheidende Frage: Seid Ihr mit dem Handel einverstanden?~
																											IF ~~ THEN REPLY ~Ja.~ + accept_offer
																											IF ~~ THEN REPLY ~Ich werde niemals mit einem Drow zusammenarbeiten!~ + dont_accept_offer
																											END
																											
																												IF ~~ THEN BEGIN dont_accept_offer
																												SAY ~Mit dieser Einstellung erntet Ihr sicher den Applaus eines gutherzigen Oberwelt-Gottes. Hier unten kommt Ihr mit so einer Einstellung aber nicht weiter.~
																												IF ~~ THEN REPLY ~Nun gut, was schlagt Ihr vor?~ + accept_offer
																												IF ~~ THEN REPLY ~Ich bleibe dabei. Mit einem Drow mache ich keine Geschäfte. Zieht Eure Klinge und sterbt!~ + i_will_kill_you
																												END
																												
																													IF ~~ THEN BEGIN accept_offer
																													SAY ~Also gut, hört zu.~
																													IF ~~ THEN + listen_carefully
																													END
																													
																														IF ~~ THEN BEGIN listen_carefully
																														SAY ~Dieses Miststück Lolths schleicht irgendwo in den Schächten herum. Jetzt, da Ihr sie geöffnet habt, wird es nur eine Frage der Zeit sein, bis sie uns hier findet. Selbst wenn wir sie töten, könnte dies die Mutter Oberinnen von Guallidurth alarmieren.~
																														=
																														~Ihr übergebt Ihr die Leiche eines männlichen Drow und überzeugt sie davon, dass Ihr den letzten seiner Art hier in dem Gebiet getötet habt. Wenn Ihr glaubwürdig seid, wird sie von dannen ziehen.~
																														IF ~~ THEN REPLY ~Und wenn ich nicht glaubwürdig bin?~ + what_if_fail
																														END
																														
																															IF ~~ THEN BEGIN what_if_fail
																															SAY ~Dann werden sich die Zwerge Iltkazars einen neuen Dummen suchen müssen, der ihren König rettet.~
																															IF ~~ THEN REPLY ~Und wo soll ich die Leiche eines Drow herbekommen?~ + where_corpse
																															END
																															
																															IF ~~ THEN BEGIN where_corpse
																															SAY ~Das lässt sich einrichten.~
																															=
																															~Holt mir Malagzmyr her!~
																															IF ~~ THEN DO ~
																															SetGlobal("VhaeraunKillDrow","ACIL24",1)
																															StartCutsceneMode()
																															StartCutscene("AC#24CT1")~ EXIT
																															END
																															
																															IF ~~ THEN BEGIN substitute
																															SAY ~So in etwa, ja.~																														
																															IF ~~ THEN DO ~
																															SetGlobal("VhaeraunKillDrow","ACIL24",3)
																															StartCutsceneMode()
																															StartCutscene("AC#24CT2")~ EXIT
																															END

																															IF ~~ THEN BEGIN i_will_kill_you
																															SAY ~Wie außerordentlich dumm von Euch. Kein Wunder, dass Ihr an der Oberfläche nichts zustande bringt. Habt Ihr es gehört, Männer? Hier ist ein <RACE>, der gerne das Gift unseres maskierten Fürsten kosten möchte!~
																															IF ~~ THEN DO ~SetGlobal("Drowfight","ACIL24",1)
																															SetGlobal("AC#25_LolthPriestess","GLOBAL",10)
																															Enemy()~ EXIT
																															END
																															
																																																																																										
/*******************************************************************************************************
Dialog mit Qall, dem Illithiden- Angesandten
*******************************************************************************************************/

BEGIN ~AC#24MDF~

IF ~~ THEN BEGIN or_your_friend
SAY ~Oder eher, dass *Euer* Freund in der Zwergenstadt versagt hat.~
IF ~~ THEN EXTERN ~AC#24DAE~ whatsoever
END

IF ~~ THEN BEGIN also_interest
SAY ~Mein Volk zeigt auch Interesse an dem Schicksal der Zwergenstadt.~
IF ~~ THEN REPLY ~Drow und Gedankenschinder arbeiten also zusammen?~ + not_work_together
END

IF ~~ THEN BEGIN not_work_together
SAY ~So weit würde ich nicht gehen. Es ist eher so, dass wir die gleichen Interessen haben.~
IF ~~ THEN REPLY ~Warum interessiert Ihr Euch für die Zwergenstadt?~ EXTERN ~AC#24DAE~ power
END

IF ~~ THEN BEGIN speaks_the_truth
SAY ~Ja.~
IF ~~ THEN EXTERN ~AC#24DAE~ job_finished
END

IF ~True()~ THEN BEGIN hello_1
SAY ~Ich dulde Eure Anwesenheit. Mehr nicht. Denkt nicht zu laut an diesem Ort.~
IF ~~ THEN EXIT
END

//----------------------------------------
// CHAIN
// ---------------------------------------
CHAIN IF ~Global("VhaeraunKillDrow","ACIL24",2)~ THEN AC#24DR9 chain_killdrow
~Ihr habt nach mir gerufen, Vhaeraun-Priester?~
== AC#24DAE ~Ja, Malagzmyr, Meistermagier aus Sshamath. Ich muss Euch eine Mitteilung machen. Caraf'nir, Euer Herr und Meister, den wir in die Zwergenstadt eingeschleust hatten, ist tot.~
== AC#24DR9 ~Bei dem dunklen Gewebe!~
== AC#24DAE ~Er wurde von diesem <PRO_RACE> hier, <CHARNAME>, umgebracht.~
== AC#24DR9 ~Von einem *colnbluth*?~
== AC#24DAE ~Wisst Ihr, was dies für Euch bedeutet, Malagzmyr?~
== AC#24DR9 ~Dass ich Caraf'nirs Platz einnehmen werde?~
END
IF ~~ THEN EXTERN ~AC#24DAE~ substitute

/*******************************************************************************************************
NPC-Dialoge
*******************************************************************************************************/

APPEND ~KORGANJ~
IF ~~ THEN BEGIN Korgan_lolth_statue
   SAY ~Ha! Dieser Drow gefällt mir!~
   IF ~~ THEN EXTERN ~AC#24DAE~ vhaeraun_flag
END
END

APPEND ~VICONIJ~
IF ~~ THEN BEGIN viconia_vhaeraun
   SAY ~Das Abbild Vhaerauns, Lolths betrügerischen Sohnes!~
   IF ~~ THEN EXTERN ~AC#24DAE~ viconia_vhaeraun_02
END
END

