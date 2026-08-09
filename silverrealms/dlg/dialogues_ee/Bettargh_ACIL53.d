/*******************************************************************************************************
Dialog Bettargh Riftsong
*******************************************************************************************************/

BEGIN ~AC#BETT1~

IF ~Global("ElernSpawn","ACIL53",3)~ THEN BEGIN elern_will_tell_you
SAY ~Meine Tochter Elern wird Euch am Standbild von Borthun, dem Wanderer alles erklären.~
IF ~~ THEN EXIT
END	

/*
IF ~GlobalGT("AC#RC_Spiderstalkings","GLOBAL",0)~ THEN BEGIN hello_anything_achieved
//IF ~Global("AC#IL_NEW_Borthun","GLOBAL",1)~ THEN BEGIN hello_anything_achieved
SAY ~Seid gegrüßt, <CHARNAME>! Was kann ich als bescheidener Bibliothekar für Euch tun?~
// OLD: Astral book talk IF ~~ THEN GOTO not_lazy
IF ~Global("AC#IL_NEW_Borthun","GLOBAL",1) Global("AC#IL_NEW_BettarghElern","GLOBAL",0)~ THEN REPLY ~Ich suche ein besonderes Buch.~ + borthun_book_start
IF ~Global("AC#Ellhimar_Cernd","GLOBAL",3) Global("Prison_Cernd","ACIL53",0)~ THEN REPLY ~Es geht um Khaernd, den Sohn von Gromi, der von Illithiden verschleppt wurde.~ GOTO free_cernd_start	
END
*/

		IF ~~ THEN BEGIN free_cernd_start
		SAY ~Ein durch und durch armer Tropf. Ich versuche, ihm hier in der Bibliothek wenigstens ein Leben fernab von Zwergen zu ermöglichen, die ihn als Monster betrachten. Wenngleich er dennoch in einem Käfig steckt - bis jetzt.~
		IF ~~ THEN GOTO free_cernd_01
		END
		
		IF ~~ THEN BEGIN borthun_book_start
		SAY ~Davon haben wir hier viele. Welches steht Euch im Sinn?~
		IF ~~ THEN REPLY ~Eines, das nicht in dieser Bibliothek steht.~ GOTO borthun_book_start_02
		END
		
			IF ~~ THEN BEGIN borthun_book_start_02
			SAY ~Was? Wie kommt Ihr denn auf so etwas?~
			IF ~~ THEN REPLY ~Mith Barak erwähnte ein Buch. Ein Buch, das sich in Iltkazar befindet. Aber nicht an dem Ort, an dem man es vermuten würde. "Das einzige Buch Iltkazars, das nicht in der Bibliothek liegen darf." So nannte er es.~ GOTO borthun_book_start_03
			END
			
			IF ~~ THEN BEGIN borthun_book_start_03
			SAY ~"Das einzige Buch Iltkazars, das nicht in der Bibliothek liegen darf"? Merkwürdig. Wir haben hier alle Bücher. Mith Barak war sehr belesen und ein gern gesehener Gast in unserer Bibliothek. Ein Buch, das nicht hier liegt. Oder vielmehr liegen darf? Hm...~
			IF ~~ THEN GOTO borthun_book_start_04
			END
			
			IF ~~ THEN BEGIN borthun_book_start_04
			SAY ~Oh! Ich habe eine Idee. Elern hatte mir vor Kurzem davon berichtet. Das wird es sein! Warum bin ich nicht schon vorher darauf gekommen?~
			IF ~~ THEN GOTO stone_clans_parting_02
			END
		
	IF ~~ THEN BEGIN not_lazy
	SAY ~Doch auch ich war nicht untätig.~
	IF ~!Global("AC#BettarghHasBook","GLOBAL",1)~ THEN GOTO not_bettargh_has_book_reveal
	IF ~Global("AC#BettarghHasBook","GLOBAL",1)~ THEN GOTO yes_bettargh__has_book_reveal
	END

