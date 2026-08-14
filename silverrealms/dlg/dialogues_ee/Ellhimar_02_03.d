

/*******************************************************************************************************
Dialog Ellhimar cre#1 in Iltkazar, Quest-Start
*******************************************************************************************************/

BEGIN ~ac#ilel1~

IF ~Global("AC#EllhimarHurt","ACIL5E",1)~ THEN BEGIN ellhimar_hurt
SAY  ~Verdammt sollt Ihr sein! Besiegt von einem <PRO_RACE>! Die einzige Genugtuung in meinem Tode wird sein, dass diese Stadt dem Untergang geweiht sein wird!~
IF ~~ THEN DO ~
			SetGlobal("AC#EllhimarHurt","ACIL5E",2)
			AddexperienceParty(3000)
			DropItem("AC#DDROW",[-1.-1])
			ReallyForceSpell(Myself,LONG_RED_MIGHT)
			Kill(Myself)
			~ EXIT
END

IF ~Global("EllhimarAngry","ACIL5E",1)~ THEN BEGIN ellhimar_angry
SAY  ~Habe ich es mir doch gedacht! Ihr seid hier, um herumzuschnüffeln! Na wartet, das wird Euch noch leidtun, Ihr *colnbluth*!~
IF ~~ THEN DO ~
			SetGlobal("AC#Vronia_Quest","GLOBAL",10)
			SetGlobal("EllhimarAngry","ACIL5E",2)
			AddJournalEntry(@50610,QUEST)
			Enemy()
			~ EXIT
END

