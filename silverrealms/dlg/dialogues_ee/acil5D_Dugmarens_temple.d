/*******************************************************************************************************
Dialog Spriggan in ACIL9C
*******************************************************************************************************/

BEGIN ~AC#DORNA~

IF ~Global("AC#DRIFR","GLOBAL",2)~ THEN BEGIN hello_driftdisc_ready
SAY ~Toll! Habt Ihr das Wunder Dugmarens gesehen? Ich wünsche Euch viel Erfolg dabei, mit Eurer Schwebescheibe an die Oberfläche zurückzukehren. Ein wenig beneide ich Euch schon, dass Ihr so einfach hin- und herreisen könnt! Wer weiß, vielleicht finden wir Zwerge irgendwann einmal den Mut, Euch an die Oberfläche zu folgen?~ 
=
~Bis dahin möge der Irrende Wanderer jeden Eurer Schritte segnen. Ich werde mich wieder an meine Arbeit hier unten im Tempel machen. Ihr wisst, wo Ihr mich finden könnt.~
IF ~~ THEN DO ~SetGlobal("AC#DRIFR","GLOBAL",3)
EraseJournalEntry(@64225)
AddJournalEntry(@64226,QUEST_DONE)~ EXIT 
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_01
SAY  ~Ihr seid der <PRO_RACE> von der Oberfläche, von der mir meine Tochter Elern berichtet hat! Mein Name ist Dorna Abgrundlied, Frau des Bettargh Abgrundlied. Mein Mann leitet die große Bibliothek, und ich stehe dem Tempel Dugmarens vor. Es freut mich, dass Ihr dem Tempel des wandernden Tüftlers einen Besuch abstattet.~ 
IF ~~ THEN REPLY ~Was ist das für ein Ort?~ GOTO what_is_it 
IF ~~ THEN REPLY ~Ich muss weiter.~ + bye
IF ~Global("AC#Return_to_Surface","GLOBAL",1)~ THEN REPLY ~Eure Tochter meinte, Ihr könntet mir bei meinem Weg zurück an die Oberfläche helfen.~ + way_to_surface
END

