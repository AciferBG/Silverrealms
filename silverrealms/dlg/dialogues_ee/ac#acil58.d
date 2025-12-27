// ---------------------------------------------
// Priester des Dumathoin: Thammout Hammermantel
// ---------------------------------------------

BEGIN ~AC#58PR1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_firsttime
  SAY ~Seid gegrüßt in den Hallen der Omlare, <RACE>. Was kann der Stille Wächter für Euch tun?~
  IF ~~ THEN REPLY ~Was habt Ihr anzubieten?~ GOTO store
  IF ~~ THEN REPLY ~Was ist das hier für ein Ort?~ GOTO what_location
  IF ~~ THEN REPLY ~Wer ist der "Stille Wächter"?~ GOTO talk_about_dumathoin
  IF ~~ THEN REPLY ~Zur Zeit nichts.~ GOTO bye
  IF ~Global("AC#RC_Turbaern_Second","GLOBAL",1)
  GlobalLT("AC#TurbaernRescued","GLOBAL",3)~ THEN REPLY ~Ich suche nach dem Hohepriester Turbaern Ghalmrin.~ + where_is_turbaern
END

IF ~True()~ THEN BEGIN hello_again
  SAY ~Seid abermals gegrüßt, <RACE>. Was kann der Stille Wächter für Euch tun?~
  IF ~~ THEN REPLY ~Was habt Ihr anzubieten?~ GOTO store
  IF ~~ THEN REPLY ~Was ist das hier für ein Ort?~ GOTO what_location
  IF ~~ THEN REPLY ~Wer ist der "Stille Wächter"?~ GOTO talk_about_dumathoin
  IF ~~ THEN REPLY ~Zur Zeit nichts.~ GOTO bye
  IF ~Global("AC#RC_Turbaern_Second","GLOBAL",1)
  GlobalLT("AC#TurbaernRescued","GLOBAL",3)~ THEN REPLY ~Ich suche nach dem Hohepriester Turbaern Ghalmrin.~ + where_is_turbaern
END

IF ~~ THEN BEGIN where_is_turbaern
SAY ~Habt Ihr es noch nicht gehört? Turbaern ist in den unteren Krypten eingeschlossen. Wir stellen gerade einen Stoßtrupp zusammen, der sich zu ihm durchschlagen soll. Sprecht mit Bulmick im südwestlichen Teil des Tempels, er wird Euch sagen, was Ihr machen könnt, um uns dabei zu unterstützen!~
IF ~~ THEN REPLY ~Ich habe noch eine weitere Frage.~ GOTO questions
IF ~~ THEN REPLY ~Gut. Ich werde diesen Bulmick aufsuchen.~ GOTO bye
END

IF ~~ THEN BEGIN questions
  SAY ~Sicher. Was möchtet Ihr von einem *delvesonn* wissen?~
  IF ~~ THEN REPLY ~Welche Dienste bietet Euer Tempel an?~ GOTO store
  IF ~~ THEN REPLY ~Was ist das hier für ein Ort?~ GOTO what_location
  IF ~~ THEN REPLY ~Was ist ein "delvesonn"?~ GOTO delvesonn
  IF ~~ THEN REPLY ~Erzählt mir über Dumathoin.~ GOTO talk_about_dumathoin
  IF ~~ THEN REPLY ~Zur Zeit nichts.~ GOTO bye
END

IF ~~ THEN BEGIN what_location
SAY ~Dies ist der heilige Ort Dumathoins, des Wächters unter dem Berge. Es ist das älteste Bauwerk in ganz Iltkazar. Es wurde erbaut, noch bevor die ganzen anderen Speichenbrunnenzitadellen in den Fels getrieben wurden.~
    IF ~~ THEN REPLY ~Ich habe noch weitere Fragen.~  GOTO questions
	IF ~~ THEN REPLY ~Das ist alles, was ich wissen wollte. Gehabt Euch wohl.~ GOTO bye
END

IF ~~ THEN BEGIN delvesonn
SAY ~Die von Dumathoin gesegneten Priester nennen sich *delvesonns*, was in Eurer Sprache soviel wie "Dumathoins verborgenes Geschenk" bedeutet.~
    IF ~~ THEN REPLY ~Ich habe noch weitere Fragen.~  GOTO questions
	IF ~~ THEN REPLY ~Das ist alles, was ich wissen wollte. Gehabt Euch wohl.~ GOTO bye
END

IF ~~ THEN BEGIN talk_about_dumathoin
SAY ~Dumathoin, oder der "Stille Wächter", ist der Schutzpatron aller Schildzwerge, unserer Rasse.~
    IF ~~ THEN REPLY ~Ich habe noch weitere Fragen.~  GOTO questions
	IF ~~ THEN REPLY ~Das ist alles, was ich wissen wollte. Gehabt Euch wohl.~ GOTO bye
END

