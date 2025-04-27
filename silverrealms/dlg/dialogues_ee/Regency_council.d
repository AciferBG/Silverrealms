// -------------------------------------------------
// King's guard
//--

BEGIN ~AC#62DW1~

IF ~RandomNum(5,1)~ THEN BEGIN hello_01
SAY ~Mein Eid gilt auf ewig – solange Mith Barak thront, stehe ich unerschütterlich wie das Erz.~
IF ~~ THEN EXIT 
END

IF ~RandomNum(5,2)~ THEN BEGIN hello_02
SAY ~Der Thron wankt nicht, solange die Klinge wacht.~
IF ~~ THEN EXIT 
END

IF ~RandomNum(5,3)~ THEN BEGIN hello_03
SAY ~Kein Schatten fällt auf den Mithralschild, solange ich wache.~
IF ~~ THEN EXIT 
END

IF ~RandomNum(5,4)~ THEN BEGIN hello_04
SAY ~Unsere Klingen ruhen nicht, solange der König träumt.~
IF ~~ THEN EXIT 
END

IF ~RandomNum(5,5)~ THEN BEGIN hello_05
SAY ~Durch Schlaf und Krieg, durch Dunkelheit und Zeit – wir wachen.~
IF ~~ THEN EXIT 
END

// -------------------------------------------------
// Bettargh Riftsong - Book Astral
//--------------------------------------------------

BEGIN ~AC#BETT2~

IF ~Global("AC#BettarghBookAstral","GLOBAL",1)~ THEN BEGIN hello_book_astral 
  SAY ~<CHARNAME>! Wie gut, dass ich Euch hier treffe!~
	IF ~!Global("AC#BettarghHasBook","GLOBAL",1)~ THEN GOTO not_bettargh_has_book_reveal
	IF ~Global("AC#BettarghHasBook","GLOBAL",1)~ THEN GOTO yes_bettargh__has_book_reveal
	END
	
	IF ~~ THEN BEGIN not_bettargh_has_book_reveal
	SAY ~Beldas war doch auf der Suche nach einem Buch auf der Oberfläche. Habt Ihr es noch?~
	IF ~PartyHasItem("AC#SRBK1")~ THEN REPLY ~Stimmt, ich sollte es Euch ja geben. Ist es dieses hier, das ich bei mir trage?~ + give_bettargh_book
	IF ~!PartyHasItem("AC#SRBK1")~ THEN REPLY ~Nein, ich habe kein Buch.~ GOTO dont_have_book
	END
	
		IF ~~ THEN BEGIN dont_have_book
		SAY ~Das ist schade. Ich konnte aber über einige meiner Gelehrten dennoch in Erfahrung bringen, was es mit dem Buch auf sich hat.~
		IF ~~ THEN GOTO astral_book_01
		END
		
		IF ~~ THEN BEGIN give_bettargh_book
		SAY ~Ja, das ist es! Lasst mich das Buch einmal sehen...~
		IF ~~ THEN DO ~TakePartyItem("AC#SRBK1")
		~ + give_bettargh_book_02
		END
		
			IF ~~ THEN BEGIN give_bettargh_book_02
			SAY ~Genau, wie ich es mir gedacht hatte. Ich konnte bereits über einige meiner Gelehrten in Erfahrung bringen, was es mit dem Buch auf sich hat.~
			IF ~~ THEN GOTO astral_book_01
			END
							
	IF ~~ THEN BEGIN yes_bettargh__has_book_reveal
	SAY ~Ihr hattet mir doch dieses Buch gegeben, welches Beldas an der Oberfläche erworben hatte: "Die Astrale See, ein Reisebericht in das Reich aus Silber von Maskyr dem Einäugigen". König Mith Barak wollte es wohl unbedingt haben.~
	IF ~~ THEN REPLY ~Habt Ihr herausgefunden, warum Mith Barak es wollte?~ GOTO astral_book_01
	END
	
			IF ~~ THEN BEGIN astral_book_01
			SAY ~König Mith Barak war seit längerer Zeit sehr interessiert an Berichten über die Astralebene.~
			IF ~~ THEN REPLY ~Was ist die Astralebene?~ GOTO whats_astral_plane
			END
			
				IF ~~ THEN BEGIN whats_astral_plane
				SAY ~Die Astralebene ist eine seltsame Erscheinung. Sie ist eine Existenzebene, die das gesamte äußere Multiversum miteinander verbindet. Leuchtende Tunnel strahlenden Lichts ziehen sich wie Silberstreifen am Horizont durch sie hindurch. Sie wird deshalb auch als silberne Leere oder Reich des Silbers bezeichnet. In ihr existiert weder Zeit noch Raum, es ist eine Ebene des Geistes, der Seele und der toten Götter.~
				IF ~~ THEN REPLY ~Tote Götter?~ GOTO dead_gods
				END
				
					IF ~~ THEN BEGIN dead_gods
					SAY ~Ja. In dem Buch, welches Beldas erwarb, finden sich genaue Beschreibungen, was passiert, wenn Götter sterben. Der Autor, Maskyr, war der Überzeugung, dass diese in der Astralebene ihre letzte Ruhe finden.~
					IF ~~ THEN REPLY ~Das ist ja ein grausiger Gedanke.~ GOTO astral_book_02
					IF ~~ THEN REPLY ~Und was hat das mit unserer Suche zu tun?~ GOTO astral_book_02
					END
					
						IF ~~ THEN BEGIN astral_book_02
						SAY ~Maskyr beschreibt sehr genau, wie es Sterblichen möglich ist, die Astralebene zu bereisen. Einige der Möglichkeiten sind uns Priestern Iltkazars sogar bekannt. Es gibt Zauber, die es ermöglichen, unsere sterbliche Hülle hier - auf der materiellen Ebene - zurückzulassen und unseren Geist auf eine Reise in die Astrale See zu schicken.~
						IF ~~ THEN REPLY ~Mit sterblicher Hülle meint Ihr den eigenen Körper, der hier zurückbleibt?~ GOTO mithbarak_astral_travel
						END
						
							IF ~~ THEN BEGIN mithbarak_astral_travel
							SAY ~Ganz genau. Der Körper bleibt regungslos zurück, während sich der Geist durch die silberne Leere bewegt.~
							IF ~~ THEN REPLY ~So regungslos wie Mith Barak auf seinem Thron?~ DO ~SetGlobal("AC#BettarghHasBook","GLOBAL",2)~ GOTO mithbarak_astral_travel_02
							END
							
								IF ~~ THEN BEGIN mithbarak_astral_travel_02
								SAY ~Das könnte sein. Daran hatte ich auch gedacht. Was, wenn unser König deshalb so regungslos auf seinem Thron sitzt, wenn er auf einer Astralreise wäre?~
								IF ~~ THEN REPLY ~Das ist eine ausgesprochen dumme Idee.~ GOTO mithbarak_astral_travel_03
								IF ~~ THEN REPLY ~Das klingt plausibel. Warum können wir ihn dann nicht einfach "aufwecken"?~ GOTO mithbarak_astral_travel_03
								END
								
									IF ~~ THEN BEGIN mithbarak_astral_travel_03
									SAY ~Ehrlich gesagt glaube ich nicht, dass unser König unter dem Einfluss astraler Magie steht. Würde er einen solchen Zauber vor seinem Schlaf gewirkt haben, hatte es jede Wache mitbekommen. Nein, hinter seinem Schlaf muss etwas anderes stecken, auch wenn ich mittlerweile überlege, ob es irgendeine Verbindung mit der Astralebene geben könnte. Das Buch beschäftigt sich auch nur am Rande mit der Möglichkeit, durch Zauber auf die Astralebene zu gelangen, und vielmehr mit der Frage, wie man Portale in die Astralebene nutzen kann, um mitsamt seinem Körper dorthin zu gelangen.~
									IF ~~ THEN REPLY ~Mith Barak suchte nach Portalen in die Astralebene?~ GOTO mithbarak_astral_travel_04
									END
									
									IF ~~ THEN BEGIN mithbarak_astral_travel_04
									SAY ~Davon bin ich mittlerweile fest überzeugt. Ich werde in der Bibliothek weitersuchen, ob sich dazu weitere Hinweise finden lassen. Dennoch ist Euer Weg an die Oberfläche der nächste wichtige Schritt, und ich wollte Euch auch nicht zusätzlich verwirren. Ich möchte nur, dass Ihr bei Eurer Suche nach Antworten auf den mysteriösen Schlaf auch diese Mitteilung in Betracht zieht. Ich habe Euch auch eine kleine Niederschrift des Inhaltes von Maskyrs Buch mitgebracht. Wie ich hörte, seid Ihr ja im Besitz von Borthuns Tagebuch. Legt meine Notizen doch einfach dazu, dann findet Ihr sie auch jederzeit wieder.~
									IF ~~ THEN DO ~~ GOTO mithbarak_astral_travel_05
									END
									
									IF ~~ THEN BEGIN mithbarak_astral_travel_05
									SAY ~Aber jetzt möchte ich Euch nicht von Euren Reisevorbereitungen abhalten. Ich hörte, Ihr sagt Bresk Bescheid, bevor Ihr uns verlasst, dann haben wir noch die Möglichkeit, uns zu verabschieden, bis Ihr wieder zurückkehrt. Ich werde in den Thronsaal gehen und Gromi und Dunnabar von meinen Erkenntnissen berichten.~
									IF ~~ THEN DO ~SetGlobal("AC#BettarghBookAstral","GLOBAL",10)
									EscapeArea()~ EXIT
									END		

/*
IF ~~ THEN DO ~SetGlobal("AC#BettarghHasBook","GLOBAL",2)
									AddJournalEntry(@62100,QUEST)
									EscapeArea()~ EXIT
									END	*/
// -------------------------------------------------
// Dunnabar Steinschulter - Dialog 01
//--------------------------------------------------		
BEGIN AC#DUN01  // Dunnabar Steinschulter - Dialog 01

IF ~Global("AC#ACIL64_Open","GLOBAL",2)~ THEN BEGIN guard_the_king
SAY ~Ich werde meiner Aufgabe nachgehen, an der Seite des Königs Wache zu stehen.~
  IF ~~ THEN REPLY ~Ich würde mir gerne auch einmal ein Bild der Lage machen.~ EXTERN ~AC#GROM1~ chain_go_check_throneroom
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello
SAY ~Halt, Fremde! Was führt Euch in die Hallen des Regentschaftsrates?~
  IF ~~ THEN REPLY ~Ich bin <CHARNAME> und möchte mit dem Regentschaftsrat über König Mith Barak sprechen. Kriegsmeister Bresk Steinschulter hat mich hierhergeschickt.~ GOTO 2
END

IF ~~ THEN BEGIN 2
SAY ~Ihr habt mit meinem Sohn Bresk gesprochen? Nun gut, folgt mir, ich werde Euch dem Rat melden. Er soll entscheiden, wie es mit Euch weitergehen soll.~
=
~Öffnet die Tore und lasst <CHARNAME> vor den Rat treten!~
  IF ~~ THEN DO ~SetGlobal("AC#RegencyCouncil","ACIL62",1)~ EXIT
END