IF ~True()~ THEN BEGIN 1
SAY  ~Ich bin derzeit nicht an Gesprächen interessiert, Fremde. Lasst mich bei meinen Studien bitte allein.~
IF ~Global("AC#Vronia_Quest","GLOBAL",3)~ THEN REPLY ~Oh, ein Mensch! Das ist aber schön, hier unten jemanden von der Oberfläche wiederzusehen!~ + surface_dweller_01
IF ~GlobalLT("AC#Vronia_Quest","GLOBAL",3)~ THEN REPLY ~Entschuldigt die Störung.~ + excuse_me
IF ~GlobalGT("AC#Vronia_Quest","GLOBAL",3)~ THEN REPLY ~Entschuldigt die Störung.~ + excuse_me
IF ~Global("AC#Vronia_Quest","GLOBAL",8)~ THEN REPLY ~Sorni Arnschädel schickt nach Euch, Ellhimar.~ + sorni_sends_me
IF ~Global("AC#Vronia_Quest","GLOBAL",7)~ THEN REPLY ~(Lüge) Sorni Arnschädel schickt nach Euch, Ellhimar.~ + sorni_sends_me_LIE
END

	IF ~~THEN BEGIN sorni_sends_me_LIE
	SAY ~Geht und richtet ihr aus, dass ich momentan keine Zeit für sie habe. Und sie soll mir das Zardazil senden, um das ich gebeten habe.~
	IF ~~ THEN REPLY ~Zardazil?~ + zardazil_LIE
	IF ~CheckStatGT(LastTalkedToBy,17,CHR)~ THEN REPLY ~Deshalb sollt Ihr ja zu ihr kommen. Ja, genau! Das war es, worum sie mich gebeten hatte! Ihr sollt schnell kommen, bevor das Zardazil wieder weg ist!~ + personally
	IF ~CheckStatLT(LastTalkedToBy,18,CHR)~ THEN REPLY ~Ja, genau! Das war es, worum sie äh... mich gebeten hatte! Ihr sollt schnell kommen, bevor das Zardazil ähm... wieder ...weg ist!~ + sorni_sends_me_LIE__failure
	END
	
		IF ~~ THEN BEGIN sorni_sends_me_LIE__failure
		SAY ~So ein Schwachsinn! Redet gefälligst erneut mit ihr und strengt Euch mehr an, wenn Ihr etwas von mir möchtet! Und jetzt lasst mich gefälligst in Ruhe.~
		IF ~~ THEN EXIT
		END
	
		IF ~~ THEN BEGIN zardazil_LIE
		SAY ~Ja, das Zardazil, das ich benötige.~
		IF ~CheckStatGT(LastTalkedToBy,17,CHR)~ THEN REPLY ~Deshalb sollt Ihr ja zu ihr kommen. Ja, genau! Das war es, worum sie mich gebeten hatte! Ihr sollt schnell kommen, bevor das Zardazil wieder weg ist!~ + personally
		IF ~CheckStatLT(LastTalkedToBy,18,CHR)~ THEN REPLY ~Ja, genau! Das war es, worum sie äh... mich gebeten hatte! Ihr sollt schnell kommen, bevor das Zardazil ähm... wieder ...weg ist!~ + sorni_sends_me_LIE__failure
		END
	
	IF ~~THEN BEGIN sorni_sends_me
	SAY ~Geht und richtet ihr aus, dass ich momentan keine Zeit für sie habe. Und sie soll mir das Zardazil senden, um das ich gebeten habe.~
	++ ~Darum geht es ja gerade. Ihr sollt sie deshalb in der Arnschädelhalle aufsuchen.~ + go_zardazil
	END
	
		IF ~~THEN BEGIN go_zardazil
		SAY ~Schaffen es die Zwerge nicht einmal, mir das bisschen Erz liefern? Nun gut, ich werde demnächst zu Sorni gehen.~
		++ ~Ihr solltet sie besser gleich aufsuchen.~ + immediate
		++ ~Geht jetzt, oder es gibt Ärger!~ + immediate
		END
		
			IF ~~THEN BEGIN immediate
			SAY ~So springt man nicht mit einem Magier um!~
			++ ~Das solltet Ihr ihr besser persönlich sagen, Ellhimar.~ + personally
			END
			
				IF ~~THEN BEGIN personally
				SAY ~Da habt Ihr vielleicht sogar Recht. Also gut, ich mache mich auf den Weg. Wehe, es ist nichts Wichtiges!~
				IF ~~ THEN DO ~
				SetGlobal("AC#Vronia_Quest","GLOBAL",9)
				AddJournalEntry(@50609,QUEST)
				EscapeArea()~  EXIT
				END
	
	// if CHARNAME is too dumb, Imoen jumps in ;-)
	IF ~~THEN BEGIN surface_dweller_01
	SAY ~Was? Wie? Ach ja natürlich, Ihr seid ja die Neuankömmlinge, über die die Zwerge derzeit soviel reden. Schön, Euch kennengelernt zu haben. Vielleicht habe ich später mehr Zeit zum Plaudern.~
	++ ~Ihr stammt aus der Gegend hier darüber? Amn? Tethyr?~ + 3
	IF ~InParty("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN REPLY ~Gut, dann werde ich später wiederkommen.~ EXTERN ~IMOEN2J~ Imoen_bump
	END

		IF ~~THEN BEGIN 3
		SAY ~Wie? Ja, ich stamme aus einem Ort nicht weit entfernt von hier an der Oberfläche, aus Shalane in Erlkazar.~
		IF ~~ THEN REPLY ~Erlkazar? Woran grenzt diese Gegend?~ + where_erlkazar
		IF ~IsValidForPartyDialog("Keldorn")~ THEN EXTERN ~KELDORJ~ keldorn_mystics_academy
		END
		
			IF ~~ THEN BEGIN keldorn_mystics_academy_02
			SAY ~Woher soll ich das wissen?~
			IF ~~ THEN EXTERN ~KELDORJ~ keldorn_mystics_academy_03
			END

			IF ~~THEN BEGIN where_erlkazar
			SAY ~Erlkazar liegt östlich von Tethyr und Amn.~
			IF ~~ THEN REPLY ~Amn! Dann wart Ihr doch sicher schon einmal in Athkatla!~ + athkatla
			END

				IF ~~THEN BEGIN athkatla
				SAY ~Nein, diese Gegend kenne ich nicht.~
				IF ~~ THEN REPLY ~Athkatla ist die Hauptstadt von Amn. Ihr kennt sie nicht?~ + capital
				END

					IF ~~THEN BEGIN capital
					SAY ~Vielleicht habe ich den Namen schon einmal gehört. Meine Reisen durch Amn sind schon eine Weile her, und wenn, bin ich immer mit Hilfe meiner mächtigen Magie durch dieses Land gereist.~
					IF ~!InParty("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN REPLY ~Und was haben die Verhüllten Magier dazu gesagt?~ + cowled_wizards
					IF ~InParty("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN EXTERN ~IMOEN2J~ imoen_cowled_wizards
					END

					IF ~~THEN BEGIN cowled_wizards
					SAY ~Mit jemand so Unbedeutendem gebe ich mich nicht ab.~
					IF ~~ THEN REPLY ~Wirklich? Wie merkwürdig, schließlich haben sie doch das Monopol der Magie in diesem Land.~ + interrogation
					END

						IF ~~THEN BEGIN interrogation
						SAY ~He, was soll das werden? Ein Verhör? Ihr spaziert hier herein und stellt eine Menge dummer Fragen. Was maßt Ihr Euch an?~
						IF ~~ THEN REPLY ~Oh, entschuldigt. Ich freue mich nur, endlich wieder ein Gesicht von der Oberfläche zu sehen, mit dem ich mich unterhalten kann. Ich bin übrigens <CHARNAME> aus Kerzenburg.~ + candlekeep01
						IF ~~ THEN REPLY ~Warum seid Ihr eigentlich hier?~ + why_are_you_here
						IF ~IsValidForPartyDialog("Edwin")~ THEN EXTERN ~EDWINJ~ edwin_red_wizards_01
						END
						
						
							IF ~~ THEN BEGIN edwin_red_wizards_02
							SAY ~Warum sollte mir die Farbe Eurer Robe Angst einjagen, Magier?~
							IF ~~ THEN EXTERN ~EDWINJ~ edwin_red_wizards_03 
							END
							
							IF ~~THEN BEGIN why_are_you_here
							SAY ~Wegen meiner Studien. Die Zwerge haben hier eine große Bibliothek. Und bevor Ihr fragt: Es geht Euch nichts an, *welche* Studien ich mache. Wer seid Ihr überhaupt und wo kommt Ihr her?~
							IF ~~ THEN REPLY ~Ich bin <CHARNAME> und stamme aus Kerzenburg.~ + candlekeep01
							END

							IF ~~THEN BEGIN candlekeep01
							SAY ~Schön, <CHARNAME>. Mein Name ist Ellhimar. Und nun gehabt Euch wohl, ich habe zu arbeiten.~
							IF ~~ THEN REPLY ~Ihr interessiert Euch nicht für Kerzenburg?~ + candlekeep02
							IF ~InParty("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN REPLY ~Ich werde Euch nicht länger stören.~ EXTERN ~IMOEN2J~ Imoen_candlekeep
							IF ~!InParty("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)
							IsValidForPartyDialog("Jaheira")~ THEN REPLY ~Ich werde Euch nicht länger stören.~ EXTERN ~JAHEIRAJ~ Jaheira_candlekeep
							IF ~IsValidForPartyDialog("Nalia")
							!InParty("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)
							!IsValidForPartyDialog("Jaheira")~ THEN REPLY ~Ich werde Euch nicht länger stören.~ EXTERN ~NALIAJ~ Nalia_candlekeep	
							END
																															
								IF ~~THEN BEGIN candlekeep02
								SAY ~Hört zu, <CHARNAME>. Auch wenn Ihr der stolze Besitzer eines Schlosses seid und Euer Vater Euch sicher als Burgherr eine Menge Ländereien vermacht hat, interessiert mich das nicht Geringsten.~
								IF ~~ THEN REPLY ~Kerzenburg ist keine Festung, sondern eine Bibliothek. Eigentlich die größte Bibliothek in den Reichen, um genau zu sein.~ + candlekeep03
								END

									IF ~~THEN BEGIN candlekeep03
									SAY ~Ach, *das* Kerzenburg! Sagt das doch gleich. Natürlich interessiert mich das. Dort werden sicher eine Menge mächtiger Folianten aufbewahrt.~
									IF ~~ THEN REPLY ~Ja, das ist richtig. Und dann die Prophezeiungen dieses Propheten, wie war noch gleich sein Name...~ + prophecies
									IF ~InParty("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN REPLY ~Ja, das stimmt.~ EXTERN ~IMOEN2J~ Imoen_prophecies
									END

										IF ~~THEN BEGIN prophecies
										SAY ~Ich komme jetzt auch nicht auf den Namen...~
										IF ~~ THEN REPLY ~Elminster! Die Prophezeiungen des Elminster meinte ich.~ + elminster
										IF ~~ THEN REPLY ~Jetzt fällt es mir wieder ein - Baldurian! Die Prophzeiungen des Baldurian.~ + baldurian
										IF ~~ THEN REPLY ~Die Prophezeiungen des Alaundo. Noch nie davon gehört?~ + alaundo
										IF ~IsValidForPartyDialog("Minsc")~ THEN REPLY ~Ich komme wirklich nicht auf den Namen...~ EXTERN ~MINSCJ~ minsc_boo_01
										END

											IF ~~THEN BEGIN baldurian
											SAY ~Ja, richtig. Wie konnte ich das vergessen. Baldurian ist wahrhaft ein mächtiger Prophet.~
											IF ~~ THEN REPLY ~Eigentlich stammen die Prophezeiungen aus dem Munde des weisen Alaundo. Noch nie davon gehört?~ + alaundo
											END
											
											IF ~~THEN BEGIN elminster
											SAY ~Ja, richtig. Wie konnte ich das vergessen. Elminster ist wahrhaft ein mächtiger Prophet.~
											IF ~~ THEN REPLY ~Eigentlich stammen die Prophezeiungen aus dem Munde des weisen Alaundo. Noch nie davon gehört?~ + alaundo
											END

											IF ~~THEN BEGIN alaundo
											SAY ~So, jetzt reicht es. Ich weiß zwar nicht, was Ihr hier auf die Probe stellen wollt, aber meine Geduld ist jetzt wahrlich am Ende. Würdet Ihr bitte jetzt mein Haus verlassen, bevor ich die Wache rufe? Ich habe jetzt wirklich keine Lust, mit Euch zu reden!~
											IF ~!IsValidForPartyDialog("Jaheira")~ THEN REPLY ~Entschuldigt meine Penetranz. Ich wollte mich nur ein wenig mit Euch austauschen.~ + excuse_me_02
											IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ Jaheira_Comment_Harpers
											END
											
											IF ~~THEN BEGIN minsc_boo_02
											SAY ~Boo? Ich denke, das könnte der Prophet gewesen sein, ja.~
											IF ~~ THEN REPLY ~Eigentlich stammen die Prophezeiungen aus dem Munde des weisen Alaundo. Noch nie davon gehört?~ + alaundo
											END											

										//Jaheira Harpers
										IF ~~THEN BEGIN harpers_02
										SAY ~Nein, Musik ist überhaupt nicht etwas, das mir Freude bereitet.~
										IF ~~ THEN EXTERN ~JAHEIRAJ~ Jaheira_Comment_Harpers_02
										END

									IF ~~THEN BEGIN excuse_me_02
									SAY ~Eine seltsame Art legt Ihr dabei an den Tag. Vielleicht ist später ein besserer Zeitpunkt, um ins Gespräch zu kommen. Bis dahin muss ich mich meinen Büchern widmen. Gehabt Euch wohl.~
									   IF ~~ THEN DO ~SetGlobal("AC#TalkedToEllhimar","GLOBAL",1)
									SetGlobal("AC#Vronia_Quest","GLOBAL",4)
									AddJournalEntry(@50602,QUEST)~  EXIT
									END

									IF ~~THEN BEGIN excuse_me
									SAY ~Jaja, schon gut. Gehabt Euch wohl.~
									   IF ~~ THEN DO ~SetGlobal("AC#TalkedToEllhimar","GLOBAL",1)~  EXIT
									END

/*******************************************************************************************************
NPC-Dialoge
*******************************************************************************************************/

APPEND ~JAHEIRAJ~
IF ~~ THEN BEGIN Jaheira_Comment_Harpers
   SAY ~Kein Grund, gleich so unfreundlich zu sein, Ellhimar. Sagt, Gelehrter, hattet Ihr an der Oberfläche Kontakt mit denen, die Harfe spielen?~
   IF ~~ THEN EXTERN ~ac#ilel1~ harpers_02
END

IF ~~ THEN BEGIN Jaheira_Comment_Harpers_02
   SAY ~Mehr wollte ich auch gar nicht wissen. Ich wollte Euch nur etwas Schönes, von dem Ihr vielleicht schon gehört hättet, näherbringen.~
   IF ~~ THEN DO ~SetGlobal("AC#JaheiraTalkedToEllhimar","GLOBAL",1)~ EXTERN ~ac#ilel1~ excuse_me_02
END

IF ~~ THEN BEGIN Jaheira_candlekeep
   SAY ~Ihr erscheint merkwürdig gleichgültig, wenn es um Kerzenburg geht. Sagt Euch dieser Name denn gar nichts?~
   IF ~~ THEN EXTERN ~ac#ilel1~ candlekeep02
END
END

APPEND ~NALIAJ~
IF ~~ THEN BEGIN Nalia_candlekeep
   SAY ~Einen Moment, Ellhimar - Euch sagt Kerzenburg nichts?~
   IF ~~ THEN EXTERN ~ac#ilel1~ candlekeep02
END
END

APPEND ~IMOEN2J~
IF ~~ THEN BEGIN Imoen_candlekeep
   SAY ~Einen Moment, Ellhimar - Euch sagt Kerzenburg nichts?~
   IF ~~ THEN EXTERN ~ac#ilel1~ candlekeep02
END

IF ~~ THEN BEGIN Imoen_bump
   SAY ~*Imoen tritt Euch verstohlen gegen das Schienbein.*~
   =
   ~Mensch <CHARNAME>, ist das schön, hier unten einen solch weisen Menschen kennenzulernen! Ihr stammt aus der Gegend hier darüber, Ellhimar? Aus Amn? Oder Tethyr?~ 
   IF ~~ THEN EXTERN ~ac#ilel1~ 3
END

IF ~~ THEN BEGIN imoen_cowled_wizards
SAY ~Und was haben die Verhüllten Magier dazu gesagt?~
IF ~~ THEN EXTERN ~ac#ilel1~ cowled_wizards 
END

IF ~~ THEN BEGIN Imoen_prophecies
SAY ~<CHARNAME> - vielleicht kennt Ellhimar ja diesen Propheten aus Kerzenburg, wie war noch gleich sein Name...~
IF ~~ THEN EXTERN ~ac#ilel1~ prophecies 
END
END

// Minsc
APPEND ~MINSCJ~
IF ~~ THEN BEGIN minsc_boo_01
   SAY ~Boo sagt sehr viele Dinge, die irgendwann in Erfüllung gehen.~
   IF ~~ THEN EXTERN ~ac#ilel1~ minsc_boo_02
END
END

// Edwin
APPEND ~EDWINJ~
IF ~~ THEN BEGIN edwin_red_wizards_01
   SAY ~Seid gegrüßt, Anwender der Kunst! Ich trage zwar die Farbe der Roten, doch Ihr habt von mir nichts zu befürchten.~
   IF ~~ THEN DO ~SetGlobal("AC#EdwinTalkedToEllhimar","GLOBAL",1)~ EXTERN ~ac#ilel1~ edwin_red_wizards_02
END

IF ~~ THEN BEGIN edwin_red_wizards_03
SAY ~Nichts für ungut, Magier. (Was für ein Hahnrei.) Sagt, was hat Euch an diesen ungastlichen Ort verschlagen?~
IF ~~ THEN EXTERN ~ac#ilel1~ why_are_you_here
END
END

// Keldorn
APPEND ~KELDORJ~
IF ~~ THEN BEGIN keldorn_mystics_academy
SAY ~Erlkazar! Wie steht es mit der Mystikerakademie in Euren Landen?~
IF ~~ THEN DO ~SetGlobal("AC#KeldornTalkedToEllhimar","GLOBAL",1)~ EXTERN ~ac#ilel1~ keldorn_mystics_academy_02 
END

IF ~~ THEN BEGIN keldorn_mystics_academy_03
SAY ~Nun, da diese Akademie in dem kleinen Fürstentum weithin als anerkannte Schule vernunftbegabter Magier bekannt ist, dachte ich, Ihr kennt sie vielleicht. Da habe ich mich wohl getäuscht.~
IF ~~ THEN REPLY ~Wo liegt Erlkazar denn eigentlich?~ EXTERN ~ac#ilel1~ where_erlkazar
END
END

/*******************************************************************************************************
Dialog Ellhimar cre#2 Mirror detected, Ellhimar angry
*******************************************************************************************************/


BEGIN ~ac#ilel2~

IF ~Global("AC#EllhimarHurt","ACIL5E",1)~ THEN BEGIN ellhimar_hurt
SAY  ~Verdammt sollt Ihr sein! Besiegt von einem <PRO_RACE>! Die einzige Genugtuung in meinem Tode wird sein, dass diese Stadt dem Untergang geweiht sein wird!~
IF ~~ THEN DO ~
			SetGlobal("AC#EllhimarHurt","ACIL5E",2)
			AddexperienceParty(3000)
			DropItem("AC#DDROW",[-1.-1])
			ReallyForceSpell(Myself,LONG_RED_MIGHT)
			Kill(Myself)
			~ EXIT
END

IF ~True()~ THEN BEGIN ellhimar_angry
SAY  ~Habe ich es mir doch gedacht! Ihr seid hier, um herumzuschnüffeln! Na wartet, das wird Euch noch leidtun, Ihr *colnbluth*!~
IF ~~ THEN DO ~
			SetGlobal("AC#Vronia_Quest","GLOBAL",10)
			SetGlobal("EllhimarAngry","ACIL5E",2)
			AddJournalEntry(@50610,QUEST)
			Enemy()
			~ EXIT
END