IF ~~ THEN BEGIN store
  SAY ~Wir bieten Euch all die Gaben, mit denen uns der Schild der Berge gesegnet hat. Seht her!~
  IF ~~ THEN DO ~StartStore("AC#58ST1",LastTalkedToBy())~ EXIT
END

IF ~~ THEN BEGIN bye 
  SAY ~Kal maerdh, <RACE>. Möge Euch der Schild der Berge immer mit reichen Adern segnen.~
  IF ~~ THEN EXIT
END

/*******************************************************************************************************
Dialog Turbaern 03: Rescued Turbaern 
*******************************************************************************************************/
BEGIN ~AC#TURB3~

IF ~GlobalGT("AC#RC_Turbaern_Second","GLOBAL",1)~ THEN BEGIN hello_again_02
  SAY ~Der Hüter unter dem Berge wacht über Euch, <CHARNAME>. Was kann ich für als dessen treuer Diener Euch tun?~
	IF ~~ THEN REPLY ~Eigentlich nichts. Ich wollte nur kurz einmal vorbeischauen.~ GOTO take_a_look
	IF ~~ THEN REPLY ~Ich habe ein paar Fragen an Euch.~ GOTO questions
END

IF ~Global("AC#Turbaern_recovered","GLOBAL",2)~ THEN BEGIN hello_again
  SAY ~Schön, Euch wiederzusehen, <CHARNAME>. Was kann ich für Euch tun?~
	IF ~~ THEN REPLY ~Eigentlich nichts. Ich wollte nur kurz einmal vorbeischauen.~ GOTO take_a_look
	IF ~~ THEN REPLY ~Ich habe ein paar Fragen an Euch.~ GOTO questions
	IF ~Global("AC#RC_Turbaern_Second","GLOBAL",1)~ THEN REPLY ~Der Regentschaftsrat bittet Euch, mir den Siegelstein zu den Spinnenschächten auszuhändigen.~ GOTO need_runestone_for_spiderstalkings
END