IF ~~ THEN BEGIN bring_him_out
SAY ~Jawohl, Ratsherr.~
  IF ~~ THEN DO ~SetGlobal("AC#RegencyQuest","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN patrol_search_02
SAY ~Jawohl, mein Ratsherr.~
 IF ~~ THEN EXTERN ~AC#GROM1~ patrol_search_03
END

	IF ~~ THEN BEGIN patrol_search_04
	SAY ~Ich habe vor einigen Tagen eine Patrouille losgeschickt, die die unmittelbare Umgebung der Stadt erkunden soll. Meine Männer sind bisher leider nicht zurückgekehrt. Das ist ungewöhnlich, und ich befürchte, dass ihnen etwas zugestoßen sein könnte.~
	 IF ~~ THEN EXTERN ~AC#GROM1~ patrol_search_05
	END
	
		IF ~~ THEN BEGIN patrol_search_06
		SAY ~Zumindest war das ihr Auftrag. Wo sie jetzt sind, wissen wir nicht.~
		 IF ~~ THEN EXTERN ~AC#GROM1~ patrol_search_07
		END
		
			IF ~~ THEN BEGIN patrol_where_to_start
			SAY ~Bei ihrem Rundgang sollten sie sich nicht weit von der Stadt entfernt haben. Mehr wissen wir leider auch nicht, <PRO_RACE>. All unsere Männer sind damit beschäftigt, die anderen Tore und die unmittelbare Umgebung der Stadt zu sichern.~
			 IF ~~ THEN EXTERN ~AC#GROM1~ patrol_search_08
			END
			

IF ~~ THEN BEGIN dunnabar_go_to_king
SAY ~Unseren König werde ich nun wieder aufsuchen, um meine Pflicht zu erfüllen.~
 IF ~~ THEN EXTERN ~AC#GROM1~ gromi_go_to_king
END

IF ~True()~ THEN BEGIN hello_true
SAY ~Wenn Ihr Nachrichten habt, die den Rat betreffen, redet mit Gromi Arnschädel.~
IF ~~ THEN EXIT 
END
// -------------------------------------------------
// Ellhimar 6(mad)
//--------------------------------------------------

BEGIN ~AC#ILEL6~

IF ~Global("AC#Ellhimar_Illithid","GLOBAL",3)~ THEN BEGIN hello_mad_laughter 
  SAY ~(wirres Lachen)~
	IF ~~ THEN EXTERN ~AC#VRON1~ chain_is_this_really_ellhimar
		END


// ---------------------------------------------
// Gromi Arnskull
// ---------------------------------------------

BEGIN AC#GROM1  // Gromi Arnskull

IF ~Global("AC#Ruvan_Treason","GLOBAL",6)~ THEN BEGIN gromi_asks_about_barakuir
SAY ~Dies sind fürwahr schwierige Zeiten für unsere Stadt.~
IF ~~ THEN EXTERN ~AC#DUN01~ chain_dunnabar_own_brother
END

		IF ~~ THEN BEGIN tell_us_about_barakuir
		SAY ~Bitte teilt Eure weiteren Erkenntnisse über Barakuir mit uns, um der ganzen Angelegenheit doch noch ein wenig Sinn zu geben.~
		IF ~~ THEN REPLY ~Außerhalb der Stadt gab es einen verlassenen Tempel der Illithiden und ich musste gegen einige der abscheulichsten ihrer Ausgeburten kämpfen.~ EXTERN ~AC#FENY1~ so_it_is_true_about_mindflayers
		END
				
		IF ~~THEN BEGIN who_is_this_lay_down
		SAY ~Wer ist das? Legt ihn ab, damit wir ihn besser betrachten können!~
		IF ~~ THEN DO ~SetGlobal("AC#Ruvan_Treason","GLOBAL",7)
		EraseJournalEntry(@62050)
		AddJournalEntry(@62051,QUEST_DONE)
		TakePartyItem("AC#28ELL")
		DestroyItem("AC#28ELL")
		SetGlobal("AC#Ellhimar_Illithid","GLOBAL",3)
		CreateCreature("AC#ILEL6",[1947.941],3)
		Wait(2)
		ActionOverride("AC#ILEL6",StartDialogueNoSet(Player1))
		~ EXIT
		END
		
		
		IF ~~ THEN BEGIN question_and_answer
		SAY ~Hm. Manchmal liegen Frage und Antwort näher beieinander, als man es vermuten würde.~
		IF ~~ THEN REPLY ~Ellhimar hat in den Spinnenschächten nach Antworten auf den schlafenden König gesucht. Irgendetwas muss ihn dort gefangen genommen und an die Illithiden ausgeliefert haben.~ EXTERN ~AC#VRON1~ vronia_ellhimar_drow
		END
		
		
		IF ~~ THEN BEGIN turbaern_gromi_regencycouncil_02
		SAY ~Es ist kein Geheimnis, dass Ihr dem Rat gegenüber schon immer abgeneigt wart, Turbaern.~
		IF ~~ THEN EXTERN ~AC#VRON1~ vronia_turbaern_what_do_you_propose
		END
		
		IF ~~ THEN BEGIN turbaern_open_throneroom
		SAY ~Ein gewagtes Unterfangen. Warum sollte dies die Bürger unserer Stadt nicht noch niedergeschlagener machen?~
		IF ~~ THEN REPLY ~Weil sie vielleicht endlich wieder *sehen*, dass sie noch einen König haben?~ + chain_open_throneroom
		END
		
		
		IF ~~ THEN BEGIN ok_open_throneroom
		SAY ~Schwierige Zeiten erfordern schwierige Entscheidungen.~
		=
		~Wohlan denn, Königsgarde - öffnet die Tore in den Thronsaal!~
		IF ~~ THEN DO ~SetGlobal("AC#Ruvan_Treason","GLOBAL",10)
		SetGlobal("AC#Ellhimar_Illithid","GLOBAL",4)
		FaceObject("DOOR02")
		Wait(1)
		SetGlobal("AC#ACIL64_Open","GLOBAL",1)
		~ EXIT
		END
		
IF ~Global("AC#Ruvan_Treason","GLOBAL",2)~ THEN BEGIN gromi_charname_missing_barakuir
SAY ~Und Ihr sagt, Eure Wachen hätten gesehen, wie <CHARNAME> in Barakuir gefallen ist?~
IF ~~ THEN EXTERN ~AC#RUVA1~ chain_ruvan_treason_01
END

	IF ~~THEN BEGIN no_goodbye_for_ruvan
	SAY ~Ich entbiete Euch ein Lebewohl, Ruvan vom Clan Steinschulter.~
	IF ~~ THEN DO ~SetInterrupt(FALSE)
	SetGlobal("AC#Ruvan_Treason","GLOBAL",5)
	ActionOverride("AC#62DW2",EscapeAreaObject("TrACIL50"))
	ActionOverride("AC#62DW3",EscapeAreaObject("TrACIL50"))
	ActionOverride("AC#CHEM1",EscapeAreaObject("TrACIL50"))
	ActionOverride("AC#RUVA1",EscapeAreaObject("TrACIL50"))
	AddJournalEntry(@62059,QUEST_DONE)
	Wait(1)
	SetInterrupt(TRUE)
	~ EXIT
	END
					
IF ~GlobalGT("AC#RC_Bettargh_Third","GLOBAL",0)
GlobalLT("AC#RC_Bettargh_Third","GLOBAL",20)
Global("AC#Ruvan_Treason","GLOBAL",0)~ THEN BEGIN hello_whats_bettargh
  SAY ~Wart Ihr schon in der Halle der Runensteine und habt Bettargh um Rat zu Barakuir gefragt?~
	IF ~Global("AC#RC_Bettargh_Third","GLOBAL",10)~ THEN REPLY ~ja, ich habe herausgefunden, wie man nach Barakuir kommen könnte.~ GOTO know_about_barakuir
	IF ~GlobalGT("AC#RC_Bettargh_Third","GLOBAL",1)
	GlobalLT("AC#RC_Bettargh_Third","GLOBAL",10)~ THEN REPLY ~Ich bin dabei, habe aber noch nichts endgültiges für Euch.~ GOTO patrol_keep_searching
	IF ~~ THEN REPLY ~Nein, noch nicht.~ GOTO patrol_keep_searching
END

	IF ~~ THEN BEGIN know_about_barakuir
	SAY ~Oh! Was habt Ihr herausgefunden?~
	IF ~~ THEN REPLY ~Barakuir liegt gen Osten, jenseits des großen Sees, den Ihr den Eisensee nennt.~ EXTERN ~AC#CHEM1~ barakuir_lake
	END

// Boote für Barakuir__________________________________________________________________________________________________________________________________________________________________________	
	IF ~~THEN BEGIN barakuir_enough_elern
	SAY ~Elern spricht die Wahrheit, <CHARNAME>. Wenn es eines gibt, vor dem sich Schildzwerge fürchten, dann ist es der Fluch, der unsere ehemaligen Clanbrüder nun zu unseren erbittertsten Gegnern gemacht hat.~
	IF ~~ THEN DO ~~ + barakuir_need_boat
	END
	
		IF ~~ THEN BEGIN barakuir_need_boat
		SAY ~Wir benötigen allerdings Boote, um dorthin zu gelangen. Keiner unserer Clans ist noch im Bootsbau bewandert, deshalb erwarte ich Vorschläge.~
		IF ~~ THEN REPLY ~Ihr habt doch diese kleinen Boote unten in der Halle, mit der Ihr durch die Lava gleitet.~ EXTERN ~AC#TORT1~ boat_azerkyn_too_heavy
		END
		
			IF ~~ THEN BEGIN gromi_boat_sorni
			SAY ~Das war die Idee von Sorni Arnschädel.~
			=
			~Ihr solltet einmal mit Sorni reden, <CHARNAME>. Vielleicht kann sie Verbesserungen an dem Boot vornehmen.~
			IF ~~ THEN REPLY ~Oh nein. Ich bin die ganze letzte Zeit damit beschäftigt gewesen, durch diese Stadt zu laufen und war bestimmt schon mehrere Male bei Sorni unten in der großen Halle. Könnt Ihr nicht einen Boten zu Ihr schicken?~ EXTERN ~AC#ELER1~ elern_no_way_talk_to_sorni_again
			IF ~~ THEN REPLY ~Ich weiß zwar nicht, das wievielte Mal es ist, dass ich Sorni in der Halle aufsuche, aber wenn Ihr wollt, werde ich wieder mit ihr reden.~ + gromi_boat_talk_to_sorni
			END
			
				IF ~~THEN BEGIN gromi_boat_talk_to_sorni
				SAY ~Gut. Wir benötigen nur noch Zwerge, die die Boote bedienen und über den See navigieren. Dies möchte ich unseren Besuchern von der Oberfläche nicht zumuten. Und wir können es uns nicht leisten, dass sie in der Dunkelheit die Orientierung verlieren und scheitern.~
				IF ~~ THEN EXTERN ~AC#ELER1~ sailors_boat
				END
				
// Hier gehts weiter__________________________________________________________________________________________________________________________________________________________________________	
				IF ~~THEN BEGIN enough_sailors_barakuir
				SAY ~Genug. Dies sollte nun wirklich nicht der Anlass für einen Streit sein. Elern hat recht, wir könnten einige der Anhänger des irrenden Wanderers mit dieser Aufgabe betrauen.~
				=
				~Elern, Ihr kümmert Euch darum, eine Mannschaft zusammenzustellen. <CHARNAME>, Ihr sprecht mit Sorni. Der Treffpunkt für den Beginn der Unternehmung ist am Platz von Bhaerynden. Noch Fragen?~
				IF ~~ THEN EXTERN ~AC#RUVA1~ boat_one_word
				END
				
					IF ~~ THEN BEGIN gromi_boat_one_word
					SAY ~Was gibt es denn noch zu besprechen, Ruvan vom Clan Steinschulter?~
					IF ~~ THEN EXTERN ~AC#RUVA1~ ruvan_boat_one_word_02
					END

				IF ~~THEN BEGIN end_pc_talk_sorni_boat
				SAY ~Nun gut. <CHARNAME>, geht zu Sorni. Wenn sie die Sache mit den Booten vorbereitet hat, trefft Euch mit der Mannschaft am Platz von Bhaerynden.~
				IF ~~ THEN REPLY ~Gut. Ich werde dort auf die Mannschaft warten.~ + end_pc_talk_sorni_boat_02
				END
				
				IF ~~THEN BEGIN end_pc_talk_sorni_boat_02
				SAY ~Ich bin sicher, dass Sorni eine Lösung finden wird. *Kal maerdh*, <CHARNAME>.~
				IF ~~ THEN DO ~SetGlobal("AC#RC_Sorni_Fourth","GLOBAL",1)
				SetGlobal("AC#RC_Bettargh_Third","GLOBAL",20)
				EraseJournalEntry(@62033)
				AddJournalEntry(@62040,QUEST)
				AddexperienceParty(1000)
				~ EXIT
				END

// go to throneroom
	IF ~~THEN BEGIN gromi_go_to_king
	SAY ~Ich werde Euch begleiten. Die Ratssitzung ist hiermit beendet. Der Rat wird erst wieder zusammentreffen, wenn unser König aus dem Schlaf erwacht ist.~
	=
	~Es bleibt Euch überlassen, <CHARNAME>, ob Ihr Euch selbst ein Bild unseres Königs machen wollt oder gleich zu den Spinnenschächten aufbrechen werdet.~
	IF ~~ THEN DO ~SetGlobal("AC#RC_Spiderstalkings","GLOBAL",1)
		EraseJournalEntry(@62021)
		AddJournalEntry(@62022,QUEST)
		AddexperienceParty(1000)
		~ EXIT
		END
				
//Second Quest: Retrieve Runestone for Spiderstalkings
IF ~GlobalGT("AC#RC_Turbaern_Second","GLOBAL",0)
GlobalLT("AC#RC_Turbaern_Second","GLOBAL",20)~ THEN BEGIN hello_whats_turbaern
  SAY ~Habt Ihr schon mit dem Hohen Omlar Turbaern gesprochen?~
	IF ~Global("AC#RC_Turbaern_Second","GLOBAL",2)~ THEN REPLY ~Ja. Er wird Euch den Siegelstein für die Spinnenschächte nicht geben.~ EXTERN ~AC#CHEM1~ turbaern_wont_give_runestone
	IF ~~ THEN REPLY ~Nein, noch nicht.~ GOTO patrol_keep_searching
END


	IF ~~ THEN BEGIN enough_turbaern
	SAY ~Genug. Es ist leichter, einen Diamanten mit der bloßen Hand zu Staub zu verwandeln, als einen *delvesonn* von seiner Meinung abzubringen.~
	=
	~Ich sehe noch eine andere Möglichkeit. <CHARNAME>, Ihr erwähntet den Spiegel Ellhimars, in welchem sich ein Gedankenschinder zeigte, richtig?~
	IF ~~ THEN REPLY ~Ja, das ist richtig.~ EXTERN ~AC#CHEM1~ send_charname_through_mirror
	END
	
	
		IF ~~ THEN BEGIN messages_to_illithids
		SAY ~Richtig. Und wir werden jetzt sehen, wohin dieser Drow die Nachricht geschickt hat. Unsere Stadt hatte in der Vergangenheit zwar schon Kontakt mit den *caradhak*, wenngleich nicht mit so verheerendem Ausgang wie andere Unterkönigreiche Shanatars. Vielleicht finden wir im untergegangenen Königreich Antworten auf unsere Fragen.~
		IF ~~ THEN EXTERN ~AC#STUR1~ travel_to_XY
		END
		
			IF ~~ THEN BEGIN dont_talk_about_duergar_here
			SAY ~Genau, dorthin. Zu dem verlorenen Clan, deren Namen wir hier nicht in den Mund nehmen dürfen. Wenn das Wasser in einen Minenschacht eindringt, kann man entweder Mauern oder Wasserräder bauen. Wir entscheiden uns für Letzteres. *Wenn* es Hinweise gibt, wie die *caradhak* uns schaden könnten, dann ist es an diesem Ort.~
			IF ~~ THEN REPLY ~Ich nehme an, dass Ihr erwartet, dass ich zu diesem Ort reisen soll?~ + chain_should_i_travel_to_xy
			END
				// OLD
				/*
				IF ~~ THEN BEGIN should_i_travel_to_xy
				SAY ~In der Tat. Auch, wenn die Geschehnisse an diesem Ort schon lange zurückliegen, würde kein Zwerg unseres Clans jemals wieder einen Fuß auf diesen unheiligen Boden setzen. Deshalb bitten wir Euch, <CHARNAME>, dies für unsere Stadt zu tun. Dies wäre die beste Spur, die wir derzeit haben.~
				IF ~~ THEN  EXTERN ~AC#ELER1~ barakuir_right
				END
				*/
					
						
					IF ~~THEN BEGIN ask_bettargh_barakuir
					SAY ~Das ist eine gute Idee, Elern. <CHARNAME>, wir bitten Euch, Bettargh Abgrundlied in der Halle der Runensteine aufzusuchen. Er wird uns weiterhelfen können.~
					=
					~Bittet ihn, Euch darin zu unterstützen, einen Weg nach Barakuir zu finden.~
					IF ~~ THEN DO ~SetGlobal("AC#RC_Bettargh_Third","GLOBAL",1)
					SetGlobal("AC#RC_Turbaern_Second","GLOBAL",20)
					EraseJournalEntry(@62021)
					AddJournalEntry(@62030,QUEST)
					AddexperienceParty(1000)
					~ EXIT
					END
					
// Gromi Ellhimar Solved
IF ~Global("AC#RC_Ellhimar_First","GLOBAL",1)
GlobalGT("AC#Vronia_Quest","GLOBAL",11)~ THEN BEGIN hello_ellhimar_solved
SAY ~Gut, dass Ihr da seid, <CHARNAME>. Unsere Runenmeisterin hat uns bereits über die Situation mit Ellhimar unterrichtet.~
IF ~~ THEN DO ~EraseJournalEntry(@62061)~ + Ellhimar_quest_finished
END

// Gromi Ellhimar First: Quest given by Vronia, Regency Council awaits
IF ~Global("AC#RC_Ellhimar_First","GLOBAL",1)
GlobalLT("AC#Vronia_Quest","GLOBAL",12)~ THEN BEGIN hello_whats_ellhimar
SAY ~Konntet Ihr Ellhimar schon auf den Zahn fühlen?~
IF ~~ THEN REPLY ~Nein, noch nicht.~ GOTO patrol_keep_searching
END

//before dwarven patrol quest
IF ~Global("AC#Iltkazar_Council_Second_Quest","GLOBAL",2)~ THEN BEGIN hello_before_patrolquest
SAY ~<CHARNAME>, Ihr seid gekommen. Wir haben Euch rufen lassen, weil wir eine Entscheidung in Eurer Sache getroffen haben.~
IF ~Global("AC#Vronia_Alert","GLOBAL",10)~ THEN GOTO better_reputation
IF ~GlobalLT("AC#Vronia_Alert","GLOBAL",10)~ THEN GOTO wheres_vronia
END

	IF ~~ THEN BEGIN wheres_vronia
	SAY ~Wo ist das Ratsmitglied von Clan Eisenbieger? Wo ist Runenmeisterin Vronia?~
	IF ~~ THEN EXTERN ~AC#ELER1~  vronia_is_busy
	END
	
	IF ~~ THEN BEGIN vronia_is_busy_02
	SAY ~Wie dem auch sei.~
	IF ~~ THEN GOTO better_reputation
	END

IF ~~ THEN BEGIN better_reputation
SAY ~Ihr habt bei einigen unserer Mitbewohner einen guten Eindruck hinterlassen. In der Stadt spricht man über Euch, und das anfängliche Misstrauen ist verschwunden.~
=
~Eure wahren Absichten sind dem Rat noch immer nicht klar. Jedoch haben wir beschlossen, den Arrest, den wir Euch auferlegt haben, aufzuheben.~
  IF ~~ THEN REPLY ~Das sind schöne Nachrichten!~ + debate
  IF ~~ THEN REPLY ~Darf ich jetzt endlich einmal Euren König sehen?~ + debate
  IF ~~ THEN REPLY ~Ihr habt Euch mit dieser Entscheidung reichlich Zeit gelassen.~ + debate
END

	IF ~~ THEN BEGIN debate
	SAY ~Der Regentschaftsrat hat lange debattiert, wie er mit Euch weiterverfahren soll. Wir werden Euch noch nicht zu unserem König vorlassen, auch wenn Ihr dessen Geheimnis kennt. Wir werden erst in Erwägung ziehen, Euch in den Thronsaal vorzulassen, wenn wir den Eindruck haben, dass Ihr ihm und der Stadt loyal gegenübersteht. Nutzt daher die Möglichkeiten, Eure Loyalität zu beweisen, die wir Euch geben. Ihr könnt uns nämlich in einer wichtigen Sache helfen.~
	IF ~~ THEN + patrol_search
	END
	
		IF ~~ THEN BEGIN patrol_search
		SAY ~Unsere Grenzen stehen unter starkem Druck. Viele Feinde stehen vor unseren Mauern, und der konstante Abwehrkampf schwächt unsere Kräfte. Habe ich das so richtig dargestellt, Dunnabar?~
		IF ~~ THEN EXTERN ~AC#DUN01~ patrol_search_02
		END
		
			IF ~~ THEN BEGIN patrol_search_03
			SAY ~Wir brauchen Eure Hilfe außerhalb Iltkazars. Dies wäre auch ein guter Anlass, Eure Loyalität der Stadt gegenüber unter Beweis zu stellen. Dunnabar, würdet Ihr bitte die Einzelheiten vortragen?~
			IF ~~ THEN EXTERN ~AC#DUN01~ patrol_search_04
			END
			
				IF ~~ THEN BEGIN patrol_search_05
				SAY ~Der Rat hat beschlossen, Euch mit der Suche nach der Patrouille zu beauftragen. Sie müssen sich irgendwo in der Nähe unserer Stadt aufhalten.~
				IF ~~ THEN EXTERN ~AC#DUN01~ patrol_search_06
				END
				
					IF ~~ THEN BEGIN patrol_search_07
					SAY ~Geht und sucht nach unseren Soldaten. Der Ausgang Iltkazars steht Euch ab sofort wieder offen.~
					IF ~~ THEN REPLY ~Ich werde Eure Männer finden, Dunnabar, und den Rat nicht enttäuschen.~ EXTERN ~AC#ELER1~ patrol_good_luck
					IF ~~ THEN REPLY ~In Ordnung. Ich kümmere mich darum.~ EXTERN ~AC#ELER1~ patrol_good_luck
					END
					
						IF ~~ THEN BEGIN patrol_open_doors
						SAY ~Dunnabar, sagt Eurem Sohn Bresk, dass sich <CHARNAME> in der Stadt frei bewegen darf und das Ultoksamrin-Tor für ihn geöffnet bleiben soll.~
						IF ~~ THEN REPLY ~Habt Dank. Wo soll ich mit der Suche beginnen?~ EXTERN ~AC#DUN01~ patrol_where_to_start
						IF ~~ THEN REPLY ~Irgendein Anhalt, wo die Patrouille sein könnte?~ EXTERN ~AC#DUN01~ patrol_where_to_start
						IF ~~ THEN REPLY ~Ich hoffe, ich muss nicht das ganze Unterreich nach diesen Zwergen absuchen.~ EXTERN ~AC#DUN01~ patrol_where_to_start
						END
						
							IF ~~ THEN BEGIN patrol_search_08
							SAY ~Mit Eurer Hilfe könnt Ihr der Stadt einen großen Dienst erweisen. Kehrt zu uns zurück, wenn Ihr etwas herausgefunden habt. Die Hallen des Regentschaftsrates sind für Euch ab sofort jederzeit geöffnet.~
							IF ~~ THEN DO ~SetGlobal("AC_Regency_Patrol","GLOBAL",1)
							SetGlobal("AC#Iltkazar_Council_Second_Quest","GLOBAL",3)
							AddJournalEntry(@62010,QUEST)
							EraseJournalEntry(@55101)~ GOTO gromi_driftdisquest_01
							END
							
							IF ~~ THEN BEGIN gromi_driftdisquest_01
							SAY ~Elern, Ihr wolltet <CHARNAME> noch etwas mitteilen?~
							IF ~~ THEN EXTERN ~AC#ELER1~ elern_driftdisquest_01
							END
							
							IF ~~ THEN BEGIN gromi_driftdisquest_02
							SAY ~Damit wäre alles gesagt. Wir erwarten Euch mit den Antworten zur Patrouille wieder hier in den Hallen. Wie und wann Ihr den Weg zurück an die Oberfläche einschlagt obliegt allein Euch. Gehabt Euch wohl, <CHARNAME>.~
							IF ~~ THEN EXIT 
							END

// dwarven patrol quest given
IF ~Global("AC_Regency_Patrol","GLOBAL",1)~ THEN BEGIN patrol_dead_01
SAY ~Ich nehme an, Ihr kehrt zurück, um den Rat über die Situation der vermissten Patrouille zu unterrichten?~
  IF ~Global("Acil20_DeadDwarves","GLOBAL",1)~ THEN DO ~SetGlobal("AC_Regency_Patrol","GLOBAL",2)
  EraseJournalEntry(@62011)~ REPLY ~Die Zwergenpatrouille ist tot. Ich fand sie in einer Höhle in den südlichen Tunneln.~ EXTERN ~AC#CHEM1~ patrol_dead_02
IF ~Global("Acil20_DeadDwarves","GLOBAL",0)~ THEN REPLY ~Ich habe noch nichts gefunden, tut mir leid.~ GOTO patrol_keep_searching
END

	IF ~~THEN BEGIN patrol_keep_searching
	SAY ~Warum belästigt Ihr dann den Regentschaftsrat? Sucht weiter, <PRO_RACE>, wenn Ihr uns wirklich helfen wollt!~
	IF ~~ THEN DO ~~ EXIT
	END

	IF ~~ THEN BEGIN what_next_01
	SAY ~Mit der Patrouille soll sich zunächst die Bronzemaske weiter befassen. Ich möchte wissen, was es mit den Illithidenköpfen auf sich hat! Wer hat sie abgetrennt? Unsere eigenen Leute? Jemand anderes? Und einige Priester sollen sich dieses Symbol ansehen und untersuchen, ob ein feindlicher Dweomer darin enthalten ist. Das wird eine Weile dauern, denn ich erwarte, dass dieser Vorfall gründlich untersucht wird!~ 
	=
	~Und die *delvesonns* sollen den Gefallenen ein würdiges Begräbnis geben. Solange dieser Vorfall untersucht wird, müssen wir uns weiteren Fragen widmen.~
	=
	~<CHARNAME> hat <HISHER> Versprechen gehalten und unser Vertrauen wirklich verdient, verehrte Ratsmitglieder. Dafür gebührt <PRO_HIMHER> unser aufrichtiger Dank.~ 
	IF ~~ THEN + discussion
	END

// Hier geht es nach Patrouillenquest weiter - je nachdem, ob Ellhimars oder Turbaerns Quest schon erledigt wurde
			IF ~~ THEN BEGIN discussion
			SAY ~Liebe Ratsmitglieder, wir müssen entscheiden, wie wir weiter verfahren sollen. Es scheint sich eine uns unbekannte Bedrohung vor unserer Stadt zu sammeln, und wir müssen die richtigen Schritte einleiten, um ihr zu begegnen.~
			//IF ~GlobalGT("AC#TurbaernRescued","GLOBAL",2)~ THEN + Turbaern_quest_finished
			//IF ~GlobalLT("AC#TurbaernRescued","GLOBAL",3)~ THEN + Turbaern_quest_not_finished_yet
			IF ~GlobalLT("AC#Vronia_Quest","GLOBAL",12)~ THEN EXTERN ~AC#VRON1~ Ellhimar_quest_not_done_yet
			IF ~GlobalGT("AC#Vronia_Quest","GLOBAL",11)~ THEN + Ellhimar_quest_finished
			END
			/*
				IF ~~ THEN BEGIN Ellhimar_quest_finished
				SAY ~<CHARNAME>, Vronia berichtete uns, dass Ihr unseren menschlichen Magier als einen vermeintlichen Drow-Spion enttarnt habt.~
				IF ~~ THEN GOTO Ellhimar_mindflayer_01
				END
				
					IF ~~ THEN BEGIN Ellhimar_mindflayer_01
					SAY ~Sie berichtete uns ebenfalls von Eurer Beobachtung, dass er in Kontakt mit einem *caradhak*, einem Illithiden, stand.~
					IF ~~ THEN REPLY ~Ja, ich habe durch einen Spiegel in das Antlitz eines Gedankenschinders geschaut.~ EXTERN ~AC#STUR1~ illithid_face_01
					END
					*/
					
						IF ~~ THEN BEGIN illithid_face_02
						SAY ~Das könnte sein, doch es gibt noch andere Hinweise. Der Magier machte sich wohl auf eigene Faust auf den Weg in die Spinnenschächte, auch wenn dieser Weg verboten ist. Dies hat <CHARNAME> ebenfalls herausgefunden, nicht wahr, Vronia?~
						IF ~~ THEN EXTERN ~AC#VRON1~ Ellhimar_spiderstakings
						END
						
							IF ~~ THEN BEGIN charname_spiderstakings_02
							SAY ~Dann sollte <CHARNAME> in den Spinnenschächten nach weiteren Antworten zu dem Vorfall mit dem Drow-Magier suchen.~
							IF ~~ THEN EXTERN ~AC#VRON1~ charname_spiderstakings_03
							END
							
								IF ~~ THEN BEGIN goto_turbaern_01
								SAY ~Dann können wir nur hoffen, dass Turbaern die Siegel dem Rat zur Verfügung stellt.~
								IF ~~ THEN EXTERN ~AC#CHEM1~ turbaern_dont_like_council
								END
								
									IF ~~ THEN BEGIN better_pcs_talk_to_turbaern 
									SAY ~Deshalb betrauen wir auch <CHARNAME> mit dieser Aufgabe.~
									IF ~GlobalGT("AC#TurbaernRescued","GLOBAL",2)~ THEN + Turbaern_quest_finished
									IF ~GlobalLT("AC#TurbaernRescued","GLOBAL",3)~ THEN + Turbaern_quest_not_finished_yet
									END
									
										IF ~~ THEN BEGIN Turbaern_quest_finished
										SAY ~Ihr habt in der Halle der Omlare eine große Katastrophe abgewendet, habe ich Recht?~
										IF ~~ THEN REPLY ~Ja, in der Krypta unter dem Tempel gab es allerhand Unruhe.~ + rescued_turbaern
										END
										
											IF ~~ THEN BEGIN rescued_turbaern
											SAY ~Ich habe die Berichte noch nicht vollständig verfolgen können, aber der Priester scheint Dumathoin sei Dank wieder wohlauf zu sein.~
											IF ~~ THEN GOTO talk_to_turbaern
											END

//__________________________________Quest: Talk to Turbaern
											
												IF ~~THEN BEGIN talk_to_turbaern
												SAY ~Ich bitte Euch, sucht den Hohen Omlar Turbaern Ghalmrin auf und bittet um die Herausgabe des Siegelsteines zum Öffnen der Spinnenschächte. Die zuständigen Ratsmitglieder kümmern sich derweil um das Begräbnis für unsere Patrouille und um die Untersuchung dieser Höhle vor unserer Stadt. Untersucht dieses Symbol, das <CHARNAME> erwähnt hat. Und entfernt die Köpfe der Illithiden, bevor sie anfangen zu stinken.~
												=
												~Damit ist die Ratssitzung beendet.~
												IF ~~ THEN DO ~SetGlobal("AC#RC_Ellhimar_First","GLOBAL",2)
												SetGlobal("AC#RC_Turbaern_Second","GLOBAL",1)
												AddJournalEntry(@62020,QUEST)
												AddexperienceParty(1000)
												~ EXIT
												END
								
								IF ~~ THEN BEGIN Turbaern_quest_not_finished_yet
								SAY ~Sagt, <CHARNAME>, habt Ihr schon mit unserem Priester Dumathoins, dem hohen Omlar gesprochen?~
								IF ~~ THEN REPLY ~Nein, nicht wirklich.~ + talk_to_turbaern_firsttime
								END
									
									IF ~~ THEN BEGIN talk_to_turbaern_firsttime
									SAY ~Dann solltet Ihr dies nun tun. Er befindet sich in der Halle der Omlare, dem heiligen Tempel Dumathoins, des Schutzpatrons unserer Rasse.~
									IF ~~ THEN + talk_to_turbaern
									END
								
			IF ~~THEN BEGIN PC_check_Ellhimar
			SAY ~Das ist eine gute Idee. Vronia, Ihr dürft den Rat so lange verlassen. <CHARNAME>, Ihr untersucht bitte den Menschen, der sich Ellhimar nennt und erstattet Vronia in ihren Privatgemächern Bericht.~
			IF ~~ THEN DO ~
			SetGlobal("AC#RC_Ellhimar_First","GLOBAL",1)
			AddJournalEntry(@62060,QUEST)
			ActionOverride("AC#ELER1",MoveToPointNoInterrupt([1921.975]))
			ActionOverride("AC#VRON1",EscapeAreaObject("TrACIL50"))
			~ EXIT
			END

//______________________________If Ellhimars Quest is not finished
					
					
IF ~~ THEN BEGIN charname_bio
SAY ~Nun gut. Also, <CHARNAME>, wo kommt Ihr her? Wo seid Ihr geboren?~
IF ~~ THEN REPLY ~Ich stamme aus Kerzenburg, einer Bibliothek an der Oberfläche.~ EXTERN ~AC#STUR1~ heard_candlekeep
END

IF ~~ THEN BEGIN what_dwarf
SAY ~Aus einer Bücherei also. Nun sagt mir, welchen Bewohner unserer Stadt habt Ihr an der Oberfläche getroffen?~
IF ~~ THEN REPLY ~Ich habe in Amn, einem Land der Oberfläche, eine Gruppe Zwerge um ihren Anführer Beldas getroffen, die mich um Hilfe für diese Stadt gebeten haben.~ EXTERN ~AC#CHEM1~ xothor
END

IF ~~ THEN BEGIN only_king_knows
SAY ~Das wusste unser Herrscher wohl nur ganz alleine. Sagt, <CHARNAME>, habt Ihr das Buch noch bei Euch?~
IF ~~ THEN REPLY ~Ja, ich sollte es im Auftrag von Beldas nach Iltkazar bringen.~ GOTO bring_book_bettargh
END

IF ~~ THEN BEGIN bring_book_bettargh
SAY ~Bringt dieses Buch einmal in die Halle der Runensteine. Vielleicht weiß unser Gelehrter Bettargh Abgrundlied etwas damit anzufangen.~
IF ~~ THEN EXTERN ~AC#RUVA1~ piece_of_paper
END

IF ~~ THEN BEGIN could_defeat_dragon
SAY ~Mornfarmar. Konntet Ihr den Drachen denn besiegen?~
IF ~~ THEN REPLY ~Fast. Kurz, bevor ich ihm den Todesstoß versetzen konnte, flog er davon.~ EXTERN ~AC#TORT1~ damned
END

IF ~~ THEN BEGIN calm_dear
SAY ~Das Unterreich ist groß, Liebste. Er wird sich in einem der anderen Unterkönigreiche Shanatars eingenistet haben, vielleicht in Drakkalor, wenn die Gerüchte wahr sind. Ich kann mir beim Hüter unter dem Berge nicht vorstellen, dass er sich aufmacht, von dort durch die alten Tunnel zu kriechen, wo er eine leichte Beute für unsere Ballisten wäre. Er wird stattdessen seine Schwingen ausbreiten und die Länder der Oberfläche tyrannisieren, was uns nur Recht sein kann. Nein, der Drache ist zunächst keine Bedrohung für uns.~
=
~Was viel wichtiger ist: <CHARNAME> hat uns hier aufgesucht, und wir müssen entscheiden, wie es mit <PRO_HIMHER> weitergehen soll.~ 
IF ~~ THEN EXTERN ~AC#STUR1~ bad_news
END

IF ~~ THEN BEGIN abstimmung
SAY ~Verehrte Ratsfreunde, lasst uns abstimmen, wie wir in dieser Angelegenheit weiter verfahren sollten.~
IF ~~ THEN + arrest_chain
END

IF ~~ THEN BEGIN entschluss_fest
SAY ~Damit steht der Entschluss fest.~
IF ~~ THEN GOTO chain_under_arrest_npc_reaction
END

/*
=
~<CHARNAME>, auf Geheiß des Rates steht Ihr unter Arrest. Dunnabar, diese Leute werden in der Zitadelle Gorms in der Bronzemaske hinter verschlossenen Türen gehalten, bis der Rat zu einer Entscheidung gekommen ist.~
IF ~~ THEN REPLY ~Das werde ich nicht hinnehmen. Wenn Ihr meine Hilfe schon nicht annehmt, dann lasst mich wenigstens unverrichteter Dinge wieder von Dannen ziehen!~ GOTO know_too_much
END
*/

IF ~~ THEN BEGIN know_too_much
SAY ~Ihr wisst zu viel über unsere Stadt, und unsere Feinde sind zu zahlreich. Wir können Euch nicht einfach gehen lassen.~
IF ~~ THEN EXTERN ~AC#ELER1~ roam_free
END

IF ~~ THEN BEGIN enuff
SAY ~Genug sei nun geredet, denn genug Geheimnisse sind preisgegeben! Der Vorschlag klingt vernünftig.~
=
~<CHARNAME>, Ihr dürft Euch in der Stadt frei bewegen, aber sie nicht verlassen. Nutzt diese Gelegenheit weise, denn der Wächter unter dem Berg wird Euch bei jedem Eurer Schritte beobachten.~
IF ~~ THEN EXTERN ~AC#ELER1~ sorry_for_that
END

IF ~~ THEN BEGIN wise_decision
SAY ~Eine weise Entscheidung. Die Ratssitzung ist hiermit beendet. Ich schlage vor, dass sich jedes der geschätzten Mitglieder Gedanken macht, wie wir mit der jetzigen Lage umgehen werden. Sobald wieder Verhandlungsbedarf besteht, werden wir wie üblich Boten zu den einzelnen Zitadellen schicken und eine neue Versammlung einberufen.~
IF ~~ THEN + chain_council_finished_01
END

IF ~~ THEN BEGIN dunnabar_arrest
SAY ~Die Beratung ist beendet.~
=
~Dunnabar, geleitet Ihr Bitte <CHARNAME> nach draußen?~
IF ~~ THEN EXTERN ~AC#DUN01~ bring_him_out
END

IF ~True()~ THEN BEGIN hello_true
SAY ~Nicht jetzt, <PRO_RACE>.~
IF ~~ THEN EXIT 
END

// ---------------------------------------------
// Elern
// ALTES ENDE MIT VARIABLE!
// DO ~SetGlobal("AC#RegencyQuest","GLOBAL",1)~ EXIT
// ---------------------------------------------

BEGIN AC#ELER1  // Elern

IF ~~ THEN BEGIN elern_driftdisquest_01
SAY ~In der Tat, Ratsherr Gromi. <CHARNAME>, ich hatte mich mit der Frage beschäftigt, wie Ihr wieder zurück an die Oberfläche gelangen könntet.~
IF ~~ THEN REPLY ~Das hatte ich mich auch schon gefragt.~ GOTO elern_driftdisquest_02 
IF ~~ THEN REPLY ~Ihr wollt mich schon wieder loswerden?~ GOTO elern_driftdisquest_get_ridof
END

	IF ~~ THEN BEGIN elern_driftdisquest_get_ridof
	SAY ~Nein, nein! So war das nicht gemeint.~
	IF ~~ THEN GOTO elern_driftdisquest_02 
	END
	
		IF ~~ THEN BEGIN elern_driftdisquest_02
		SAY ~Also passt auf. Unsere Gelehrten und Baumeister meinen, dass Ihr den Schacht, der offensichtlich an die Oberfläche führt, weder mit Leitern noch durch einfache Magie wieder hinaufgelangen könnt. Allerdings hatte meine Mutter, Dorna Abgrundlied, einen anderen Einfall.~
		IF ~~ THEN REPLY ~Was für ein Einfall ist das?~ GOTO elern_driftdisquest_03
		IF ~~ THEN REPLY ~Erzählt mir mehr.~ GOTO elern_driftdisquest_03
		IF ~~ THEN REPLY ~Das klingt interessant.~ GOTO elern_driftdisquest_03
		END
		
			IF ~~ THEN BEGIN elern_driftdisquest_03
			SAY ~Genaueres kann ich Euch leider auch nicht sagen. Doch wenn Ihr in Erwägung zieht, wieder an die Oberfläche zurück zu reisen - und auf demselben Wege wieder hier herunter - so solltet Ihr meine Mutter Dorna in dem Tempel Dugmarens aufsuchen. Ihr findet den Tempel in der Halle der Runensteine, an einer Tür unter den Werkstätten der Tiefengnome.~
			IF ~~ THEN DO ~SetGlobal("AC#Return_to_Surface","GLOBAL",1)
			AddJournalEntry(@63001,QUEST)~ EXTERN ~AC#GROM1~ gromi_driftdisquest_02 
			END

IF ~~ THEN BEGIN who_else_illithids
SAY ~Wer sonst könnte denn hinter alldem hier stecken?.~ 
IF ~~ THEN REPLY ~Jemand, der Gedankenschinder genauso wenig leiden kann wie Euch.~ EXTERN ~AC#STUR1~ no_one_likes_illithids
END

IF ~~ THEN BEGIN elern_houseguard
SAY ~Mit Verlaub, Ruvan, hier geht es aber nicht um eine Fahrt in die Schlacht, sondern darum, heimlich und verstohlen unserer Stadt zu helfen!~
IF ~~ THEN EXTERN ~AC#GROM1~ enough_sailors_barakuir
END

IF ~~ THEN BEGIN sailors_boat
SAY ~Ich werde einige der Anhänger Dugmarens fragen, die diese Aufgabe sicher begeistert übernehmen werden. Sie könnten gleichzeitig noch die Gegend kartografieren.~
IF ~~ THEN EXTERN ~AC#RUVA1~ sailors_boat_notdugmaren
END 

IF ~~ THEN BEGIN elern_no_way_talk_to_sorni_again
SAY ~Ich kann Euch gut verstehen, aber in diesem Falle ist es schon wichtig, dass Ihr persönlich mit Sorni redet. Vielleicht kann sie das Boot auf Eure Größe und Gewicht besser einstellen, dass es nicht so leicht kentert.~
IF ~~ THEN REPLY ~Also gut, wenn es unbedingt notwendig ist, werde ich eben erneut mit Sorni reden.~ EXTERN ~AC#GROM1~ gromi_boat_talk_to_sorni
END

IF ~~ THEN BEGIN barakuir_sorry
SAY ~Entschuldigt bitte dieses Vorpreschen meines Onkels, <CHARNAME>. Es ist nur so, dass kein Zwerg Shanatars jemals wieder seinen Fuß auf den unheiligen Boden der Duergar setzen würde.~
=
~Viele meiner Clanbrüder haben Angst, allein dadurch selbst zu einem Grauzwerg zu werden.~
IF ~~ THEN EXTERN ~AC#GROM1~ barakuir_enough_elern
END 
// OLD
/*
IF ~~ THEN BEGIN barakuir_right
SAY ~Auch wenn mich der Gedanke daran graust, könnte der Vorschlag Gromis wirklich die beste Entscheidung sein. Die Wege an diesen Ort sind schon seit langer Zeit vergessen und verloren, aber mein Clan könnte in der Abgrundliedhalle Aufzeichnungen darüber haben.~
=
~Ich schlage vor, dass <CHARNAME> meiner Familie in der Bibliothek Dugmarens einen Besuch abstattet.~
IF ~~ THEN EXTERN ~AC#GROM1~ ask_bettargh_barakuir
END
*/

IF ~~ THEN BEGIN you_could_try_runestone
SAY ~Ihr könntet es ja auch gern selbst einmal versuchen, Ruvan. Denkt Ihr, Ihr hättet mehr Erfolg? Ihr wagt es doch noch nicht einmal, weil Ihr fürchtet, Euch von dem Hohen Omlar den Bart stutzen zu lassen!~
IF ~~ THEN EXTERN ~AC#GROM1~ enough_turbaern
END 

IF ~~ THEN BEGIN we_know_turbaern_dislikes_rc
SAY ~Was hattet Ihr erwartet? Dass er <CHARNAME> den Siegelstein aushändigt, nur weil wir ihn schicken? Wir wissen doch alle, dass Turbaern den Regentschaftsrat nicht leiden kann.~ 
IF ~~ THEN EXTERN ~AC#STUR1~ turbaern_damages_city
END

IF ~~ THEN BEGIN patrol_good_luck
SAY ~Viel Glück, <CHARNAME>!~
IF ~~ THEN EXTERN ~AC#GROM1~ patrol_open_doors
END 

IF ~~ THEN BEGIN listen
SAY ~Hört Euch doch wenigstens einmal an, was <PRO_HESHE> zu sagen hat!~
=
~Entschuldigt das Auftreten der anderen Ratsmitglieder, <CHARNAME>. Ich bin sicher, es gibt einen guten Grund, dass Ihr uns hier aufsucht.~
  IF ~~ THEN REPLY ~Ich bin <CHARNAME>. Ich habe den weiten Weg von der Oberfläche bis hierher zurückgelegt, um Euch bei der Suche nach dem Grund für Euren schlafenden König zu helfen.~ EXTERN ~AC#CHEM1~ longway_down
END

IF ~~ THEN BEGIN they_made_it
SAY ~Dann haben sie es also tatsächlich geschafft!~ 
IF ~~ THEN EXTERN ~AC#STUR1~ elern_knows_it
END

IF ~~ THEN BEGIN fate
SAY ~Wie auch immer, Beldas scheint <CHARNAME> derart vertraut zu haben, dass er <PRO_HIMHER> die Sorgen unserer Stadt anvertraut hat. Er hat Euch gefunden, <PRO_RACE>, er hatte Euch überzeugt, sich ihm anzuschließen und das Buch zurück nach Iltkazar zu bringen. Warum hat das Schicksal eine derart schreckliche Wendung genommen, nachdem Ihr Euch gefunden hattet?~
  IF ~~ THEN REPLY ~Beldas suchte nach einem Weg zurück ins Unterreich. Wir erklommen einen Berg, auf dem eine Festung des alten Shanatar liegt.~ EXTERN ~AC#VRON1~ runedar
END

IF ~~ THEN BEGIN all_dwarves_vanished
SAY ~... der alle unsere Zwerge vernichtet hat. Ein grausames Schicksal.~
IF ~~ THEN EXTERN ~AC#GROM1~ could_defeat_dragon
END

IF ~~ THEN BEGIN what_uncle
SAY ~Wie bitte, Onkel Sturvis? Bei Moradin, ich glaube, ich habe mich verhört! Diese Leute kommen hierher, um uns zu helfen, und Ihr wollt Sie einsperren?~
  IF ~~ THEN REPLY ~Einen derart unhöflichen Empfang hatte ich nun wirklich nicht erwartet.~ EXTERN ~AC#CHEM1~ antrag_sturvis
  IF ~~ THEN REPLY ~Genau deshalb bin ich hergekommen! Ich wollte mich schon immer einmal in einer Stadt im Unterreich einsperren lassen.~ EXTERN ~AC#CHEM1~ antrag_sturvis
  IF ~~ THEN REPLY ~In Bezug auf Gastfreundschaft sind Eure Vettern an der Oberfläche Fremden gegenüber deutlich aufgeschlossener.~ EXTERN ~AC#CHEM1~ antrag_sturvis
  IF ~~ THEN REPLY ~Ach, wisst Ihr, ich war schon so oft irgendwo eingesperrt, da kommt es auf dieses eine Mal wirklich nicht mehr an.~ EXTERN ~AC#CHEM1~ antrag_sturvis
END

IF ~~ THEN BEGIN roam_free
SAY ~Dann lasst <CHARNAME> sich wenigstens in der Stadt frei bewegen. Unter König Mith Barak war diese Stadt schon immer ein Ort der Gastfreundschaft inmitten der Schrecken des Unterreiches. Seit wann tretet Ihr unsere Gastfreundschaft derart mit Füßen?~
IF ~~ THEN EXTERN ~AC#FENY1~ spy_more
END

IF ~~ THEN BEGIN sorry_for_that
SAY ~Es tut mir leid, dass ich nicht mehr herausholen konnte, <CHARNAME>. Bitte macht jetzt keine Dummheiten, denn bei dem leisesten Widerstand werdet Ihr in das Gefängnis der Stadt geworfen werden.~
  IF ~~ THEN REPLY ~Ich werde mich dem Entschluss des Rates beugen.~ EXTERN ~AC#GROM1~ wise_decision
  IF ~~ THEN REPLY ~Was für eine Wahl habe ich denn? Gut, ich willige ein und werde meine guten Absichten beweisen.~ EXTERN ~AC#GROM1~ wise_decision
  IF ~~ THEN REPLY ~Macht, was Ihr wollt! Ich bin froh, wenn ich Eure verfluchte Stadt so schnell wie möglich wieder verlassen kann!~ EXTERN ~AC#GROM1~ wise_decision
END

IF ~~ THEN BEGIN for_the_king
SAY ~Auf unseren weisen Herrscher.~
  IF ~~ THEN REPLY ~Auf König Mithbarak.~ EXTERN ~AC#GROM1~ dunnabar_arrest
  IF ~~ THEN REPLY ~Und weiter?~ EXTERN ~AC#GROM1~ dunnabar_arrest
  IF ~~ THEN REPLY ~Ach, rutscht mir doch alle den Buckel herunter!~ EXTERN ~AC#GROM1~ dunnabar_arrest
END

IF ~~ THEN BEGIN vronia_is_busy
SAY ~Vronia lässt sich entschuldigen, da sie mit einer wichtigen anderen Angelegenheit beschäftigt ist.~
IF ~~ THEN EXTERN ~AC#GROM1~ vronia_is_busy_02 
END

IF ~True()~ THEN BEGIN hello_true
SAY ~Seid gegrüßt, <CHARNAME>. Der Regentschaftsrat wartet auf Eure Berichte.~
IF ~~ THEN EXIT 
END

// ---------------------------------------------
// Sturvis
// ---------------------------------------------

BEGIN AC#STUR1  // Sturvis

IF ~~ THEN BEGIN no_one_likes_illithids
SAY ~Das trifft auf so ziemlich auf jede Rasse des Unterreiches zu.~
IF ~~ THEN REPLY ~Die Illithiden vermuten, dass unser Gegner gar nicht aus dem Unterreich kommt.~ + why_not_from_underdark
END

// Party Has Ellhimar
	IF ~~ THEN BEGIN why_not_from_underdark
	SAY ~Und wie kommen sie darauf?~
	IF ~~ THEN REPLY ~Sie haben Euch schon länger beobachtet, als Ihr es Euch vorstellen könnt. Und sie haben mir jemanden ausgehändigt. Seht her, wen ich bei mir habe!~ EXTERN ~AC#GROM1~ who_is_this_lay_down
	END

IF ~~ THEN BEGIN barakuir_calm_yourself
SAY ~Beruhigt Euch, meine Liebe. Dies sind doch nichts als Schauergeschichten. <CHARNAME> wird damit mit Leichtigkeit fertig.~
IF ~~ THEN REPLY ~Ihr erwartet also von vorneherein, dass ich diese Überfahrt auf mich nehme?~ EXTERN ~AC#ELER1~ barakuir_sorry
END

/* bad news twice? CHECK!!!
IF ~~ THEN BEGIN bad_news
SAY ~Das sind schlimme Neuigkeiten, die diese Fremden von der Oberfläche hier überbringen. Der Rat muss über das weitere Vorgehen in den nächsten Tagen eingehend beraten. Dies sind schwere Zeiten, und wir sollten jetzt keine leichtfertigen Entscheidungen treffen, die wir dann später bereuen könnten. Meine verehrten Ratsmitglieder, ich beantrage, dass wir die Versammlung  vertagen und diese Gruppe solange unter Arrest stellen.~
IF ~~ THEN EXTERN ~AC#ELER1~ what_uncle
END
*/

IF ~~ THEN BEGIN travel_to_XY
SAY ~Ihr wollt <CHARNAME> nach...~
IF ~~ THEN EXTERN ~AC#GROM1~ dont_talk_about_duergar_here
END

IF ~~ THEN BEGIN turbaern_damages_city
SAY ~Damit schadet er aber unserer Stadt!~
IF ~~ THEN EXTERN ~AC#TORT1~ turbaern_has_his_reasons
END

IF ~~ THEN BEGIN illithid_face_01
SAY ~Wieder die *caradhak*! Meister Gromi, die Illithiden haben sich gegen unsere Stadt verschworen!~
IF ~~ THEN EXTERN ~AC#GROM1~ illithid_face_02
END

IF ~~ THEN BEGIN illithid_01
SAY ~Verdammte 'caradhak'!~
IF ~~ THEN EXTERN ~AC#FENY1~ illithid_02
END

IF ~~ THEN BEGIN elern_knows_it
SAY ~Ihr wusstet davon, dass einige aus der Stadt an die Oberfläche aufgebrochen sind, Elern? Nun, <CHARNAME>, Ihr scheint in der Tat viel über uns zu wissen. Nur wissen wir wenig über Euch oder Eure Beweggründe.~
IF ~~ THEN EXTERN ~AC#VRON1~ nothing_evil
END

IF ~~ THEN BEGIN heard_candlekeep
SAY ~Von dieser Bibliothek habe ich schon einmal gehört. Mein Bruder Bettargh sollte in unserer Halle der Runensteine mehr über diesen Ort in Erfahrung bringen können.~
IF ~~ THEN EXTERN ~AC#GROM1~ what_dwarf
END

IF ~~ THEN BEGIN book_01
SAY ~Ein Buch? Auf diesen Gedanken kann sie nur mein Vetter Bettargh gebracht haben. Was für ein Buch sollte das denn sein?~
IF ~~ THEN REPLY ~Es heißt "Die Astrale See, ein Reisebericht in das Reich aus Silber von Maskyr dem Einäugigen."~ EXTERN ~AC#CHEM1~ mit_so_etwas
END

IF ~~ THEN BEGIN bad_news
SAY ~Das sind schlimme Neuigkeiten, die diese Fremden von der Oberfläche hier überbringen. Der Rat muss über das weitere Vorgehen in den nächsten Wochen eingehend beraten. Dies sind schwere Zeiten, und wir sollten jetzt keine leichtfertigen Entscheidungen treffen, die wir dann später bereuen könnten.~
= 
~Meine verehrten Ratsmitglieder, ich beantrage, dass wir die Versammlung vertagen und diese Gruppe solange unter Arrest stellen.~
IF ~~ THEN EXTERN ~AC#ELER1~ what_uncle
END

IF ~~ THEN BEGIN runecaster
SAY ~Ihr wisst als unsere Runenwirkerin  selbst am Besten, dass die Runen mit jedem Tag, den unser König schläft, schwächer werden, Vrona.~
IF ~~ THEN EXTERN ~AC#GROM1~ enuff
END

IF ~True()~ THEN BEGIN hello_true
SAY ~Der Rat befasst sich mit wichtigen Angelegenheiten, <CHARNAME>. Ihr solltet dankbar sein, dass Ihr hier Gehör findet.~
IF ~~ THEN EXIT 
END

// ---------------------------------------------
// Turbaern in ACIL62
// ---------------------------------------------

BEGIN AC#TURB8  // Turbaern Ghalmrin

IF ~Global("AC#Ruvan_Treason","GLOBAL",4)~ THEN BEGIN charname_has_not_stolen_hammer
SAY ~Nein, <PRO_HESHE> hat ihn NICHT gestohlen! Der Hammer wurde <CHARNAME> von Dumathoin überlassen, um <PRO_HIMHER> die Flucht aus Barakuir zu ermöglichen.~
IF ~~ THEN EXTERN ~AC#GROM1~ chain_gromi_turbaern_01
END

IF ~~ THEN BEGIN know_about_spiderstalkings
SAY ~Es gibt einen Grund, weshalb König Mith Barak wollte, dass dieser Ort für alle Ewigkeit versiegelt bleiben möge. Auch wenn ich nicht glaube, dass Ellhimar sein jetziger Zustand in den Spinnenschächten widerfahren ist, so ist doch gut möglich, dass er dort auf etwas gestoßen ist, welches ihn in die Fänge der Illithiden getrieben hat.~
IF ~~ THEN EXTERN ~AC#GROM1~ question_and_answer
END

IF ~~ THEN BEGIN turbaern_drow_possible
SAY ~Es gibt nur einen Weg, dies herauszufinden. <CHARNAME>, hier ist der Schlüsselstein für den Zugang in die Spinnenschächte.~
IF ~~ THEN REPLY ~Ihr gebt ihn mir jetzt einfach so? Das letzte Mal wolltet Ihr ihn mir nicht aushändigen.~ + give_key_spiderstalkings
END

	IF ~~ THEN BEGIN give_key_spiderstalkings
	SAY ~Nein. Ich wollte ihn *dem Rat* nicht geben. Ihr habt Euren Wert für die Stadt mehr als einmal unter Beweis gestellt, <CHARNAME>. Hier, nehmt ihn.~
	IF ~~ THEN DO ~GiveItemCreate("AC#KY1",Player1,1,0,0)~ + turbaern_gromi_regencycouncil
		END
		
		IF ~~ THEN BEGIN turbaern_gromi_regencycouncil
		SAY ~Und bei allem Respekt, Gromi, aber dies ist nicht mehr die Zeit für lange Debatten im Regentschaftsrat.~
		IF ~~ THEN EXTERN ~AC#GROM1~ turbaern_gromi_regencycouncil_02
		END
		
		IF ~~ THEN BEGIN no_more_regency_council
		SAY ~Lasst uns die alte Fehden beiseite legen. Und unser Volk braucht unseren König! Lasst uns die Hallen zum Thronsaal wieder öffnen.~
		IF ~~ THEN EXTERN ~AC#GROM1~ turbaern_open_throneroom
		END
		
		IF ~~ THEN BEGIN turbaern_what_to_do_with_hammer
		SAY ~Dies muss <CHARNAME> entscheiden. Da <PRO_HIMHER> der Hammer von Dumathoin überlassen wurde, kann <PRO_HESHE> ihn solange schwingen, bis sich Dumathoin einen anderen Träger wünscht. Oder <PRO_HESHE> legt ihn wieder auf seinen angestammten Platz im Tempel zurück. Was sagt Ihr, <CHARNAME>?~
		IF ~~ THEN REPLY ~Ich würde ihn gerne behalten.~ + keep_hammer
		IF ~~ THEN REPLY ~Ich brauche ihn nicht mehr und würde ihn wieder dem Tempel zur Verfügung stellen.~ + give_hammer
		END
		
			IF ~~ THEN BEGIN keep_hammer
			SAY ~So sei es denn. Führt ihn mit Stolz.~
			IF ~~ THEN GOTO already_have_key_to_spiderstalkings
			END
			
			IF ~~ THEN BEGIN give_hammer
			SAY ~Eine weise Entscheidung. Ich werde ihn also in Eurem Namen zurücklegen.~
			IF ~~ THEN DO ~TakePartyItem("AC#HADUM")~ GOTO already_have_key_to_spiderstalkings
			END
			
				IF ~~ THEN BEGIN already_have_key_to_spiderstalkings
				SAY ~Den Schlüsselstein zu den Spinnenschächten habe ich Euch ja bereits übergeben. Sucht diesen ungastlichen Ort auf - vielleicht kommen wir damit dem Rätsel unseres schlafenden Königs wieder ein Stück näher.~
				IF ~~ THEN EXTERN ~AC#DUN01~ dunnabar_go_to_king
				END
		
// ---------------------------------------------
// Ruvan
// ---------------------------------------------

BEGIN AC#RUVA1  // Ruvan


IF ~~ THEN BEGIN charname_has_dumathoins_hammer
SAY ~Das könnt Ihr nicht tun! <CHARNAME> ist die Person, die Euch hinters Licht führen will! Seht, <PRO_HESHE> trägt sogar den Hammer Dumathoins! Den hat <PRO_HESHE> aus den heiligen Hallen Dumathoins gestohlen!~
IF ~~ THEN REPLY ~Der Hammer war meine Rettung. Er erschien vor mir, als ich feststellen musste, dass die Boote verschwunden waren.~ + hammer_appeared
END

	IF ~~ THEN BEGIN hammer_appeared
	SAY ~Was für eine dreiste Lüge! Niemandem von der Oberfläche wäre es gestattet, diesen Hammer zu führen! Glaubt mir, <PRO_HESHE> hat ihn gestohlen!~
	IF ~~ THEN DO ~SetGlobal("AC#Ruvan_Treason","GLOBAL",3)												
	~ EXIT
	END
	
IF ~~ THEN BEGIN charname_had_no_chance
SAY ~Meine Männer versuchten noch, <CHARNAME> freizuschaufeln, doch alle Mühe war vergebens - <PRO_HESHE> war augenblicklich tot. Sie richteten <PRO_HIMHER> ein Grab aus Stein ein und machten sich sodann schweren Herzens auf den Rückweg in unsere Stadt.~
IF ~~ THEN REPLY ~Ich muss schon sagen, von allen Geschichten, die ich bisher über meinen Tod gehört habe, ist dies mit Abstand die Rührseligste.~ + c_c_charnames_alive
END

	IF ~~ THEN BEGIN c_c_charnames_alive
	SAY ~W-w-was? W-wie ist das möglich? Ihr lebt?~
	IF ~~ THEN REPLY ~Ich würde von Euch eher gerne wissen, wie es möglich ist, dass Ihr mich für tot haltet!~ + why_do_you_think_i_am_dead
	END
	
		IF ~~ THEN BEGIN why_do_you_think_i_am_dead
		SAY ~M-meine Männer! Sie haben mich falsch informiert! Sie haben Euch zurückgelassen! So eine Feigheit muss mit dem Tod bestraft werden. Ich werde sie umgehend hinrichten lassen!~
		IF ~~ THEN REPLY ~Und damit wichtige Zeugen ausschalten? Eure Leute haben Hathar gegenüber schon zugegeben, dass sie von Euch angehalten wurden, mich in Barakuir zurückzulassen, sobald ich ihnen den Rücken zugekehrt habe.~ + chain_accusation
		END

IF ~~ THEN BEGIN ruvan_boat_one_word_02
SAY ~Dies ist nicht für die Ohren von Außenstehenden bestimmt und geht nur die Ratsmitglieder etwas an.~
IF ~~ THEN EXTERN ~AC#GROM1~ end_pc_talk_sorni_boat
END
					
IF ~~ THEN BEGIN boat_one_word
SAY ~Auf ein Wort noch, liebe Ratsmitglieder.~
IF ~~ THEN EXTERN ~AC#GROM1~ gromi_boat_one_word
END

IF ~~ THEN BEGIN sailors_boat_notdugmaren
SAY ~Mit Verlaub, Mädchen, aber das sind alles keine Krieger! Ich werde eine Mannschaft der fähigsten Kämpfer meines Hauses stellen, die diese Aufgabe mit Hingabe erfüllen werden!~
IF ~~ THEN EXTERN ~AC#ELER1~ elern_houseguard
END

IF ~~ THEN BEGIN boat_azerkyn_lets_try
SAY ~Lasst es uns doch einfach ausprobieren! Mehr Möglichkeiten haben wir ohnehin nicht.~
IF ~~ THEN REPLY ~Was ist das zwergische Wort für Versuchskaninchen?~ EXTERN ~AC#FENY1~ boat_azerkyn_fenyl
IF ~~ THEN REPLY ~Bedaure, aber ich bin nicht an einem Himmelfahrtskommando - oder wie immer Ihr das hier unten nennt - interessiert.~ EXTERN ~AC#FENY1~ boat_azerkyn_fenyl
IF ~~ THEN REPLY ~Vergesst es. Ich bin doch nicht den ganzen Weg bis hierher gegangen, um dann in einem unterirdischen See zu ertrinken!~ EXTERN ~AC#FENY1~ boat_azerkyn_fenyl
END

IF ~~ THEN BEGIN why_trust_charname
SAY ~Und wieder einmal zeigt sich, dass wir unser Schicksal nicht diesem <PRO_RACE> von der Oberfläche anvertrauen sollten! Wer sagt denn, dass <PRO_HESHE> es überhaupt versucht hat, Ghalmrin den Siegelstein abzunehmen?~
IF ~~ THEN EXTERN ~AC#ELER1~ you_could_try_runestone
END

IF ~~ THEN BEGIN take_runestone_from_turbaern
SAY ~Dann werden wir uns eben den Siegelstein von ihm mit Hilfe der Wache holen!~
IF ~~ THEN EXTERN ~AC#VRON1~ turbaern_no_guard
END

IF ~~ THEN BEGIN patrol_dead_03
SAY ~Das waren sicher die verfluchten Drow!~
IF ~~ THEN REPLY ~In der Tat musste ich gegen eine Drowpatrouille vor den Toren Iltkazars kämpfen. In der Höhle befand sich jedoch noch etwas anderes - die abgeschlagenen Köpfe von Illithiden - und ein seltsames Symbol auf dem Boden.~ EXTERN ~AC#STUR1~ illithid_01
END

IF ~~ THEN BEGIN vergadain
SAY ~Bei Vergadain! Das kann nicht sein! Es ist eines der bestgehüteten Geheimnisse unserer Stadt! Wer hat es Euch gesagt?~
IF ~~ THEN REPLY ~Ich habe einige Eurer Bewohner an der Oberfläche getroffen, die dort nach Hilfe suchten.~ EXTERN ~AC#ELER1~ they_made_it
END

IF ~~ THEN BEGIN allvater
SAY ~Bei dem Allvater!~
IF ~~ THEN EXTERN ~AC#TORT1~ moradin_soul
END

IF ~~ THEN BEGIN piece_of_paper
SAY ~Anstelle dieses Stück Papiers interessiert mich vielmehr, wie es dazu kommen konnte, dass unser Beldas Euch aufgesucht hat und nun nicht mehr am Leben ist.~
IF ~~ THEN REPLY ~Beldas hörte in Kerzenburg von mir, und ich habe den Eindruck, dass er schon vorher von meiner Existenz gewusste haben musste.~ EXTERN ~AC#FENY1~ why_one_of_us
END

IF ~True()~ THEN BEGIN hello_true
SAY ~Nicht jetzt, <PRO_RACE>!~
IF ~~ THEN EXIT 
END
// ---------------------------------------------
// Fenyl
// ---------------------------------------------

BEGIN AC#FENY1  // Fenyl


IF ~~THEN BEGIN so_it_is_true_about_mindflayers
SAY ~Also ist es wahr! Die *caradhak* sind für die Angriffe und unsere Misere verantwortlich!~
IF ~~ THEN REPLY ~Nein. Ich traf einige ihrer Vertreter, die nicht gegen mich kämpfen wollten. Auch die Gedankenschinder werden von einem bisher unbekannten Feind gejagt.~ + illithids_not_responsable
END

	IF ~~THEN BEGIN illithids_not_responsable
	SAY ~Die Illithiden sind also nicht die Schuldigen?~
	IF ~~ THEN REPLY ~So, wie es aussieht, nicht.~ EXTERN ~AC#ELER1~ who_else_illithids
	END

IF ~~THEN BEGIN boat_azerkyn_fenyl
SAY ~Wem unterstehen denn die Boote und wer konstruiert sie, Meister Gromi?~
IF ~~ THEN EXTERN ~AC#GROM1~ gromi_boat_sorni
END

IF ~~THEN BEGIN illithid_02
SAY ~Illithiden so nahe vor unseren Häusern! Wie sollen wir weiter verfahren, Meister Gromi?~
IF ~~ THEN EXTERN ~AC#GROM1~ what_next_01
END

IF ~~THEN BEGIN bad_things
SAY ~Das sind schlimme Dinge, von denen Ihr hier berichtet. Wie sind sie gestorben?~
IF ~~ THEN REPLY ~Sie wurden von einem Drachen getötet.~ EXTERN ~AC#CHEM1~ gorm
END

IF ~~THEN BEGIN why_one_of_us
SAY ~Warum sollte sich einer der Unseren für einen <PRO_RACE> wie Euch von der Oberfläche interessieren?~
IF ~~ THEN REPLY ~Mithbarak dachte wohl, dass ich ihm irgendwie helfen könnte.~ EXTERN ~AC#TORT1~ not_born
END

IF ~~THEN BEGIN gorm_bless_us
SAY ~Gorm beschütze uns! Ein Drache in der Nähe unserer Stadt!~
IF ~~ THEN EXTERN ~AC#GROM1~ calm_dear
END

IF ~~THEN BEGIN spy_more
SAY ~Damit er uns dann noch mehr auskundschaften kann?~
IF ~~ THEN EXTERN ~AC#VRON1~ elern_is_right
END

IF ~True()~ THEN BEGIN hello_true
SAY ~Wenn Ihr etwas zu bereden habt, sprecht mit Gromi Arnschädel.~
IF ~~ THEN EXIT 
END
// ---------------------------------------------
// Chemcol
// ---------------------------------------------

BEGIN AC#CHEM1  // Chemcol

IF ~~THEN BEGIN barakuir_lake
SAY ~Berronar beschütze uns! Unter diesem *dunglor* soll sich allerhand Getier herumtreiben! Ich hörte von dämonischen Rochen, Abolethen und Schlimmerem!~
IF ~~ THEN EXTERN ~AC#STUR1~ barakuir_calm_yourself
END 

IF ~~THEN BEGIN send_charname_through_mirror
SAY ~Oh, ich habe einen Einfall! Sollen wir <CHARNAME> durch den Spiegel schicken?~
IF ~~ THEN EXTERN ~AC#VRON1~ checked_mirror_no_way
END 

IF ~~THEN BEGIN turbaern_wont_give_runestone
SAY ~Was für eine bodenlose Unverschämtheit!~
IF ~~ THEN EXTERN ~AC#ELER1~ we_know_turbaern_dislikes_rc
END 

IF ~~THEN BEGIN turbaern_dont_like_council
SAY ~Wir wissen alle, dass der Hohe Omlar auf den Regentschaftsrat nicht gut zu sprechen ist.~
IF ~~ THEN EXTERN ~AC#GROM1~ better_pcs_talk_to_turbaern
END

IF ~~THEN BEGIN patrol_dead_02
SAY ~Bei den Göttern - sie sind tot? Habt Ihr einen Anhalt, wer sie getötet haben könnte?~
IF ~~ THEN EXTERN ~AC#RUVA1~ patrol_dead_03
END

IF ~~THEN BEGIN longway_down
SAY ~Wie wunderbar. Seht Ihr, schon an der Oberfläche redet man über den Fluch, der über unsere Stadt hereingebrochen ist.~
IF ~~ THEN EXTERN ~AC#RUVA1~ vergadain
END

IF ~~THEN BEGIN xothor
SAY ~Die verrückten Xothor sind also tatsächlich an die Oberfläche gelangt! Wo sind sie jetzt?~
IF ~~ THEN REPLY ~Ich bedaure, Euch mitteilen zu müssen, dass sie alle tot sind.~ EXTERN ~AC#RUVA1~ allvater
END

IF ~~THEN BEGIN gorm
SAY ~Gorm beschütze uns! Wie konnte es nur soweit kommen?~
IF ~~ THEN REPLY ~Eure Gefährten hatten wohl einen Weg an die Oberfläche gefunden, konnten aber nicht mehr auf demselben Wege zurück. Sie besuchten meine alte Heimat, Kerzenburg, um ein Buch zu erlangen, welches Euer König vor seiner... Schlafenszeit suchte.~ EXTERN ~AC#STUR1~ book_01
END

IF ~~THEN BEGIN mit_so_etwas
SAY ~Was wollte unser König denn mit so etwas?~
IF ~~ THEN EXTERN ~AC#GROM1~ only_king_knows
END

IF ~~THEN BEGIN durgarn
SAY ~Norogh durgarn!~
IF ~~ THEN EXTERN ~AC#ELER1~ all_dwarves_vanished
END

IF ~~THEN BEGIN antrag_sturvis
SAY ~Der Antrag von Sturvis vom Clan Abgrundlied klingt vernünftig.~
IF ~~ THEN EXTERN ~AC#TORT1~ torth_agrees
END

IF ~True()~ THEN BEGIN hello_true
SAY ~(Die Zwergin ignoriert Euch.)~
IF ~~ THEN EXIT 
END
// ---------------------------------------------
// Vronia
// ---------------------------------------------

BEGIN AC#VRON1  // Vronia
/*
IF ~~THEN BEGIN illithid_symbol
SAY ~Ich interessiere mich eher für dieses Symbol auf dem Boden.~
IF ~~ THEN EXTERN ~AC#GROM1~ what_next_01
END
*/

IF ~~THEN BEGIN vronia_turbaern_what_do_you_propose
SAY ~Was schlagt Ihr also vor, Hoher Omlar?~
IF ~~ THEN EXTERN ~AC#TURB8~ no_more_regency_council
END

IF ~~THEN BEGIN vronia_ellhimar_drow
SAY ~Da der andere Ellhimar ein Drow war, könnte ich mir schon vorstellen, was - oder besser wen -wir dort vorfinden könnten.~
IF ~~ THEN REPLY ~Ihr meint, dass die Drow hinter allem Stecken?~ EXTERN ~AC#TURB8~ turbaern_drow_possible
END

IF ~~THEN BEGIN checked_mirror_no_way
SAY ~Ich habe den Spiegel schon untersucht. Man kann nicht durch ihn hindurchreisen. Er diente lediglich dazu, Nachrichten aus der Stadt zu schicken.~
IF ~~ THEN EXTERN ~AC#GROM1~ messages_to_illithids
END

IF ~~THEN BEGIN turbaern_no_guard
SAY ~Das werden wir bestimmt nicht.~
IF ~~ THEN EXTERN ~AC#RUVA1~ why_trust_charname
END

IF ~~THEN BEGIN Ellhimar_quest_not_done_yet
SAY ~Ich muss dem Rat einen Vorschlag machen. Es geht um Ellhimar, den menschlichen Magier. Er verhält sich merkwürdig, und ich dachte, dass <CHARNAME> sich seiner einmal annehmen könnte. Mehr möchte ich in diesem Rahmen nicht preisgeben, da ich niemanden vorschnell anklagen will.~
=
~Ich würde jedoch empfehlen, dass wir <CHARNAME> bitten, unseren Gast etwas näher kennenzulernen. Ich würde <HISHER> Ansprechpartner sein. Damit kein Verdacht auf den Rat fällt, würde ich <CHARNAME> bis zum Abschluss der Untersuchung in meinem Haus empfangen.~
IF ~~ THEN EXTERN ~AC#GROM1~ PC_check_Ellhimar
END

IF ~~THEN BEGIN charname_spiderstakings_03
SAY ~Ihr wisst, Gromi, dass der Zugang in die Schächte von unserem Hohen Omlar Turbaern Ghalmrin persönlich versiegelt worden ist. Nur der Priester Dumathoins kann die Siegel, die die Türen verschließen, mit dem passenden Runenstein wieder öffnen.~
IF ~~ THEN EXTERN ~AC#GROM1~ goto_turbaern_01
END

IF ~~THEN BEGIN Ellhimar_spiderstakings
SAY ~Das ist richtig. Wir wissen nicht, wie er dort hereingekommen ist. Aber der Verdacht liegt nahe, dass in dieser alten Mine nicht alles mit rechten Dingen zugeht.~
IF ~~ THEN EXTERN ~AC#GROM1~ charname_spiderstakings_02
END

IF ~~THEN BEGIN nothing_evil
SAY ~Ich sehe keine boshaften Absichten in <PRO_HISHER>en Augen. Lasst uns hören, was <PRO_HESHE> zu sagen hat.~
IF ~~ THEN EXTERN ~AC#GROM1~ charname_bio
END

IF ~~THEN BEGIN runedar
SAY ~Shanatar, darsam runedar.~
=
~Fahrt fort, <PRO_RACE>.~
IF ~~ THEN REPLY ~Beldas hoffte, in der alten Zwergenfestung eine Passage ins Unterreich zu finden, doch als wir auf dem Gipfel ankamen, wartete dort bereits der Drache auf uns.~ EXTERN ~AC#CHEM1~ durgarn
END

IF ~~THEN BEGIN elern_is_right
SAY ~Elern hat Recht. Es wäre nicht der Wunsch unseres Königs, einen Besucher wie einen Gefangenen zu behandeln. Die Runen, mit denen diese Stadt umgeben ist, werden dafür sorgen, dass der <PRO_RACE> keinen Schaden anrichten kann.~
IF ~~ THEN EXTERN ~AC#STUR1~ runecaster
END

IF ~True()~ THEN BEGIN hello_true
SAY ~*Mahal*, <PRO_RACE>. Hier im Ratsgebäude hat Gromi das Sagen. Wendet Euch an ihn, solltet Ihr etwas besprechen müssen.~
IF ~~ THEN EXIT 
END

// ---------------------------------------------
// Torth
// ---------------------------------------------

BEGIN AC#TORT1  // Torth

IF ~~THEN BEGIN boat_azerkyn_too_heavy
SAY ~So sehr ich Euren Einsatz schätze, <CHARNAME>, doch diese Boote sind dafür geschaffen, über einen dichten Lavastrom zu gleiten. Ich fürchte, sie würden im normalen Wasser einfach untergehen.~
IF ~~ THEN EXTERN ~AC#RUVA1~ boat_azerkyn_lets_try
END

IF ~~THEN BEGIN turbaern_has_his_reasons
SAY ~Der Hohepriester wird seine Gründe haben und steht seit jeher über den Entscheidungen des Rates, Sturvis. Dies sollten wir akzeptieren.~
IF ~~ THEN EXTERN ~AC#RUVA1~ take_runestone_from_turbaern
END

IF ~~THEN BEGIN moradin_soul
SAY ~Möge Moradin sich Ihrer in der Seelenschmiede annehmen.~
IF ~~ THEN EXTERN ~AC#FENY1~ bad_things
END

IF ~~THEN BEGIN not_born
SAY ~Bei Abbathors falscher Zunge, mit Eurem spärlichen Flaum statt Bartwuchs scheint Ihr ja noch nicht einmal geboren gewesen zu sein, als Mithbarak in seinen letzten Schlummer fiel!~
IF ~~ THEN EXTERN ~AC#ELER1~ fate
END

IF ~~THEN BEGIN damned
SAY ~Verfluchte Bestie! Wisst Ihr etwas Genaueres über den Wyrm?~
IF ~~ THEN REPLY ~Er schien die Zwerge zu kennen und ihnen aufgelauert zu haben. Ich glaube, er war der Grund, weshalb sie nicht zurück konnten, da er den Ausgang aus dem Unterreich bewachte.~ EXTERN ~AC#FENY1~ gorm_bless_us
END

IF ~~THEN BEGIN torth_agrees
SAY ~Bei Dumathoin, das stimmt. Wir müssen diese Nachrichten erst in Ruhe überdenken, bevor wir weitere Schritte ergreifen werden.~
IF ~~ THEN EXTERN ~AC#GROM1~ abstimmung
END

IF ~True()~ THEN BEGIN hello_true
SAY ~Hmpf.~
IF ~~ THEN EXIT 
END

// ---------------------------------------------
// CHAIN - erster Dialog
// ---------------------------------------------

CHAIN IF WEIGHT #-1 ~Global("AC#RegencyCouncil","ACIL62",2)~ THEN AC#GROM1 1
~...nun, da wir uns über die Erhöhung der Besteuerung der Zardazil-Erzvorkommen geeinigt haben, kommen wir zu der Frage nach der Neuvergabe der Schürfrechte für die Hizaagkur-Minen von Clan Olara.~
DO ~SetGlobal("AC#RegencyCouncil","ACIL62",3)~
== AC#ELER1 ~Bei allem Respekt, Ratsherr Gromi, aber gibt es nicht drängendere Angelegenheiten, die wir besprechen müssten? Die Bedrohung vor den Toren Iltkazars durch die feindlichen Rassen nimmt mit jedem verstrichenen neuen Tag größere Ausmaße an. Wir sollten die Patrouillen in den nördlichen Tunneln verstärken und...~
== AC#STUR1 ~Dies sind Angelegenheiten, die nur unser Monarch entscheiden kann, Elern.~
== AC#ELER1 ~...der, wie Ihr alle wisst, in dem derzeitigen Zustand seines mysteriösen Schlafes keine Entscheidungen treffen kann!~
== AC#RUVA1 ~Ihr seid neu in den Regentschaftsrat aufgenommen worden, Elern. Den anderen Ratsmitgliedern sind die langen Schlafensphasen unseres Königs wohlbekannt, und wir haben uns darauf geeinigt, in diesen Perioden keine grundlegenden Entscheidungen über den Kopf unseres schlafenden Herrschers hinweg treffen zu wollen.~
== AC#ELER1 ~Aber dieses Mal ist er aus seinem fünfundsiebzig Jahre währenden Schlaf nicht erwacht! Seit einem Jahr schon warten wir darauf, dass unser Herr die Augen wieder öffnet, und es geschieht nichts, während sich die Schlinge unserer Feinde um den Hals unserer schönen Stadt langsam zuzieht!~
== AC#FENY1 ~Es reicht, Elern. Ihr solltet Eure Position in diesem Rat achten und die älteren Ratsherren nicht verärgern.~
== AC#GROM1 ~Meine Gattin hat Recht, Ratsherrin Elern. Seit über hundert Jahren stehe ich nun schon dem Regentschaftsrat vor. Überlasst diese Angelegenheit den erfahreneren Ratsherren, die an die Schlafensperioden unseres Monarchen schon gewöhnt sind und wissen, was zu tun ist, bis unser König wieder erwacht.~
== AC#ELER1 ~Aber er ist nicht erwacht, Ratsherr Gromi! Seit einem Jahr schon ist der Sand des Stundenglases verronnen, das eigentlich den Zeitpunkt seines Erwachens anzeigen sollte! Sagt mir, was gedenkt Ihr zu tun, wenn unser Herr nicht mehr erwachen sollte?~
== AC#STUR1 ~Das sind ungeheuerliche Dinge, die Ihr da aussprecht, Elern! Verzeiht das ungeschliffene Benehmen meiner Nichte, Meister Gromi, und kommen wir zurück zu der Frage nach der Vergabe der...~
== AC#DUN01 ~Verehrte Ratsmitglieder, ich kündige den Besuch von <CHARNAME>, eines Vertreters der Rasse <PRO_RACE> von der Oberfläche, an.~
== AC#GROM1 ~Was, <PRO_HESHE> stammt aus der Oberwelt? Mit Leuten dieser Art haben wir seit Langem nichts mehr zu schaffen.~
== AC#FENY1 ~Wie kommt es überhaupt, dass ein <PRO_RACE> von der Oberfläche so einfach in die Stadt und dann noch zu dem Regentschaftsrat vorgelassen wird, Ruvan? Erfüllt Euer Clan seine Aufgaben, die Stadt zu schützen, etwa nicht richtig?~
== AC#RUVA1 ~Ich bin mir sicher, mein Bruder Dunnabar hatte als Herr der Bronzemaske Iltkazars gute Gründe, diese Gruppe zu uns vorzulassen, Fenyl.~
== AC#CHEM1 ~Dann sollten wir Eurem Bruder nun auch wieder befehlen, diesen <PRO_RACE> wieder aus unseren Hallen zu entfernen, Ruvan.~
END
IF ~~ THEN EXTERN ~AC#ELER1~ listen

CHAIN IF ~~ THEN AC#GROM1 arrest_chain
~<CHARNAME> hat uns hier aufgesucht und beunruhigende Nachrichten mitgebracht. Ratsherr Sturvis beantragt, den <PRO_RACE> von der Oberfläche hier unter Arrest zu stellen, bis der Rat die weiteren Schritte geklärt hat. Wie stimmt der Rest des Rates ab?~
== AC#FENY1 ~Ich stimme dafür, den <PRO_RACE> unter Arrest zu stellen.~
== AC#TORT1 ~Ich stimme auch dafür.~
== AC#RUVA1 ~Dafür.~
== AC#CHEM1 ~Dafür.~
== AC#VRON1 ~Ich enthalte mich.~
== AC#ELER1 ~Nun ich...~
END
IF ~~ THEN EXTERN ~AC#GROM1~ entschluss_fest

CHAIN IF ~~ THEN AC#GROM1 chain_council_finished_01
~Ich schließe die Versammlung mit einem Hoch auf unseren König!~
== AC#FENY1 ~Auf unseren König!~
== AC#TORT1 ~Auf uns'ren König!~
== AC#RUVA1 ~Auf Mith Barak, den Silberschild.~
== AC#CHEM1 ~Auf den letzten wahren Herrscher Shanatars!~
== AC#STUR1 ~Auf den Hüter der Berge und Bewahrer des Wissens.~
== AC#VRON1 ~Auf König Mith Barak.~
END
IF ~~ THEN EXTERN ~AC#ELER1~ for_the_king

CHAIN IF ~~ THEN AC#RUVA1 chain_ruvan_treason_01
~Ja, Meister Gromi. Sie haben es mit ihren eigenen Augen gesehen.~
== AC#ELER1 ~Oh nein! Das ist ja schrecklich!~
== AC#TORT1 ~Was für ein Jammer - <PRO_HESHE> war so ein guter <PRO_RACE>!~
== AC#VRON1 ~Seltsam. Meine Runen haben <CHARNAME>s Tod gar nicht vorhergesagt.~
== AC#CHEM1 ~Nun sind wir eben wieder auf uns allein gestellt. Es war falsch, einem Bewohner der Oberfläche unser Schicksal anzuvertrauen.~
== AC#STUR1 ~Ich finde es schade. Zum Schluss mochte ich diesen <PRO_RACE> sogar ganz gerne - zumindest für einen <PRO_RACE>, der von der Oberfläche kommt.~
== AC#FENY1 ~Wir sollten <PRO_HIMHER> zu Ehren eine Statue bei Sorni in Auftrag geben.~
== AC#CHEM1 ~Das ist eine gute Idee! Nur nicht zu teuer sollte es sein, wer weiß, wofür wir die Metalle noch benötigen.~
== AC#ELER1 ~Habt Ihr denn nichts Besseres zu tun, als über eine Statue nachzudenken? Ruvan, haben Eure Männer Euch berichtet, wie... <CHARNAME> gestorben ist?~
== AC#RUVA1 ~Die Höhlendecke ist über Ihnen zusammengebrochen und hat sie alle unter sich begraben.~
END
IF ~~ THEN EXTERN ~AC#RUVA1~ charname_had_no_chance

CHAIN IF ~~ THEN AC#RUVA1 chain_accusation
~Das sind unerhöhrte Anschuldigungen!~
== AC#CHEM1 ~In der Tat! Ich verlange, dass sich <CHARNAME> bei meinem Mann entschuldigt!~
== AC#DUN01 ~Ich glaube Euch kein Wort, Bruder! Es ist so offensichtlich, dass Ruvan vom Clan Steinschulter <CHARNAME> in Barakuir beseitigen wollte! Er bringt Schande über seinen Clan!~
== AC#RUVA1 ~Was redet Ihr da? Ich wollte doch nur das Beste für die Stadt!~
== AC#GROM1 ~Ruvan vom Clan Steinschulter, die Beweise gegen Euch wiegen so schwer wie ein ganzer Sack voll Adamant. Ich schließe Euch und Eure Frau vorerst aus dem Rat aus, bis die Umstände geklärt sind.~
== AC#RUVA1 ~Ihr wollt... WAS? Nach allem, was ich für Euch getan habe? Wisst Ihr, wieviel Juwelen ich Euch...~
== AC#FENY1 ~Dies spielt alles keine Rolle mehr, Ruvan. Ihr habt uns absichtlich hinters Licht geführt.~
== AC#ELER1 ~Und Ihr wolltet <CHARNAME> beseitigen.~
== AC#STUR1 ~Dass Ihr aus niederen Motiven einen <PRO_RACE> umbringen wolltet, ist für einen Vertreter unserer Stadt eine Schande!~
== AC#TORT1 ~Ich sage, wir sperren ihn vorerst ins Gefängnis. Es gibt drängendere Probleme, als mit so einem Abschaum zu verhandeln.~
END
IF ~~ THEN EXTERN ~AC#RUVA1~ charname_has_dumathoins_hammer

CHAIN IF ~~ THEN AC#GROM1 chain_gromi_turbaern_01
~Turbaern?~
== AC#TURB8 ~Ja, hier bin ich, und ich sehe, gerade zur rechten Zeit!~
== AC#CHEM1 ~Ihr seid kein Mitglied des Regentschaftsrates, Turbaern vom Clan Ghalmrin!~
== AC#TURB8 ~Ich wollte auch nie eins sein!~
= ~Der Rat hat seine Aufgabe nicht erfüllt! Er sollte Iltkazar durch die schweren Stunden führen, stattdessen hätte er die Stadt fast in den Abgrund geführt!~
== AC#FENY1 ~Dies sind harte Worte, Turbaern.~
== AC#GROM1 ~Der Hohe Omlar spricht leider die Wahrheit. Wir haben versagt.~ 
== AC#TURB8 ~Nur durch Dumathoins Eingreifen scheint es <CHARNAME> überhaupt wieder zurück nach Iltkazar geschafft zu haben.~
== AC#DUN01 ~Wie sollen wir nun mit meinem Bruder Ruvan weiterverfahren?~
== AC#GROM1 ~Ruvan hat unser Vertrauen verspielt. Bis diese Krise vorüber ist, sollen er und seine Frau in der Bronzemaske im Kerker in Haft bleiben.~
== AC#RUVA1 ~Das werdet Ihr nicht wagen!~
== AC#GROM1 ~Ihr habt Euer Stimmrecht im Rat verwirkt, Ruvan. Ist jemand der anderen Ratsmitglieder gegen diese Entscheidung?~
= ~Ich sehe, das ist nicht der Fall. Nun gut, Dunnabar, Ihr habt die traurige Aufgabe, der Kerkermeister Eures Bruders zu sein.~
== AC#DUN01 ~Sehr wohl. Was für eine Schande für unseren Clan! Warum nur, Ruvan?~
== AC#RUVA1 ~Das würdet Ihr nie verstehen!~
== AC#DUN01 ~So führt sie denn ab, Wachen!~
END
IF ~~ THEN EXTERN ~AC#GROM1~ no_goodbye_for_ruvan

// CHAIN: Ruvan arrested, Player talks about Barakuir
CHAIN IF ~~ THEN AC#DUN01 chain_dunnabar_own_brother
~Verraten vom eigenen Bruder! Eine Schande für den Clan!~
== AC#GROM1 ~Bei alledem bin ich mir sicher, dass Ruvan dennoch meinte, das Beste für unsere Stadt zu tun.~
== AC#ELER1 ~Indem er beabsichtigte, <CHARNAME> in Barakuir verrotten zu lassen?~
END
++ ~Das ist für mich auch schwer zu begreifen.~ EXTERN ~AC#GROM1~ chain_community
++ ~Ich kann in seinem Verhalten auch schwer etwas Gemeinnütziges erkennen.~ EXTERN ~AC#GROM1~ chain_community

CHAIN IF ~~ THEN AC#GROM1 chain_community
~Letztlich bleibt uns jetzt nur, nach vorne zu sehen!~
== AC#VRON1 ~Mich würde interessieren, was <CHARNAME> über Barakuir zu berichten habt.~
END
++ ~Oh, da gibt es Einiges.~ EXTERN ~AC#GROM1~ tell_us_about_barakuir
++ ~Viel weiter sind wir nicht gekommen. Ob sich der ganze Ärger gelohnt hat, müsst Ihr entscheiden.~ EXTERN ~AC#GROM1~ tell_us_about_barakuir
++ ~Ich denke, die wichtigste Erkenntnis war, dass es einen Verräter in Euren Reihen gab.~ EXTERN ~AC#GROM1~ tell_us_about_barakuir

// Ellhimar appears

CHAIN IF ~~ THEN AC#VRON1 chain_is_this_really_ellhimar
~Das ist Ellhimar!~
== AC#TORT1 ~Was ist das wieder für eine neue Teufelei!~
== AC#FENY1 ~Ist er es wirklich, <CHARNAME>?~
END
++ ~Ich weiß es nicht.~ EXTERN ~AC#GROM1~ chain_yes_its_really_ellhimar
++ ~Er wurde wohl von den Gedankenschindern gefangengenommen und gefoltert.~ EXTERN ~AC#GROM1~ chain_yes_its_really_ellhimar

CHAIN IF ~~ THEN AC#GROM1 chain_yes_its_really_ellhimar
~Welch schreckliches Schicksal muss ihm wiederfahren sein!~
== AC#ELER1 ~Euch muss dieser Anblick sicher besonders schmerzen, Gromi - wenn man bedenkt, dass Eurem Sohn Ähnliches widerfahren ist.~
== AC#GROM1 ~Sprecht nicht davon! Dies ist nicht die richtige Zeit und der richtige Ort für solche Gespräche.~
== AC#ELER1 ~...aber vielleicht wäre es gut, wenn wir darüber einmal reden würden, Gromi! Oder wollt Ihr Euren Sohn für immer in der Bibliothek meiner Familie einsperren?~
== AC#GROM1 ~Nein! Nicht hier, nicht jetzt.~
== AC#VRON1 ~Lasst gut sein. Wir sollten ihn umgehend in den gnädigen Hof, den Tempel Sharindlars, bringen!~
== AC#FENY1 ~Die Fruchtvolle Mutter Isdlara wird sich um ihn kümmern können.~
== AC#DUN01 ~Meine Männer werden ihn sofort dorthin bringen, werte Ratsmitglieder.~
== AC#STUR1 ~Das müsst Ihr nicht übernehmen, Dunnabar. Ihr habt wichtigere Aufgaben! Dies können meine Frau und ich übernehmen. Wir werden ihn in die Obhut Isdlaras übergeben.~
== AC#ELER1 ~Tante Isdlara ist die beste Heilerin der Stadt, <CHARNAME>. Ihr wird es sicher gelingen, aus Ellhimar wieder einen normalen Menschen zu machen.~
== AC#TORT1 ~Wir können nur hoffen, dass er jemals wieder genesen wird. Anderenfalls werden wir nie erfahren, was mit ihm geschehen ist.~
== AC#VRON1 ~Aber wir wissen, wo ihm dies widerfahren sein könnte und könnten dort unsere Suche fortsetzen.~
== AC#TURB8 ~Wohl wahr. Der Weg führt uns nun also in die Spinnenschächte.~
END
++ ~Ihr wusstet davon, Turbaern?~ EXTERN ~AC#TURB8~ know_about_spiderstalkings

CHAIN IF ~~ THEN AC#GROM1 chain_open_throneroom
~Es war bisher noch nie in der Schlafensperiode unseres Königs der Fall, dass jedem Zutritt zum Thronsaal gewährt wurde.~
== AC#DUN01 ~Und die Sicherheit unseres Königs steht an erster Stelle!~
== AC#ELER1 ~Ich finde, wir sollten es einmal versuchen.~
== AC#FENY1 ~Warum nicht? Wir können den Regentschaftsrat jetzt, da Ruvan im Gefängnis sitzt, ohnehin nicht mehr regulär einberufen.~
== AC#STUR1 ~Vielleicht könnte <CHARNAME> auch einmal einen Blick auf unseren König werfen?~
END
IF ~~ THEN EXTERN ~AC#GROM1~ ok_open_throneroom

CHAIN IF ~~ THEN AC#GROM1 chain_go_check_throneroom
~Selbstverständlich. Dies war ja der Grund, weshalb Ihr uns aufgesucht habt. Es wäre nun mehr als angemessen, Euch Zutritt zu unserem König zu ermöglichen.~
== AC#ELER1 ~Erwartet nicht zu viel, <CHARNAME>. Der Anblick ist ziemlich... deprimierend.~
== AC#GROM1 ~So teilt sich der Rat auf. Fenyl und Sturvis Abgrundlied bringen den Magier in die Obhut der Fruchtvollen Mutter Isdlara. Dunnabar Steinschulter wird neben dem König Wache halten, während seine Söhne die Verteidigung der Stadt aufrecht erhalten.~
== AC#VRON1 ~Ich werde mich mit Euch, Turbaern, der Erneuerung der zerstörten Runen widmen, die unsere Stadt schützen sollen.~
== AC#TURB8 ~So werden wir es machen. Ihr seid in der Halle der Omlare immer ein gerngesehener Gast Dumathoins.~
== AC#GROM1 ~Dabei fällt mir ein - was sollen wir mit dem heiligen Hammer machen, den <CHARNAME> bei sich trägt?~
END
IF ~~ THEN EXTERN ~AC#TURB8~ turbaern_what_to_do_with_hammer

CHAIN IF ~~ THEN AC#GROM1 chain_should_i_travel_to_xy
~In der Tat. Auch, wenn die Geschehnisse an diesem Ort schon lange zurückliegen, würde kein Zwerg unseres Clans jemals wieder einen Fuß auf diesen unheiligen Boden setzen. Deshalb bitten wir Euch, <CHARNAME>, dies für unsere Stadt zu tun. Dies wäre die beste Spur, die wir derzeit haben.~
== AC#ELER1 ~Auch wenn mich der Gedanke daran graust, könnte der Vorschlag Gromis wirklich die beste Entscheidung sein. Die Wege an diesen Ort schienen lange Zeit verloren, doch mein Clan hatte in der Abgrundliedhalle Aufzeichnungen darüber - welche ich bereits gelesen habe.~
== AC#STUR1 ~Ihr habt Euch schon das Wissen über B... über diesen Ort angeeignet?~
== AC#ELER1 ~Ja. Oder ist sonst jemand von Euch auf die Idee gekommen, woher der Gedankenschinder gekommen sein könnte?~
== AC#GROM1 ~Genug. Es bringt jetzt nichts mehr, um den heißen Met herumzureden. <CHARNAME>, wir bitten Euch, in Barakuir nach dem Verbleib von Illithiden zu suchen.~
== AC#FENY1 ~Barakuir... schon lange habe ich diesen verfluchten Namen nicht mehr vernommen...~
END
++ ~Was ist Barakuir?~ EXTERN ~AC#VRON1~ NEW_what_is_barakuir


CHAIN IF ~~ THEN AC#VRON1 NEW_what_is_barakuir
~Barakuir ist die alte Heimstatt der Duergar. Einst waren sie Schildzwerge wie wir, doch die Gefangenschaft der Illithiden brachte sie um den Verstand.~
== AC#GROM1 ~Clan Duergar herrschte lange Zeit über sein Unterkönigreich wie jeder andere Clan auch. Doch die lange Folter der Gedankenschinder hat ihren Verstand vergiftet. Die Duergar gaben uns anderen Zwergenclans die Schuld für ihre Sklaverei. Als sie sich aus den Fesseln der Illithiden befreien konnten, wandten sie sich gegen ihre Brüder.~
== AC#FENY1 ~Seitdem liegt ein Fluch über Barakuir, und kein Zwerg Shanatars wird jemals wieder diesen unheiligen Ort betreten.~
== AC#GROM1 ~Deshalb bitten wir Euch darum, in den Ruinen der einst stolzen Heimat von Clan Duergar nach Antworten zu suchen.~
END
++ ~Was muss ich tun?~ EXTERN ~AC#GROM1~ barakuir_need_boat	

// Chain NPC Reaction: accept quest?

CHAIN IF ~~ THEN AC#GROM1 chain_under_arrest_npc_reaction
~<CHARNAME>, auf Geheiß des Rates steht Ihr unter Arrest. Dunnabar, diese Leute werden in der Zitadelle Gorms in der Bronzemaske hinter verschlossenen Türen gehalten, bis der Rat zu einer Entscheidung gekommen ist.~
== AnomenJ IF ~InParty("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN ~Was für eine Frechheit! Wir bieten dem Zwergenvolk unsere Hilfe an, und sie schlagen sie nicht nur aus, sondern behandeln uns wie ordinäre Strauchdiebe!~
== ViconiJ IF ~InParty("viconia") !StateCheck("viconia",CD_STATE_NOTVALID)~ THEN ~Dies ist wieder einmal das perfekte Beispiel, weshalb man sich nicht mit Zwergen einlassen sollte!~
== MazzyJ IF ~InParty("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN ~Was soll denn das jetzt? Das kann doch nicht deren Ernst sein!~
== KeldorJ IF ~InParty("keldorn") !StateCheck("keldorn",CD_STATE_NOTVALID)~ THEN ~Wir sollten zähnknirschend ihre Bedingunen akzeptieren und zumindest versuchen, unseren guten Willen weiterhin unter Beweis zu stellen.~
== AerieJ IF ~InParty("aerie") !StateCheck("aerie",CD_STATE_NOTVALID)~ THEN ~Schlimm genung, dass wir hier herunter mussten... aber jetzt nicht mehr wieder herauf zu können?~
== MinscJ IF ~InParty("minsc") !StateCheck("minsc",CD_STATE_NOTVALID)~ THEN ~Was haben diese Zwerge denn nicht verstanden, dass sie uns hier einsperren wollen? Wir stehen doch auf der guten Seite, nicht auf der Bösen!~
== YoshJ IF ~InParty("yoshimo") !StateCheck("yoshimo",CD_STATE_NOTVALID)~ THEN ~Wie unerfreulich. Lasst uns sehen, ob wir eine Möglichkeit finden, schleunigst wieder von hier zu verschwinden.~
== JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN ~Eine überraschende, aber nachvollziehbare Entscheidung. Wir hätten es kommen sehen müssen, dass man uns hier nicht mit offenen Armen empfängt.~
== BEDWIN IF ~InParty("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN ~Das haben wir jetzt davon. Es war eben eine durch und durch dämliche Idee, diesen Zwerglingen unsere Hilfe anbieten zu wollen!~
== ValygarJ IF ~InParty("valygar") !StateCheck("valygar",CD_STATE_NOTVALID)~ THEN ~Ich kann das Misstrauen des Rates gut verstehen. Diese Stadt hat die letzten Jahrhunderte nur durch Vorsicht und Argwohn überleben können.~
== KORGANJ IF ~InParty("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN ~Was für ein Haufen Idioten! Ich sage, wir kämpfen uns den Weg durch die Stadt frei, raffen noch ein paar Kostbarkeiten zusammen und verschwinden von hier!~
== JANJ IF ~InParty("Jan") !StateCheck("Jan",CD_STATE_NOTVALID)~ THEN ~Im Gefängnis? Hier unten? Das ist ja schlimmer als in Athkatla!~
== NALIAJ IF ~InParty("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN ~Oh nein! Können sie uns nicht einfach wieder gehen lassen?~
== HAERDAJ IF ~InParty("HaerDalis") !StateCheck("HaerDalis",CD_STATE_NOTVALID)~ THEN ~Nun sind wir wieder in einem Käfig, wie ein Kanarienvogel in der Mine...~
== CERNDJ IF ~InParty("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN ~Die Zwerge haben gute Gründe, nicht jedem dahergelaufenen Abenteurer auf Anhieb zu trauen. Warten wir ab, wie es weitergeht.~
END
IF~~THEN GOTO know_too_much	

// Chain - message that Ellhimar is a drow spy
CHAIN IF ~~ THEN AC#GROM1 Ellhimar_quest_finished
~<CHARNAME>, Vronia berichtete uns, dass Ihr unseren menschlichen Magier als einen vermeintlichen Drow-Spion enttarnt habt.~
== AC#STUR1 ~Dieser Menschenmagier war in Wirklichkeit ein Drow-Spion? Und lebte jahrelang mitten in unserer Stadt?~
== AC#GROM1 ~Das glauben wir nicht. Wir vermuten eher, dass etwas im Laufe der letzten Herdfeuer eine Art Sinneswandel bei ihm ausgelöst hat, wenn ich Vronia richtig verstehe.~
== AC#VRON1 ~So ist es. Ich bemerkte in der letzten Zeit eine deutliche Veränderung seines Wesens. Ich denke, dass wir den richtigen Ellhimar zu Recht bei uns aufgenommen haben - und er irgendwann durch ein großes Unglück durch den Drow ersetzt wurde.~
END
IF ~~ THEN EXTERN ~AC#GROM1~ Ellhimar_mindflayer_01
				
CHAIN IF ~~ THEN AC#GROM1 Ellhimar_mindflayer_01
~Sie berichtete uns ebenfalls von <CHARNAME>s Beobachtung, dass Ellhimar in Kontakt mit einem *caradhak*, einem Illithiden, stand.~
END
IF ~~ THEN REPLY ~Ja, ich habe durch einen Spiegel in das Antlitz eines Gedankenschinders geschaut.~ EXTERN ~AC#STUR1~ illithid_face_01
					