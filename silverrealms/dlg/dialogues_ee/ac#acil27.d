

// ---------------------------------------------
// Bresk Steinschulter
// ---------------------------------------------

BEGIN ~AC#BRES8~

IF ~NumTimesTalkedToGT(0)~ THEN BEGIN hello_ready
	SAY ~Also was ist, <CHARNAME>, seid Ihr bereit für die große Fahrt?~
	IF ~~ THEN REPLY ~Noch nicht ganz. Lasst mich noch einen kurzen Moment verschnaufen und die Zauber vorbereiten, bevor es los geht.~ + bresk_wait
	IF ~PartyHasItem("AC#DROHE")~ THEN REPLY ~Ich trage hier immer noch den Kopf der Drow-Priesterin mit mir herum, den Ihr haben wolltet.~ GOTO drow_quest_yes_finished
	IF ~~ THEN REPLY ~Ja, lassen wir es beginnen.~ EXTERN ~AC#SORN8~ chain_lets_go
END

		IF ~~ THEN BEGIN drow_quest_yes_finished
		SAY ~Oh! Das hatte ich schon fast wieder vergessen. Zeigt einmal her...~
		IF ~~ THEN DO ~TakePartyItem("AC#DROHE")
		DestroyItem("AC#DROHE")~ GOTO drow_quest_yes_finished_02
		END
		
			IF ~~ THEN BEGIN drow_quest_yes_finished_02
			SAY ~Gut gemacht! Was für hässliche Dinger diese Drow doch sind, mit ihren großen Augen, langen Nasen und wenig Haaren.~
			=
			~Also gut, hier ist Eure wohlverdiente Belohnung. Hat Spaß gemacht, mit Euch zusammenzuarbeiten!~
			IF ~~ THEN DO ~SetGlobal("AC#BreskDrowPriestess","GLOBAL",10)
			GiveItemCreate("MISC43",Player1,3,0,0)~ GOTO endlich_fertig
			END
			
				IF ~~ THEN BEGIN endlich_fertig
				SAY ~Nachdem das geklärt ist - seid Ihr bereit für die große Fahrt?~
				IF ~~ THEN REPLY ~Noch nicht ganz. Lasst mich noch einen kurzen Moment verschnaufen und die Zauber vorbereiten, bevor es los geht.~ + bresk_wait				
				IF ~~ THEN REPLY ~Ja, lassen wir es beginnen.~ EXTERN ~AC#SORN8~ chain_lets_go
				END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN bresk_good_catch
  SAY ~Na, da habt Ihr ja einiges Getier an Land gezogen!~
  IF ~~ THEN REPLY ~Ihr meint diese Kuo-Toa?~ DO ~EraseJournalEntry(@62043)~ GOTO kuotoa_catch