/*
Runestone Spiderstalkings
____________________________________________________________________*/
		IF ~~ THEN BEGIN need_runestone_for_spiderstalkings
		SAY ~So, tut er das.~
		IF ~~ THEN REPLY ~Ihr wirkt nicht gerade begeistert.~ GOTO whats_the_problem
		IF ~~ THEN REPLY ~Habt Ihr damit ein Problem?~ GOTO whats_the_problem
		END
	
			IF ~~ THEN BEGIN whats_the_problem
			SAY ~Die Spinnenschächte sind ein dreckiger, von unzähligen Spinnen verseuchter Ort. Es gibt dort weder Schätze, Artefakte noch sonstiges, was es lohnen würde, der Gegend einen Besuch abzustatten. Der Durchgang wurde nicht ohne Grund verschlossen. König Mith Barak selbst hat es angeordnet, um der Plage der Spinnen, die aus diesem Loch hervorkriechen, einen Riegel vorzuschieben. Warum bei bei dem Hüter der Berge möchte der Rat denn den Zugang jetzt wieder öffnen?~
			IF ~~ THEN REPLY ~Er erhofft sich davon neue Erkenntnisse, was den Grund des schlafenden Königs angeht.~ GOTO whats_the_point
			IF ~~ THEN REPLY ~Ellhimar war ein verwandelter Drow, der in den Spinnenschächten war.~ GOTO whats_the_point
			END
			
				IF ~~ THEN BEGIN whats_the_point
				SAY ~Und der Rat glaubt, damit dem Rätsel Mith Baraks irgendeinen Schritt näher zu kommen?~
				IF ~~ THEN REPLY ~Irgendwo muss man ja einmal anfangen. Oder soll man hier untätig herumsitzen?~ GOTO somewhere_to_start
				END
				
					IF ~~ THEN BEGIN somewhere_to_start
					SAY ~Die Einzigen, die hier wirklich auf ihrem *batock* sitzen, sind doch die Ratsmitglieder selbst - Elern einmal ausgenommen. Ihr habt die Ratssitzungen erlebt, was haltet Ihr denn davon?~
					IF ~~ THEN REPLY ~Ich denke, der Rat trifft die richtigen Entscheidungen.~ GOTO rc_makes_good_decisions
					IF ~~ THEN REPLY ~Ein Urteil darüber steht mir nicht zu.~ GOTO rc_no_decisions
					IF ~~ THEN REPLY ~Es ist ein ziemlich langatmiges Gelaber.~ GOTO blabla
					END
					
						IF ~~ THEN BEGIN rc_makes_good_decisions
						SAY ~Ja, das denken die Meisten.~
						IF ~~ THEN GOTO rc_no_decisions
						END
						
						IF ~~ THEN BEGIN blabla
						SAY ~Genau so ist es.~
						IF ~~ THEN GOTO rc_no_decisions
						END
						
							IF ~~ THEN BEGIN rc_no_decisions
							SAY ~Lasst mich Euch etwas sagen: Der Rat trifft gar keine Entscheidungen. Diese *jargh* stehen in ihren schön verzierten Gewändern seit über siebzig Jahren in den Hallen und haben nichts außer *mur* zustande gebracht.~
							IF ~~ THEN REPLY ~Das sind harte Worte.~ GOTO hard_words
							END
							
								IF ~~ THEN BEGIN hard_words
								SAY ~Es ist die Wahrheit.~
								IF ~~ THEN REPLY ~Das sagt Ihr doch nur, weil Ihr kein Mitglied im Rat seid.~ GOTO no_member
								IF ~~ THEN REPLY ~Ihr habt vermutlich Recht.~ GOTO no_member
								END
								
									IF ~~ THEN BEGIN no_member
									SAY ~Wisst Ihr, warum ich kein Mitglied des Rates bin?~
									IF ~~ THEN REPLY ~Weil Ihr nicht gefragt wurdet?~ GOTO why_no_member
									IF ~~ THEN REPLY ~Weil Ihr nicht wolltet?~ GOTO why_no_member
									END
									
										IF ~~ THEN BEGIN why_no_member
										SAY ~Ich diene nur unserem König.~
										IF ~~ THEN REPLY ~Das hilft Euch derzeit aber nicht weiter.~ GOTO that_doesnt_help
										IF ~~ THEN REPLY ~Wie könnt Ihr Mith Barak dienen, wenn er Euch keine Befehle geben kann?~ GOTO that_doesnt_help
										END
										
											IF ~~ THEN BEGIN that_doesnt_help
											SAY ~Hat Euch jemand einmal erzählt, wie Mith Barak der *donrar*, der König von Iltkazar wurde?~
											IF ~~ THEN REPLY ~Nein.~ GOTO how_mith_king
											END
										
												IF ~~ THEN BEGIN how_mith_king
												SAY ~Mith Barak, der Clanlose erschien nur Stunden vor dem Tod des alten Königs. Alle anderen Clans hatten sich schon Gedanken gemacht und lange debattiert, wer denn der rechtmäßige Nachfolger werden könnte. Und dann kam ein stämmiger *dwar* mit silbernen Augen durch das Tor gelaufen und wurde mit einem der letzten Atemzüge des alten Herrschers zum rechtmäßigen Herrscher ernannt.~
												=
												~Ihr könnt Euch sicher die Gesichter der ganzen Clan-Anführer vorstellen, als ein Clanloser plötzlich die mit Omlaren verzierte Herrscherkrone auf dem Kopf hatte. Sofort brach Streit aus.~
												IF ~~ THEN REPLY ~Was ist dann passiert?~ GOTO what_happened_next
												END
												
													IF ~~ THEN BEGIN what_happened_next
													SAY ~Dumathoin, der Schild der Berge, erschien. Und gab Mith Barak seinen Segen.~
													IF ~~ THEN REPLY ~Der Avatar Eures Gottes ist erschienen?~ GOTO dumathoin_avatar
													END
													
														IF ~~ THEN BEGIN dumathoin_avatar
														SAY ~Nicht ein Avatar. Ein Zeichen. Dumathoin, der Hüter unter dem Berge, spricht nicht. Aber er sendet Zeichen. In diesem Fall eine riesige Hand, die die alte Rune Shanatars in die Luft zeichnete. Mein Gott ist der Schutzherr aller Zwergenreiche Shanatars. Dieses Zeichen genügte den anderen Clanmitgliedern. Sie erkannten Mith Barak als ihren Herrscher an.~
														IF ~~ THEN REPLY ~Wart Ihr dabei?~ GOTO you_were_there
														END
														
															IF ~~ THEN BEGIN you_were_there
															SAY ~Ich? Nein, mein <GIRLBOY>. Das war lange vor meiner Zeit. Vor vielen Zwergenleben.~
															IF ~~ THEN REPLY ~Wie konnte Mith Barak dann so lange überleben?~ GOTO mith_long_life
															END
															
																IF ~~ THEN BEGIN mith_long_life
																SAY ~Das ist die Frage, die niemand beantworten kann.~
																=
																~Aber letztlich ist es auch egal. Indem ich Mith Barak diene, diene ich Dumathoin. Unser König regiert mit dem Willen meines Gottes, und der Wille des Königs ist der Wille des Hüters unter dem Berge.~
																IF ~~ THEN REPLY ~Und deshalb gebt Ihr mir den Siegelstein nicht.~ GOTO so_no_runestone
																END
																
																	IF ~~ THEN BEGIN so_no_runestone
																	SAY ~Ich zweifle nicht an Euch. Ihr seid ein fähiger <PRO_RACE>. Ihr habt mich gerettet, eine Tat, die der Rat niemals zustande gebracht hätte. Euch vertraue ich mehr als dem Rat.~
																	=
																	~Sagt den Ratsmitgliedern, dass ich nur dem Willen des Königs unterworfen bin. Bis ich kein Zeichen bekomme, dass es der Wunsch des Königs ist, die Spinnenschächte zu öffnen, bleiben die Siegel geschlossen.~  
																	IF ~~ THEN REPLY ~Und mit dieser Nachricht schickt Ihr mich nun zurück?~ GOTO send_me_back
																	END
																	
																		IF ~~ THEN BEGIN send_me_back
																		SAY ~Ja. Es gibt nichts mehr zu dieser Angelegenheit zu sagen. Dumathoin sei mit Euch, <CHARNAME>.~
																		IF ~~ THEN DO ~SetGlobal("AC#RC_Turbaern_Second","GLOBAL",2)
																		EraseJournalEntry(@62020)
																		AddJournalEntry(@62021,QUEST)
																		~ EXIT
																		END
										
										
											
					
		
