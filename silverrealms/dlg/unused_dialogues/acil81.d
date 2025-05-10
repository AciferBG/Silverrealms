/*******************************************************************************************************
Dialog Lich
*******************************************************************************************************/

BEGIN ~AC#81LI1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY  ~Welche Schmach! Seit Ewigkeiten gefangen in einer magischen Barriere, die ich nicht durchbrechen konnte, nur um dann von einem niederen <RACE> befreit zu werden?~
++ ~Ja, ich habe Euch befreit. Wie wäre es mit einer Belohnung?~ + reward
END

	IF ~~ THEN BEGIN reward
	   SAY ~Ihr wagt es, hier Hand an mein Gefängnis zu legen und erwartet dann auch noch eine Belohnung? Für diesen Frevel werde ich Euch vernichten!~
	   IF ~~ THEN DO ~Enemy()~  EXIT
	END

/*******************************************************************************************************
Dialog Githzerai
*******************************************************************************************************/

BEGIN ~AC#81GZ1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY  ~Frei! Endlich frei! So bin ich also schlussendlich doch noch dem Tode durch die Githyanki entronnen. Seid Ihr mein Retter, <RACE>?~
++ ~Das bin ich. Und wer seid Ihr?~ + who_are_you
END

	IF ~~ THEN BEGIN who_are_you
	SAY ~Ein Gefangener der Githyanki, meiner verhassten Vettern. Doch nun nicht mehr! Dank Euch. Doch wie ich sehe, hat sich dieser Ort seit meiner Gefangennahme verändert.~
	++ ~Warum wart Ihr hier gefangen?~ + why_imprisoned
	END
	
		IF ~~ THEN BEGIN why_imprisoned
		SAY ~In Zeiten, als dieser Ort noch eine Festung der Githyanki war, wurde ich von meiner Rasse hierher entsandt, um die Anlage auszukundschaften. Ich wurde entdeckt und eingesperrt. Als die Githyanki diese Festung aufgaben, haben sie mich wohl vergessen.~
		++ ~Wollt Ihr Euch mir anschließen?~ + join_me
		END
		
			IF ~~ THEN BEGIN join_me
			SAY ~Seht mich doch an. Die ewige Gefangenschaft hat meinen Körper und meinen Geist ausgezehrt. Ich wäre Euch nur Last als Nutzen. Nein, ich kann Euch nicht begleiten.~
			++ ~Was für einen Nutzen hatte es dann, Euch zu befreien?~ + benefit
			END
			
				IF ~~ THEN BEGIN benefit
				SAY ~Ich kann Euch nicht viel im Austausch für meine Freiheit bieten, doch eine nützliche Sache habe ich für Euch.~
				IF ~~ THEN GOTO arrow_01
				END
				
					IF ~~ THEN BEGIN arrow_01
					SAY ~Ich trage immer noch einen Pfeil bei mir, der eigentlich dafür gedacht war, den Githyanki-Kommandanten zu töten. Ich konnte ihn bei meiner Gefangennahme erfolgreich vor meinen Häschern verstecken - in der Hoffnung, dem ersten Githyanki, der mich aus der magischen Barriere entlässt, zwischen seine hässlichen Augen zu rammen. Nun brauche ich den Pfeil nicht mehr und denke, er könnte Euch von Nutzen sein.~
					IF ~~ THEN DO ~GiveItem("AC#81ARO",LastTalkedToBy)~ GOTO bye
					END
					
						IF ~~ THEN BEGIN bye
						SAY ~Doch nun haben wir genug Worte gewechselt. So sehr ich es auch genieße, mich mit Euch zu unterhalten, so sehr sehne ich mich danach, diesen finsteren Ort schleunigst zu verlassen. Gehabt Euch wohl, und möget Ihr besseres Glück als ich vor vielen Jahren haben, Euer Ziel hier zu erreichen.~
						IF ~~ THEN DO ~CreateVisualEffectObject("SPDIMNDR",Myself)
						Wait(1)
						DestroySelf()~  
						EXIT
						END
					

/*******************************************************************************************************
Dialog Seryl, Duthka'gith
*******************************************************************************************************/

BEGIN ~AC#SERYL~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY  ~Ihr lauft geradewegs in Euer Verderben, <RACE>!~
++ ~Eine Kreatur wie Euch habe ich noch nie gesehen. Was seid Ihr?~ + who_are_you
++ ~Das sehe ich anders.~ + fight02
END