END

	IF ~~ THEN BEGIN kuotoa_catch
		SAY ~Diese Fischgesichter sind wirklich lästige Kreaturen. Respekt, wie Ihr die zur Strecke gebracht habt.~
	  IF ~~ THEN EXTERN ~AC#ELER8~ chain_prepare_boats
	END
	
		IF ~~ THEN BEGIN bresk_enough
		  SAY ~Genug jetzt! Wir sollten an diesem Ort nicht länger als nötig verweilen.~
		  IF ~~ THEN REPLY ~Wo sind denn die Boote?~ GOTO chain_where_are_the_boats
		END
	
			IF ~~ THEN BEGIN bresk_enough_02
			  SAY ~Das bringt doch alles nichts, Freunde! Soll doch die Goldgarde mit reisen, die werden sich schon früh genug vor Angst ins Hemd machen. Was ist mit Euch, <CHARNAME>? Habt Ihr auch Angst?~
			  IF ~~ THEN REPLY ~Wovor sollte ich denn Angst haben?~ GOTO not_afraid
			  IF ~~ THEN REPLY ~Außer, dass ich noch niemals zuvor mit einem Boot über einen unterirdischen See gefahren bin, ist alles in Ordnung.~ GOTO a_little_afraid
			  IF ~~ THEN REPLY ~Mein Wams ist jetzt schon gestrichen voll.~ GOTO very_afraid
			END
			
				IF ~~ THEN BEGIN not_afraid
				SAY ~Seht Ihr? Ich wusste es! <CHARNAME> gefällt mir mit jedem <PRO_HISHER> Sätze besser!~
				IF ~~ THEN REPLY ~Danke. Wir sollten die Boote zu Wasser lassen.~ GOTO build_the_boats
				END
				
				IF ~~ THEN BEGIN a_little_afraid
				SAY ~Das sind wir alle nicht. Aber jetzt ist keine Zeit, sich in die Hosen zu machen.~
				IF ~~ THEN REPLY ~Richtig. Wir sollten stattdessen die Boote zu Wasser lassen.~ GOTO build_the_boats
				END
				
				IF ~~ THEN BEGIN very_afraid
				SAY ~Ha! Na, dann hoffe ich, dass Sorni das zusätzliche Gewicht bei der Konstruktion der Boote mit eingerechnet hat und ihr nicht inmitten Eurer eigenen Pisse untergeht.~
				IF ~~ THEN REPLY ~Das ist ein gutes Stichwort. Wir sollten die Boote zu Wasser lassen.~ GOTO build_the_boats
				END
				
					IF ~~ THEN BEGIN build_the_boats
					SAY ~Wahr gesprochen, <CHARNAME>! Wohlan, Bootsschmiede, zeigt einmal, was Ihr könnt!~
					IF ~~ THEN DO ~SetGlobal("AC#RC_Sorni_Fourth","GLOBAL",10)~ EXIT
					END
					
						IF ~~ THEN BEGIN two_boats
						SAY ~Und unsere Schmiedemeisterin hat gleich zwei Boote geschmiedet! Na, was sagt Ihr, <CHARNAME>?~
						IF ~~ THEN REPLY ~Ähm. Die sehen ein wenig klein aus.~ EXTERN ~AC#SORN8~ looks_too_small
						IF ~~ THEN REPLY ~Die sehen großartig aus!~ EXTERN ~AC#SORN8~ looks_awesome
						END

					IF ~~ THEN BEGIN bresk_wait
					SAY ~Na gut. Ruht Euch aus, bereitet Euch vor - wir werden hier über Euch wachen!~
					IF ~~ THEN DO ~~ EXIT
					END




// ---------------------------------------------
// Elern Abgrundlied
// ---------------------------------------------

BEGIN ~AC#ELER8~

IF ~True()~ THEN BEGIN hello_ready
	SAY ~Also was ist, <CHARNAME>, seid Ihr bereit für die große Fahrt?~
	IF ~~ THEN REPLY ~Noch nicht ganz. Lasst mich noch einen kurzen Moment verschnaufen und die Zauber vorbereiten, bevor es los geht.~ EXTERN ~AC#BRES8~ bresk_wait
	IF ~~ THEN REPLY ~Ja, lassen wir es beginnen.~ EXTERN ~AC#SORN8~ chain_lets_go
END

// ---------------------------------------------
// Hathar
// ---------------------------------------------

BEGIN ~AC#HATH8~

IF ~Global("AC#Ruvan_Treason","GLOBAL",0)~ THEN BEGIN hello_ready
	SAY ~Also was ist, <CHARNAME>, seid Ihr bereit für die große Fahrt?~
	IF ~~ THEN REPLY ~Noch nicht ganz. Lasst mich noch einen kurzen Moment verschnaufen und die Zauber vorbereiten, bevor es los geht.~ EXTERN ~AC#BRES8~ bresk_wait
	IF ~~ THEN REPLY ~Ja, lassen wir es beginnen.~ EXTERN ~AC#SORN8~ chain_lets_go
