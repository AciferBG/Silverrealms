// ---------------------------------------------
// ACIL0A-Dwarven Camp-Dialoge
// ---------------------------------------------
// Goblin Captain

BEGIN ~AC#0AGO1~

IF ~Global("GoblinTrap","ACIL0A",1)~ THEN BEGIN hello_trap_spun
SAY ~Hat geklappt! Falle zugeschnappt! Zwerge entwischt, aber jetzt bessere Beute. Schnappt die Großlinge!~
IF ~~ THEN DO ~Enemy()
SetGlobal("GoblinTrap","ACIL0A",15)~ EXIT
END

IF ~Global("GoblinTrap","ACIL0A",10)~ THEN BEGIN hello_trap_disarmed
SAY ~Hmm. Großlinge zu schlau für Falle! Nicht gut. Tötet sie!~
IF ~~ THEN DO ~Enemy()
SetGlobal("GoblinTrap","ACIL0A",19)~ EXIT
END


// Beldas
/*
BEGIN ~ac#dwf0a~

IF ~Global("Wait_for_sleep","ACIL0A",1)~ THEN BEGIN hello_02
SAY ~Nun, <CHARNAME>? Wollt Ihr Euch jetzt zu uns ans wärmende Feuer setzen?~
IF ~~ THEN REPLY ~Ich möchte mich hier erst noch ein wenig umsehen.~ + exit_01
IF ~~ THEN REPLY ~Aber gerne!~ + lets_talk_03
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_01
SAY ~*Mahal*, <CHARNAME>! Schön, dass Ihr zu uns stoßt! Ist das nicht eine herrliche Lichtung, auf der wir unser Lager errichtet haben? Bei Sharindlar, ich kann mich wahrlich nicht genug an der Schönheit der Oberwelt sattsehen!~
++ ~Es freut mich, dass Ihr so Gefallen an der Oberfläche findet. Wie geht es jetzt weiter?~ + whats_next
END

	IF ~~ THEN BEGIN whats_next 
	SAY ~Der Eingang zum Turboldberg ist gleich dahinten im Osten, hinter dem steinernen Tor. Leider ist der Weg noch verschüttet.~ 
	IF ~~ THEN REPLY ~Sollen wir ihn dann nicht schleunigst freiräumen?~ EXTERN ~ac#dwf2a~ clear_path
	END
	
	IF ~~ THEN BEGIN clear_path_02 
	SAY ~...allerdings nicht von Hand. Dazu bräuchten wir eine halbe Ewigkeit, selbst für einen Zwerg. Mit der Hilfe meines Gottes werde ich einen Zauber wirken, der das Geröll beiseite schaffen wird.~ 
	IF ~~ THEN REPLY ~Das könnt Ihr so einfach machen?~ + spell_wood
	IF ~~ THEN REPLY ~Eine gute Idee!~ + first_rest
	IF ~~ THEN REPLY ~Schön! Wann fangen wir an?~ + first_rest
	END
	
		IF ~~ THEN BEGIN spell_wood 
		SAY ~Ich bin mir sicher, bei Euch auf der Oberfläche gibt es auch Zauber, die es erlauben, Gewächs und Gestrüpp zu beeinflussen. Im Unterreich machen wir so etwas mit Fels und Gestein.~ 
		IF ~~ THEN REPLY ~Schön! Wann fangen wir an?~ + first_rest
		END
		
			IF ~~ THEN BEGIN first_rest 
			SAY ~Ich werde erst eine Weile ruhen und zu meinem Gott beten müssen, bevor ich den Zauber wirken kann. Morgen früh bei Tagesanbruch können wir dann mit dem Aufstieg beginnen.~ 
			IF ~~ THEN GOTO lets_talk
			END
			
				IF ~~ THEN BEGIN lets_talk 
				SAY ~Warum gesellt Ihr Euch nicht zu uns ans Feuer? Thradear hat mit seiner Wurfaxt ein feines Stück Wildbret erlegt. Jetzt haben wir Zeit, uns einmal näher kennenzulernen, <CHARNAME>!~ 
				IF ~~ THEN EXTERN ~ac#dwf3a~ spend_time_together
				END
				
					IF ~~ THEN BEGIN lets_talk_02 
					SAY ~Also was, <CHARNAME>? Leistet Ihr uns ein wenig Gesellschaft?~ 
					IF ~~ THEN REPLY ~Ich möchte mich hier erst noch ein wenig umsehen.~ + not_rest_yet
					IF ~~ THEN REPLY ~Aber gerne!~ + lets_talk_03
					END
					
					IF ~~ THEN BEGIN lets_talk_03 
					SAY ~Schön! Wisst Ihr, ich freue mich richtig, dass Ihr uns bei diesem Abenteuer begleitet. Los, Thradear, erzähl uns eine Geschichte!~ 
					IF ~~ THEN EXTERN ~ac#dwf3a~ tell_a_story_01
					END
					
					IF ~~ THEN BEGIN tell_a_story_03 
					SAY ~Aber ja! Was sagt Ihr, <CHARNAME>? Habt Ihr nicht Lust, uns über die Welt hier droben zu erzählen?~ 
					IF ~~ THEN REPLY ~Was genau möchtet Ihr wissen?~ + charname_story_01
					IF ~~ THEN REPLY ~Wenn ich es mir richtig überlege, würde ich gerne lieber gleich ruhen.~ + rest_fast_01
					END
					
						IF ~~ THEN BEGIN charname_story_01 
						SAY ~Ich würde gerne mehr über Kerzenburg erfahren. Wie war es, inmitten dieser Bibliothek aufzuwachsen?~ 
						IF ~~ THEN REPLY ~Wenn ich es mir richtig überlege, würde ich gerne lieber gleich ruhen.~ + rest_fast_01
						END

IF ~~ THEN BEGIN rest_fast_01
SAY ~Selbstverständlich. Wir werden morgen noch Gelegenheit zum Reden haben. Ruht Euch gut aus, Gormar und Thradear werden die Wache übernehmen.~
IF ~~ THEN DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("AC#0ACUT")
~ EXIT
END

IF ~~ THEN BEGIN not_rest_yet
SAY ~Wie Ihr wünscht, <CHARNAME>.~
IF ~~ THEN DO ~SetGlobal("Wait_for_sleep","ACIL0A",1)~ EXIT
END

IF ~~ THEN BEGIN exit_01
SAY ~Wie Ihr wollt.~
IF ~~ THEN DO ~~ EXIT
END

// Gormar

BEGIN ~ac#dwf2a~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello
SAY ~Seid gegrüßt, <CHARNAME>. Beldas möchte mit Euch sprechen.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN clear_path 
SAY ~Das haben wir auch vor, <GIRLBOY>.~ 
IF ~~ THEN EXTERN ~ac#dwf0a~ clear_path_02
END

IF ~~ THEN BEGIN tell_a_story_02 
SAY ~Warum fragen wir nicht <CHARNAME>, ob er uns etwas erzählen möchte?~ 
IF ~~ THEN EXTERN ~ac#dwf0a~ tell_a_story_03
END
			
// Thradear

BEGIN ~ac#dwf3a~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello
SAY ~Hmpf. Diese ganzen Bäume hier sind nicht nach meinem Geschmack. Wenn Ihr etwas wollt, redet mit Beldas.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN spend_time_together 
SAY ~...und schließlich werden wir auf dem Weg durchs Unterreich eine Menge Zeit zusammen verbringen müssen.~ 
IF ~~ THEN EXTERN ~ac#dwf0a~ lets_talk_02
END

IF ~~ THEN BEGIN tell_a_story_01 
SAY ~Mir fällt grad' keine ein.~ 
IF ~~ THEN EXTERN ~ac#dwf2a~ tell_a_story_02
END
*/

