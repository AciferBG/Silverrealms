BEGIN ~AC#ALDYM~

IF ~Global("Scepter_finished","ACIL05",0)
PartyHasItem("AC#ZEPX2")~ THEN BEGIN hello_teleported
SAY  ~Ihr habt das Zepter zusammengefügt! Ich kann es spüren!~
IF ~~ THEN REPLY ~Ja, hier ist es.~ DO ~SetGlobal("Scepter_finished","ACIL05",1)~ GOTO have_xothaerin_scepter_01
IF ~~ THEN REPLY ~Das Zepter hat ganz schön Unheil in den Minen angerichtet!~ DO ~SetGlobal("Scepter_finished","ACIL05",1)~ GOTO scepter_did_chaos
IF ~IsValidForPartyDialog("Jaheira")~ THEN DO ~SetGlobal("Scepter_finished","ACIL05",1)~ EXTERN ~JAHEIRAJ~ Jaheira_scepter_did_chaos
END

/*
IF ~Global("AC#ACIL04Teleport","GLOBAL",1)~ THEN BEGIN hello_teleported
SAY  ~Es hat funktioniert! Dank des Zepters konnte ich Euch zurückteleportieren!~
IF ~~ THEN REPLY ~Wäre das nicht auch ein bisschen schneller gegangen?~ DO ~SetGlobal("AC#ACIL04Teleport","GLOBAL",10)~ + teleport_faster
IF ~~ THEN REPLY ~Schön, wieder in einer sichereren Umgebung zu sein.~ DO ~SetGlobal("AC#ACIL04Teleport","GLOBAL",10)~ + teleport_faster
IF ~~ THEN REPLY ~Ein Fußmarsch wäre mir zwar lieber gewesen, aber sei's drum.~ DO ~SetGlobal("AC#ACIL04Teleport","GLOBAL",10)~ + teleport_faster
END
*/
/*
	IF ~~ THEN BEGIN teleport_faster
	SAY ~Glaubt mir, ich hätte Euch gerne schneller dort wieder herausgeholt, aber im Inneren der alten Azerkyn-Mine hat mein Zauber nicht richtig gewirkt. Habt Ihr das Zepter bei Euch?~
	IF ~~ THEN REPLY ~Ja, hier ist es.~ GOTO have_xothaerin_scepter_01
	IF ~~ THEN REPLY ~Wenn ich es durch Eure Teleportation nicht verloren habe, schon.~ GOTO have_xothaerin_scepter_01
	IF ~~ THEN REPLY ~Das Zepter hat ganz schön Unheil in den Minen angerichtet!~ GOTO scepter_did_chaos
	IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ Jaheira_scepter_did_chaos
	END
	*/
	
		IF ~~ THEN BEGIN scepter_did_chaos
		SAY ~Wirklich? Wie meint Ihr das?~
		IF ~~ THEN REPLY ~Als ich es gerade zusammengesetzt hatte, öffnete sich ein altes Portal und wütende Feuerelementare stürmten auf mich ein!~ EXTERN ~AC#RAVE3~ scepter_opened_portal
		END
	
	IF ~~ THEN BEGIN have_xothaerin_scepter_01
	SAY ~Lasst mich das Zepter einmal sehen. Bei Mystra... ja, das ist genau das, wonach...~
	IF ~~ THEN DO ~EraseJournalEntry(@20044)~ EXTERN ~AC#RAVE3~ betrayal01
	END

IF ~Global("AC#XothaerinForge","GLOBAL",10)~ THEN BEGIN hello_visit_forge
SAY ~Sucht die Zwergenschmiede in den Wolkengipfeln und findet einen Weg, das Zepter zu reparieren.~
IF ~~ THEN EXIT
END

