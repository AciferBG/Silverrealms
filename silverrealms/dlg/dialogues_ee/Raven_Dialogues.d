// Raven Dialogues

// Raven in Area ACIL04 (Twowaters, after Beldas left tavern)

BEGIN ~AC#RAV04~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello
SAY ~*Krah*! *Krah*! Da seid Ihr ja! Ich habe überall nach Euch gesucht!~
IF ~Global("AC#XothaerinScepter","GLOBAL",1)~ THEN GOTO retrieve_scepter
IF ~Global("AC#XothaerinScepter","GLOBAL",2)~ THEN GOTO meet_master
END

	IF ~~ THEN BEGIN meet_master
	SAY ~Mein Meister möchte Euch sprechen! Es geht um das Zepter!~
	IF ~~ THEN REPLY ~Weiß er jetzt, wo sich das fehlende Teil befindet?~ GOTO missing_part 
	IF ~~ THEN REPLY ~Richtig! Es fehlt ja noch meine Belohnung.~ + reward
	END
	
		IF ~~ THEN BEGIN reward
		SAY ~Das ist seine Aufgabe. Meine Aufgabe ist es, Euch zu ihm zu zitieren!~
		IF ~~ THEN REPLY ~Wo möchte er mich treffen?~ GOTO where_is_mage
		END

		IF ~~ THEN BEGIN missing_part
		SAY ~Das muss er Euch sagen. Aber meine Aufgabe ist es, Euch zu ihm zu zitieren!~
		IF ~~ THEN REPLY ~Wo möchte er mich treffen?~ GOTO where_is_mage
		END
		
		IF ~~ THEN BEGIN where_is_mage 
  SAY ~*Krah, krah*! Unser Turm befindet sich nordwestlich von hier, in den Hamlar-Bergen am Fuße des Wolkengipfel-Gebirges. Mein Meister und ich werden dort auf Euch warten. Aber lasst Euch nicht zu lange Zeit!~
  IF ~~ THEN DO ~SetGlobal("AC#MeetAldym","GLOBAL",1)
SetGlobal("AC#Raven_NPC","ACIL04",1)  
RevealAreaOnMap("ACIL03")
AddJournalEntry(@20040,QUEST)  
EscapeArea()
~ EXIT
END

	IF ~~ THEN BEGIN retrieve_scepter
	SAY ~Ihr wolltet doch das Zepter für meinen Meister besorgen! Er wartet darauf... und ich auch! *Krah*!~
	IF ~~ THEN REPLY ~Ihr habt Recht. Ich hatte es ganz vergessen.~ GOTO yes_retrieve_scepter
	IF ~~ THEN REPLY ~Was war noch einmal mit dem Zepter? Ich kann mich gar nicht richtig erinnern.~ + remember
	IF ~~ THEN REPLY ~Ich habe keine Lust nach dem Zepter zu suchen.~ + no_retrieve_scepter
	END
	
		IF ~~ THEN BEGIN yes_retrieve_scepter
		SAY ~Dann macht mal! Das Zepter liegt immer noch in diesem heiligen Wasser an der Axtbrücke. Geht es dort holen. Ich werde Euch dann wieder aufsuchen.~
		IF ~~ THEN DO ~SetGlobal("AC#RavenQuest#04","GLOBAL",2)
		SetGlobal("AC#Raven_NPC","ACIL04",1)
		EscapeArea()~ EXIT 
		END
	
		IF ~~ THEN BEGIN remember
		SAY ~Ihr solltet für meinen Meister ein Zepter aus einem überfluteten Zwergentempel bergen. Der Zugang befindet sich an der Axtbrücke.~
		IF ~~ THEN REPLY ~Ich habe keine Lust nach dem Zepter zu suchen.~ + no_retrieve_scepter 
		IF ~~ THEN REPLY ~Ihr habt Recht. Ich hatte es ganz vergessen.~ GOTO yes_retrieve_scepter
		END

		IF ~~ THEN BEGIN no_retrieve_scepter
		SAY ~Was? Aber ihr hattet es doch versprochen! *Krah*!~
		IF ~~ THEN REPLY ~Es war nur ein Scherz.~ GOTO joke
		IF ~~ THEN REPLY ~Nein, wirklich. Sucht Euch jemand anderen.~ + decline_quest
		END
		
			IF ~~ THEN BEGIN joke
			SAY ~Ihr seid ein echter Spaß*Krah*Vogel, was?~
			IF ~~ THEN GOTO yes_retrieve_scepter
			END
		
			IF ~~ THEN BEGIN decline_quest
			SAY ~Ach, ich weiß schon, warum ich mit einem <PRO_RACE> so ungern Geschäfte mache. Wie dem auch sei. Dann suche ich mir eben jemand anderen.~
			IF ~~ THEN DO ~SetGlobal("AC#RavenQuest#04","GLOBAL",99)
			EscapeArea()~ EXIT 
			END

// Raven in Area ACIL0A (Dwarven Camp, after Beldas' death)