// astral plane book	
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
			SAY ~König Mith Barak war seit längerer Zeit sehr interessiert an der Astralebene.~
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
									IF ~~ THEN GOTO mithbarak_astral_travel_04
									END
									
									IF ~~ THEN BEGIN mithbarak_astral_travel_04
									SAY ~Mith Barak war überzeugt davon, dass in einem der Unterkönigreiche ein Portal in die Astralebene existieren müsse. Ich werde in der Bibliothek weitersuchen, ob sich dazu weitere Hinweise finden lassen. Lassen wir es bis auf weiteres darauf bewenden.~ 				
									IF ~Global("AC#IL_NEW_BettarghElern","GLOBAL",0)~ THEN + stone_clans_parting_01
									IF ~Global("AC#Ellhimar_Cernd","GLOBAL",3) Global("Prison_Cernd","ACIL53",0)~ THEN GOTO free_cernd_01	
									END	
									
									IF ~~ THEN BEGIN free_cernd_01
									SAY ~Elern erzählte mir, dass Ihr Hilfe bei der Entzifferung dieses... Hirnlappens eines Illithidenhirns benötigt.~
									IF ~~ THEN GOTO free_cernd_02
									END	
									
									IF ~~ THEN BEGIN free_cernd_02
									SAY ~Vronia hatte Euch bereits über Khaernds Schicksal berichtet. Ich wurde von der Stadt mit der Aufsicht über Gromis Sohn betraut, und ich habe beschlossen, dass es das Beste wäre, er würde Euch bei dem Vorgehen unterstützen.~
									IF ~~ THEN REPLY ~Deshalb bin ich hier. Ich würde gerne mit Khaernd sprechen.~ GOTO free_cernd_03
									IF ~~ THEN REPLY ~Ich brauche Khaernd dafür nicht.~ GOTO not_free_cernd
									END	

									IF ~~ THEN BEGIN not_free_cernd
									SAY ~Wie Ihr meint.~
									IF ~~ THEN GOTO keep_on_going_surface
									END										
									
									IF ~~ THEN BEGIN free_cernd_03
									SAY ~Einverstanden. Khaernds Zelle befindet sich im Westen dieser Bibliothek. Ich habe die Wachen bereits angewiesen, Euch durchzulassen. Sprecht mit ihm und bittet um seine Hilfe. Er mag ein wenig verrückt sein, aber er hat ein gutes Herz.~
									IF ~~ THEN DO ~SetGlobal("Prison_Cernd","ACIL53",1)
									AddJournalEntry(@50702,QUEST)~ EXIT
									END	

									
										IF ~~ THEN BEGIN stone_clans_parting_01
										SAY ~Dabei fällt mir ein - Elern wollte mit Euch wegen eines merkwürdigen Buches sprechen...~
										IF ~~ THEN + stone_clans_parting_02
										END


	IF ~~ THEN BEGIN keep_on_going_surface
	SAY ~Sagt mir Bescheid, wenn Ihr sonst noch etwas von mir benötigt. Ich werde mich so lange meinen Büchern und Runentafeln widmen.~
	IF ~~ THEN DO ~~ EXIT 
	END
	
		IF ~~ THEN BEGIN stone_clans_parting_02
		SAY ~Elern, Liebes, würdest Du bitte einmal zu mir und unserem Gast von der Oberfläche kommen?~
		IF ~~ THEN DO ~SetGlobal("AC#IL_NEW_BettarghElern","GLOBAL",1)
		SetGlobal("ElernSpawn","ACIL53",1)
		SetGlobal("AC#IL_NEW_Borthun","GLOBAL",10)~ EXIT
		END
		