IF ~~ THEN BEGIN who_are_you
SAY ~Meine Eltern waren beide Vertreter der mächtigsten Rassen, die das Multiversum beherrschen - mein Vater ein roter Drache, meine Mutter eine Githyanki!~
++ ~Ein wenig größenwahnsinnig seid Ihr aber schon.~ + fight
END

	IF ~~ THEN BEGIN fight
	   SAY ~Ich habe schon zu viele Worte mit einem niederen <RACE> wie Euch gewechselt! Jetzt werde ich Euch für die Rasse meiner Mutter opfern!~
	   IF ~~ THEN DO ~Enemy()~  EXIT
	END

	IF ~~ THEN BEGIN fight02
	   SAY ~Was für ein hochmütiger <RACE> Ihr doch seid! Mal sehen, was davon übrig ist, wenn Ihr wimmernd in einem unserer Kerker liegt!~
	   IF ~~ THEN DO ~Enemy()~  EXIT
	END

/*******************************************************************************************************
Dialog Astraler Deva
*******************************************************************************************************/

BEGIN ~AC#DEVA1~

IF ~Global("AC#ChoseDeva","ACIL81",1)
Dead("AC#MARIL")~ THEN BEGIN hello_chose_deva
SAY  ~Ah, der <RACE>, der mir gegen den finsteren Tanar'ri half! Was kann ich für Euch tun?~
++ ~Ich benötige Heilung.~ DO ~StartStore("AC#DEVA1",LastTalkedToBy())~ EXIT
++ ~Ich möchte mich ausruhen.~ DO ~RestParty()~ EXIT
++ ~Ich benötige Eure Dienste nicht länger. Ihr könnt diesen Ort verlassen.~ + deva_leave_place
END

	IF ~~ THEN BEGIN deva_leave_place
	SAY ~Seid Ihr Euch da sicher? Wenn ich einmal fort bin, werde ich nicht mehr hierher zurückkehren.~
	++ ~Ihr habt Recht. Wartet noch ein wenig, vielleicht brauche ich Eure Hilfe doch noch.~ + deva_stay
	++ ~Ja, Ihr könnt gehen.~ + deva_leave_place_exit
	END
	
	IF ~~ THEN BEGIN deva_stay
	SAY ~Ihr wisst, wo Ihr mich finden könnt.~
	IF ~~ THEN  EXIT
	END
	
	IF ~~ THEN BEGIN deva_leave_place_exit
	SAY ~Mögen die Götter mit Euch sein. Lebt wohl.~
	IF ~~ THEN DO ~CreateVisualEffectObject("SPDIMNDR",Myself)
	Wait(1)
	DestroySelf()~  
	EXIT
	END

IF ~~ THEN BEGIN did_you_free_us
SAY ~So sagt, <RACE>, seid Ihr derjenige, der uns aus dem Spiegelgefängnis befreit hat?~
++ ~Ja, das war ich.~ + yes
END

	IF ~~ THEN BEGIN yes
	SAY ~Eine edle Tat. So schließt Euch denn meinem Kampf gegen diesen Dämon an, wenn Ihr möchtet!~
	IF ~~ THEN EXTERN ~AC#MARIL~ chain_choose
	END
	
	IF ~~ THEN BEGIN choose_deva
	SAY ~Eine weise Wahl. Ich werde Euch jede Hilfe zuteil werden lassen, die ich Euch geben kann.~
	IF ~~ THEN EXTERN ~AC#MARIL~ marilith_enemy
	END
/*******************************************************************************************************
Dialog Marilith
*******************************************************************************************************/

BEGIN ~AC#MARIL~

IF ~Global("MarilithGoodbye","ACIL81",1)~ THEN BEGIN goodbye_door_open
SAY  ~So ist das Tor aus diesem Ort nun endlich offen. Ihr seid mir nicht länger nützlich, <RACE>. Es war amüsant, an Eurer Seite zu kämpfen, doch nun werde ich Euch verlassen.~
IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~Global("AC#ChoseMarilith","ACIL81",1)
Dead("AC#DEVA1")~ THEN BEGIN hello_chose_marilith
SAY  ~Ah, der <RACE>, der mir geholfen hat, den gutherzigen Deva zu vernichten! Was kann ich für Euch tun?~
++ ~Ich benötige Eure Dienste nicht länger. Ihr könnt diesen Ort verlassen.~ + marilith_leave_place
END

	IF ~~ THEN BEGIN marilith_leave_place
	SAY ~Seid Ihr Euch da sicher? Wenn ich einmal fort bin, werde ich nicht mehr hierher zurückkehren.~
	++ ~Ihr habt Recht. Wartet noch ein wenig, vielleicht brauche ich Eure Hilfe doch noch.~ + marilith_stay
	++ ~Ja, Ihr könnt gehen.~ + marilith_leave_place_exit
	END
	
	IF ~~ THEN BEGIN marilith_stay
	SAY ~Ihr wisst, wo Ihr mich finden könnt.~
	IF ~~ THEN  EXIT
	END
	
	IF ~~ THEN BEGIN marilith_leave_place_exit
	SAY ~Mögen die Götter mit Euch sein. Lebt wohl.~
	IF ~~ THEN DO ~CreateVisualEffectObject("SPDIMNDR",Myself)
	Wait(1)
	DestroySelf()~  
	EXIT
	END