// Schmiedeabenteuer
/*
IF ~Global("AC#XothaerinForge","GLOBAL",1)~ THEN BEGIN hello_have_found_forge
SAY ~<CHARNAME>! Ich habe eine Möglichkeit gefunden, die beiden Zepterteile zu vereinigen!~
IF ~~ THEN GOTO about_azerkyn_01
END
*/
IF ~~ THEN BEGIN NEW_unify_sceptre
SAY ~Bisher habt Ihr mir das Zepter in zwei Teilen besorgt. Nun habe ich eine Möglichkeit gefunden, die beiden Stücke wieder zu vereinigen.~
IF ~~ THEN GOTO about_azerkyn_01
END

	IF ~~ THEN BEGIN about_azerkyn_01
	SAY ~Und ich hörte von Eurer vergeblichen Suche, einen Weg ins Unterreich zu finden. Ich helfe Euch gerne, wenn Ihr mir helft!~
	IF ~~ THEN REPLY ~Das klingt gut. Fahrt fort.~ GOTO about_azerkyn_02
	IF ~~ THEN REPLY ~Wie großzügig...~ GOTO about_azerkyn_02
	IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ Jaheira_comment_help_forge_scepter
	END
	
		IF ~~ THEN BEGIN about_azerkyn_02
		SAY ~Ich habe viel über die Geschichte der Zwerge lesen müssen, um bei diesem alten Zepter weiterzukommen. Und, was soll ich sagen - meine Hoffnung hat sich bestätigt: Es ist eines der Herrschaftszepter Shanatars!~
		IF ~~ THEN REPLY ~Nur eben in zwei Teilen.~ GOTO two_parts
		END
		
			IF ~~ THEN BEGIN two_parts
			SAY ~In der Tat. Der alte Zwergenclan Azerkyn, dem dieses Zepter gehörte, wollte wohl nicht, dass seine Macht in falsche Hände gerät. Deshalb wurde es in einer der zahlreichen Schmieden, für die der Clan so berühmt ist, in zwei Teile zerschlagen.~
			IF ~~ THEN REPLY ~Und Ihr haltet es wirklich für eine gute Idee, es wieder zu vereinigen?~ GOTO good_idea_to_reforge_it 
			END
			
			IF ~~ THEN BEGIN good_idea_to_reforge_it
			SAY ~Ich kann Eure Bedenken verstehen. Macht Euch da aber keine allzu großen Sorgen. Bei mir ist es in guten Händen!~
			IF ~~ THEN REPLY ~Das behaupten alle Leute, bevor ihnen eine Sache über den Kopf wächst!~ GOTO not_a_good_idea_01
			IF ~InParty("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN EXTERN ~CERNDJ~ Cernd_not_a_good_idea_01
			END
			
				IF ~~ THEN BEGIN not_a_good_idea_01
				SAY ~Das Land, in dem ich lebe, wurde schon mehr als einmal von bösartigen, fremden Mächten überrannt. Wir überleben in Halruaa nur deshalb so lange, weil wir alles Wissen, das wir uns aneignen, streng für uns bewahren. Genau so wenig, wie jeder Magier in Faerun in einem unserer Luftschiffe durch die Gegend fliegen sollte, sollte nicht jeder die Möglichkeit besitzen, derart mächtige Gegenstände in Gebrauch zu haben. Natürlich bin ich mir der Gefahren bewusst. Es ist jedoch nicht das erste Herrschaftszepter Shanatars, das im Besitz meiner Familie ist.~
				IF ~~ THEN REPLY ~Ihr besitzt schon eines?~ GOTO already_own_scepter
				END
				
					IF ~~ THEN BEGIN already_own_scepter
					SAY ~Ja, es liegt hier vor mir auf dem Tisch. Ihr könnt es Euch ruhig ansehen. Es ist das Torglor-Zepter, welches sich seit Jahrhunderten im Besitz meiner Familie befindet. Nun habe ich auch noch das Xothaerin-Zepter des Clan Azerkyn gefunden! Doch ich fürchte, ich könnte Euch damit verwirren. Man muss kein Schriftgelehrter sein, um die Fragezeichen in Euren Augen zu erkennen. ~
					IF ~~ THEN GOTO questions_aldym
					END
					
		IF ~~ THEN BEGIN questions_aldym
		SAY ~Bevor ich fortfahre habt Ihr vielleicht noch Fragen.~
		IF ~~ THEN REPLY ~Ihr erwähnt immer viele Zwergenclans und Zwergennamen. Könnt Ihr mir darüber etwas berichten?~ GOTO question_clans
		IF ~~ THEN REPLY ~Was war das mit den Zeptern?~ + questions_scepter
		IF ~~ THEN REPLY ~Ich habe keine weiteren Fragen mehr.~ + questions_no_more_questions
		END
									
				IF ~~ THEN BEGIN questions_scepter
				SAY ~Jedes Unterkönigreich hatte einen eigenen Schutzherrn aus dem Zwergenpantheon. Als Zeichen der Macht erschufen die Zwerge für ihre Könige Zepter, die mit dem Symbol ihrer Gottheit versehen waren und ganz einzigartige Fähigkeiten besaßen.~
				IF ~~ THEN REPLY ~Ich möchte zu einem anderen Thema noch etwas fragen.~ + questions_aldym 
				END

				IF ~~ THEN BEGIN question_clans
				SAY ~Aber ja. Früher lebten verschiedene Zwergenclans in diesem Gebiet. Das gesamte Zwergenreich, das diese Länder einst beherrschte, nannte man Shanatar. Es teilte sich in viele verschiedene Unterkönigreiche auf - Xothaerin, Torglor, Drakkalor, Iltkazar, Ultoksamrin, Sondarr, Korolnor und noch einige andere, deren Namen ich nicht kenne. Ein jeder herrschende Zwergenclan gründete ein Unterkönigreich und wählte eine Schutzgottheit aus dem Zwergenpantheon als ihren Mentor.~
				IF ~~ THEN REPLY ~Erzählt mir über Xothaerin.~ GOTO question_clans_xothaerin
				IF ~~ THEN REPLY ~Erzählt mir über Torglor.~ + question_clans_toglor
				IF ~~ THEN REPLY ~Ich habe eine Gruppe Zwerge aus Iltkazar getroffen und bin auf der Suche nach deren Reich.~ + question_clans_iltkazar
				IF ~~ THEN REPLY ~Ich möchte zu einem anderen Thema noch etwas fragen.~ + questions_aldym 			
				END
							
							IF ~~ THEN BEGIN question_clans_xothaerin
							SAY ~Xothaerin herrschte als Unterkönigreich über das Gebiet, auf dem wir gerade stehen - die Wolkengipfelberge und die Ebenen südlich davon bis zu den Kleinen Zähnen. Xothaerin wurde das Adamantkönigreich genannt und war der Göttin Sharindlar gewidmet. Ihr habt ihre Symbole vielleicht unterwegs entdeckt - eine brennende Nadel. Sharindlar wird oft als tanzende Zwergin dargestellt. Der herrschende Clan in Xothaerin war Clan Azerkyn, ein Clan, der als Meister des Feuers in die Geschichtsbücher einging. Deshalb bin ich besonders froh, das Xothaerin-Zepter dieses Clans gefunden zu haben!~
							IF ~~ THEN REPLY ~Welche Fähigkeiten besitzt das Xothaerin-Zepter?~ GOTO about_xothaerin_scepter_too_early
							IF ~~ THEN REPLY ~Ich habe Fragen zu einem anderen Zwergenclan.~ + question_clans
							IF ~~ THEN REPLY ~Ich möchte zu einem anderen Thema noch etwas fragen.~ + questions_aldym 
							END
							
								IF ~~ THEN BEGIN about_xothaerin_scepter_too_early
								SAY ~Das erzähle ich Euch gleich.~
								IF ~~ THEN GOTO questions_aldym 
								END
							
							IF ~~ THEN BEGIN question_clans_toglor
							SAY ~Ich weiß nicht viel über Torglor, auch wenn meine Familie deren Zepter besitzt. Torglor wurde "Silberkönigreich" genannt. Ich habe vor, mehr über dieses Unterkönigreich herauszufinden, sobald ich das andere Zepter, das Xothaerin-Zepter, dank Eurer Hilfe wieder in Betrieb genommen habe. Man erzählt sich aber, dass der unbekannte Clan, der in Torglor herrschte, viel mit Portalen an sogenannten Erdknoten arbeitete und plötzlich wie vom Erdboden verschluckt verschollen blieb.~
							IF ~~ THEN REPLY ~Ich habe Fragen zu einem anderen Zwergenclan.~ + question_clans
							IF ~~ THEN REPLY ~Ich möchte zu einem anderen Thema noch etwas fragen.~ + questions_aldym 
							END
							
						IF ~~ THEN BEGIN question_clans_iltkazar
						SAY ~Na, da hat einer Euch ja einen Bären aufgebunden! Alle Zwergenreiche sind schon seit langer Zeit untergegangen. Ich bezweifle, dass Ihr dort viel mehr als verwittere Ruinen finden werdet, aber ich möchte Euch natürlich nicht von Eurer Suche abhalten.~
						IF ~~ THEN REPLY ~Ich habe Fragen zu einem anderen Zwergenclan.~ + question_clans
						IF ~~ THEN REPLY ~Ich möchte zu einem anderen Thema noch etwas fragen.~ + questions_aldym 
						END	
						
	IF ~~ THEN BEGIN questions_no_more_questions
	SAY ~Gut. Kommen wir nun zu dem Zepter, bei dem ich erneut Eure Hilfe brauche. Wie gesagt, es ist das Xothaerin-Zepter, welches der Göttin Sharindlar geweiht war und von Clan Azerkyn geschaffen wurde. Clan Azerkyn beherrschte den Umgang mit Feuer wie kein anderer Zwergenclan. Viele behaupten sogar, der Clan habe sich später selbst auf die Feuerebene abgesetzt. Laut meinen Nachforschungen ist es möglich, mit diesem Zepter bereits bestehende Verbindungen zur Feuerebene zu nutzen, um Hochöfen anzuheizen. Dadurch konnten die Zwerge des alten Shanatar so prächtige Legierungen herstellen. Meine Hoffnung ist, dass ich durch die Vereinigung des Zepters einen Teil der ursprünglichen Fähigkeit wiedererlangen und mir in meiner Heimat Halruaa zu Nutze machen kann.~
	IF ~~ THEN REPLY ~Das klingt mir nicht ganz geheuer.~ GOTO play_with_fire
	IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ Jaheira_play_with_fire
	END
	
		IF ~~ THEN BEGIN play_with_fire
		SAY ~Ich verspreche Euch hoch und heilig bei Azuth, dem ersten Magister, dass ich das Zepter erst dann in Gebrauch nehmen werde, wenn ich wieder nach Halruaa zurückgekehrt bin.~
		IF ~~ THEN GOTO reforge_scepter_01 
				IF ~IsValidForPartyDialog("Keldorn")~ THEN EXTERN ~KELDORJ~ keldorn_vow_azuth
		END
		
		IF ~~ THEN BEGIN reforge_scepter_01
		SAY ~Um die beiden Teile des Zepters wieder zusammenzufügen braucht man die Macht eines alten Hochofens aus der Shanatar-Ära. Glücklicherweise habe ich ganz in der Nähe eine alte Zwergengießerei in meinen Unterlagen entdeckt, die uns solch eine Möglichkeit bieten würde. Sie lag lange vergessen unter dem Schnee des Wolkengipfel-Gebirges, doch ihre Öfen sollten noch glühen wie vor langer Zeit, da der Clan Azerkyn damals deren Feuer entfacht hatte.~
		IF ~~ THEN REPLY ~Hier in den Wolkengipfeln liegt eine alte Zwergenbehausung?~ GOTO azerkyn_clanhold
		END
		
			IF ~~ THEN BEGIN azerkyn_clanhold
			SAY ~Nicht nur eine - Unzählige! Die Kunst ist eher, die Richtige zu finden. Ich bitte Euch, diese alte Heimstatt des Clans Azerkyn aufzusuchen und eine Möglichkeit zu finden, beide Zepterteile wieder zu vereinigen. Der Zugang zu den alten Öfen liegt in den höchsten Bereichen des Wolkengipfel-Gebirges, Ihr solltet dort mit Schnee rechnen.~
			IF ~~ THEN DO ~RevealAreaOnMap("ACIL9F")~ GOTO finish_job_scepter 
			END			
				
				IF ~~ THEN BEGIN finish_job_scepter
				SAY ~Sucht die Zwergenschmiede, findet einen Weg, das Zepter zu reparieren - und wenn Ihr es vereinigt habt, kehrt zu mir zurück. Dann werde ich dieses ungastliche Land verlassen - nicht, bevor ich Euch einen Zugang ins Unterreich genannt habe, der Euch bei Eurer eigenen Suche helfen könnte.~
				IF ~~ THEN REPLY ~Könnt Ihr mir den Zugang ins Unterreich nicht gleich sagen?~ EXTERN ~AC#RAVE3~ not_tell_way_underdark_too_early 
				IF ~~ THEN REPLY ~In Ordnung.~ + give_scepter_parts
				END
				
				
					IF ~~ THEN BEGIN first_scepter_then_underdark
					SAY ~In der Tat, soviel Vorsicht muss sein. Aber ich stehe zu meinem Wort - sobald das Zepter vollständig ist, werde ich Euch all meine Erkenntnisse mitteilen.~
					IF ~~ THEN GOTO give_scepter_parts
					END
					
					IF ~~ THEN BEGIN give_scepter_parts
					SAY ~Hier sind die beiden Teile. Verliert sie nicht, denn ohne diese gibt es keine Möglichkeit, das Zepter wieder zu reparieren. Ich wünsche Euch viel Glück!~
					IF ~~ THEN DO ~RevealAreaOnMap("ACIL9F")
					GiveItemCreate("AC#ZEPXO",Player1,0,0,0)
					GiveItemCreate("AC#ZEPXS",Player1,0,0,0)
					EraseJournalEntry(@20036)
					AddJournalEntry(@20044,QUEST)
					SetGlobal("AC#XothaerinForge","GLOBAL",10)~ EXIT
					END

IF ~Global("AC#XothaerinHead","GLOBAL",20)
Global("AC#XothaerinForge","GLOBAL",0)~ THEN BEGIN hello_still_searching
SAY ~Seid gegrüßt, <CHARNAME>. Ich suche immer noch nach einer Möglichkeit, beide Zepterteile zu vereinigen. Leider bin ich noch nicht vorangekommen. Ich lasse Euch eine Nachricht zukommen, wenn ich eine Lösung gefunden habe.~
IF ~~ THEN EXIT
END

IF ~NumTimesTalkedToGT(0)~ THEN BEGIN hello_again
SAY ~Ihr kehrt zurück! Was habt Ihr zu berichten?~
IF ~~ THEN REPLY ~Noch nichts.~ GOTO bye_01
IF ~PartyHasItem("AC#ZEPXS")~ THEN REPLY ~Ich habe den Zepterkopf gefunden.~ + have_scepter_head_01
END

	IF ~~ THEN BEGIN bye_01
	SAY ~Nun gut, dann werde ich noch ein wenig länger hier auf Euch warten müssen.~
	IF ~~ THEN EXIT 
	END
	
	IF ~~ THEN BEGIN have_scepter_head_01
	SAY ~Ihr habt den Kopf? Das ist ja hervorragend! Lasst einmal sehen!~
	IF ~~ THEN DO ~TakePartyItem("AC#ZEPXS")
	DestroyItem("AC#ZEPXS")
	SetGlobal("AC#XothaerinHead","GLOBAL",3)~ GOTO have_scepter_head_02
	END
	
	IF ~~ THEN BEGIN have_scepter_head_02
	SAY ~Das Symbol Sharindlars! Das ist er! Hoffentlich lässt er sich mit dem Griff verbinden!~
	IF ~Global("AC#BeldasDies","GLOBAL",0)~ THEN GOTO beldas_alive_not_working
	IF ~GlobalGT("AC#BeldasDies","GLOBAL",0)~ THEN GOTO beldas_dead_found_solution
	END
	
		IF ~~ THEN BEGIN beldas_dead_found_solution
		SAY ~Nein, so geht das nicht. Die zwei Teile passen zwar zusammen - doch es ist so, wie ich es befürchtet habe: Sie lassen sich nicht so einfach zusammenfügen. Glücklicherweise habe ich bereits eine Möglichkeit gefunden, die beiden Zepterteile zu vereinigen!~
		IF ~~ THEN DO ~SetGlobal("AC#XothaerinHead","GLOBAL",20)
		EraseJournalEntry(@20033)
		EraseJournalEntry(@20034)~ GOTO about_azerkyn_01
		END
	
		IF ~~ THEN BEGIN beldas_alive_not_working
		SAY ~Die zwei Teile passen zwar zusammen - doch es ist so, wie ich es mir gedacht habe: Sie lassen sich nicht so einfach zusammenfügen.~
		IF ~~ THEN REPLY ~Ihr seht enttäuscht aus.~ GOTO beldas_alive_not_working_02
		IF ~~ THEN REPLY ~Und was jetzt?~ GOTO beldas_alive_not_working_02
		END
		
			IF ~~ THEN BEGIN beldas_alive_not_working_02
			SAY ~Wenn doch nicht alles so kompliziert wäre! Ich muss weitere Nachforschungen anstellen.~
			IF ~~ THEN GOTO not_working_reward
			END
			
				IF ~~ THEN BEGIN not_working_reward
				SAY ~Entschuldigt, wo bleiben meine Manieren! Habt Dank, dass Ihr mir beide Teile gebracht habt, <CHARNAME>. Es ist ganz gewiss nicht Eure Schuld, dass ich damit nicht weiterkomme.~
				IF ~~ THEN REPLY ~Kann ich noch etwas tun?~ GOTO not_working_need_help 
				END
				
					IF ~~ THEN BEGIN not_working_need_help
					SAY ~Ich fürchte nicht. Natürlich könnte man versuchen, die zwei Teile wieder zusammenzubringen. Ich würde es aber vorziehen, dass wir es auf die gleiche Weise machen, wie die Teile voneinander getrennt wurden.~
					IF ~~ THEN REPLY ~Wie meint Ihr das?~ GOTO not_working_find_forge
					END
					
					IF ~~ THEN BEGIN not_working_find_forge
					SAY ~Ich vermute, die Zwerge haben dieses Zepter absichtlich zerteilt - um es vor dem Zugriff ihrer Feinde zu schützen. Wir müssen den Prozess, den die Zwerge anwendeten, also umkehren. Ich bin mir sicher, hierzu in den alten Texten Anhaltspunkte zu finden. Dafür benötige ich aber wieder Zeit.~
					IF ~~ THEN REPLY ~Das bedeutet, Ihr braucht mich gerade nicht mehr?~ GOTO not_working_no_need_for_me 
					END
					
						IF ~~ THEN BEGIN not_working_no_need_for_me
						SAY ~Derzeit könnt Ihr mir nicht helfen. Ich schlage vor, ich entsende wieder meinen Vertrauten, wenn ich weitergekommen bin.~
						IF ~~ THEN REPLY ~Also gut. Dann werde ich mich wieder meinen anderen Aufgaben widmen. Viel Glück auf Eurer Suche, Aldym!~ GOTO bye_not_working
						END
						
							IF ~~ THEN BEGIN bye_not_working
							SAY ~Gehabt Euch wohl, <CHARNAME>! Ich hoffe, ich kann Euch bei unserem nächsten Zusammentreffen Genaueres berichten.~
							IF ~~ THEN DO ~SetGlobal("AC#XothaerinHead","GLOBAL",20)
						EraseJournalEntry(@20033)
						EraseJournalEntry(@20034)
						AddJournalEntry(@20035,QUEST_DONE)  
						~EXIT
							END
	
IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0 
  SAY ~Oh, willkommen! Sind das <CHARNAME> und die Abenteurer, von denen Ihr berichtet hattet, Salpham?~
IF ~~ THEN EXTERN ~AC#RAVE3~ is_this_party01
END

	IF ~~ THEN BEGIN welcome
	SAY ~Schön, dass Ihr gekommen seid, <CHARNAME>! Mein Name ist Aldym Ryscelsar. Ich bin Gelehrter und Magier.~
	//IF ~Global("AC#BeldasDies","GLOBAL",0)~ THEN GOTO beldas_alive_scepter_handle_retrieved_01
	//IF ~GlobalGT("AC#BeldasDies","GLOBAL",1)~ THEN GOTO beldas_dead_scepter_handle_retrieved_01
	IF ~~ THEN GOTO not_from_here
	END
	
							IF ~~ THEN BEGIN not_from_here								
							SAY ~Ich komme nicht von hier. Ich gehöre zur Familie der Ryscelsar aus Halruaa und habe den weiten Weg in dieses ungastliche Land zurückgelegt, um mich mit der Arbeit der Zwerge, die hier vor tausenden von Jahren lebten, zu befassen. Leider habe ich feststellen müssen, dass dieses Land Magiern gegenüber nicht besonders wohlgesonnen ist. Und so musste ich mich hier mitten im Nirgendwo niederlassen und bin auf fremde Hilfe angewiesen, denn sowohl der Zugang nach Athkatla als auch ein freies Reisen bleiben mir in diesen Ländereien verwehrt.~
							++ ~Die Verhüllten Magier haben Euch von weiteren Nachforschungen abgehalten?~ + not_from_here_02
							IF ~IsValidForPartyDialog("Valygar")~ THEN EXTERN ~VALYGARJ~ Valygar_cowled_wizards_01
							END

								IF ~~ THEN BEGIN not_from_here_02
								SAY ~So ist es. Ich hatte von ihrem Einfluss in diesem Land gehört, ihre Macht über die Anwender der Magie aber kolossal unterschätzt. Jetzt sitze ich hier in diesem Turm fest und komme nicht weiter.~
								IF ~~ THEN EXTERN ~AC#RAVE3~ tower_new_01
								END

								IF ~~ THEN BEGIN tower_new_02
								SAY ~Oh ja, mein Vertrauter hat eine Menge beeindruckender Fähigkeiten, nicht wahr, mein Guter?~
								IF ~~ THEN EXTERN ~AC#RAVE3~ tower_new_03
								END

								IF ~~ THEN BEGIN familiar_new_01
								SAY ~Ich habe meinen Vertrauten Salpham gefunden, kurz, nachdem mein alter Vertrauter verschwunden ist. Welch ein Glück, denn ohne ihn hätte ich diese Reise nie antreten können! Doch ich schweife ab.~
								IF ~Global("AC#BeldasDies","GLOBAL",0)~ THEN GOTO beldas_alive_scepter_handle_retrieved_NEW_01
								IF ~GlobalGT("AC#BeldasDies","GLOBAL",1)~ THEN GOTO beldas_dead_scepter_handle_retrieved_NEW_01
								END

								IF ~~ THEN BEGIN beldas_alive_scepter_handle_retrieved_NEW_01
								SAY ~Mein Vertrauter sagte mir, Ihr hättet ihm geholfen, diesen Zeptergriff für mich zu besorgen?~
								IF ~~ THEN REPLY ~Das ist richtig.~ + reward_dwarfbook_01
								END
								
								IF ~~ THEN BEGIN beldas_dead_scepter_handle_retrieved_NEW_01
								SAY ~Mein Vertrauter sagte mir, Ihr hättet ihm geholfen, diesen Zeptergriff für mich zu besorgen? Und Ihr seid auf der Suche nach einem Weg ins Unterreich?~
								IF ~~ THEN REPLY ~Das ist richtig.~ + reward_dwarfbook_01
								END
	
									IF ~~ THEN BEGIN reward_dwarfbook_01
									SAY ~Dann möchte ich mich zunächst für Eure Hilfe bedanken. Da Ihr wohl auch an Zwergenangelegenheiten interessiert seid, möchte ich Euch als Dank dieses Buch hier geben. Es ist eine Abhandlung über die Geschichte der Zwerge und beschäftigt sich vor Allem mit der Sprache und Schrift dieser Rasse. Ich habe es in den vergangenen Jahren in mühevoller Arbeit zusammengestellt und denke, es könnte Euch ein nützlicher Begleiter sein.~
									IF ~~ THEN REPLY ~Dankeschön.~ DO ~GiveItemCreate("AC#BKDWF",Player1,0,0,0)~ GOTO family_matters_NEW_01
									IF ~~ THEN REPLY ~Ein Buch? Was bitte soll ich denn mit so etwas anfangen?~ DO ~GiveItemCreate("AC#BKDWF",Player1,0,0,0)~ GOTO a_book_01 									
									END
									
										IF ~~ THEN BEGIN a_book_01
										SAY ~Ihr könnt nicht Lesen?~
										IF ~~ THEN REPLY ~Doch, natürlich kann ich Lesen.~ GOTO book_value
										IF ~~ THEN REPLY ~Darum geht es nicht.~ + book_value
										END
										
											IF ~~ THEN BEGIN book_value
											SAY ~Ihr werdet seinen Wert früher oder später erkennen, dessen bin ich mir sicher! Doch zurück zu meinem Anliegen.~
											IF ~~ THEN GOTO family_matters_NEW_01
											END
									
									IF ~~ THEN BEGIN family_matters_NEW_01
									SAY ~Seit langer Zeit schon interessiert sich meine Familie für einige zwergische Artefakte, deren Geschichten eng mit der Region, in der wir uns hier befinden, verknüpft sind. Ursprünglich aus reiner Sammelleidenschaft erworben, entwickelte meine Familie doch stärkeres Interesse an der Geschichte der Zwerge, denn in unserer Heimat haben wir uns auf den Abbau seltener Erze, die wir für unsere magischen Gegenstände benötigen, spezialisiert. In Halruaa sind zwar reichlich Bodenschätze vorhanden, aber wenig Wissen, wie man damit umgeht. Deshalb bin ich hier.~
									IF ~~ THEN GOTO why_i_need_sceptre
									END
									
									IF ~~ THEN BEGIN why_i_need_sceptre
									SAY ~Ich habe die Vermutung, dass die Zwerge einst Gegenstände verwendeten, die das Gestein selbst verändern konnten. Auf irgendeine Art und Weise war es ihnen möglich, selbst härteste Legierungen zum Schmelzen zu bringen. Leider ist dieses Wissen im Laufe der Jahrhunderte mit dem Verschwinden der Zwerge verloren gegangen. Ich hoffe jedoch, dass in diesem Zepter, dessen Griff Ihr mir besorgt habt, noch die verborgene Magie von einst schlummern könnte. Deshalb suche ich nach diesem Gegenstand.~
									//IF ~~ THEN REPLY ~Ich soll Euch also den zweiten Teil des Zepters besorgen?~ + shipwreck_quest_01
									IF ~~ THEN REPLY ~Warum fragt Ihr nicht einfach einen Zwergenclan um Hilfe?~ + ask_dwarves
									END
									
										IF ~~ THEN BEGIN ask_dwarves
										SAY ~Die Zwerge wollen doch alles Wissen nur für sich behalten. Der Gedanke, dass ein Volk Menschen - noch dazu Magier!- ihr wertvolles Gestein bearbeiten könnten, ist für sie nur schwer erträglich. Glaubt mir, meine Familie hat schon alle anderen Möglichkeiten ausgeschöpft, bevor ich mich anschickte, diese Reise zu unternehmen.~
										//IF ~~ THEN REPLY ~Ich soll Euch also den zweiten Teil des Zepters besorgen?~ + shipwreck_quest_01
										IF ~~ THEN GOTO NEW_unify_sceptre
										END
/*	
	IF ~~ THEN BEGIN beldas_alive_scepter_handle_retrieved_01
	SAY ~Mein Vertrauter sagte mir, Ihr hättet ihm geholfen, diesen Zeptergriff für mich zu besorgen?~
	IF ~~ THEN REPLY ~Das ist richtig.~ + scepter_handle_retrieved_02
	END
	
	IF ~~ THEN BEGIN beldas_dead_scepter_handle_retrieved_01
	SAY ~Mein Vertrauter sagte mir, Ihr hättet ihm geholfen, diesen Zeptergriff für mich zu besorgen? Und Ihr seid auf der Suche nach einem Weg ins Unterreich?~
	IF ~~ THEN REPLY ~Das ist richtig.~ + scepter_handle_retrieved_02
	END

		
			IF ~~ THEN BEGIN scepter_handle_retrieved_02
			SAY ~Nun, wie Ihr Euch vorstellen könnt, war ich etwas überrascht, nur den einen Teil des Zepters vor mir zu sehen. Ich hätte gerne das vollständige Zepter in meinem Besitz, und dazu fehlt der Kopf.~
			++ ~Was ist denn so besonders an diesem Zepter?~ + what_kind_of_scepter
			END
		
			
				IF ~~ THEN BEGIN what_kind_of_scepter
				SAY ~Das kann ich noch nicht genau sagen. Dazu bräuchte ich den zweiten Teil.~
				//IF ~Global("AC#BeldasDies","GLOBAL",0)~ THEN REPLY ~Wisst Ihr, wo sich der zweite Teil befinden könnte?~ + second_part_no
				//IF ~GlobalGT("AC#BeldasDies","GLOBAL",1)~ THEN REPLY ~Wisst Ihr, wo sich der zweite Teil befinden könnte?~ + second_part_yes
				IF ~~ THEN REPLY ~Wisst Ihr, wo sich der zweite Teil befinden könnte?~ + second_part_yes
				END
				
							IF ~~ THEN BEGIN second_part_yes
							SAY ~Ja. Ich musste eine lange Zeit alte Folianten wälzen, aber jetzt weiß ich, wo der Kopf des Zepters zu finden ist. Ich würde ja selbst weitere Nachforschungen anstellen, wenn ich denn die Möglichkeit dazu hätte.~
							IF ~~ THEN GOTO aldyms_quest_02
							END
							
					IF ~~ THEN BEGIN second_part_no
					SAY ~Leider nicht. Ich hatte nicht damit gerechnet, dass es überhaupt möglich wäre, diesen zu trennen. Ich kann mir auch nicht vorstellen, dass die beiden Teile weit voneinander entfernt sind.~
					IF ~~ THEN GOTO interest_work_for_mage
					END
					
						IF ~~ THEN BEGIN interest_work_for_mage
						SAY ~Es freut mich jedenfalls, dass Ihr hergekommen seid. Meine Bitte an Euch ist einfach - haltet Eure Augen und Ohren offen. Solltet Ihr irgendwo auf Euren Reisen einen Gegenstand finden, der zu diesem Griff passen könnte, bringt ihn zu mir.~
						IF ~~ THEN REPLY ~Das lässt sich machen.~ GOTO interest_work_for_mage_02
						IF ~~ THEN REPLY ~Wer seid Ihr eigentlich?~ + aldyms_quest_02 
						END
						
							IF ~~ THEN BEGIN interest_work_for_mage_02
							SAY ~Ich wäre Euch sehr verbunden. Ich würde ja selbst weitere Nachforschungen anstellen, wenn ich denn die Möglichkeit dazu hätte.~
							IF ~~ THEN GOTO aldyms_quest_02
							END

							IF ~~ THEN BEGIN aldyms_quest_02								
							SAY ~Ich komme nicht von hier. Ich gehöre zur Familie der Ryscelsar aus Halruaa und habe den weiten Weg in dieses ungastliche Land zurückgelegt, um mich mit der Arbeit der Zwerge, die hier vor tausenden von Jahren lebten, zu befassen. Leider habe ich feststellen müssen, dass dieses Land Magiern gegenüber nicht besonders wohlgesonnen ist. Und so musste ich mich hier mitten im Nirgendwo niederlassen und bin auf fremde Hilfe angewiesen, denn sowohl der Zugang nach Athkatla als auch ein freies Reisen bleiben mir in dieser Ländereien verwehrt.~
							++ ~Die Verhüllten Magier haben Euch von weiteren Nachforschungen abgehalten?~ + aldym_cw_01
							END

								IF ~~ THEN BEGIN aldym_cw_01
								SAY ~So ist es. Ich hatte von ihrem Einfluss in diesem Land gehört, ihre Macht über die Anwender der Magie aber kolossal unterschätzt. Jetzt sitze ich hier in diesem Turm fest und komme nicht weiter.~
								IF ~~ THEN EXTERN ~AC#RAVE3~ tower01
								END

								IF ~~ THEN BEGIN tower02
								SAY ~Oh ja, mein Vertrauter hat eine Menge beeindruckender Fähigkeiten, nicht wahr, mein Guter?~
								IF ~~ THEN EXTERN ~AC#RAVE3~ tower03
								END

								IF ~~ THEN BEGIN familiar01
								SAY ~Ich habe meinen Vertrauten Salpham gefunden, kurz, nachdem mein alter Vertrauter verschwunden ist. Welch ein Glück, denn ohne ihn hätte ich diese Reise nie antreten können! Doch ich schweife ab.~
								IF ~~ THEN GOTO whatayawant_01
								END

									IF ~~ THEN BEGIN whatayawant_01
									SAY ~Seit langer Zeit schon interessiert sich meine Familie für einige zwergische Artefakte, deren Geschichte eng mit der Region, in der wir uns hier befinden, verknüpft ist. Ursprünglich aus reiner Sammelleidenschaft erworben, entwickelte meine Familie doch stärkeres Interesse an der Geschichte der Zwerge. Und deshalb bin ich hier.~
									//IF ~Global("AC#BeldasDies","GLOBAL",0)~ THEN REPLY ~Und was ist meine Aufgabe dabei?~ + whatayawant_02
									//IF ~GlobalGT("AC#BeldasDies","GLOBAL",1)~ THEN REPLY ~Ich soll Euch also den zweiten Teil des Zepters besorgen?~ + shipwreck_quest_01
									IF ~~ THEN REPLY ~Ich soll Euch also den zweiten Teil des Zepters besorgen?~ + shipwreck_quest_01
									END
*/									
									IF ~~ THEN BEGIN shipwreck_quest_01
									SAY ~Genau. Er befindet sich auf dem Wrack eines Schiffes, welches auf dem Weg nach Athkatla gekentert ist. Fragt mich nicht, wie der Teil des Zepters auf ein Schiff gelangt ist. Aber dort solltet Ihr suchen. Wenn Ihr ihn mir bringt, würde ich mich sehr erkenntlich zeigen!~
									IF ~~ THEN REPLY ~Gut. Ich werde mich auf die Suche machen.~ GOTO shipwreck_quest_02
									IF ~GlobalGT("AC#BeldasDies","GLOBAL",1)~ THEN REPLY ~Und mir einen Weg ins Unterreich zeigen?~ + route_underdark_01
									END
									
										IF ~~ THEN BEGIN route_underdark_01
										SAY ~Und Euch einen Weg ins Unterreich zeigen.~
										IF ~~ THEN REPLY ~Gut. Ich werde mich auf die Suche machen.~ GOTO shipwreck_quest_02
										END
									
										IF ~~ THEN BEGIN shipwreck_quest_02
										SAY ~Schön! Nach allem, was ich herausgefunden habe, befindet sich das Schiffswrack an der Küste südlich von Athkatla. Sucht dort nach dem Zepter. Ich werde hier auf Euch warten.~
										IF ~~ THEN DO ~RevealAreaOnMap("ACIL0D")
										SetGlobal("AC#XothaerinHead","GLOBAL",1)
										SetGlobal("AC#MeetAldym","GLOBAL",20)
										EraseJournalEntry(@20040)
										AddJournalEntry(@20033,QUEST)
										~ EXIT
										END
/*									
										IF ~~ THEN BEGIN whatayawant_02
										SAY ~Wie bereits erwähnt - momentan bitte ich Euch nur, mir bei meiner Suche unter die Arme zu greifen.~
										IF ~~ THEN GOTO wait_retrieve_scepter_head_01
										END

											
													IF ~~ THEN BEGIN wait_retrieve_scepter_head_01
													SAY ~Ihr wisst jetzt, wo ich mich aufhalte. Ich würde mich freuen, wenn Ihr mir mich zusätzlich bei meiner Suche unterstützen könntet. Gehabt Euch wohl, <CHARNAME>.~
													IF ~~ THEN DO ~SetGlobal("AC#XothaerinScepter","GLOBAL",3)
													EraseJournalEntry(@20022)~ EXIT
													END
*/
IF ~~ THEN BEGIN what01
SAY ~He, Salpham, was macht Ihr da?~
IF ~~ THEN EXTERN ~AC#RAVE3~ betrayal02
END

IF ~~ THEN BEGIN what02
SAY ~Ich verstehe nicht, Salpham...~
IF ~~ THEN EXTERN ~AC#RAVE3~ betrayal03
END

/*******************************************************************************************************
Dialogue Aldym dying
*******************************************************************************************************/
BEGIN ~AC#ALDY2~

IF ~True()~ THEN BEGIN hello_dying_inside
SAY ~*Hust* Was für ein Verrat, <CHARNAME>... Schnell, geht nach draußen! Der Turm scheint sich aufzulösen und aus dieser Welt zu verschwinden!~
IF ~~ THEN EXIT 
END

IF ~~ THEN BEGIN he_is_your_master
SAY ~ER ist Euer Meister? Dieser.... Teufel?~
IF ~~ THEN EXTERN ~AC#MAL06~ malphas_devil
IF ~InParty("HaerDalis")~ THEN EXTERN ~HAERDAJ~ haerdalis_raven_02 
END

/*******************************************************************************************************
Dialogue Aldym dying outside in area ACIL08
*******************************************************************************************************/
BEGIN ~AC#ALDY3~

IF ~Global("AldymHealMagic","ACIL08",1)~ THEN BEGIN hello_heal_magic
SAY ~Bitte.. beeilt Euch. Das Atmen fällt mir schwer...~
IF ~PartyHasItem("POTN08")~ THEN REPLY ~Nehmt diesen Heiltrank. Er wird Euch helfen, wieder auf die Beine zu kommen.~ DO ~TakePartyItem("POTN08")~ GOTO give_healing_potion
IF ~PartyHasItem("POTN52")~ THEN REPLY ~Nehmt diesen konzentrierten Heiltrank. Er wird Euch helfen, wieder auf die Beine zu kommen.~ DO ~TakePartyItem("POTN52")~ GOTO give_healing_potion
IF ~~ THEN REPLY ~Ich versuche immer noch, Euch mit Magie zu heilen.~ + still_try_heal_magic
END

	IF ~~ THEN BEGIN still_try_heal_magic
	SAY ~Bitte.. beeilt Euch! Mir bleibt nicht mehr viel Zeit auf dieser Welt.~
	IF ~~ THEN EXIT 
	END
			
IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_dying_outside
SAY ~Verschwunden. Einfach in Luft aufgelöst hat er sich! Wie konnte ich die ganze Zeit in diesem Turm hausen, ohne zu erkennen, dass alles nur Lug und Trug ist?~
IF ~~ THEN REPLY ~Was ist da gerade mit dem Turm passiert?~ GOTO what_happened_tower
IF ~~ THEN REPLY ~Was war das für eine Gestalt, die dort erschienen ist?~ + about_malphas
IF ~~ THEN REPLY ~Euer Vertrauter hat Euch hintergangen.~ + familiar_01
IF ~~ THEN REPLY ~Wie geht es jetzt weiter?~ + whats_next
END

	IF ~~ THEN BEGIN what_happened_tower
	SAY ~Der Turm hat sich *hust* dematerialisiert. Er war nicht von dieser Welt. Ich dachte, es wäre ein einfacher Zauber, den mein Vertrauter gewirkt hatte...~
	IF ~~ THEN REPLY ~Was war das für eine Gestalt, die dort erschienen ist?~ + about_malphas
	IF ~~ THEN REPLY ~Euer Vertrauter hat Euch hintergangen.~ + familiar_01 
	IF ~~ THEN REPLY ~Wie geht es jetzt weiter?~ + whats_next
	END
	
	IF ~~ THEN BEGIN about_malphas
	SAY ~Ich weiß es nicht. Irgendeine Art rabengesichtiges Scheusal. Ich... bin mir nicht sicher, aber ich meinte, irgendwo schon einmal von einem solchen Teufel namens Malphas gelesen zu haben, der imstande ist, Sterbliche in seine Ränke einzuspannen und ihnen zeitweise mächtige Türme zu schenken...~
	IF ~~ THEN REPLY ~Ihr meint, dieser Malphas hat den Turm herbeigezaubert, um Euch einzulullen?~ GOTO malphas_built_tower
	IF ~~ THEN REPLY ~Wie geht es jetzt weiter?~ + whats_next
	END
	
		IF ~~ THEN BEGIN malphas_built_tower
		SAY ~So... muss es gewesen sein, ja. Er schickte mir meinen Vertrauten, um mich in Sicherheit zu wiegen. Diese ganze Suche nach den Zeptern, diese ganze Zwergengeschichte nur seinetwegen... wie konnte ich bloß so dumm sein!~
		IF ~~ THEN REPLY ~Wie geht es jetzt weiter?~ + whats_next
		END
	
	IF ~~ THEN BEGIN familiar_01
	SAY ~Das hat er. Und ich war so versessen, dieses verfluchte Zepter zu bekommen, dass ich es nicht bemerkt hatte!~
	IF ~~ THEN REPLY ~Was ist da gerade mit dem Turm passiert?~ GOTO what_happened_tower
	IF ~~ THEN REPLY ~Was war das für eine Gestalt, die dort erschienen ist?~ + about_malphas
	IF ~~ THEN REPLY ~Wie geht es jetzt weiter?~ + whats_next
	END
	
IF ~~ THEN BEGIN whats_next
SAY ~Mit mir geht es zu Ende. Eine gerechte Strafe für meine Torheit! Und Ihr solltet ins Unterreich gehen und diese Zwergenstadt aufsuchen, bevor noch mehr Unheil geschieht.~
IF ~~ THEN REPLY ~Ihr wolltet mir einen Weg dorthin nennen, Aldym.~ GOTO way_to_underdark
IF ~~ THEN REPLY ~Ich weiß immer noch nicht, wie ich dorthin komme.~ GOTO way_to_underdark
END

	IF ~~ THEN BEGIN way_to_underdark
	SAY ~Ach ja. So nahm das Unheil ja erst seinen Lauf. Also passt auf, ich kann Euch einen Weg ins Unterreich nennen.~
	IF ~~ THEN GOTO way_to_underdark_02
	END
	
		IF ~~ THEN BEGIN way_to_underdark_02
		SAY ~Es war schwierig, hierzu etwas in den Schriften der Gelehrten zu finden. Die Zwerge hatten sämtliche Eingänge vor ihrem Verschwinden versiegelt. Und der einzige noch bekannte Zugang ins alte Shanatar soll nun sogar von einem Drachen bewacht werden!~
		IF ~~ THEN REPLY ~Den habe ich vermutlich bereits kennengelernt.~ GOTO way_to_underdark_03
		IF ~~ THEN REPLY ~Fahrt fort.~ GOTO way_to_underdark_03
		END
		
			IF ~~ THEN BEGIN way_to_underdark_03
			SAY ~Ich hörte, Ihr wart schon im südlichen Tethyr auf der Suche nach einem passenden Weg ins Unterreich. Ihr wart sogar nahe dran! Es gibt da eine Höhle in den Kuldin-Gipfeln, die man Ravimors Höhle nennt. Die Zwerge haben sie nie beachtet, da die Passage aus einer Zeit stammt, als erst wenige Menschen und Zwerge auf dieser Welt wandelten. Dieser Durchgang scheint noch offen zu sein - oder besser gesagt: Er wurde nie genutzt und deshalb nie verschlossen. Ich weiß nicht, was Euch dort erwartet. Aber Euer Vorteil ist, dass niemand damit rechnet, dort einen Zugang zu finden. Nach den vergangenen Ereignissen fürchte ich, dass viele böse Augen die bekannten Wege nach Euch absuchen werden.~
			IF ~~ THEN DO ~RevealAreaOnMap("ACIL01")
			EraseJournalEntry(@20010)
			AddJournalEntry(@20019,QUEST)
			AddJournalEntry(@20041,QUEST_DONE)~ GOTO bye_pre_death
			END
			
			IF ~~ THEN BEGIN bye_pre_death
			SAY ~Schreitet diesen Weg - und wendet das böse Schicksal ab, das ich heraufbeschworen habe! Und betet für mich, dass Azuth meiner Seele gnädig sei. Einzig dies und sonst nichts mehr.~						
			IF ~~ THEN REPLY ~Ihr werde Euch hier nicht sterbend zurücklassen, Magier.~ GOTO heal_you_01
			IF ~~ THEN REPLY ~Dann lasse ich Euch hier einmal allein und entbiete Euch ein Lebewohl.~ GOTO bye_death
			END
			
			IF ~~ THEN BEGIN heal_you_01
			SAY ~Das wäre eine noble Geste... doch macht schnell, ich spüre, dass mein letztes Stündlein geschlagen hat...~
			IF ~PartyHasItem("POTN08")~ THEN REPLY ~Nehmt diesen Heiltrank. Er wird Euch helfen, wieder auf die Beine zu kommen.~ DO ~TakePartyItem("POTN08")~ GOTO give_healing_potion
			IF ~PartyHasItem("POTN52")~ THEN REPLY ~Nehmt diesen konzentrierten Heiltrank. Er wird Euch helfen, wieder auf die Beine zu kommen.~ DO ~TakePartyItem("POTN52")~ GOTO give_healing_potion
			IF ~~ THEN REPLY ~Ich könnte versuchen, Euch mit Magie zu heilen.~ + heal_magic
			END
			
			IF ~~ THEN BEGIN give_healing_potion
			SAY ~Das ist sehr nobel von Euch...~
			IF ~~ THEN DO ~DisplayString(Myself,46150)
			UseItem("POTN08",Myself)
			UseItem("POTN52",Myself)
			SetGlobal("AC#HealedAldym","GLOBAL",1)~ EXIT 
			END

			IF ~~ THEN BEGIN heal_magic
			SAY ~Bitte.. beeilt Euch. Das Atmen fällt mir schwer...~
			IF ~~ THEN DO ~SetGlobal("AldymHealMagic","ACIL08",1)
			SetGlobalTimer("AldymHealMagicTimer","ACIL08",TWO_ROUNDS)~ EXIT 
			END
			
			IF ~~ THEN BEGIN bye_death
			SAY ~So ist es also um mich geschehen...~
			IF ~~ THEN DO ~VerbalConstant(Myself,DYING)
			Kill(Myself)~ EXIT 
			END

/*******************************************************************************************************
Dialogue Aldym rescued
*******************************************************************************************************/
BEGIN ~AC#ALDY4~

IF ~True()~ THEN BEGIN hello_rescued_me
SAY ~Ihr habt es tatsächlich vollbracht! Habt Dank, Freunde, dass Ihr mich nicht in dieser Wildnis dem Tode überlassen habt.~
IF ~~ THEN REPLY ~Was gedenkt Ihr jetzt zu tun?~ + whats_next
END

	IF ~~ THEN BEGIN whats_next
	SAY ~Ich weiß es nicht. Mein Himmelsschiff ist zerstört. Was hält mich noch an diesem Ort? Wenn ich den verhüllten Magiern in die Hände falle bin ich verloren.~
	IF ~~ THEN GOTO whats_next_02 
	END
	
		IF ~~ THEN BEGIN whats_next_02
		SAY ~Ich habe noch einen letzten Zauber, der mich in meine Heimat zurückbringen wird. Diese Gelegenheit werde ich nutzen. Doch vorher möchte ich Euch als Dank für meine Rettung eine kleine Belohnung geben.~
		IF ~~ THEN DO ~GiveItem("AC#MGCAP",Player1)~ GOTO reward
		END
		
			IF ~~ THEN BEGIN reward
			SAY ~Diese Kopfbedeckung hat mich in der Vergangenheit vor vielen falschen Entscheidungen bewahrt. Nur gegen die eigene Torheit gibt es keine schützende Magie! So lebt denn wohl, <CHARNAME>. Ich werde Euch in warmen Erinnerungen halten.~
			IF ~~ THEN DO ~AddexperienceParty(1000)
			CreateVisualEffectObject("SPDIMNDR",Myself) 
			Wait(1)				
			DestroySelf()~ EXIT 
			END
/*******************************************************************************************************
Salpham-Dialog
*******************************************************************************************************/

BEGIN ~AC#RAVE3~

IF ~True()~ THEN BEGIN hello_talk_to_master
SAY ~Sprecht zu meinem Meister, nicht zu mir.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN not_tell_way_underdark_too_early
SAY ~Um uns dann auf Nimmerwiedersehen zu verlassen? Ihr haltet meinen Meister für einen ganz schönen Narren, <RACE>!~
IF ~~ THEN EXTERN ~AC#ALDYM~ first_scepter_then_underdark
END

IF ~~ THEN BEGIN tower_new_01
SAY ~*Ich* habe meinem Meister diesen Turm geschenkt, müsst Ihr wissen.~
IF ~~ THEN EXTERN ~AC#ALDYM~ tower_new_02
IF ~IsValidForPartyDialog("HaerDalis")~ THEN EXTERN ~HAERDAJ~ haerdalis_raven_01
END

/*
IF ~~ THEN BEGIN tower01
SAY ~*Ich* habe meinem Meister diesen Turm geschenkt, müsst Ihr wissen.~
IF ~~ THEN EXTERN ~AC#ALDYM~ tower02
END
*/

IF ~~ THEN BEGIN tower_new_03
SAY ~*Krah*! *Krah*!~
IF ~~ THEN EXTERN ~AC#ALDYM~ familiar_new_01
END

/*
IF ~~ THEN BEGIN tower03
SAY ~*Krah*! *Krah*!~
IF ~~ THEN EXTERN ~AC#ALDYM~ familiar01
END
*/

IF ~~ THEN BEGIN is_this_party01
SAY ~Ja, Meister. Ich hatte sie vor der Axtbrücke getroffen.~
IF ~~ THEN EXTERN ~AC#ALDYM~ welcome
END

IF ~~ THEN BEGIN scepter_opened_portal
SAY ~Gebt meinem Meister doch einfach dieses Zepter, dann werden wir sehen, was es damit auf sich hat!~
IF ~~ THEN EXTERN ~AC#ALDYM~ have_xothaerin_scepter_01
END

IF ~~ THEN BEGIN betrayal01
SAY ~...wonach ich gesucht habe!~
IF ~~ THEN EXTERN ~AC#ALDYM~ what01
END

IF ~~ THEN BEGIN betrayal02
SAY ~Ich nehme das, weshalb ich hergekommen bin und was mir zusteht!~
IF ~~ THEN DO ~TakePartyItem("AC#ZEPX2")~ EXTERN ~AC#ALDYM~ what02
END

IF ~~ THEN BEGIN salpham_leave
SAY ~Ja, Meister!~
IF ~~ THEN EXTERN ~AC#ALDY2~ he_is_your_master 
END

IF ~~ THEN BEGIN shut_up
SAY ~Haltet die Klappe, Barde!~
IF ~~ THEN EXTERN ~HAERDAJ~ shut_up_02 
END

IF ~~ THEN BEGIN betrayal03
SAY ~Ihr... Ihr seid nicht mein Meister. Ich diene einem höheren Wesen. Meister? MEISTER? Ich habe das Zepter! ICH HABE BEIDE ZEPTER!~
IF ~~ THEN DO ~SetGlobal("AC#_MalphasTransforms","GLOBAL",1)
StartCutSceneMode()
StartCutScene("AC#5CUT2")~ EXIT
END
/*
Malphas appears
*/
BEGIN ~AC#MAL06~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY  ~Gut gemacht, mein lieber Rabe! Das Zepter ist unser! Nun lasst mich gleich einmal seine Wirkung versuchen!~
IF ~~ THEN DO ~SetGlobal("AC#_MalphasTransforms","GLOBAL",2)
StartCutSceneMode()
StartCutScene("AC#5CUT4")~ EXIT
END

IF ~Global("AC#_Malphas_Revealed","GLOBAL",3)~ THEN BEGIN 1
SAY ~Ihr wart nützlich, Magier, das zu beschaffen, wonach es meiner Herrin verlangt, und nun nehme ich Euch diese beiden Zepter und alles andere, vor allem Euer Leben. Solltet Ihr nicht ausreichend zu Euren Göttern gebetet haben, sehen wir uns vielleicht im Jenseits erneut wieder. Es wäre mir eine Freude, Eure Qualen in Baator zu verlängern. Kommt Ihr, Salpham?~ 
IF ~~ THEN EXTERN ~AC#RAVE3~ salpham_leave
END

/*
	IF ~~ THEN BEGIN byebye_charname
	SAY ~Und auch Ihr, <CHARNAME>, sollt hier sterben. So führe ich nun das zu Ende, was auf dem Turboldberg begann - dabei hatte ich den Hinterhalt so gut vorbereitet!~
	++ ~Ihr wisst von dem Kampf?~ + know_dragon_01
	END
	
	
		IF ~~ THEN BEGIN know_dragon_01
		SAY ~Natürlich weiß ich davon, <PRO_RACE>. Ihr dummen Sterblichen denkt, alles dreht sich nur um Euch! Dabei ist es genau umgekehrt. Doch genug geredet, meine Herrin ruft, um mich für diesen Triumph reich zu belohnen. Kommt Ihr, Salpham?~
		IF ~~ THEN EXTERN ~AC#RAVE3~ salpham_leave
		END
*/		
			
		IF ~~ THEN BEGIN malphas_devil
		SAY ~"Teufel" ist ganz gut getroffen! Dachtet Ihr wirklich, dieser Rabe diente Euch aus freien Stücken? Los Salpham, zurück in meine Heimat und zu meiner Herrin!~
		IF ~~ THEN GOTO exit_fight
		END

IF ~~ THEN BEGIN exit_fight
SAY ~Ihr anderen sollt in meinem Turm verbrennen, wenn dieser aus Eurer Ebene gerissen wird!~
IF ~~ THEN DO ~SetGlobal("AC#_MalphasTransforms","GLOBAL",3)
SetGlobal("AC#_Malphas_Revealed","GLOBAL",4)
StartCutSceneMode()
StartCutScene("AC#5CUT3")~ EXIT
END

//__________________________________________________________
// NPC-Dialoge

// Cernd
APPEND ~CERNDJ~
IF ~~ THEN BEGIN Cernd_not_a_good_idea_01
   SAY ~Einen mächtigen Gegenstand wieder in Gang zu setzen, der absichtlich außer Funktion genommen wurde, übersteigt die Vorstellungskraft vieler Menschen in hohem Maße, lässt sie unvorsichtig werden und bringt die Ordnung durcheinander.~
   IF ~~ THEN EXTERN ~AC#ALDYM~ not_a_good_idea_01
END
END

// Valygar
APPEND ~VALYGARJ~
IF ~~ THEN BEGIN Valygar_cowled_wizards_01
   SAY ~Bestimmt seid Ihr den verhüllten Magiern in die Quere gekommen, richtig? Sie mögen es nicht gerne, wenn fremde Zauberkundige in ihrem Gebiet verweilen. Es muss Euch einiges an Kraft gekostet haben, ihren Fängen zu entwischen.~
   IF ~~ THEN EXTERN ~AC#ALDYM~ not_from_here_02
END
END

// Jaheira
APPEND ~JAHEIRAJ~
IF ~~ THEN BEGIN Jaheira_comment_help_forge_scepter
SAY ~Das klingt selbstloser als es tatsächlich gemeint ist.~
IF ~~ THEN EXTERN ~AC#ALDYM~ about_azerkyn_02  
END 
	
IF ~~ THEN BEGIN Jaheira_play_with_fire
   SAY ~Ihr wollt wirklich ernsthaft mit dem alten Feuer spielen, Magier?~
   IF ~~ THEN EXTERN ~AC#ALDYM~ play_with_fire
END

IF ~~ THEN BEGIN Jaheira_scepter_did_chaos
SAY ~Geht vorsichtig mit diesem Gegenstand um, Magier. Sobald wir ihn in den Zwergenminen zusammengesetzt hatten, hatte sich unvermittelt ein verschlossenes Feuerportal wieder geöffnet.~
IF ~~ THEN EXTERN ~AC#RAVE3~ scepter_opened_portal 
END
END

// Keldorn
APPEND ~KELDORJ~
IF  ~~ THEN BEGIN keldorn_vow_azuth
   SAY ~Solche Schwüre sind nicht mehr wert als das Pergament, auf sie dem stehen. Aber wir wollen Euch hier einmal glauben.~
   IF ~~ THEN EXTERN ~AC#ALDYM~ reforge_scepter_01
END
END

// Haer Dalis
APPEND ~HAERDAJ~
IF ~~ THEN BEGIN haerdalis_raven_01
   SAY ~Hach, der Rabe, welch anmutiges Tier! Da kommt mir erneut ein alter Reim in den Sinn:
   "Immer höher stieg mein Staunen bei des Raben dunklem Raunen,
   Doch ich dachte: Ohne Zweifel weiß er dies und sonst Nichts mehr;
   Hat’s von seinem armen Meister, dem des Unglücks finstre Geister
   Drohten dreist und drohten dreister, bis er trüb und trauerschwer."
   Ein treffender Vers, zeigt er doch, welch schwere Bedeutung man jenen Vögeln seit jeher zuschreibt.~
   IF ~~ THEN EXTERN ~AC#ALDYM~ tower_new_02
END

IF ~~ THEN BEGIN haerdalis_raven_02
SAY ~Also doch der Rabe - ist es so, wie ich es sage?~
=
~"Gramprophet! rief ich voll Zweifel, ob Du Vogel oder Teufel!
Bei dem ew’gen Himmel droben, bei dem Gott, den ich verehr’
Sei dies Wort das Trennungszeichen! Vogel, Scheusal, Du mußt weichen!
Fleuch zurück zum Sturmesgrauen, oder zum Baator’schen Heer!
Keine Feder laß zurücke mir als Zeichen Deiner Tücke;
Laß allein mich dem Geschicke – wage nie Dich wieder her!"~
IF ~~ THEN EXTERN ~AC#RAVE3~ shut_up 
END

IF ~~ THEN BEGIN shut_up_02
SAY ~Wohl eher den Schnabel, fürcht' ich!~
IF ~~ THEN EXTERN ~AC#MAL06~ malphas_devil 
END
END