/*___________________________________________________________________
Idle Chatter
*/		
		IF ~~THEN BEGIN take_a_look
		SAY ~Dann bis bald. Ihr wisst, dass meine Priester Euch gerne weiterhelfen.~
		IF ~~ THEN DO ~~ EXIT
		END
		
		IF ~~ THEN BEGIN questions
		SAY ~Sicher, stellt Eure Fragen.~
		IF ~~ THEN REPLY ~Das war alles. Ich werde später wiederkommen.~ GOTO take_a_look
		IF ~~ THEN REPLY ~Was für eine Funktion hatten eigentlich die Runen in der unteren Krypta?~ GOTO runes_01
		END

			IF ~~ THEN BEGIN runes_01
			SAY ~Diese Stadt ist durch uralte, mächtige Magie geschützt. Anders als bei Euch an der Oberfläche können Eroberer von allen Seiten in unsere Stadt eindringen. Die Runen unter unserem Tempel bildeten einen mächtigen Dweomer, der Beschwörungszauber und ein Durchgraben durch die Mauern unmöglich machen sollte. Beides ist nun geschwächt, und ich möchte mir nicht ausmalen, was passieren könnte, wenn unsere Feinde diese Schwachstelle entdecken würden.~
			IF ~~ THEN REPLY ~Wie lange wird es dauern, die Runen wieder zu aktivieren?~ GOTO how_long_runes
			END
		
				IF ~~ THEN BEGIN how_long_runes
				SAY ~Ich weiß es nicht. Die Schutzzauber sind über Jahrhunderte gewachsen. Es wird mehrere Herdfeuer benötigen, um mindestens die wesentlichen Bestandteile wieder zu aktivieren.~
				IF ~~ THEN REPLY ~Kann ich dabei irgendwie behilflich sein?~ GOTO help_runes
				END
		
					IF ~~ THEN BEGIN help_runes
					SAY ~Leider nicht. Obwohl - wenn Ihr die Stadt gegen unsere Feinde verteidigt, wäre uns das wahrscheinlich die größte Hilfe.~
					IF ~~ THEN REPLY ~Ich habe noch andere Fragen.~ GOTO questions
					IF ~~ THEN REPLY ~Das war alles. Ich werde später wiederkommen.~ GOTO take_a_look
					END


IF ~Global("AC#Turbaern_recovered","GLOBAL",1)~ THEN BEGIN hello_firsttime
  SAY ~<CHARNAME>! Wie gut, Ihr seid wieder in unseren Tempel zurückgekehrt.~
    IF ~~ THEN REPLY ~Es ist schön, Euch wieder zu sehen, Turbaern. Wie geht es Euch?~  GOTO how_are_you
	IF ~~ THEN REPLY ~Ich wollte nur kurz einmal vorbeischauen...~ GOTO thank_you
	IF ~Global("AC#RC_Turbaern_Second","GLOBAL",1)~ THEN REPLY ~Der Regentschaftsrat hat eine Bitte an Euch.~ GOTO rc_can_wait