IF ~GlobalGT("AC#TalkedToBettargh","ACIL53",1)~ THEN BEGIN hello_after_first_talk
SAY ~Oh, seid gegrüßt, <CHARNAME>! Was kann ich für Euch tun?~
++ ~Derzeit nichts.~ + goodbye_02
IF ~PartyHasItem("AC#SRBK1")~ THEN REPLY ~Ich habe hier ein Buch, welches Beldas bis zu seinem Tode bei sich trug. Ich soll es Euch geben.~ + beldas_book
IF ~Global("AC#IL_NEW_Borthun","GLOBAL",1) Global("AC#IL_NEW_BettarghElern","GLOBAL",0)~ THEN REPLY ~Ich suche ein besonderes Buch.~ + borthun_book_start
IF ~Global("AC#Ellhimar_Cernd","GLOBAL",3) Global("Prison_Cernd","ACIL53",0)~ THEN REPLY ~Es geht um Khaernd, den Sohn von Gromi, der von Illithiden verschleppt wurde.~ GOTO free_cernd_start	
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
						IF ~~ THEN REPLY ~Nichts mehr. Ich werde später wieder vorbeikommen.~ + goodbye_02
						END

						
						// The PCs deliver Beldas' Book about the astral plane
							IF ~~ THEN BEGIN beldas_book
							SAY ~Der arme Beldas, ja. Ich habe von seinem Schicksal gehört. Er war ein guter Zwerg und ein formidabler Schüler. Lasst mich das Buch einmal sehen...~
							IF ~~ THEN DO ~SetGlobal("AC#BettarghHasBook","GLOBAL",1)
							TakePartyItem("AC#SRBK1")
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
								//IF ~~ THEN DO ~SetGlobal("BettarghMoves","ACIL53",1)~ EXIT 
								IF ~~ THEN EXIT 
								END
								
								IF ~~ THEN BEGIN goodbye_02
								SAY ~Dann werde ich mich wieder meinen Studien widmen. Ihr findet mich hier in der Bibliothek meist am zentralen Schacht neben der Treppe, falls Ihr später weitere Fragen habt.~
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
Dialog Elern in ACIL53 
*******************************************************************************************************/
BEGIN ~AC#ELER5~