END

		IF ~~ THEN BEGIN cowards_did_not_help
		SAY ~Das sind schlimme Nachrichten. Ich werde meinen Bruder informieren, damit er den Rat davon in Kenntnis setzen kann.~
		IF ~~ THEN REPLY ~Nicht nötig, Hathar. Das kann ich auch gerne selbst übernehmen.~ + hathar_charname
		END
		
			IF ~~ THEN BEGIN hathar_charname
			SAY ~<CHARNAME>? Ich dachte, Ihr wäret tot?~
			IF ~~ THEN REPLY ~Das würden sich manch andere wohl gerne wünschen.~ EXTERN ~AC#27DW3~ chain_impossible
			END
			
				IF ~~ THEN BEGIN bunch_of_liars
				SAY ~Ich würde eher sagen, Ihr seid ein Haufen Lügner, oder was meint Ihr dazu, <CHARNAME>?~
				IF ~~ THEN REPLY ~Sie haben mich einfach zurückgelassen. Als ich meine Aufgabe erfüllt hatte, waren sie mitsamt der Boote weg.~ + abgekartetes_spiel
				END
				
					IF ~~ THEN BEGIN abgekartetes_spiel
					SAY ~Also wenn Ihr mich fragt, sieht das alles nach einem abgekarteten Spiel aus!~
					IF ~~ THEN EXTERN ~AC#27DW3~ n_no_1
					END
					
					IF ~~ THEN BEGIN only_orders
					SAY ~Hab' ich mir's doch gedacht! Daher weht der Wind! Und ich weiß auch schon, wer im Hintergrund die Strippen zieht!~
					IF ~~ THEN REPLY ~Ruvan, Euer Onkel?~ + uncle_ruvan
					END
				
					IF ~~ THEN BEGIN uncle_ruvan
					SAY ~Ja, genau! Wir müssen schleunigst vor den Rat, denn ich könnte mir vorstellen, dass diese feige Spinne schon weiter ihre Fäden spinnt!~
					=
					~Legt Eure Waffen nieder und kommt mit uns, Ihr feiger Abschaum von Duergarscheiße! Und seid froh, dass ich <CHARNAME> nicht gestatte, Euch hier gleich einen Kopf kürzer zu machen!~
					IF ~~ THEN EXTERN ~AC#27DW3~ y_y_yes_01
					END
					
					IF ~~ THEN BEGIN whats_with_you
					SAY ~Ich nehme die Jammerlappen mit in die Bronzemaske. Ihr solltet wie gesagt schnell vor den Rat treten. Wollt Ihr uns begleiten oder alleine nach Iltkazar vorrücken?~
					IF ~~ THEN REPLY ~Ich komme schon alleine zurecht.~ + go_alone
					END
					
						IF ~~ THEN BEGIN go_alone
						SAY ~Gut. Los, Abmarsch, Männer, und dass Ihr mir keine Faxen macht!~
						IF ~~ THEN DO ~SetGlobal("AC#Ruvan_Treason","GLOBAL",2)
						ActionOverride("AC#27DW1",EscapeAreaObject("TrACIL20"))
						ActionOverride("AC#27DW2",EscapeAreaObject("TrACIL20"))
						 ActionOverride("AC#27DW3",DropItem("SPER01",[-1.-1]))
						 ActionOverride("AC#27DW4",DropItem("SPER01",[-1.-1]))
						 ActionOverride("AC#27DW5",DropItem("SPER01",[-1.-1]))
						ActionOverride("AC#27DW3",EscapeAreaObject("TrACIL20"))
						ActionOverride("AC#27DW4",EscapeAreaObject("TrACIL20"))
						ActionOverride("AC#27DW5",EscapeAreaObject("TrACIL20"))						
						Wait(1)
						ActionOverride("AC#HATH8",EscapeAreaObject("TrACIL20"))
						~ EXIT
						END

// ---------------------------------------------
// Sorni
// ---------------------------------------------

BEGIN ~AC#SORN8~

IF ~NumTimesTalkedToGT(0)~ THEN BEGIN hello_ready
	SAY ~Also was ist, <CHARNAME>, seid Ihr bereit für die große Fahrt?~
	IF ~~ THEN REPLY ~Noch nicht ganz. Lasst mich noch einen kurzen Moment verschnaufen und die Zauber vorbereiten, bevor es los geht.~ EXTERN ~AC#BRES8~ bresk_wait
	IF ~~ THEN REPLY ~Ja, lassen wir es beginnen.~ + chain_lets_go
END
		
IF ~NumTimesTalkedTo(0)~ THEN BEGIN sorni_looks_good
  SAY ~Na, das sieht ja schonmal gut aus!~
  IF ~~ THEN  GOTO chain_sorni_is_there