END

			IF ~~ THEN BEGIN rc_can_wait
			SAY ~Das muss kurz warten!~
				IF ~~ THEN GOTO present
			END
		
	IF ~~ THEN BEGIN how_are_you
	SAY ~Dank der heilenden Magie des Hüters unter dem Berge geht es mir wieder gut.~
		IF ~~ THEN GOTO thank_you
	END
	
	IF ~~ THEN BEGIN thank_you
	SAY ~Ich würde nicht hier stehen, wenn Ihr nicht gewesen wäret, <CHARNAME>. Ich stehe tief in Eurer Schuld.~
    IF ~~ THEN REPLY ~Das finde ich auch.~  GOTO present
	IF ~~ THEN REPLY ~Ach, das war nicht der Rede wert.~ GOTO humble
	IF ~~ THEN REPLY ~Ich versuche immer, das Richtige zu tun. Ihr braucht Euch nicht dafür zu bedanken.~ GOTO humble
	END
	
		IF ~~ THEN BEGIN humble
		SAY ~Seid nicht so bescheiden! Nicht jeder <PRO_RACE> von der Oberfläche hätte dies für unsere Stadt getan.~
			IF ~~ THEN GOTO present
		END
		
			IF ~~ THEN BEGIN present
			SAY ~Hier, ich habe als Dank ein Geschenk für Euch.~
			IF ~~ THEN REPLY ~Deshalb bin ich hier.~  GOTO present02
			IF ~~ THEN REPLY ~Vielen Dank.~  GOTO present02
			IF ~~ THEN REPLY ~Das ist doch nicht nötig.~ GOTO humble02
			END
			
					IF ~~ THEN BEGIN humble02
					SAY ~Doch, das ist es! Ich möchte, dass Ihr es annehmt.~
					IF ~~ THEN GOTO present02
					END
					
				IF ~~ THEN BEGIN present02
				SAY ~Es ist ein heiliges Amulett meines Gottes. Ihr werdet es hoffentlich nicht sehr oft brauchen, doch wenn, dann wird es Euch vor dem sicheren Tod im Gestein bewahren.~
				IF ~~ THEN DO ~GiveItemCreate("AC#AMUDU",Player1,1,0,0)~ GOTO present03
				END
				
					IF ~~ THEN BEGIN present03
					SAY ~Unser Tempel steht Euch immer offen - und ich bin mir sicher, dass der Stille Wächter immer seine schützende Hand über Euch ausbreiten wird.~
					IF ~Global("AC#Arrested","GLOBAL",1)~ THEN REPLY ~Könntet Ihr ein gutes Wort im Regentschaftsrat für mich einlegen, dass dieser Arrest in Eurer Stadt endlich aufgehoben wird?~  GOTO arrest_gone
					IF ~~ THEN REPLY ~Vielen Dank, Turbaern. Ich werde das Amulett mit Stolz tragen.~ GOTO thanks_again
					END
					
						IF ~~ THEN BEGIN arrest_gone
						SAY ~Glaubt mir, das habe ich schon. Ich kann es nicht allein entscheiden, wann Ihr Euch in und außerhalb der Stadt wieder frei bewegen könnt, aber mein Wort hat beim Regentschaftrat einiges an Gewicht. Habt Geduld, <CHARNAME>, und überzeugt die Zwerge von Euren edlen Absichten.~
						IF ~~ THEN DO ~SetGlobal("AC#Turbaern_recovered","GLOBAL",2)~ GOTO thanks_again
						END
						
						IF ~~THEN BEGIN thanks_again
						SAY ~Wie gesagt, der Dank gebührt ganz allein Euch.~
						=
						~Ich werde mich nun wieder meinen Aufgaben im Tempel widmen. Es gibt einiges aufzuräumen, und die Schutzrunen in den tiefsten Kammern unserer Stadt sind wohl unwiederbringlich zerstört.~
						IF ~GlobalLT("AC#RC_Turbaern_Second","GLOBAL",1)~ THEN EXIT
						IF ~Global("AC#RC_Turbaern_Second","GLOBAL",1)~ THEN REPLY ~Ich habe noch ein Anliegen. Der Regentschaftsrat bittet Euch, mir den Siegelstein zu den Spinnenschächten auszuhändigen.~ GOTO need_runestone_for_spiderstalkings
						END

/*******************************************************************************************************
Dialog Dhundala
*******************************************************************************************************/
BEGIN ~AC#58DE1~

IF ~True()~ THEN BEGIN 0
  SAY ~Was wollt Ihr? Ich komme gerade von einer Schürfexpedition zurück und habe jetzt wirklich keine Lust, mit einem <RACE> wie Euch zu reden!~
  IF ~~ THEN REPLY ~Ich entschuldige die Störung und werde Euch in Ruhe lassen.~  GOTO bye
  IF ~PartyHasItem("AC#SRPAX")~ THEN REPLY ~Ich soll Euch von einem Händler Eure neue Spitzhacke bringen.~  GOTO has_pickaxe
END

IF ~~ THEN BEGIN bye
SAY ~Gute Idee!~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN has_pickaxe
SAY ~Oh! Sagt das doch gleich! Das ist ein gutes Stück. Hoffentlich hält sie länger als die letzte, die ich bei Thifthic in Auftrag gegeben hatte.~
  IF ~~ THEN DO ~TakePartyItem("AC#SRPAX")
  EraseJournalEntry(@54601)~ GOTO no_thanks_01
END

IF ~~ THEN BEGIN no_thanks_01
SAY ~Aber nur damit Ihr's wisst: Einen Dank werdet Ihr von mir dafür nicht bekommen, Oberflächenbewohner.~
    IF ~~ THEN REPLY ~Das hatte ich auch gar nicht erwartet.~  GOTO no_thanks_02
END

IF ~~ THEN BEGIN no_thanks_02
SAY ~Gut. Freuen tu' ich mich trotzdem. Hier habt Ihr einen Zirkon, den ich gestern geschürft habe. Und jetzt werde ich mir erst einmal den Staub von den Stiefeln wischen.~
    IF ~~ THEN REPLY ~Dafür sage ich jetzt aber Danke.~  GOTO thanks_01