IF ~~ THEN BEGIN okidok
SAY ~Kommt, <CHARNAME>, folgt mir zu Borthuns Standbild im Osten der Bibliothek!~
IF ~~ THEN DO ~SetGlobal("ElernSpawn","ACIL53",3)
SetGlobal("AC#ElernBorthunBook","GLOBAL",1)
AddJournalEntry(@64101,QUEST)
MoveToPointNoInterrupt([2755.920])~ EXIT
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
			SAY ~Beldas war ein glühender Verehrer Borthuns. Beide gehörten dem Clan Diamantklinge an. Beldas wollte ihm in jeglicher Hinsicht nacheifern. Leider hat ihm dies kein Glück gebracht, wie Ihr wisst.~			
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
						SAY ~Aber zurück zu Borthuns Buch. Er hat genaue Aufzeichnungen über seine Entdeckungen in den Ländern des Lichts geführt.~
						IF ~~ THEN GOTO check_borthuns_diary
						END
			
							IF ~~ THEN BEGIN check_borthuns_diary
							SAY ~Es würde mich also nicht wundern, wenn Borthun in seinem Buch diesen Ort, den Mith Barak besucht hat, erwähnt hat. Und es passt auch zu der Aussage, es sei das einzige Buch Iltkazars, das nicht in der Bibliothek liegen darf. Denn Borthuns Chronik befindet sich tatsächlich nicht in dieser Bibliothek.~
							IF ~~ THEN GOTO why_diary_not_here	
							END
				
								IF ~~ THEN BEGIN why_diary_not_here
								SAY ~Es befindet sich im Besitz von Clan Diamantklinge. Borthun war Angehöriger dieses Clans, und bevor er zu seiner letzten Reise an die Oberfläche aufbrach, vermachte er die Chronik seinem Sohn, dem Urgroßvater von Anthan Diamantklinge, des Priesters in der Uralten Schmiede. Anthan rückt es nicht heraus, weil er es als Schande für seine Familie ansieht, dass ein Zwerg an die Oberfläche strebt. Darum gab es schon lange Zeit Streit zwischen Mith Barak und Anthan, dem Clanältesten.~
								++ ~Mith Barak hat sich mit Anthan gestritten?~ + dont_know_anthan	
								END
								
									IF ~~ THEN BEGIN dont_know_anthan
									SAY ~Die Moradin-Priester halten sich ja ohnehin für die einzig wahren Sprecher für die zwergische Rasse, und unser Anthan steht dem in nichts nach. Wenn es nach ihm ginge, würden wir noch genauso leben wie vor zweitausend Jahren. Gegen diese alten Steinköpfe hatte es unser König besonders schwer, dabei war ihm wirklich daran gelegen, die Stadt nach vorne zu bringen. Aber ich schweife ab.~
									=
									~*Dornar* Mith Barak machte keinen Hehl daraus, dass er Borthuns Aufzeichnungen gerne in die Bibliothek aufgenommen hätte, aber Anthan hat sich strikt geweigert. Sie haben sich damals wohl so geeinigt, dass Mith Barak das besagte Buch im Tempel Moradins lesen durfte. Dies hatte mir Beldas erzählt, bevor Mith Barak nicht mehr aus seinem Schlaf erwachte. Ich hatte es damals so verstanden, dass Beldas gemeinsam mit Mith Barak das Buch studiert hatte und sich deshalb umso mehr bemüßigt fühlte, an der Oberfläche nach einem "Heilmittel" für Mith Baraks Schlaf zu suchen.~ 
									= 
									~Dass Mith Barak vielleicht selbst genau aus diesem Grunde ebenfalls in Borthuns Aufzeichnungen nachschlagen wollte, kam mir bis jetzt nicht in den Sinn. Aber so könnte es gewesen sein! Wenn Ihr also glaubt, dass in diesem Buch hilfreiche Anmerkungen zu Mith Baraks Schlaf enthalten sein könnten, müsstet Ihr Anthan überzeugen, Euch dasselbe Zugeständnis zu gewähren: Euch einen Blick in Borthuns Chronik werfen zu lassen.~
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
								SAY ~Jedenfalls kann ich Euch keinen besseren Rat geben, als Anthan in der Uralten Schmiede, dem Tempel Moradins im Westen der Stadt, aufzusuchen und ihn zu bitten, dass er Euch einmal einen Blick in die Aufzeichnungen seines Ahnen Borthun werfen lässt. Ich werde draußen am Platz von Bhaerynden neben Bresk auf Euch warten. Wenn Ihr das Buch habt, helfe ich Euch, es zu lesen und zu verstehen. Und diesen Ort zu finden, an den Ihr als Nächstes reisen müsst.~
								IF ~~ THEN DO ~SetGlobal("ElernSpawn","ACIL53",4)
								SetGlobal("AC#ElernBorthunBook","GLOBAL",2)
								SetGlobal("AC#Clans_Parting","GLOBAL",2)
								AddJournalEntry(@64102,QUEST)
								EscapeArea()
								~ EXIT 
								END
					
					
// Elern Chain #1: Elern taucht auf und spricht mit ihrem Vater
CHAIN IF WEIGHT #-1 ~NumTimesTalkedTo(0)~ THEN AC#ELER5 yes_dad_whats_up
~Ja, Vater, was ist? Oh, <CHARNAME>! Ihr seid gekommen! Es ist schön, Euch wiederzusehen!~
== AC#BETT1 ~Würdet Ihr <CHARNAME> zu der Statue von Borthun führen und ihm berichten, was Ihr über dieses Buch, welches Ihr vor Kurzem erwähnt habt, herausgefunden habt?~
== AC#ELER5 ~Meint Ihr wirklich, dass dies jetzt der richtige Zeitpunkt ist, Vater?~
== AC#BETT1 ~Es ist genau der richtige Zeitpunkt. Genau genommen ärgere ich mich, dass ich darauf nicht schon viel früher gekommen bin.~
== AC#BETT1 ~Wir brauchen das Buch für unsere weitere Suche, Elern.~
== AC#ELER5 ~Nun, wenn das so ist helfe ich gerne!~
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