END

	IF ~~ THEN BEGIN looks_too_small
	SAY ~Ihr sollt auch nicht darauf herumhampeln! Größere Boote gibt's nicht. Entweder Ihr nehmt die, oder Ihr müsst schwimmen.~
	IF ~~ THEN DO ~~ + mushroom_trunk
	END
	
	IF ~~ THEN BEGIN looks_awesome
	SAY ~Danke! War mal was völlig anderes als ständig diese Waffen und Rüstungen.~
	IF ~~ THEN DO ~~ + mushroom_trunk
	END
	
		IF ~~ THEN BEGIN mushroom_trunk
		SAY ~Ich habe sie innen extra mit Pilz-Stämmen auskleiden lassen, damit Ihr keine nassen Füße bekommt. Also was ist, <CHARNAME>, seid Ihr bereit für die große Fahrt?~
		IF ~~ THEN REPLY ~Noch nicht ganz. Lasst mich noch einen kurzen Moment verschnaufen und die Zauber vorbereiten, bevor es los geht.~ EXTERN ~AC#BRES8~ bresk_wait
		IF ~~ THEN REPLY ~Ja, lassen wir es beginnen.~ + chain_lets_go
		END
		
			IF ~~ THEN BEGIN step_on_boat
			SAY ~Es geht los, Männer!~
			IF ~~ THEN REPLY ~Ich danke Euch allen. Ich werde Euch nicht enttäuschen.~ GOTO step_on_boat_02
			END
			
			IF ~~ THEN BEGIN step_on_boat_02
			SAY ~Steigt einfach in das Eine der zwei Boote, <CHARNAME>. Wir werden Euch dann zu Wasser lassen und auf den See hinausschieben.~
			IF ~~ THEN DO ~EraseJournalEntry(@62043)
			AddJournalEntry(@62044,QUEST)
			SetGlobal("AC#RC_Sorni_Fourth","GLOBAL",12)~ EXIT
			END
		

// ---------------------------------------------
// Boatsmith
// ---------------------------------------------
BEGIN ~AC#27BSM~

// ---------------------------------------------
// Ruvan's Houseguard
// ---------------------------------------------
BEGIN ~AC#27DW3~

IF ~~ THEN BEGIN n_no_1
SAY ~N-n-nein! Wir haben doch nur...~
IF ~~ THEN REPLY ~Ihr habt doch nur Eure Befehle ausgeführt, richtig?~ EXTERN ~AC#HATH8~ only_orders
END

IF ~~ THEN BEGIN y_y_yes_01
SAY ~J-j-ja, Hathar.~
IF ~~ THEN EXTERN ~AC#HATH8~ whats_with_you
END
//----------------------------------------
// CHAIN
// ---------------------------------------
CHAIN IF ~~ THEN AC#27DW3 chain_impossible
~Bei dem Hüter der Berge! D-d-das ist nicht...~
== AC#HATH8 ~Soso, Ihr habt mit eigenen Augen gesehen, wie <CHARNAME> gefallen ist?~
END
IF ~~ THEN EXTERN ~AC#HATH8~ bunch_of_liars

CHAIN IF ~~ THEN AC#ELER8 chain_prepare_boats
~Uh, was für ein garstiger Ort dies hier doch ist!~
== AC#HATH8 ~Elern, was macht Ihr denn hier?~
== AC#ELER8 ~Denkt Ihr, ich würde unsere Freunde von der Oberfläche hier so einfach im Stich lassen?~
== AC#HATH8 ~Nein, aber das ist doch viel zu gefährlich für eine...~
== AC#ELER8 ~Eine was?~
END
IF ~~ THEN EXTERN ~AC#BRES8~ bresk_enough