END

IF ~~ THEN BEGIN thanks_01
SAY ~He, Ihr seid gar nicht so verkehrt. Steht zwar noch ein bisschen im Weg rum, aber Ihr habt mehr Manieren als manche der anderen *delvar*.~
    IF ~~ THEN DO ~SetGlobal("AC#Pickaxe","GLOBAL",2)
IncrementGlobal("AC_Iltkazar_Reputation","GLOBAL",1)
GiveItemCreate("MISC25",LastTalkedToBy,1,0,0)
DisplayStringNoName(Player1,@1021)~ EXIT
END

/*******************************************************************************************************
Dialog Talhund 01
*******************************************************************************************************/
BEGIN ~AC#58DW1~

IF ~GlobalLT("AC#TurbaernRescued","GLOBAL",3)
Global("Dumathoin_Alarm","ACIL58",4)~ THEN BEGIN hello_again
  SAY ~Wir müssen einen Weg nach unten die Krypten finden, um unseren Brüdern dort unten zu helfen!~
  IF ~~ THEN DO ~~ EXIT
	END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY ~Ihr kommt zu einer schlechten Zeit zu uns, Oberflächen-<PRO_RACE>!~
  IF ~~ THEN REPLY ~Was war das für ein Signal?~  GOTO what_signal
END

	IF ~~ THEN BEGIN what_signal
	SAY ~Das war das Horn der Wachen. Zweimal langes Signal heißt, dass in den Krypten unter unserem Tempel etwas mächtig den Bart runtergegangen ist und die Eingänge nach unten verschlossen wurden!~
	IF ~~ THEN DO ~SetGlobal("Dumathoin_Alarm","ACIL58",2)
	~ EXIT
	END
	
	IF ~~ THEN BEGIN god_damn
	SAY ~Verflucht! Rasch, gehe zu Lorsil und den anderen im Süden, während ich zu Bulmick und seinem Lastenaufzug gehe - vielleicht gibt es von dort eine Möglichkeit, nach unten zu gelangen!~
	IF ~~ THEN DO ~SetGlobal("Dumathoin_Alarm","ACIL58",4)
	AddJournalEntry(@58001,QUEST)
	SetGlobal("AC#58DW1Moves","ACIL58",1)
	SetGlobal("AC#58DW2Moves","ACIL58",1)
	//ActionOverride("AC#58DW2",//MoveToObjectNoInterrupt("AC#58DW9"))
	//MoveToPointNoInterrupt([582.2076])
	~ EXIT
	END

/*******************************************************************************************************
Dialog Talhund 02
*******************************************************************************************************/
BEGIN ~AC#58DW2~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY ~Der heilige Hammer Dumathoins ist vom Altar gestohlen worden! Die Schutzrunen in der Krypta sind damit zerstört worden und die Wege nach unten nicht mehr passierbar! Unser Priester Turbaern ist mit seinen Männern unten eingeschlossen!~
  IF ~~ THEN DO ~~ EXTERN ~AC#58DW1~ god_damn
END

IF ~GlobalLT("AC#TurbaernRescued","GLOBAL",3)~ THEN BEGIN hello_again
  SAY ~Wir müssen einen Weg nach unten die Krypten finden, um unseren Brüdern dort unten zu helfen!~
  IF ~~ THEN DO ~~ EXIT
	END
	
/*******************************************************************************************************
Dialog Talhund 04
*******************************************************************************************************/
BEGIN ~AC#58DW4~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_01
SAY ~Der heilige Hammer Dumathoins ist fort!~
IF ~~ THEN REPLY ~Welcher Hammer?~ GOTO hammer_01
IF ~PartyHasItem("AC#HADUM")~ THEN REPLY ~Ist es dieser Hammer hier?~ + have_hammer
END

	IF ~~ THEN BEGIN have_hammer
	SAY ~Ihr habt den Hammer geborgen? Los, legt ihn schnell wieder zurück auf diesen Altar! Ich werde die anderen informieren, dass der Hammer wieder an seinem angestammten Platz ist!~
	IF ~~ THEN DO ~EscapeArea()~ EXIT
			END

	IF ~~ THEN BEGIN hammer_01
	SAY ~Na der Hammer, der eigentlich hier auf dem Altar liegen sollte! Ihr seht ja sogar noch den Abdruck, den der heilige Hammer auf dem Gestein hinterlassen hat. Nicht auszudenken, was passieren könnte, wenn er in falsche Hände gerät.~
	IF ~~ THEN REPLY ~Was ist so besonders an diesem Hammer?~ GOTO hammer_02 
	IF ~PartyHasItem("AC#HADUM")~ THEN REPLY ~Ist es dieser Hammer hier?~ + have_hammer
	END
	
		IF ~~ THEN BEGIN hammer_02
		SAY ~Was für eine Frage! Er ist ein vom Hüter unter dem Berge gesegnetes Artefakt!~
		IF ~~ THEN REPLY ~Ich werde Euch dann einmal wieder allein lassen.~ GOTO bye_hammer
		IF ~PartyHasItem("AC#HADUM")~ THEN REPLY ~Ist es dieser Hammer hier?~ + have_hammer
		END
		
			IF ~~ THEN BEGIN bye_hammer
			SAY ~Hrm.~
			IF ~~ THEN DO ~EscapeArea()~ EXIT
			END