BEGIN ~AC#RAVE0~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_again_beldas_dead
SAY ~Hier steckt Ihr also! *Krah*!~
//IF ~Global("AC#XothaerinScepter","GLOBAL",1)~ THEN GOTO did_not_retrieve_scepter
//IF ~Global("AC#MeetAldym","GLOBAL",1)~ THEN GOTO meet_aldym
/*IF ~GlobalGT("AC#XothaerinHead","GLOBAL",0)
GlobalLT("AC#XothaerinHead","GLOBAL",20)~ THEN GOTO did_not_retrieve_scepter_head*/
//IF ~Global("AC#XothaerinHead","GLOBAL",20)~ THEN GOTO aldym_found_way_to_restore_scepter
IF ~~ THEN GOTO aldym_found_way_to_restore_scepter
END
/*
// Player talked in ACIL06 to Raven but did not retrieve the scepter handle, Raven still in ACIL06
IF ~~ THEN BEGIN did_not_retrieve_scepter
  SAY ~Ihr wolltet doch das Zepter für meinen Meister besorgen!~ 
  IF ~~ THEN REPLY ~Ich bin gerade wirklich nicht in der Stimmung mit Euch zu reden.~ + not_in_the_mood
  IF ~~ THEN REPLY ~Ihr seid hier? Wie habt Ihr mich gefunden?~ + why_are_you_here
END

// Scepter handle retrieved, Area ACIL03 revealed, Raven disappears in ACIL06, PLayer did not talk to Aldym yet
IF ~~ THEN BEGIN meet_aldym
  SAY ~Mein Meister wollte doch mit Euch sprechen! Ihr solltet ihn doch in seinem Turm aufsuchen!~ 
  IF ~~ THEN REPLY ~Ich bin gerade wirklich nicht in der Stimmung mit Euch zu reden.~ + not_in_the_mood
  IF ~~ THEN REPLY ~Ihr seid hier? Wie habt Ihr mich gefunden?~ + why_are_you_here
END

// Scepter handle retrieved, talked to Aldym, player did not retrieve scepter head
IF ~~ THEN BEGIN did_not_retrieve_scepter_head
  SAY ~*Krah*! *Krah*! Ihr solltet doch das Schiffswrack nach dem Zepterkopf absuchen!~ 
  IF ~~ THEN REPLY ~Ich bin gerade wirklich nicht in der Stimmung mit Euch zu reden.~ + not_in_the_mood
  IF ~~ THEN REPLY ~Ihr seid hier? Wie habt Ihr mich gefunden?~ + why_are_you_here
END
*/
// Aldym has both parts of the scepter
IF ~~ THEN BEGIN aldym_found_way_to_restore_scepter
  SAY ~Mein Meister hat endlich einen Weg gefunden, die beiden Zepterteile zu vereinigen!~ 
  IF ~~ THEN REPLY ~Ich bin gerade wirklich nicht in der Stimmung, mit Euch zu reden.~ + not_in_the_mood
  IF ~~ THEN REPLY ~Was scheren mich noch Eure zwei Zepterteile?~ + not_in_the_mood
  IF ~~ THEN REPLY ~Ihr seid hier? Wie habt Ihr mich gefunden?~ + why_are_you_here