// Larkonlan; Cult of the dragon leader, equipped with chlorazor
/*
BEGIN ~ac#s#cd1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_dagger
  SAY ~Endlich haben wir Euch gefunden! Ihr besitzt einer der weiteren Dolche! Gebt ihn uns!~ 
  IF ~PartyHasItem("AC#S#ON1")~ THEN REPLY ~Meint Ihr diesen Roten Dolch hier?~  + have_dagger
  IF ~!PartyHasItem("AC#S#ON1")~ THEN REPLY ~Also, wenn wir von *dem* Dolch reden - nein, den habe ich nicht mehr.~ + what_dagger
  IF ~~ THEN REPLY ~Von was für einem Dolch redet Ihr da?~ + what_dagger
END

		IF ~~ THEN BEGIN what_dagger 
		SAY ~Ihr wisst genau von welchem Dolch wir reden - der Roten Klinge, einem der fünf Drachendolche!~ 
		IF ~!PartyHasItem("AC#S#ON1")~ THEN REPLY ~Ihr mögt vielleicht schwer von Begriff sein, ich für meinen Teil habe sofort verstanden, worum es Euch geht. Ich habe den Dolch, den Ihr sucht, nicht mehr.~ + no_dagger_02
		IF ~PartyHasItem("AC#S#ON1")~ THEN REPLY ~Ja, den besitze ich.~  + have_dagger
		IF ~~ THEN REPLY ~Bei Beshaba! Es gibt fünf von diesen Dingern?~  + five_daggers
		END
		
			IF ~~ THEN BEGIN five_daggers 
			SAY ~Selbstverständlich existieren fünf Dolche, sie sind ja auch den großen Drachenarten nachempfunden. Ihr habt einen davon, den Roten Dolch, den werdet Ihr mir nun gleich geben!~ 
			++ ~Die Dolche sind den Drachenarten nachempfunden? Was meint Ihr damit?~ + dragon_race
			IF ~!PartyHasItem("AC#S#ON1")~ THEN REPLY ~Ich habe den Dolch, den Ihr sucht, nicht mehr.~ + no_dagger_02
			IF ~PartyHasItem("AC#S#ON1")~ THEN REPLY ~Ja, den besitze ich. Allerdings nur leihweise.~  + have_dagger
			END
			
				IF ~~ THEN BEGIN dragon_race 
				SAY ~So, wie es fünf verschiedenfarbige Drachen gibt - rote, schwarze, grüne, blaue und weiße - so gibt es auch fünf Dolche in der Farbe. Aber jetzt genug des langen Geredes! Gebt mir den roten Dolch!~ 
				IF ~!PartyHasItem("AC#S#ON1")~ THEN REPLY ~Ich habe den Dolch, den Ihr sucht, nicht mehr.~ + no_dagger_02
				IF ~PartyHasItem("AC#S#ON1")~ THEN REPLY ~Ja, den besitze ich. Allerdings nur leihweise.~  + have_dagger
				END
		
		IF ~~ THEN BEGIN have_dagger 
		SAY ~Immerhin seid Ihr ehrlich. Los, gebt mir den Dolch!~ 
		IF ~~ THEN REPLY ~Mit diesem Ton erreicht Ihr bei mir gar nichts.~  + not_give_dagger
		IF ~~ THEN REPLY ~Seht, ich habe gerade ein paar gute Freunde im Kampf verloren und bin wirklich schlecht gelaunt. Es würde nicht gut für Euch ausgehen, wenn Ihr weiter so mit mir redet.~  + not_give_dagger
		END
		
	IF ~~ THEN BEGIN not_give_dagger
	SAY ~Dann werden wir uns den Dolch eben von Eurer Leiche holen!~
	IF ~~ THEN DO ~Enemy()
	SetGlobal("AC#S#CultofDragonQuest","GLOBAL",1)~ EXIT
	END

		IF ~~ THEN BEGIN no_dagger_02 
		SAY ~Ihr habt ihn nicht mehr? Wem habt Ihr ihn gegeben?~ 
		IF ~~ THEN REPLY ~Das geht Euch nichts an.~ + bribe_01
		IF ~~ THEN REPLY ~Was wäre Euch diese Information wert?~ + bribe_01
		IF ~~ THEN REPLY ~Einem Magier in den Hügeln nördlich von Athkalta.~ + mage_tower_01
		END
		
			IF ~~ THEN BEGIN mage_tower_01 
			SAY ~Geht es vielleicht noch etwas genauer?~ 
			IF ~~ THEN REPLY ~Das geht Euch nichts an.~ + bribe_01
			IF ~~ THEN REPLY ~Was wäre Euch diese Information wert?~ + bribe_01
			IF ~~ THEN REPLY ~(Ihm Eure Karte zeigen und den Weg zum Magierturm erklären.)~ DO ~RevealAreaOnMap("ACIL08")
			HideAreaOnMap("ACIL03")~ + mage_tower_02
			END
	
	IF ~~ THEN BEGIN mage_tower_02
	SAY ~Habt Dank. Ihr habt Euch heute mächtige Freunde gemacht. Los, statten wir diesem Magier einmal einen Besuch ab!~
	IF ~~ THEN DO ~SetGlobal("AC#S#CultofDragonQuest","GLOBAL",1)
	SetGlobal("AC#S#told_CotD_tower","GLOBAL",1)
	ActionOverride("ac#s#cd2",EscapeArea())
	ActionOverride("ac#s#cd2",EscapeArea())
	EscapeArea()~ EXIT
	END
	
	IF ~~ THEN BEGIN bribe_01
	SAY ~Ich bin wahrlich nicht in der Stimmung, mich mit Euch lange aufzuhalten. Da Ihr mir nicht länger von Nutzen seid, werde ich Euch einen qualvollen Tod schenken!~
	IF ~~ THEN DO ~Enemy()
	SetGlobal("AC#S#CultofDragonQuest","GLOBAL",1)~ EXIT
	END
*/	
/*******************************************************************************************************
NPC-Dialoge
*******************************************************************************************************/