IF ~~ THEN BEGIN choose_02
SAY ~Und lasst den <RACE> seine Wahl treffen. Sagt, wen werdet Ihr unterstützen, <LADYLORD>? Wählt mit Bedacht, denn der andere wird Euch nach Eurer Entscheidung unverhofft angreifen.~
++ ~Ich werde an Eurer Seite kämpfen, Marilith, und Eure Hilfe in meinen späteren Kämpfen in Anspruch nehmen.~ + choose_marilith
++ ~Ich wähle Euch, Deva, und hoffe auf Heilung meiner Wunden, sollte ich sie hier benötigen.~ EXTERN ~AC#DEVA1~ choose_deva
++ ~Euer Kampf geht mich nichts an. Tragt ihn unter Euch Euch aus und lasst mich in Frieden.~ + choose_none
END

	IF ~~ THEN BEGIN choose_none
	SAY ~Wie Ihr meint. Doch irgendwann werdet Ihr Euch entscheiden müssen, kleiner <RACE>~
	IF ~~ THEN DO ~SetGlobal("AC#ChoseNone","ACIL81",1)
	ActionOverride("AC#DEVA1",Attack("AC#MARIL"))
	Attack("AC#DEVA1")~  
	EXIT
	END
	
	IF ~~ THEN BEGIN choose_marilith
	SAY ~Ich werde Euch nicht enttäuschen!~
	IF ~~ THEN DO ~SetGlobal("AC#ChoseMarilith","ACIL81",1)
	ActionOverride("AC#DEVA1",Enemy())
	ActionOverride("AC#DEVA1",Attack("AC#MARIL"))~  
	EXIT
	END
	
	IF ~~ THEN BEGIN marilith_enemy
	SAY ~Ihr habt den falschen Verbündeten gewählt, <RACE>! Nun werde ich Euch beide in den Tod schicken!~
	IF ~~ THEN DO ~Enemy()
	SetGlobal("AC#ChoseDeva","ACIL81",1)
	ActionOverride("AC#DEVA1",Attack("AC#MARIL"))~  
	EXIT
	END

// Chain #1
CHAIN IF WEIGHT #-1 ~NumTimesTalkedTo(0)~ THEN AC#MARIL chain_hello_free_mirror
~So sind wir also aus dem Spiegel befreit, Deva.~
== AC#DEVA1 ~Ich war lieber in diesem Spiegel gefangen, als Eure fürchterliche Visage wieder ertragen zu müssen, Dämon!~
== AC#MARIL ~So seid Ihr bereit für den nächsten Kampf?~
== AC#DEVA1 ~Wartet - hier sind noch weitere Kreaturen.~
== AC#MARIL ~Ich nehme an, dass dies unsere heldenhaften Befreier sind.~
END
IF ~~ THEN EXTERN ~AC#DEVA1~ did_you_free_us

// Chain #2
CHAIN IF ~~ THEN AC#MARIL chain_choose
~Wer sagt denn, dass <HESHE> so ein erbärmliches Wesen wie Euch unterstützen möchte, Deva? Schließt Euch mir an, *edler* <RACE>, und Euer Ruhm wird unermesslich sein!~
== AC#DEVA1 ~Kein Lebewesen in den Ebenen würde freiwillig mit einer Kreatur wie Euch zusammenarbeiten, Dämon!~
== AC#MARIL ~Still! Und lasst den <RACE> seine Wahl treffen. Sagt, wen werdet Ihr unterstützen, <LADYLORD>? Wählt mit Bedacht, denn der andere wird Euch unverhofft angreifen.~
== AC#DEVA1 ~Wir sollten zunächst noch klären, was wir diesem <RACE> im Austausch für <HISHER>e Hilfe anbieten können.~
  = ~Ich für meinen Teil werde Euch Heilung und Linderung all jener Gebrechen schenken, die Euch an solch einem Ort widerfahren könnten.~
== AC#MARIL ~Was für eine schwächliche Art, um Unterstützung zu werben, Deva! Wer würde für so eine erbärmliche Gegenleistung sein Leben riskieren wollen?~
 = ~Unterstützt mich, <RACE>, denn ich werde Euch ein treuer Gefährte bei all den folgenschweren Kämpfen sein, die Ihr an diesem Ort gegen die uns beiden so verhassten Teufel und deren Schergen ausfechten werden müsst.~  
END
IF ~~ THEN + choose_02