END



	IF ~~ THEN BEGIN why_are_you_here
	SAY ~*Krah*! Das war gar nicht so einfach. Ich suchte schon eine ganze Weile nach Euch. Letztendlich bin ich dem ganzen Blitz, Feuer und Rauch gefolgt. Das war ja ein ganz schönes Spektakel, das Ihr da veranstaltet habt! Und alles nur, weil Ihr einen Weg ins Unterreich finden wolltet!~
	IF ~~ THEN REPLY ~Ihr wisst davon?~ GOTO way_underdark
	END

	IF ~~ THEN BEGIN not_in_the_mood
	SAY ~So? Ihr könnt es Euch wohl kaum leisten, jetzt in Selbstmitleid zu verfallen. Und alles nur, weil Ihr einen Weg ins Unterreich finden wolltet!~
	IF ~~ THEN REPLY ~Ihr wisst davon?~ GOTO way_underdark
	END
	
		IF ~~ THEN BEGIN way_underdark
		SAY ~Das ist doch offensichtlich! Zumindest aus meiner Perspektive, da ich die Dinge gerne von oben betrachte. Hört zu. Mein Meister kann Euch vielleicht helfen. Er kennt einen Weg ins Unterreich.~
			IF ~~ THEN REPLY ~Ins Unterreich? Da muss ich hin!~ GOTO way_underdark_03
			END
			
				IF ~~ THEN BEGIN way_underdark_03
				SAY ~Das weiß er. Darum sollte ich Euch ja aufsuchen!~
				//IF ~Global("AC#XothaerinScepter","GLOBAL",1)~ THEN GOTO axebridge_01 // Option #1: Raven sends the party back to axebridge to retrieve the scepter handle
				//IF ~Global("AC#MeetAldym","GLOBAL",1)~ THEN GOTO mage_tower_01 //  Option #2: Scepter handle retrieved, Area ACIL03 revealed, Raven disappeared in ACIL06, PLayer did not talk to Aldym yet
				/*IF ~GlobalGT("AC#XothaerinHead","GLOBAL",0)
				GlobalLT("AC#XothaerinHead","GLOBAL",20)~ THEN GOTO shipwreck_01 // Option #3: Raven sends the party directly to the shipwreck if player already talked to Aldym */
				//IF ~Global("AC#XothaerinHead","GLOBAL",20)~ THEN GOTO dwarven_smithy_01
				IF ~~ THEN GOTO dwarven_smithy_01
				END
				/*
				// Option #1: 
				// - scepter handle NOT retrieved
				// - DID NOT talk to Aldym
					IF ~~ THEN BEGIN axebridge_01
					SAY ~Habt Ihr es schon vergessen? Ihr wolltet doch das Zwergenzepter aus der Höhle nahe der Axtbrücke für mich bergen!~
					IF ~~ THEN REPLY ~Ich bin einfach noch nicht dazu gekommen.~ GOTO axebridge_02
					END
					
						IF ~~ THEN BEGIN axebridge_02
						SAY ~Dann solltet Ihr Euch vielleicht einmal beeilen! Oder wollt Ihr Euch den Weg ins Unterreich selbst graben? Ich warte an der Axtbrücke auf Euch!~
						IF ~~ THEN DO ~EscapeArea()
						~ EXIT
						END
					
				// Option #2: 
				// - scepter handle retrieved
				// - DID NOT talk to Aldym
					IF ~~ THEN BEGIN mage_tower_01
					SAY ~Habt Ihr es schon vergessen? Ihr solltet doch meinen Meister in dessen Turm aufsuchen, nachdem Ihr mir nur den Griff des Zepters besorgen konntet!~
					IF ~~ THEN REPLY ~Ich bin einfach noch nicht dazu gekommen.~ GOTO mage_tower_02
					END	
					
						IF ~~ THEN BEGIN mage_tower_02
						SAY ~Dann solltet Ihr Euch vielleicht einmal beeilen! Oder wollt Ihr Euch den Weg ins Unterreich selbst graben? Mein Meister wartet in seinem Turm auf Euch!~
						IF ~~ THEN DO ~EscapeArea()
						~ EXIT
						END
				// Option #3: 
				// - scepter handle retrieved
				// - already talked to Aldym
				// did not retrieve scepter head
					IF ~~ THEN BEGIN shipwreck_01
					SAY ~Ihr solltet doch den fehlenden Kopf des Zepters bergen. Er ist auf diesem Schiffswrack. Wieder am ... Wasser.~
					IF ~~ THEN GOTO shipwreck_02
					END
				
						IF ~~ THEN BEGIN shipwreck_02 
						  SAY ~Wenn Ihr den Zepterkopf habt, kehrt zum Turm meines Meisters zurück. Dann wird er Euch einen Weg ins Unterreich weisen und Ihr könnt Eure andere Suche fortsetzen.~
						  IF ~~ THEN DO ~EscapeArea()
						~ EXIT
						END
				*/
				// Option #3: 
				// - all parts retrieved
				// player waits for ruther instructions
				IF ~~ THEN BEGIN dwarven_smithy_01
					SAY ~Mein Meister hat den Ort gefunden, an dem die beiden Zepterteile wieder vereinigt werden können.~
					IF ~~ THEN GOTO dwarven_smithy_02
					END
				
						IF ~~ THEN BEGIN dwarven_smithy_02 
						  SAY ~Dabei fand er auch Hinweise auf einen Weg ins Unterreich, den Ihr wohl so dringend sucht. Kommt in den Turm meines Meisters und er wird Euch alles erklären!~
						  IF ~~ THEN DO ~SetGlobal("AC#XothaerinForge","GLOBAL",1)
						EraseJournalEntry(@20035)
						AddJournalEntry(@20036,QUEST)
						RevealAreaOnMap("ACIL03")
						EscapeArea()
						~ EXIT
						END
						
// Raven in Area ACIL09 (destroyed Axe Bridge)

BEGIN ~AC#RAVE5~