/*******************************************************************************************************
Dialog Lorsil 
*******************************************************************************************************/
BEGIN ~AC#58DW9~

IF ~PartyHasItem("AC#57TUR")
Global("HasTurbaernBody","ACIL58",2)~ THEN BEGIN 2
  SAY ~Gut, dass Ihr es nach oben geschafft habt. Hier, wartet, ich werde Euch den Priester abnehmen...~
	IF ~~ THEN DO ~TakePartyItem("AC#57TUR")
	SetGlobal("HasTurbaernBody","ACIL58",3)
	CreateCreature("AC#TURB2",[-1.-1],0)
	~ EXIT
	END
	
IF ~!PartyHasItem("AC#57TUR")~ THEN BEGIN 0
  SAY ~Verfluchte Untote! Wenn Ihr irgendwie helfen wollt, sucht Bulmick im Westen auf!~
	IF ~~ THEN DO ~~ EXIT
	END
	
IF ~PartyHasItem("AC#57TUR")
GlobalLT("AC#TurbaernRescued","GLOBAL",2)~ THEN BEGIN 1
  SAY ~Meister Turbaern? Den Göttern sei Dank! Los, öffnet die Tore!~
	IF ~~ THEN DO ~SetGlobal("AC#TurbaernRescued","GLOBAL",2)
	~ EXIT
	END

	IF ~~ THEN BEGIN bring_him
	  SAY ~Bringt den Hohen Omlar Ghalmrin in seine Privatgemächer! Die Talhund sollen sich um ihn kümmern!~
	  IF ~~ THEN DO ~~ EXTERN ~AC#TURB2~ thank_pc
	END

	IF ~~ THEN BEGIN go_check_the_runes
	  SAY ~Jawohl, hoher Omlar. Los, Kameraden, bringt unseren Priester zu den Heilern. Ich werde mir die Schäden da unten einmal genauer ansehen.~
	  IF ~~ THEN DO ~~ EXTERN ~AC#TURB2~ honor_pc
	END		
/*******************************************************************************************************
Dialog Turbaern 02 
*******************************************************************************************************/
BEGIN ~AC#TURB2~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
  SAY ~Aah... ich spüre wieder Dumathoins heiligen Boden unter meinen Füßen...~
  IF ~~ THEN DO ~~ EXTERN ~AC#58DW9~ bring_him
END

			IF ~~THEN BEGIN thank_pc
			SAY ~Wartet... auf ein Wort noch... zu meinen Rettern....~
				=
				~Ich bin Euch zu großem Dank verpflichtet, <CHARNAME>. Ohne Euch hätte ich diesen Tag nicht überlebt. Ihr sollt uns immer in den Hallen der Omlare willkommen sein. Sobald es mir wieder besser geht, werde ich Euch gebührend entlohnen.~
				=
				~Lorsil, mein treuer Krieger. Geht nach unten und seht nach den Runen. Ich fürchte, sie sind alle zerstört. Was dies für die Sicherheit unserer Stadt bedeutet, möchte ich mir gar nicht ausmalen. Seht unten nach, wie groß der Schaden ist.~
			  IF ~~ THEN DO ~~ EXTERN ~AC#58DW9~ go_check_the_runes
			END
			
			IF ~~ THEN BEGIN honor_pc
			SAY ~Euch, <CHARNAME>, wird die Ehre zuteil, Dumathoins Hammer  wieder an seinen angestammten Platz zu bringen. Platziert ihn bitte auf dem Sockel im Osten unseres Tempel. Ich bin mir sicher, dass der Schweigende gnädig auf Euch herablächeln wird!~
			IF ~~ THEN DO ~SetGlobal("AC#TurbaernRescued","GLOBAL",10)
				IncrementGlobal("AC_Iltkazar_Reputation","GLOBAL",3)
				SetGlobalTimer("Turbaern_recovered","ACIL58",ONE_DAY)
				ActionOverride("AC#58DW9",EscapeAreaObject("TrACIL57"))
				ActionOverride("ac#58dw8",EscapeAreaObject("TrACIL50")) 
				EraseJournalEntry(@58008)
				AddJournalEntry(@58009,QUEST_DONE)
				EraseJournalEntry(@58020)
				AddJournalEntry(@58021,QUEST)
				AddexperienceParty(1000)
				DisplayStringNoName(Player1,@1021)
				DestroySelf()~ EXIT
			END
	