CHAIN IF ~~ THEN AC#BRES8 chain_where_are_the_boats
~Ja genau, was ist mit den Booten?~
== AC#27BSM ~Wir können die Boote jederzeit zusammenbauen, wenn alle bereit sind.~
== AC#HATH8 ~Schön, dass Sorni ein paar ihrer besten *telor* geschickt hat! Aber Bruder, sagt, was machen denn die *mulgvaldar* unseres Onkels hier bei uns?~
== AC#27DW3 ~Wir wurden vom Rat beauftragt, den <PRO_RACE> von der Oberfläche auf dem Weg über den See zu geleiten.~
== AC#HATH8 ~Macht Ihr Witze? Mit diesen Speeren wollt Ihr nach Barakuir reisen?~
== AC#27DW3 ~Mit den Speeren können wir Angriffe aus dem Wasser am Besten abwehren. Wir haben den Befehl des Rates, einen Weg nach Barakuir zu finden, aber keinen Fuß in diese unheilige Stadt zu setzen. Wir werden an den Ufern auf der anderen Seite warten, bis der <PRO_RACE> von der Oberfläche seinen Auftrag erfüllt hat und ihn dann wieder sicher zurück bringen.~
== AC#ELER8 ~Leider hat der Rat so entschieden, Hathar.~
== AC#HATH8 ~Wisst Ihr, was ich unserem Onkel das nächste Mal zeige, wenn ich ihn zu Gesicht bekomme, Bruder?~
END
IF ~~ THEN EXTERN ~AC#BRES8~ bresk_enough_02

CHAIN IF ~~ THEN AC#SORN8 chain_sorni_is_there
~Gute Arbeit, Männer!~
== AC#27BSM ~Danke, Herrin!~
== AC#HATH8 ~Sorni?~
== AC#BRES8 ~Was macht Ihr denn hier draußen?~
== AC#SORN8 ~Denkt Ihr, ich lasse mir diese Gelegenheit entgehen?~
== AC#ELER8 ~Schön, dass Ihr da seid, Sorni!~
== AC#BRES8 ~Aber es ist doch viel zu gefährlich! Ihr seid Schmiedin und keine Kriegerin!~
== AC#SORN8 ~Papperlapapp! Wisst Ihr, wieviel Kraft man braucht, um Adamantit zu schmieden? Da ist ein Drow-Schädel wie Rothé-Butter dagegen.~
END
IF ~~ THEN EXTERN ~AC#BRES8~ two_boats

CHAIN IF ~~ THEN AC#SORN8 chain_lets_go
~Viel Erfolg, <CHARNAME>! Wenn die Boote unterwegs sinken, werde ich beim nächsten Mal stabilere bauen. Moradin sei mit Euch!~
== AC#HATH8 ~Ich beneide Euch, <CHARNAME>. Schlagt für mich den Schädel eines besonders kräftigen Unholdes ein, in Ordnung?~
== AC#ELER8 ~Passt auf Euch auf, <CHARNAME>. Ich freue mich schon auf Eure Rückkehr!~
== AC#BRES8 ~Ich hätte nie gedacht, dass ich mich mal freue, einen <PRO_RACE> von der Oberfläche wiederzusehen. Möge Gorm seinen Blick nie von Euch abwenden.~
END
IF ~~ THEN EXTERN ~AC#SORN8~ step_on_boat

CHAIN IF ~NumTimesTalkedTo(1)
Global("AC#Ruvan_Treason","GLOBAL",1)~ THEN AC#HATH8 chain_pcs_are_missing
~Ihr kehrt alleine zurück! Was ist mit <CHARNAME> und den anderen?~
== AC#27DW3 ~Wir überbringen schlechte Nachrichten, Hathar.~
== AC#HATH8 ~Bei dem Allvater! Was ist geschehen?~
== AC#27DW3 ~Sie sind in Barakuir gefallen. Wir konnten ihnen nicht helfen und sind schweren Herzens alleine zurückgefahren.~
== AC#HATH8 ~Ihr habt ihre sterblichen Überreste zurückgelassen?~
== AC#27DW3 ~So leid es uns tut, doch sie wurden alle mit Haut und Haar von einem riesigen, tentakelbewehrten Ungeheuer gefressen.~
== AC#HATH8 ~Moradin sei ihrer Seele gnädig! Damit hatte ich nicht gerechnet. Seid Ihr Euch sicher?~
== AC#27DW3 ~Wir hörten ihre Schreie und haben den Todeskampf mit eigenen Augen gesehen, als wir auf den See zurückgerudert sind.~
== AC#HATH8 ~Ihr Feiglinge habt nicht einmal versucht, ihnen zu helfen?~
== AC#27DW3 ~Barakuir beherbergt Schrecken, gegen die wir *dwar* machtlos sind. Selbst so tapfere Recken wie Ihr würden dort nur den schnellen Tod finden.~
END
IF ~~ THEN EXTERN ~AC#HATH8~ cowards_did_not_help