IF ~Global("AC#Raven_ACIL09Head","GLOBAL",1)~ THEN BEGIN hello_again_head
SAY ~Habt Ihr den Kopf des Zepter endlich gefunden? ~
IF ~~ THEN REPLY ~Nur mal langsam mit den jungen Krähen! Ich bin noch auf der Suche danach.~ GOTO wait_head
IF ~PartyHasItem("AC#ZEPXS")~ THEN REPLY ~Ja, ich denke schon.~ + have_head
END

	IF ~~ THEN BEGIN wait_head
	SAY ~Dann macht mal etwas schneller!~
	IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN have_head
	SAY ~Das wurde aber auch Zeit! Her damit! *Krah, krah*!~
	IF ~~ THEN DO ~TakePartyItem("AC#ZEPXO")
	TakePartyItem("AC#ZEPXS")~ GOTO take_2_items
	END
	
		IF ~~ THEN BEGIN take_2_items
		SAY ~Das sind sie! Heure*krah*!~
		=
		~...~
		IF ~~ THEN GOTO not_working
		END
		
			IF ~~ THEN BEGIN not_working
			SAY ~Sie lassen sich nicht zusammenfügen!~
			IF ~~ THEN REPLY ~Und jetzt?~ GOTO bye_alone_to_master
			END
			
			IF ~~ THEN BEGIN bye_alone_to_master 
				SAY ~*Krah, krah*! Ich werde zum Meister zurückkehren und ihm von meinem Scheitern berichten müssen... oh weh, oh weh!~
				IF ~~ THEN REPLY ~He! Ihr wolltet mir doch einen Weg von der Brücke weisen!~ GOTO way_home
				IF ~~ THEN REPLY ~Sicher, dass ich nicht noch helfen kann?~ GOTO can_i_help
				END
				
					IF ~~ THEN BEGIN way_home
					SAY ~Stimmt! *Krah*! Es wäre ja niemandem damit geholfen, wenn Ihr in dieser Höhle versauern würdet. Gleich neben mir ist ein Geheimgang, der Euch auf die Eshpurtastraße zurückbringen wird.~
					IF ~~ THEN GOTO bye_krah
					END
					
					IF ~~ THEN BEGIN can_i_help
					SAY ~Ach, Ihr wollt doch nur den Weg hier weg erfahren, stimmts? Also passt auf: Gleich neben mir ist ein Geheimgang, der Euch auf die Eshpurtastraße zurückbringen wird.~
					IF ~~ THEN GOTO bye_krah
					END
  
				IF ~~ THEN BEGIN bye_krah 
				SAY ~Und nun muss ich nach einer Möglichkeit suchen, die beiden Zepterstücke wieder zu vereinigen. Vielleicht werdet Ihr noch einmal gebraucht. Das muss aber mein Meister entscheiden. Bin mir sicher, wir sehen uns demnächst wieder. *Krah*! *Krah*!~
				IF ~~ THEN DO ~SetGlobal("AC#Raven_ACIL09Head","GLOBAL",2)
				EraseJournalEntry(@20025)
				AddJournalEntry(@20024,QUEST_DONE)  
				EscapeAreaObject("TrACIL09")
				~ EXIT
				END

IF ~Global("AC#XothaerinScepter","GLOBAL",1)~ THEN BEGIN hello_again_scepter
  SAY ~*Krah*! Ihr habt endlich das Zepter? *Krah*!~ 
  IF ~PartyHasItem("AC#ZEPXO")~ THEN REPLY ~Ist es das hier?~  + have_scepter
  IF ~!PartyHasItem("AC#ZEPXO")~ THEN REPLY ~Nein, noch nicht.~ + exit_no_scepter
END

	IF ~~ THEN BEGIN exit_no_scepter
	SAY ~Dann sucht weiter! Es sollte in der Höhle gleich hinter mir sein!~
	IF ~~ THEN EXIT 
	END

	IF ~~ THEN BEGIN have_scepter
	SAY ~Zeigt her! *Krah, krah*!~
	IF ~~ THEN DO ~/*TakePartyItem("AC#ZEPXO")*/
	SetGlobal("AC#XothaerinScepter","GLOBAL",2)
	SetGlobal("AC#Raven_NPC","ACIL06",1)~ + only_handle
	END
	
		IF ~~ THEN BEGIN only_handle
		SAY ~Das ist ja nur der Griff! Wo ist der Rest?~
		IF ~~ THEN REPLY ~Das war alles, was sich in der Höhle finden ließ.~ GOTO thats_all
		IF ~~ THEN REPLY ~Woher soll ich das wissen? Mehr war nicht da.~ GOTO thats_all
		IF ~~ THEN REPLY ~Was ist eigentlich so besonders an diesem Zepter?~ GOTO what_kind_of_sceptre
		END
		
		IF ~~ THEN BEGIN what_kind_of_sceptre
		SAY ~Das weiß nur mein Meister. Und jetzt wird er wütend sein, weil ich nur mit diesem Griff zurückkehre!~
		IF ~~ THEN REPLY ~Wo könnte der Rest des Zepters zu finden sein?~ GOTO where_is_head
		END
		
		IF ~~ THEN BEGIN thats_all
		SAY ~Das war... alles? *Krah*! *Krah*! Oh weh! Mein Meister wird wütend sein! Mit diesem Griff alleine lässt sich nichts anfangen, gar nichts!~
		IF ~~ THEN REPLY ~Wo könnte der Rest des Zepters zu finden sein?~ GOTO where_is_head
		END
		
			IF ~~ THEN BEGIN where_is_head
			SAY ~Ich weiß es nicht. Wie schrecklich! Was soll ich nur tun!~
			IF ~~ THEN REPLY ~Kann ich Euch irgendwie weiterhelfen?~ GOTO keep_on_searching 
			IF ~~ THEN REPLY ~Das ist zum Glück nicht mehr mein Problem.~ GOTO notmycupoftea 
			END
			
			IF ~~ THEN BEGIN notmycupoftea
			SAY ~Doch, das ist es! Oder wollt Ihr von der Brücke springen und bis nach Keczulla schwimmen? Ich sage Euch erst, wie Ihr hier herauskommt, wenn ich das vollständige Zepter habe. Im Gegensatz zu Euch könnte *ich* nämlich von hier fortfliegen, wenn ich nicht den Zorn meines Meisters derart fürchten würde. Also sucht gefälligst nach dem verdammten Zepterkopf!~
			IF ~~ THEN GOTO keep_on_searching
			END
			
				IF ~~ THEN BEGIN keep_on_searching
				SAY ~Ich hab's im Gefieder, dass der Rest des Zepters hier irgendwo sein muss. Vielleicht draußen, vielleicht an der Brücke... sucht weiter, und ich sage Euch, wie Ihr schnell von diesem Ort wieder fortkommt.~
				IF ~~ THEN DO ~SetGlobal("AC#Raven_ACIL09Head","GLOBAL",1)
				EraseJournalEntry(@20021)
				AddJournalEntry(@20023,QUEST)  ~ EXIT 
				END
				