IF ~True()~ THEN BEGIN hello_02
SAY ~Seid gegrüßt, <PRO_RACE>!~
IF ~Global("AC#Return_to_Surface","GLOBAL",4)~ THEN REPLY ~Wegen des Quecksilbers...~ + about_mercury
IF ~Global("AC#Return_to_Surface","GLOBAL",4)~ THEN REPLY ~Wegen des Levitationstrankes...~ + about_levitation_potion
IF ~PartyHasItem("AC#DRFT1")
GlobalLT("AC#Return_to_Surface","GLOBAL",5)~ THEN REPLY ~Ich habe hier die Schwebescheibe der Drow. Allerdings schwebt sie nicht mehr.~ + driftdisc_not_working
IF ~Global("AC#Return_to_Surface","GLOBAL",1)~ THEN REPLY ~Eure Tochter meinte, Ihr könntet mir bei meinem Weg zurück an die Oberfläche helfen.~ + way_to_surface
IF ~~ THEN REPLY ~Was ist das für ein Ort?~ GOTO what_is_it
IF ~~ THEN REPLY ~Ich muss weiter.~ + bye
END

	IF ~~ THEN BEGIN about_levitation_potion
	SAY ~Oh! Habt Ihr den Trank bereits erworben?~
	IF ~PartyHasItem("AC#POTL2")~ THEN REPLY ~Ja, hier ist er.~ GOTO have_levitation_potion
	IF ~!PartyHasItem("AC#POTL2")~ THEN REPLY ~Nein, noch nicht.~ GOTO not_have_all_ingredients
	IF ~~ THEN REPLY ~Wie war das noch einmal mit dem Zauber, den ich auf die Scheibe wirken sollte?~ + spell_tenser_reprise
	END
	
		IF ~~ THEN BEGIN have_levitation_potion  
		SAY ~Wirklich! Ihr seid wahrlich ein großartiger <PRO_RACE>!~
		IF ~~ THEN GOTO have_levitation_potion_02 
		END
		
		IF ~~ THEN BEGIN have_levitation_potion_02
		SAY ~Habt Ihr auch das Quecksilber?~
		IF ~PartyHasItem("AC#MERC1")~ THEN REPLY ~Ja, hier ist es.~ GOTO have_all
		IF ~!PartyHasItem("AC#MERC1")~ THEN REPLY ~Nein, noch nicht.~ GOTO not_have_all_ingredients
		END
		
	IF ~~ THEN BEGIN about_mercury
	SAY ~Oh! Habt Ihr es schon gefunden?~
	IF ~PartyHasItem("AC#MERC1")~ THEN REPLY ~Ja, hier ist es.~ GOTO have_mercury
	IF ~!PartyHasItem("AC#MERC1")~ THEN REPLY ~Nein. Ich muss mich wieder verabschieden.~ GOTO bye
	IF ~~ THEN REPLY ~Wo kann ich noch einmal das Quecksilber kaufen?~ GOTO buy_mercury_reprise
	IF ~~ THEN REPLY ~Könnt Ihr mir noch einmal erklären, wie ich Quecksilber selbst herstellen kann?~ GOTO create_mercury_reprise
	IF ~~ THEN REPLY ~Wie war das noch einmal mit dem Zauber, den ich auf die Scheibe wirken sollte?~ + spell_tenser_reprise
	END
	
		IF ~~ THEN BEGIN have_mercury  
		SAY ~Wirklich! Ihr seid wahrlich ein großartiger <PRO_RACE>!~
		IF ~~ THEN GOTO have_mercury_02 
		END
		
			IF ~~ THEN BEGIN have_mercury_02
			SAY ~Habt Ihr auch den Levitationstrank?~
			IF ~PartyHasItem("AC#POTL2")~ THEN REPLY ~Ja, hier ist er.~ GOTO have_all
			IF ~!PartyHasItem("AC#POTL2")~ THEN REPLY ~Nein, noch nicht.~ GOTO not_have_all_ingredients
			END
			
				IF ~~ THEN BEGIN not_have_all_ingredients
				SAY ~Kehrt zu mir zurück, wenn Ihr alle Zutaten beisammen habt, um den Zauber auf die Schwebescheibe zu wirken.~
				IF ~~ THEN EXIT 
				END
		
			IF ~~ THEN BEGIN have_all
			SAY ~Perfekt! Jetzt müsst Ihr nur noch die verschiedenen Komponenten auf Dugmarens Altar legen und den Zauber wirken. Hier, ich gebe Euch Eure Schwebescheibe wieder...~
			IF ~~ THEN DO ~GiveItemCreate("AC#DRFT1",Player1,1,0,0)~ GOTO have_mercury_03
			END
			
				IF ~~ THEN BEGIN have_mercury_03
				SAY ~Legt die Schwebescheibe mitsamt dem Quecksilber und dem Levitationstrank auf den Opfertisch. Hier ist die Spruchrolle mit dem Zauber "Tensers fliegende Scheibe". Sprecht den Zauber danach aus, dann sollte die Schwebescheibe - so der Irrende Wanderer möchte - wieder funktionieren.~
				IF ~~ THEN DO ~SetGlobal("AC#Return_to_Surface","GLOBAL",5)
				GiveItemCreate("AC#5DTFD",Player1,1,0,0)
				EraseJournalEntry(@64224)
				EraseJournalEntry(@64221)
				EraseJournalEntry(@64223)
				EraseJournalEntry(@64206)
				AddJournalEntry(@64225,QUEST)~ EXIT 
				END
	
								IF ~~ THEN BEGIN create_mercury_reprise
								SAY ~Wenn Ihr selbst Quecksilber herstellen wollt, benötigt Ihr das passende Erz. Ich bin keine *delvar*, keine Erzschürferin, aber ich habe mich auch dazu ein wenig belesen. Ihr benötigt ein spezielles Erz, das wir Zwerge "Cinnabar" nennen. Man kann daraus Färbemittel herstellen - aber auch Quecksilber gewinnen.~
								IF ~~ THEN REPLY ~Wo finde ich dieses Cinnabar-Erz?~ GOTO cinnabar_reprise
								END
								
									IF ~~ THEN BEGIN cinnabar_reprise
									SAY ~Gleich außerhalb Iltkazars südlich der Stadt gibt es einen verlassenen Stollen, in welchem früher Cinnabar abgebaut wurde. Wir nennen ihn "Nummaks Stollen". Schon lange sind die Zugänge versiegelt, aber ich habe einen Schlüssel, mit dem Ihr das Tor wieder öffnen könnt.~
									IF ~~ THEN GOTO cinnabar_reprise_02
									END
									
										IF ~~ THEN BEGIN cinnabar_reprise_02
										SAY ~Wenn Ihr das Cinnabar geschürft habt, müsst Ihr es in die erste Ebene der Arnschädelhalle bringen. Dort wird Euch Thargrun Drunkensang helfen, aus dem Erz Quecksilber zu gewinnen.~
										IF ~~ THEN + driftdisc_summary_reprise
										END
																		

								IF ~~ THEN BEGIN buy_mercury_reprise
								SAY ~Wenn Ihr Quecksilber kaufen wollt, könnt Ihr das in der Stadt tun. Wir haben hier einige Alchemisten, die es für ihre Kunst benötigen. Chiksul in der Zitadelle zum "Blutigen Bollwerk" wird Euch sicher welches verkaufen können. Aber ich warne Euch vor: Das lassen sich die Alchemisten teuer bezahlen! Ihr werdet viele, viele Goldmünzen berappen müssen, um Euch ein wenig dieser Flüssigkeit leisten zu können.~
								IF ~~ THEN GOTO driftdisc_summary_reprise
								END
								
								IF ~~ THEN BEGIN driftdisc_summary_reprise
								SAY ~Wenn Ihr das Quecksilber habt, kehrt zu mir zurück. Dann versuchen wir, den Zauber zu wirken. Mit Dugmarens Beistand werden wir die Scheibe wieder zum Schweben bringen.~
								IF ~~ THEN REPLY ~Mehr wollte ich gar nicht wissen. Ich muss weiter.~ + bye
								END
								
									IF ~~ THEN BEGIN spell_tenser_reprise
									SAY ~Darum kümmern wir uns später. Besorgt erst einmal das Quecksilber und den Levitationstrank..~
									IF ~~ THEN REPLY ~Wo kann ich noch einmal das Quecksilber kaufen?~ GOTO buy_mercury_reprise 
									IF ~~ THEN REPLY ~Könnt Ihr mir noch einmal erklären, wie ich Quecksilber selbst herstellen kann?~ GOTO create_mercury_reprise
									IF ~~ THEN REPLY ~Mehr wollte ich gar nicht wissen. Ich muss weiter.~ + bye
									END

	IF ~~ THEN BEGIN driftdisc_not_working
	SAY ~Das hatte ich mir schon gedacht.~
	IF ~~ THEN REPLY ~Habt Ihr eine Idee, wie man sie wieder zum Schweben bringen könnte?~ GOTO driftdisc_not_working_02
	IF ~~ THEN REPLY ~Und Ihr habt mich dennoch durch die Stadt geschickt, um sie zu holen?~ + useless_driftdisc
	END
	
		IF ~~ THEN BEGIN useless_driftdisc
		SAY ~Natürlich! Ihr wollt doch an die Oberfläche, nicht ich, oder?~
		IF ~~ THEN GOTO driftdisc_not_working_02
		END
		
			IF ~~ THEN BEGIN driftdisc_not_working_02
			SAY ~Lasst mich einmal sehen...~
			IF ~~ THEN DO ~TakePartyItem("AC#DRFT1")
			EraseJournalEntry(@64209)~ GOTO driftdisc_not_working_03
			END
			
				IF ~~ THEN BEGIN driftdisc_not_working_03
				SAY ~Der Zauber, der die Scheibe zum Schweben bringen sollte, ist erloschen. Mit einigen Kniffen könnten wir die Magie wieder zum Wirken bringen. Ich habe mich bereits nach einigen Möglichkeiten umgesehen.~
				IF ~~ THEN REPLY ~Was benötige ich dafür?~ GOTO what_do_i_need_driftdisc
				END
				
					IF ~~ THEN BEGIN what_do_i_need_driftdisc
					SAY ~Die Verzauberung kann durch den Zauberspruch "Tensers fliegende Scheibe" erneuert werden. Der Zauber ist in unseren Archiven sogar vorhanden. Wenn Ihr einen  Magier in der Gruppe habt, der Zauber wirken kann, könntet Ihr versuchen, die Scheibe selbst zu verzaubern. Meint Ihr, Ihr bekommt das hin?~
					IF ~~ THEN REPLY ~Ja.~ GOTO yes_driftdisc
					IF ~~ THEN REPLY ~Nein.~ GOTO no_driftdisc
					IF ~~ THEN REPLY ~Ich weiß nicht.~ GOTO no_driftdisc
					END
					
						IF ~~ THEN BEGIN yes_driftdisc
						SAY ~Das wäre dann natürlich das Einfachste.~
						IF ~~ THEN GOTO no_driftdisc
						END
						
						IF ~~ THEN BEGIN no_driftdisc
						SAY ~Wenn Ihr es nicht selbst hinbekommt, die Scheibe zu verzaubern, müssen wir auf den Segen Dugmarens hoffen. Mein Gott hat mich in der Beziehung aber noch nie im Stich gelassen. Dazu aber später mehr. Denn wir brauchen noch zwei weitere Komponenten, um die Verzauberung abzuschließen.~
						IF ~~ THEN GOTO driftdisc_component
						END
						
							IF ~~ THEN BEGIN driftdisc_component
							SAY ~Ihr benötigt noch einen Levitationstrank und etwas Quecksilber. Den Levitationstrank stellen wir hier in der Bibliothek selbst her. Quecksilber ist jedoch äußerst selten. Ihr könnt es entweder in der Stadt kaufen oder selbst herstellen.~
							IF ~~ THEN REPLY ~Wo kann ich Quecksilber kaufen?~ GOTO buy_mercury 
							IF ~~ THEN REPLY ~Wie kann ich Quecksilber selbst herstellen?~ GOTO create_mercury 
							IF ~~ THEN REPLY ~Wo bekomme ich den Levitationstrank her?~ GOTO levitation_potion 
							END
							
									IF ~~ THEN BEGIN levitation_potion
									SAY ~Bei Fruntuck Flaschenhals. Die Svirfnebli des Flaschenhals-Clanes sind schon seit langem für die Herstellung verschiedener Tränke zuständig und haben das Braurecht dieser Stadt für die Levitationstränke. Ihr könnt eine Flasche bei Fruntuck gleich außerhalb dieses Tempels, die Treppe hoch bei der Plattform der Erfinder, erwerben.~
									IF ~~ THEN GOTO driftdisc_components_tutti
									END
									
										IF ~~ THEN BEGIN driftdisc_components_tutti
										SAY ~Wenn Ihr den Levitationstrank und etwas Quecksilber habt, kommt wieder hier vorbei. Könnt Ihr mir folgen?~
										IF ~~ THEN REPLY ~Wo kann ich Quecksilber kaufen?~ GOTO buy_mercury 
										IF ~~ THEN REPLY ~Wie kann ich Quecksilber selbst herstellen?~ GOTO create_mercury 
										IF ~~ THEN REPLY ~Wo bekomme ich den Levitationstrank her?~ GOTO levitation_potion 
										IF ~~ THEN REPLY ~Soweit alles klar.~ + driftdisc_summary
										END
							
								IF ~~ THEN BEGIN create_mercury
								SAY ~Wenn Ihr selbst Quecksilber herstellen wollt, benötigt Ihr das passende Erz. Ich bin keine *delvar*, keine Erzschürferin, aber ich habe mich auch dazu ein wenig belesen. Ihr benötigt ein spezielles Erz, das wir Zwerge "Cinnabar" nennen. Man kann daraus Färbemittel herstellen - aber auch Quecksilber gewinnen.~
								IF ~~ THEN REPLY ~Wo finde ich dieses Cinnabar-Erz?~ GOTO cinnabar_01
								END
								
									IF ~~ THEN BEGIN cinnabar_01
									SAY ~Gleich außerhalb Iltkazars südlich der Stadt gibt es einen verlassenen Stollen, in welchem früher Cinnabar abgebaut wurde. Wir nennen ihn "Nummaks Stollen". Schon lange sind die Zugänge versiegelt, aber ich habe einen Schlüssel, mit dem Ihr das Tor wieder öffnen könnt.~
									IF ~~ THEN DO ~SetGlobal("createmercury","LOCALS",1)~ GOTO cinnabar_02
									END
									
										IF ~~ THEN BEGIN cinnabar_02
										SAY ~Wenn Ihr das Cinnabar geschürft habt, müsst Ihr es in die erste Ebene der Arnschädelhalle bringen. Dort wird Euch Thargrun Drunkensang helfen, aus dem Erz Quecksilber zu gewinnen.~
										IF ~Global("buymercury","LOCALS",1)~ THEN DO ~~ GOTO driftdisc_components_tutti 
										IF ~Global("buymercury","LOCALS",0)~ THEN DO ~~ GOTO buy_mercury 
										END
																		

								IF ~~ THEN BEGIN buy_mercury
								SAY ~Wenn Ihr Quecksilber kaufen wollt, könnt Ihr das in der Stadt tun. Wir haben hier einige Alchemisten, die es für ihre Kunst benötigen. Chiksul in der Zitadelle zum "Blutigen Bollwerk" wird Euch sicher welches verkaufen können. Aber ich warne Euch vor: Das lassen sich die Alchemisten teuer bezahlen! Ihr werdet viele, viele Goldmünzen berappen müssen, um Euch ein wenig dieser Flüssigkeit leisten zu können.~
								IF ~Global("createmercury","LOCALS",0)~ THEN DO ~SetGlobal("buymercury","LOCALS",1)~ GOTO create_mercury
								IF ~Global("createmercury","LOCALS",1)~ THEN DO ~SetGlobal("buymercury","LOCALS",1)~ GOTO driftdisc_components_tutti
								END
								
								IF ~~ THEN BEGIN driftdisc_summary
								SAY ~Gemeinsam versuchen wir dann, den Zauber zu wirken. Mit Dugmarens Beistand werden wir die Scheibe wieder zum Schweben bringen! Habt Ihr noch Fragen?~
								IF ~~ THEN REPLY ~Wo kann ich noch einmal das Quecksilber kaufen?~ GOTO buy_mercury 
								IF ~~ THEN REPLY ~Könnt Ihr mir noch einmal erklären, wie ich Quecksilber selbst herstellen kann?~ GOTO create_mercury
								IF ~~ THEN REPLY ~Wie war das noch einmal mit dem Zauber, den ich auf die Scheibe wirken sollte?~ + spell_tenser_01
								IF ~~ THEN REPLY ~Alles klar! Los geht's.~ + mercury_lets_go
								END
								
									IF ~~ THEN BEGIN spell_tenser_01
									SAY ~Darum kümmern wir uns später. Besorgt erst einmal das Quecksilber.~
									IF ~~ THEN REPLY ~Wo kann ich noch einmal das Quecksilber kaufen?~ GOTO buy_mercury 
									IF ~~ THEN REPLY ~Könnt Ihr mir noch einmal erklären, wie ich Quecksilber selbst herstellen kann?~ GOTO create_mercury
									IF ~~ THEN REPLY ~Alles klar! los geht's~ + mercury_lets_go
									END
									
										IF ~~ THEN BEGIN mercury_lets_go
										SAY ~Hier ist der Schlüssel in den Stollen, falls Ihr Euch um das Cinnabar-Erz selbst kümmern wollt. Der Stollen wurde von uns versiegelt, weil es darin spuken soll, aber das ist sicher nur ein Hirngespinst der abergläubigen Zwerge. Viel Erfolg, <CHARNAME>!~
										IF ~~ THEN DO ~SetGlobal("AC#Return_to_Surface","GLOBAL",4)
										SetGlobal("AC#Fruntuck_Levitate","GLOBAL",1)
										GiveItemCreate("AC#5DKY1",LastTrigger,0,0,0)
										AddJournalEntry(@64200,QUEST)
										AddJournalEntry(@64220,QUEST)
										~ EXIT 
										END

	IF ~~ THEN BEGIN way_to_surface
	SAY ~Oh, dann hat sie es Euch schon ausgerichtet? Wie schön! Also passt auf.~
	IF ~~ THEN GOTO way_to_surface_02
	END
	
		IF ~~ THEN BEGIN way_to_surface_02
		SAY ~Ich habe mich ein bisschen belesen über diesen Schacht, den Ihr zu uns herabgestiegen seid. Ziemlich tief. Seeehr tief. Wie seid Ihr den heruntergekommen, ohne Euch alle Knochen zu brechen?~
		IF ~~ THEN REPLY ~Durch einen Federfalltrank, den ich gefunden hatte.~ GOTO feather_falling
		END
		
			IF ~~ THEN BEGIN feather_falling
			SAY ~Das muss dann aber ein ganz schön mächtiger Trank gewesen sein! Und viel schwieriger wird es werden, Euch wieder hinauf zu schicken. Wir hantieren hier viel mit Levitationstränken, um die Bibliothek zu bewirtschaften. Aus diesem Grunde kann ich Euch sagen, dass ein solcher Trank Euch niemals unbeschadet wieder ganz nach oben bringen würde.~
			=
			~Ich hatte auch mit dem ein oder anderen Baumeister unserer Steinmetzgilde gesprochen. Leitern, Seile und dergleichen scheiden leider auch aus. Wir müssen eine andere Möglichkeit in Betracht ziehen.~
			IF ~~ THEN REPLY ~Was schlagt Ihr also vor?~ GOTO about_passage_of_underdark
			IF ~GlobalGT("AC#IL_CharvDead","GLOBAL",0)~ THEN REPLY ~Ich habe schon einen Ausgang aus dem Unterreich gefunden. Der rote Drache, der ihn bewachte, wurde von mir erschlagen.~ GOTO charv_dead
			END
			
				IF ~~ THEN BEGIN charv_dead
				SAY ~Ihr habt den Drachen, der Beldas getötet haben soll, erschlagen? Das ist gut. Sehr gut!~
				=
				~Unabhängig davon wäre es aber eine gute Idee, den direkten Zugang, den Ihr herunter gekommen seid, für einen Weg an die Oberfläche nutzbar zu machen. Hört zu.~
				IF ~~ THEN GOTO  about_passage_of_underdark
				END
				
				IF ~~ THEN BEGIN about_passage_of_underdark
						SAY ~Die meisten Passagen wurden von unserer Rasse schon vor langer Zeit versiegelt. Die Zwerge des alten Shanatar haben sich komplett von der Außenwelt abgekapselt. Viele Zwerge halten das für eine gute Sache. Ich habe die Befürchtung, dass wir dadurch auch in einer großen, unterirdischen Falle sitzen.~
						IF ~~ THEN REPLY ~Ihr helft mir auch, zurück an die Oberfläche zu gelangen, weil Ihr Euch damit einen Vorteil für die Stadt erhofft, oder?~ + help_to_be_free						
						END
						
							IF ~~ THEN BEGIN help_to_be_free
							SAY ~So ist es. Seht, die anderen Zwerge mögen uns Anhänger des irrenden Wanderers zwar belächeln, aber im Unterschied zu all den anderen Zwergen, die immer nur nach unten sehen, blicken wir auch ab und zu nach oben.~
							IF ~~ THEN + about_passage_of_underdark02 
							END
							
							IF ~~ THEN BEGIN about_passage_of_underdark02
							SAY ~Insofern ist mir sehr daran gelegen, einen Weg an die Oberfläche zu nutzen. Derer gab es einst viele, heute... keinen einzigen mehr.~
							IF ~Global("AC#IL_CharvDead","GLOBAL",0)~ THEN + other_wayout_charv_not_dead
							IF ~GlobalGT("AC#IL_CharvDead","GLOBAL",0)~ THEN + other_wayout_charv_dead
							IF ~GlobalGT("AC#AnthanDragon","GLOBAL",0)~ THEN + other_wayout_charv_not_dead 
							END
			
									
						IF ~~ THEN BEGIN other_wayout_charv_not_dead
						SAY ~Es gibt zwar noch einen weiteren Weg. Der Weg, den unser Beldas - Dugmaren sei seiner Seele gnädig - genommen hatte, führte ihn jedoch direkt in die Fänge dieses roten Drachen. Wenn Ihr Euch zutraut, den Drachen zu erschlagen, hättet Ihr einen weiteren Zugang geöffnet.~
						=
						~Die Zugänge zu dem Drachen sind jedoch versiegelt. Ihr solltet diesbezüglich mit Beldas' Vater, Anthan Diamantklinge, sprechen. Er könnte Euch sagen, wie Ihr den Weg zu dem Drachen finden könntet.~						
						=
						~Nichtsdestotrotz würde ich es gutheißen, wenn Ihr den Weg, den Ihr herabgenommen habt, für uns wieder gangbar machen würdet.~
						IF ~~ THEN + idea_01
						END
						
						IF ~~ THEN BEGIN other_wayout_charv_dead
						SAY ~Ihr habt diesen roten Drachen zwar erschlagen, der einen Zugang bewachte. Doch ich habe noch eine andere - einfachere Idee, wie Ihr wieder an die Oberfläche reisen könntet.~
						IF ~~ THEN + idea_01
						END
												 
						IF ~~ THEN BEGIN idea_01
				SAY ~Vor längerer Zeit brachte mir ein Spähtrupp unserer Krieger eine seltsame Scheibe vorbei, die sie bei einem Kampf gegen Drow erbeutet hatten. Ich erkannte sofort, dass es sich dabei nur um eine der berüchtigten Drow-Schwebescheiben handeln konnte, welche die Dunkelelfen dazu verwenden, in ihren finsteren Städten emporzuschweben.~
				IF ~~ THEN REPLY ~Ihr denkt, eine Schwebescheibe der Drow könnte mich wieder nach oben bringen?~ GOTO  drow_driftdisc_01
				END
				
					IF ~~ THEN BEGIN drow_driftdisc_01
					SAY ~Genau! Nachdem ich die Schwebescheibe untersucht hatte, habe ich sie beseite gelegt, und fast vergessen, weil wir in der Stadt keine Verwendung für sie zu haben schienen. Welcher Zwerg, der etwas auf sich hält, möchte schon dabei gesehen werden, wie er in der Stadt mit einer Scheibe aus Drow-Handwerkskunst herumschwebt! Doch für Euch Oberflächler wäre dieser Gegenstand von großem Nutzen.~ 
					IF ~~ THEN REPLY ~Wo ist diese Drow-Schwebescheibe jetzt?~ + wheres_driftdisc					
					END				
					
					IF ~~ THEN BEGIN wheres_driftdisc
					SAY ~Ich habe sie dem alten Shagretor im "Vermächtnis" gespendet. Dort müsste sie immer noch zu finden sein.~
					IF ~~ THEN REPLY ~Was ist das "Vermächtnis"?~ GOTO legacy
					END
					
						IF ~~ THEN BEGIN legacy
						SAY ~Das "Vermächtnis" ist ein Sammelort für alle Objekte, die uns Zwergen Shanatars schöne Erinnerungen schenkt. Neben alten Bronzetafeln und Standarten findet man dort auch ausgewählte Beutestücke, die wir den ganzen bösen Rassen des Unterreiches abgenommen haben. Und dort habe ich diese Schwebescheibe abgegeben.~ 
						IF ~~ THEN GOTO legacy_02
						END
						
							IF ~~ THEN BEGIN legacy_02
							SAY ~Der Inhaber des "Vermächtnis", der alte Shagretor, hat sie zu dem anderen Drow-Gerümpel, das ihm so wichtig ist, gelegt. Ich hätte sie ja eher in den Müllstollen geworfen, aber ein Glück für Euch, dass wir in Iltkazar einen Zwerg haben, dem die alten Devotionalien wichtig sind! Ihr solltet also Shagretor im "Vermächtnis" danach fragen. Ihr findet seine Ausstellung in Haelas Hallen im Südosten der Stadt, gegenüber des alten Dumathoin-Tempels.~
							IF ~~ THEN DO ~SetGlobal("AC#Return_to_Surface","GLOBAL",2)
							EraseJournalEntry(@63001)
							AddJournalEntry(@64207,QUEST)~ EXIT
							END

IF ~~ THEN BEGIN what_is_it
SAY ~Dies hier ist der Tempel Dugmarens, des zwergischen Gottes des Wissens. Die Zwerge beten zu ihm, wenn sie auf einen Einfall hoffen oder bei einem Problem nicht mehr weiterkommen, weil es sich nicht durch Muskelkraft lösen lässt.~
IF ~~ THEN REPLY ~Das war alles, was ich wissen wollte. Gehabt Euch wohl.~ GOTO bye
IF ~~ THEN REPLY ~Bietet Ihr hier auch Dienste an?~ + services
END

	IF ~~ THEN BEGIN services
	SAY ~Nein. Für Heilung und dergleichen sind die anderen Zitadellen zuständig. Wir schenken unseren Gläubigen stattdessen Wissen.~
	IF ~~ THEN REPLY ~Das war alles, was ich wissen wollte. Gehabt Euch wohl.~ GOTO bye 
	END

	IF ~~ THEN BEGIN bye
	SAY  ~Möge das Schimmerauge immer über Euch wachen!~  
	IF ~~ THEN EXIT
	END