/*******************************************************************************************************
Dialog Bulmick
*******************************************************************************************************/
BEGIN ~AC#58DW3~

IF ~GlobalGT("AC#TurbaernRescued","GLOBAL",9)~ THEN BEGIN hello_after_rescue
SAY ~Oh! Da seid Ihr wieder!~
IF ~~ THEN REPLY ~Wie ich sehe habt Ihr den Lastenaufzug wieder repariert.~ GOTO repaired_elevator
END

	IF ~~ THEN BEGIN repaired_elevator
	SAY ~Was? Oh, ja! Wir haben die Seilzüge durch Metallketten ersetzt, damit sie nicht wieder reißen.~
	IF ~~ THEN REPLY ~Hättet Ihr diesen Einfall nicht haben können, bevor ich mitsamt dem Aufzug in die Tiefe gestürzt bin?~ GOTO repaired_elevator_02 
	END
	
		IF ~~ THEN BEGIN repaired_elevator_02
		SAY ~Dank Euch haben wir es herausgefunden! Und ich muss mich jetzt um ... äh... andere Angelegenheiten kümmern.~
		IF ~~ THEN DO ~EscapeArea()~ EXIT 
		END

IF ~Global("Use_Elevator","ACIL58",3)~ THEN BEGIN ready_set_action
	SAY ~So, haltet Euch gut fest! Und wackelt nicht so arg, wenn es abwärts geht. Der Sarg in der Mitte sollte den Träger stabilisieren, dass er nicht so stark hin- und herschwingt. Und haltet Euch nicht an den Seilen fest, die sind durch die Last ohnehin schon sehr stark beansprucht! Wenn Ihr unten seid, ziehen wir den Träger wieder nach oben und lassen die nächste Fuhre herunter. Also los jetzt, gebt uns das Zeichen, wenn Ihr bereit seid!~
	IF ~~ THEN DO ~SetGlobal("Use_Elevator","ACIL58",4)
	EraseJournalEntry(@58004)
	AddJournalEntry(@58005,QUEST)
	~ EXIT
END
			
IF ~Global("Use_Elevator","ACIL58",1)~ THEN BEGIN hello_again
  SAY ~Na, sollen wir Euch unten lassen - oder habt Ihr es Euch anders überlegt?~
  IF ~~ THEN REPLY ~Ich bin bereit. Lasst mich nach unten.~  GOTO going_down
  IF ~~ THEN REPLY ~Wartet noch. Ich muss mich erst vorbereiten.~  GOTO not_ready_yet
END

		IF ~~ THEN BEGIN not_ready_yet
		SAY ~Beeilt Euch! Wir können unseren Priester nicht ewig warten lassen! Wo bleiben überhaupt die anderen?~
		IF ~~ THEN DO ~~ EXIT
		END
		
		IF ~~ THEN BEGIN going_down
		SAY ~He, das ist gut! Ihr seid die Ersten, die heruntergelassen werden, wisst Ihr das?~
		IF ~~ THEN REPLY ~Was? Hättet Ihr mir das nicht vorher sagen können?~  GOTO going_down_02
		END
		
			IF ~~ THEN BEGIN going_down_02
			SAY ~Nichts für ungut, stellt Euch jetzt endlich auf den Lastenträger!~
			IF ~~ THEN DO ~SetGlobal("Use_Elevator","ACIL58",2)
			~ EXIT
			END
		
IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY ~He Ihr, Platz da! Da die Zugänge nach unten versperrt sind, stellen wir gerade eine Truppe zusammen, die wir an dem Lastenaufzug nach unten lassen können.~
  IF ~~ THEN REPLY ~Was wäre, wenn ich diese Aufgabe übernehmen würde?~  GOTO my_job
END

	IF ~~ THEN BEGIN my_job
	SAY ~Ihr? Ihr seid nicht von hier. Ein <PRO_RACE> von der Oberfläche? Warum wollt Ihr das machen?~
	IF ~~ THEN REPLY ~Weil ich gerade nichts besseres zu tun habe.~  GOTO nothing_better
	IF ~Global("AC#RC_Turbaern_Second","GLOBAL",1)~ THEN REPLY ~Ich muss den Hohepriester Turbaern auf Geheiß des Regentschaftsrates etwas fragen. Da er sich dort unten befindet, muss ich eben auch hinunter.~  GOTO nothing_better
	END
	
		IF ~~ THEN BEGIN nothing_better
		SAY ~Hmm...~
		=
		~Also gut. Dann könnten die anderen Talhund versuchen, den reguären Zugang nach unten wieder freizubekommen. Sagt mir, wann Ihr soweit seid, dann hieven wir Euch auf den Träger!~
		IF ~~ THEN DO ~SetGlobal("Use_Elevator","ACIL58",1)
		EraseJournalEntry(@58001)
		AddJournalEntry(@58004,QUEST)~ EXIT
		END
	