// go to mage
	
		IF ~~ THEN BEGIN to_master 
		SAY ~Ihr! <RACE>! Kommt mit zu meinem Herrn! Er wird weniger zornig sein, wenn Ihr mit dabei seid. Und wenn Ihr nach dem fehlenden Kopf des Zepters sucht, wird er Euch sicher reich entlohnen!~ 
		IF ~~ THEN REPLY ~Könnt Ihr mir den Ort auf der Karte zeigen?~  GOTO move_alone
		END
		
		IF ~~ THEN BEGIN move_alone 
  SAY ~*Krah, krah*! Unser Turm befindet sich nördlich von hier, in den Hamlar-Bergen am Fuße des Wolkengipfel-Gebirges. Mein Meister und ich werden dort auf Euch warten. Aber lasst Euch nicht zu lange Zeit...~
  IF ~~ THEN DO ~SetGlobal("AC#MeetAldym","GLOBAL",1)
SetGlobal("AC#_RavenPlotStart","GLOBAL",4)
EraseJournalEntry(@20021)
AddJournalEntry(@20022,QUEST_DONE)  
AddJournalEntry(@20040,QUEST)
RevealAreaOnMap("ACIL03")  
EscapeArea()
~ EXIT
END



IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0 
  SAY ~*Krah*! *Krah*!~ [AC#RAVSE]
  IF ~~ THEN + hello_0
END

	IF ~~ THEN BEGIN hello_0
	SAY ~*Krah*! Sind sie weg?~
	++ ~Ein sprechender Rabe?~ + talking_raven
	++ ~Meint Ihr mich?~ + talking_raven
	++ ~Wer ist weg?~ + highwaymen
	END
	
		IF ~~ THEN BEGIN talking_raven
		SAY ~*Krah*! In der Tat. Oder seht Ihr noch jemand anderen, der sich mit Euch unterhält? Also - sind sie weg?~
		IF ~~ THEN REPLY ~Wer ist weg?~ + highwaymen
		END
	
			IF ~~ THEN BEGIN highwaymen
			SAY ~Na, die Wegelagerer, die da draußen herumlungerten und wegen derer ich mich nicht mehr ins Freie traute!~
			++ ~Ja, sie sind weg.~ + gone
			++ ~Ich weiß es nicht.~ + gone
			END
	
				IF ~~ THEN BEGIN gone
				SAY ~Nun, das ist jetzt auch egal. He, Ihr könntet mir bei einer Angelegenheit helfen. Wo Ihr schon hier seid.~
				IF ~~ THEN GOTO dwarven_artifacts_02
				END
	
					IF ~~ THEN BEGIN dwarven_artifacts_02
					SAY ~Ihr scheint mir ein fähiger Abenteurer zu sein. Ich könnte Eure Hilfe gebrauchen. Beziehungsweise - mein Meister könnte Eure Hilfe gebrauchen.~
					++ ~Euer Meister?~ + familiar_01
					END
		
						IF ~~ THEN BEGIN familiar_01
						SAY ~Ja. *Krah* mein Meister ist ein mächtiger Magier.~
						IF ~~ THEN REPLY ~Ihr seid der Vertraute eines Magiers?~ + familiar_02
						IF ~~ THEN REPLY ~Seid Ihr auch ein verwandelter Lehrjunge?~ + melicamp_01
						END
						
							IF ~~ THEN BEGIN melicamp_01
							SAY ~Verwandelt? Wie meint Ihr das?~
							IF ~~ THEN REPLY ~Nichts für ungut. Fahrt fort. Euer Meister ist also ein Magier?~ + familiar_02
							IF ~~ THEN REPLY ~Nun, der letzte sprechende Vogel, dem ich begegnete, war ein Magierschüler, dessen Verwandlungszauber gründlich misslungen war.~ GOTO melicamp_02
							END
							
							IF ~~ THEN BEGIN melicamp_02
							SAY ~*Krahahaha!* Was für eine einfältige Geschichte. Nein, ich bin ein Rabe, und das bleibt auch so.~
							IF ~~ THEN REPLY ~Euer Meister ist also ein Magier?~ + familiar_02
							END
			
							IF ~~ THEN BEGIN familiar_02
							SAY ~Genau. Ich bin meines Meisters treuer Diener. Er hat mich losgeschickt, etwas aus dieser Gegend für ihn zu beschaffen. Nur jetzt komme ich nicht weiter. Da kommt Ihr mir wie gerufen!~
							++ ~Was soll ich für Euch tun?~ + help_raven_02
							END
				
								IF ~~ THEN BEGIN help_raven_02
								SAY ~Hört zu. Ich lungere hier nicht umsonst an diesem ungastlichen Ort herum. Mein Meister sucht ein zwergisches Artefakt, ein Zepter. Es befindet sich hier ganz in der Nähe, hinter mir in dieser Höhle. Leider kann ich das Zepter nicht erreichen, da es in einem kleinen Wasserbecken unter der Wasseroberfläche liegt. Aber Ihr könntet es mit Leichtigkeit greifen! Ihr geht die Höhle herunter und besorgt mir den Gegenstand. Im Gegenzug werde ich Euch für Eure Mühen entlohnen. Was sagt Ihr?~
								IF ~~ THEN REPLY ~In Ordnung. Das dürfte nicht so schwer sein.~ + accept
								IF ~~ THEN REPLY ~Ich weiß nicht, ob ich dazu Lust habe.~ + not_in_the_mood
								IF ~~ THEN REPLY ~Was bekomme ich dafür?~ + magpie
								END
								
									IF ~~ THEN BEGIN magpie
									SAY ~Beim spitzen Federkiel! Ihr seid ja gieriger als eine Elster! Über die Belohnung bestimme nicht ich, sondern mein Meister. Aber er ist sehr großzügig, das kann ich Euch sagen!~
									IF ~~ THEN REPLY ~In Ordnung. Das dürfte nicht so schwer sein.~ + accept
									++ ~Ich weiß nicht...~ + not_in_the_mood_02
									END
								
									IF ~~ THEN BEGIN not_in_the_mood
									SAY ~Ihr müsst ja nicht den Helden spielen. Geht herein, holt das Zepter, kommt wieder heraus.~
									=
									~Der Eingang ist gleich hinter mir! Ihr müsst durch eine kleine Höhle hinunter in einen verfallenen Schrein irgendeiner Zwergengottheit hinabsteigen. Sucht im Wasser nach dem Zepter. Wenn Ihr es habt, bringt es zu mir.~
									++ ~Das klingt einfach.~ + retrieve_scepter
									++ ~Ich weiß nicht...~ + not_in_the_mood_02
									END
					
									IF ~~ THEN BEGIN accept
									SAY ~Sehr gut! Der Höhleneingang ist gleich hinter mir. Ihr müsst durch eine kleine Höhle hinunter in einen verfallenen Schrein irgendeiner Zwergengottheit hinabsteigen. Sucht im Wasser nach dem Zepter. Wenn Ihr es habt, bringt es zu mir.~
									++ ~Bin gleich zurück.~ + retrieve_scepter
									END
						
								IF ~~ THEN BEGIN not_in_the_mood_02
								SAY ~Ich schon. Habt Ihr Euch schon einmal gefragt, wie Ihr Euren Weg draußen fortsetzen wollt, jetzt, da der Weg versperrt ist? Ich kenne einen Fluchtweg aus diesem un*kräh*lichen Ort. Husch, husch! Auf zur Höhle. Ich werde hier auf Euch warten.~
								IF ~~ THEN DO ~SetGlobal("AC#XothaerinScepter","GLOBAL",1)	
								AddJournalEntry(@20020,QUEST)
								~ EXIT
								END	
								
								IF ~~ THEN BEGIN retrieve_scepter
								SAY ~*Krah*! Abgemacht! Ich werde hier auf Euch warten.~
								IF ~~ THEN DO ~SetGlobal("AC#XothaerinScepter","GLOBAL",1)	
								AddJournalEntry(@20020,QUEST)
								~ EXIT
								END	
/*
// Raven in Area ACIL06 (Axe Bridge)

BEGIN ~AC#RAVE1~



IF ~Global("AC#XothaerinScepter","GLOBAL",1)~ THEN BEGIN hello_again_scepter
  SAY ~*Krah*! Ihr habt endlich das Zepter? *Krah*!~ 
  IF ~PartyHasItem("AC#ZEPXO")~ THEN REPLY ~Ist es das hier?~  + have_scepter
  IF ~!PartyHasItem("AC#ZEPXO")~ THEN REPLY ~Nein, noch nicht.~ + exit_no_scepter
END

	IF ~~ THEN BEGIN exit_no_scepter
	SAY ~Dann sucht weiter! Es sollte in einer Höhle westlich der Brücke sein!~
	IF ~~ THEN EXIT 
	END

	IF ~~ THEN BEGIN have_scepter
	SAY ~Zeigt her!~
	IF ~~ THEN DO ~TakePartyItem("AC#ZEPXO")
	SetGlobal("AC#XothaerinScepter","GLOBAL",2)
	SetGlobal("AC#Raven_NPC","ACIL06",1)~ + only_handle
	END
	
		IF ~~ THEN BEGIN only_handle
		SAY ~Das ist ja nur der Griff! Wo ist der Rest?~
		IF ~~ THEN REPLY ~Das war alles, was sich in der Höhle finden ließ.~ GOTO thats_all
		IF ~~ THEN REPLY ~Woher soll ich das wissen? Mehr war nicht da.~ GOTO thats_all
		IF ~~ THEN REPLY ~Was ist eigentlich so besonders an diesem Zepter?~ GOTO what_kind_of_sceptre
		END
		
		IF ~~ THEN BEGIN what_kind_of_sceptre
		SAY ~Das weiß nur mein Meister. Und jetzt wird er wütend sein, weil ich nur mit diesem Griff zurückkehre!~
		IF ~~ THEN REPLY ~Wo könnte der Rest des Zepters zu finden sein?~ GOTO where_is_head
		END
		
		IF ~~ THEN BEGIN thats_all
		SAY ~Das war... alles? *Krah*! *Krah*! Oh weh! Mein Meister wird wütend sein! Mit diesem Griff alleine lässt sich nichts anfangen, gar nichts!~
		IF ~~ THEN REPLY ~Wo könnte der Rest des Zepters zu finden sein?~ GOTO where_is_head
		END
		
			IF ~~ THEN BEGIN where_is_head
			SAY ~Ich weiß es nicht. Wie schrecklich! Was soll ich nur tun!~
			IF ~~ THEN REPLY ~Kann ich Euch irgendwie weiterhelfen?~ GOTO bye_alone_to_master // new version: raven leaves alone
			IF ~~ THEN REPLY ~Das ist zum Glück nicht mehr mein Problem.~ GOTO bye_alone_to_master // new version: raven leaves alone
			IF ~Global("AC#RavenQuest#04","GLOBAL",2)~ THEN GOTO to_master //PCs have to go to mage
			END

				IF ~~ THEN BEGIN bye_alone_to_master 
				SAY ~*Krah, krah*! Ich werde zum Meister zurückkehren und ihm von meinem Scheitern berichten müssen... oh weh, oh weh!~
				IF ~~ THEN REPLY ~He! Was wird aus meiner Belohnung?~ GOTO bye_krah
				IF ~~ THEN REPLY ~Sicher, dass ich nicht noch helfen kann?~ GOTO bye_krah
				END
  
				IF ~~ THEN BEGIN bye_krah 
				SAY ~Ein anderes Mal, vielleicht! *Krah*! *Krah*!~
				IF ~~ THEN DO ~SetGlobal("AC#_RavenPlotStart","GLOBAL",4)
				EraseJournalEntry(@20021)
				AddJournalEntry(@20022,QUEST_DONE)  
				EscapeArea()
				~ EXIT
				END
// go to mage
	
		IF ~~ THEN BEGIN to_master 
		SAY ~Ihr! <RACE>! Kommt mit zu meinem Herrn! Er wird weniger zornig sein, wenn Ihr mit dabei seid. Und wenn Ihr nach dem fehlenden Kopf des Zepters sucht, wird er Euch sicher reich entlohnen!~ 
		IF ~~ THEN REPLY ~Könnt Ihr mir den Ort auf der Karte zeigen?~  GOTO move_alone
		END
		
		IF ~~ THEN BEGIN move_alone 
  SAY ~*Krah, krah*! Unser Turm befindet sich nördlich von hier, in den Hamlar-Bergen am Fuße des Wolkengipfel-Gebirges. Mein Meister und ich werden dort auf Euch warten. Aber lasst Euch nicht zu lange Zeit...~
  IF ~~ THEN DO ~SetGlobal("AC#MeetAldym","GLOBAL",1)
SetGlobal("AC#_RavenPlotStart","GLOBAL",4)
EraseJournalEntry(@20021)
AddJournalEntry(@20022,QUEST_DONE)  
AddJournalEntry(@20040,QUEST)
RevealAreaOnMap("ACIL03")  
EscapeArea()
~ EXIT
END



IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0 
  SAY ~*Krah*! *Krah*!~ 
  IF ~~ THEN + hello_0
END

	IF ~~ THEN BEGIN hello_0
	SAY ~*Krah*! Seid gegrüßt, <RACE>!~
	++ ~Ein sprechender Rabe?~ + talking_raven
	++ ~Meint Ihr mich?~ + talking_raven
	END
	
		IF ~~ THEN BEGIN talking_raven
		SAY ~*Krah*! In der Tat. Oder seht Ihr noch jemand anderen, der sich mit Euch unterhält?~
		IF ~~ THEN + search_for_artifacts
		END
	
			IF ~~ THEN BEGIN search_for_artifacts
			SAY ~Ihr seid auf der Suche nach den Hinterlassenschaften der Zwerge, nicht wahr?~
			++ ~Wie kommt Ihr darauf?~ + dwarven_artifacts_01
			END
	
				IF ~~ THEN BEGIN dwarven_artifacts_01
				SAY ~Na, Ihr spaziert gerade aus einer der alten Zwergenhöhlen mit einer Runentafel in der Hand. Das hat mein Interesse geweckt.~
				++ ~Ihr interessiert Euch für diese Runentafel?~ + dwarven_artifacts_02
				END
	
					IF ~~ THEN BEGIN dwarven_artifacts_02
					SAY ~Dafür? Nein. Aber Ihr scheint mir ein fähiger Abenteurer zu sein. Ich könnte Eure Hilfe gebrauchen. Beziehungsweise - mein Meister könnte Eure Hilfe gebrauchen.~
					++ ~Euer Meister?~ + familiar_01
					END
		
						IF ~~ THEN BEGIN familiar_01
						SAY ~Ja. *Krah* mein Meister ist ein mächtiger Magier.~
						IF ~~ THEN REPLY ~Ihr seid der Vertraute eines Magiers?~ + familiar_02
						IF ~~ THEN REPLY ~Seid Ihr auch ein verwandelter Lehrjunge?~ + melicamp_01
						END
						
							IF ~~ THEN BEGIN melicamp_01
							SAY ~Verwandelt? Wie meint Ihr das?~
							IF ~~ THEN REPLY ~Nichts für ungut. Fahrt fort. Euer Meister ist also ein Magier?~ + familiar_02
							IF ~~ THEN REPLY ~Nun, der letzte sprechende Vogel, dem ich begegnete, war ein Magierschüler, dessen Verwandlungszauber gründlich misslungen war.~ GOTO melicamp_02
							END
							
							IF ~~ THEN BEGIN melicamp_02
							SAY ~*Krahahaha!* Was für eine einfältige Geschichte. Nein, ich bin ein Rabe, und das bleibt auch so.~
							IF ~~ THEN REPLY ~Euer Meister ist also ein Magier?~ + familiar_02
							END
			
							IF ~~ THEN BEGIN familiar_02
							SAY ~Genau. Ich bin meines Meisters treuer Diener. Er hat mich losgeschickt, etwas aus dieser Gegend für ihn zu beschaffen. Nur jetzt komme ich nicht weiter. Da kommt Ihr mir wie gerufen!~
							++ ~Was soll ich für Euch tun?~ + help_raven_02
							END
				
								IF ~~ THEN BEGIN help_raven_02
								SAY ~Hört zu. Ich lungere hier nicht umsonst an diesem ungastlichen Ort herum. Mein Meister sucht ein zwergisches Artefakt, ein Zepter. Es befindet sich hier ganz in der Nähe, am westlichen Rand der Brücke in einer Höhle. Leider kann ich das Zepter nicht erreichen, da es in einem kleinen Wasserbecken unter der Wasseroberfläche liegt. Aber Ihr könntet es mit Leichtigkeit greifen! Ihr geht in die Höhle und besorgt mir den Gegenstand. Im Gegenzug werde ich Euch für Eure Mühen entlohnen. Was sagt Ihr?~
								IF ~~ THEN REPLY ~In Ordnung. Das dürfte nicht so schwer sein.~ + accept
								IF ~~ THEN REPLY ~Ich weiß nicht, ob ich dazu Lust habe.~ + not_in_the_mood
								IF ~~ THEN REPLY ~Was bekomme ich dafür?~ + magpie
								END
								
									IF ~~ THEN BEGIN magpie
									SAY ~Beim spitzen Federkiel! Ihr seid ja gieriger als eine Elster! Über die Belohnung bestimme nicht ich, sondern mein Meister. Aber er ist sehr großzügig, das kann ich Euch sagen!~
									IF ~~ THEN REPLY ~In Ordnung. Das dürfte nicht so schwer sein.~ + accept
									++ ~Ich weiß nicht...~ + not_in_the_mood_02
									END
								
									IF ~~ THEN BEGIN not_in_the_mood
									SAY ~Ihr müsst ja nicht den Helden spielen. Geht herein, holt das Zepter, kommt wieder heraus.~
									=
									~Der Höhleneingang ist gleich auf der anderen Seite der Brücke, hinter einigen Pflanzen verborgen. Er ist leicht zu übersehen, deshalb seht genau hin! Ihr müsst durch eine kleine Höhle hinunter in einen verfallenen Schrein irgendeiner Zwergengottheit hinabsteigen. Sucht im Wasser nach dem Zepter. Wenn Ihr es habt, bringt es zu mir.~
									++ ~Das klingt einfach.~ + retrieve_scepter
									++ ~Ich weiß nicht...~ + not_in_the_mood_02
									END
					
									IF ~~ THEN BEGIN accept
									SAY ~Sehr gut! Der Höhleneingang ist gleich auf der anderen Seite der Brücke, hinter einigen Pflanzen verborgen. Er ist leicht zu übersehen, deshalb seht genau hin! Ihr müsst durch eine kleine Höhle hinunter in einen verfallenen Schrein irgendeiner Zwergengottheit hinabsteigen. Sucht im Wasser nach dem Zepter. Wenn Ihr es habt, bringt es zu mir.~
									++ ~Bin gleich zurück.~ + retrieve_scepter
									END
						
								IF ~~ THEN BEGIN not_in_the_mood_02
								SAY ~Ich schon. Husch, husch! Auf zur Höhle. Ich werde hier auf Euch warten.~
								IF ~~ THEN DO ~SetGlobal("AC#XothaerinScepter","GLOBAL",1)	
								AddJournalEntry(@20020,QUEST)
								~ EXIT
								END	
								
								IF ~~ THEN BEGIN retrieve_scepter
								SAY ~*Krah*! Abgemacht! Ich werde hier auf Euch warten.~
								IF ~~ THEN DO ~SetGlobal("AC#XothaerinScepter","GLOBAL",1)	
								AddJournalEntry(@20020,QUEST)
								~ EXIT
								END								
*/

