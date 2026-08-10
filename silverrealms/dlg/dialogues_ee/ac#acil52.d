

BEGIN ~AC#52DW1~ // Phaeba Schwarzhorn, Priesterin der Haela in ACIL52

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0 // from:
  SAY ~Seid gegrüßt, <RACE>. Ich bin Phaeba Schwarzhorn, das strahlende Schwert im Dienste unserer geliebten Göttin Haela Leuchtaxt. Wie kann ich Euch behilflich sein?~
  IF ~~ THEN REPLY ~Was ist dies hier für ein Tempel?~ GOTO 1
  IF ~~ THEN REPLY ~Ich benötige Heilung.~ GOTO 4
  IF ~~ THEN REPLY ~Ich muss mich wieder verabschieden.~ + bye_haela
END

IF ~True()~ THEN BEGIN hello_again
  SAY ~Seid gegrüßt, <RACE>. Wie kann ich Euch behilflich sein?~
  IF ~~ THEN REPLY ~Was ist dies hier für ein Tempel?~ GOTO 1
  IF ~~ THEN REPLY ~Ich benötige Heilung.~ GOTO 4
  IF ~~ THEN REPLY ~Ich muss mich wieder verabschieden.~ + bye_haela
END

	IF ~~ THEN BEGIN bye_haela
	SAY ~Möge die Glücksmaid immer auf Euch herablächeln!~
	IF ~~ THEN EXIT 
	END

IF ~~ THEN BEGIN 1 // from: 0.0
  SAY ~Dies ist der Tempel von Haela Leuchtaxt, der Dame des Kampfes. Ihr findet hier Heilung, einige Tränke und jede Menge Rat zu den besten Kampftaktiken gegen unsere zahlreichen Widersacher. Wie kann ich Euch behilflich sein?~ 
  IF ~~ THEN REPLY ~Erzählt mir etwas über den Glauben an Eure Göttin.~  GOTO 2
  IF ~~ THEN REPLY ~Ich benötige Heilung.~ GOTO 4
  IF ~~ THEN REPLY ~Ich muss mich wieder verabschieden.~ + bye_haela
END

IF ~~ THEN BEGIN 2 // from: 1.0
  SAY ~Haela, die Glücksmaid, ist die Schutzpatronin all jener Zwerge, die den Kampf um des Kampfes willen lieben, die unbekannten Gefahren ins Auge sehen müssen und die im Allgemeinen jedwede scheußliche Kreatur von dieser Welt ins Jenseits schicken möchten. Haela wird für ihr helles Lachen und ihre immer fröhliche Art von uns geliebt. Sie ist vor Allem auch die Schutzpatronin derer, die weite Reisen auf sich nehmen müssen und Sie dabei um Beistand anrufen. Vertraut in Haela, dann werdet Ihr jeden Kampf überstehen, und die Monster dieser Länder werden durch Eure Waffen fallen, unabhängig von ihrer Anzahl und Stärke. ~ 
  IF ~~ THEN REPLY ~Ich möchte etwas anderes fragen.~ GOTO 3
END

IF ~~ THEN BEGIN 3 // from: 2.0
  SAY ~Sicher. Wie kann Euch die Glücksmaid behilflich sein?~ 
  IF ~~ THEN REPLY ~Ich benötige Heilung.~ GOTO 4
  IF ~~ THEN REPLY ~Ich muss mich wieder verabschieden.~ + bye_haela
END

IF ~~ THEN BEGIN 4 // from: 3.0
  SAY ~Die Glücksmaid segnet all jene, die an ihre Wohltat glauben, und durch ihre Gläubigen ist sie für die Bedrängten eine Stütze.~
  IF ~~ THEN DO ~StartStore("AC#52DW1",LastTalkedToBy)
~ EXIT
END

IF ~~ THEN BEGIN trust_PC
  SAY ~Das können wir. Danke für Eure Hilfe, Betrangrid.~
  IF ~~ THEN REPLY ~Ihr habt mich nur weggeschickt, um mich zu prüfen?~ GOTO trust_PC_02
END

IF ~~ THEN BEGIN trust_PC_02
  SAY ~In der Tat. Habt Ihr die Falle vorne an der Tempeltür bemerkt? Haelas Diener haben ein strenges Auge auf die Schätze unserer Rasse und strecken Strolche und Diebe gnadenlos nieder.~
  IF ~~ THEN REPLY ~Was hättet Ihr mit mir getan, wenn ich das Schwert behalten hätte?~ GOTO trust_PC_03
  IF ~~ THEN REPLY ~Was für ein Glück, dass Ihr mich nicht zu dieser Sorte <PRO_RACE> zählt.~ GOTO luck
END

IF ~~ THEN BEGIN trust_PC_03
  SAY ~Betrangrid wäre Euch auf jedem Eurer Schritte gefolgt und hätte das getan, was unsere Göttin von ihr gefordert hätte.~
  IF ~~ THEN REPLY ~Was für ein Glück, dass Ihr mich nicht zu dieser Sorte <PRO_RACE> zählt.~ GOTO luck
END

IF ~~ THEN BEGIN luck
  SAY ~Vielleicht versteht Ihr nun besser, warum wir unsere Göttin Glücksmaid nennen. Betrangrid?~
IF ~~ THEN DO ~~ EXTERN ~ac#52HA1~ yes_maam
END

IF ~~ THEN BEGIN give_sword_back
  SAY ~Seid so nett und gebt <CHARNAME> das Schwert zurück; <HESHE> kann es in der Arnschädelhalle gegen eine Waffe seiner Wahl eintauschen.~
IF ~~ THEN DO ~~ EXTERN ~ac#52HA1~ give_sword_back_02
END



/*******************************************************************************************************
Dialog Isdlara Riftsong, high priestess of Sharindlar
*******************************************************************************************************/
BEGIN ~AC#52DW9~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0 // from:
  SAY ~Oh, ein neues Gesicht im "Gnädigen Hof"! Wie schön. Seid Ihr hier, um Euch der Liebe und dem Tanz Sharindlars, der mildtätigen Maid, anzuschließen?~ 
  IF ~~ THEN REPLY ~So einen Tempel hatte ich hier nicht erwartet.~ GOTO 1
  IF ~~ THEN REPLY ~Erzählt mir mehr über Sharindlar.~ GOTO 3
  IF ~~ THEN REPLY ~Ich möchte die Dienste Eures Tempels in Anspruch nehmen.~  GOTO 6
  IF ~~ THEN REPLY ~Derzeit nicht. Vielleicht später.~  GOTO bye_sharindlar
END

IF ~~ THEN BEGIN 1 // from: 0.0
  SAY ~So geht es vielen, die das erste Mal Sharindlar, der strahlenden Tänzerin, begegnen.~ 
  IF ~~ THEN REPLY ~Ist diese Statue hinter Euch ein Abbild Sharindlars?~GOTO 2
END

IF ~~ THEN BEGIN 2 // from: 1.0
  SAY ~Ja, das ist die Tänzerin in all ihrer Schönheit und Anmut.~ 
  IF ~~ THEN REPLY ~Erzählt mir mehr über Sharindlar.~ GOTO 3
END

IF ~~ THEN BEGIN 3 // from: 2.0
  SAY ~Oh, da gibt es viel zu erzählen. Sharindlar ist die Schutzpatronin der Liebe, der Gnade und der Heilung. Zwerge, die verliebt sind, beten zu ihr, um ihre Angebetete zu gewinnen. Den Kranken schenkt Sharindlar Heilung, den Zwerginnen, die sich Nachwuchs wünschen, Fruchtbarkeit.~ 
  IF ~~ THEN GOTO 4
END

IF ~~ THEN BEGIN 4 // from: 3.0
  SAY ~Hier in diesem Tempel verehren wir sie, wie die Herrin der Gnade es uns gelehrt hat. Wir tanzen, haben Freude und schenken den Versehrten und Verzweifelten dadurch neue Kraft.~ 
  IF ~~ THEN REPLY ~Das ist zunächst einmal alles, was ich wissen wollte. Gehabt Euch wohl.~  GOTO 5
  IF ~~ THEN REPLY ~Könnte ich Sharindlars Dienste in Anspruch nehmen?~  GOTO 6
END

IF ~~ THEN BEGIN 5 // from: 4.0
  SAY ~Die Dame des Lebens wird Euch immer gnädig gesonnen sein.~ 
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 6 // from: 4.1
  SAY ~Sicher, seht Euch ruhig um. Wenn wir Euch Liebe und Heilung schenken können, wird das die Gnädige Dame höchst erfreuen!~ 
  IF ~~ THEN DO ~StartStore("ac#52dw9",LastTalkedToBy(Myself))
~ EXIT
END

IF ~HPPercentLT(LastTalkedToBy(Myself),100)~ THEN BEGIN 7 // from:
  SAY ~Ihr seht verletzt aus. Sollen wir im Namen Sharindlars Eure Verletzungen kurieren?~ 
  IF ~~ THEN REPLY ~Ich benötige die Dienste Eures Tempels.~ GOTO 6
  IF ~~ THEN REPLY ~Derzeit keins von beiden. Vielleicht später.~GOTO bye_sharindlar
END

IF ~True()~ THEN BEGIN 8 // from:
  SAY ~Ihr seid zurück! Wollt Ihr die Annehmlichkeiten des Gnädigen Hofes genießen oder benötigt Ihr Unterstützung unseres Tempels?~ 
  IF ~~ THEN REPLY ~Ich benötige die Dienste Eures Tempels.~ GOTO 6
  IF ~~ THEN REPLY ~Derzeit keins von beiden. Vielleicht später.~  GOTO bye_sharindlar
END

	IF ~~ THEN BEGIN bye_sharindlar
  SAY ~Wie Ihr wollt. Die Dame des Lebens wird Euch immer gnädig gesonnen sein.~ 
  IF ~~ THEN EXIT
END

/*******************************************************************************************************
Dialog Priesterin von Sharindlar, healing the wounded
*******************************************************************************************************/

BEGIN ~AC#52DW8~

IF ~Global("HelpHealing","ACIL52",10)~ THEN BEGIN hello_you_healed_final
SAY ~Der Heiler von der Oberfläche kehrt zurück! Seht nur, wie es den Kranken schon ein wenig besser geht!~
IF ~~ THEN DO ~SetGlobal("HelpHealing","ACIL52",20)~ EXIT
END

IF ~Global("HelpHealing","ACIL52",2)~ THEN BEGIN hello_you_healed
SAY ~Ihr habt es tatsächlich gemacht! Ihr seid toll! Von Euch Oberflächenbewohnern könnten wir hier unten mehr gebrauchen. Geht jetzt, den Rest der Heilung kann ich gut allein machen. Ich werde aber jedem erzählen, was für ein großherziger <PRO_RACE> mir heute geholfen hat.~
IF ~~ THEN DO ~SetGlobal("HelpHealing","ACIL52",10)
IncrementGlobal("AC_Iltkazar_Reputation","GLOBAL",1)
AddexperienceParty(100)
DisplayStringNoName(Player1,@1021)~ EXIT 
END

IF ~Global("HelpHealing","ACIL52",1)~ THEN BEGIN hello_promised_help
SAY ~Danke, dass Ihr Euch bereiterklärt habt, zu helfen, die Kranken zu heilen. Wirkt einfach einen Heilzauber auf einen der kranken Zwerge hier um uns herum.~
IF ~~ THEN EXIT
END

IF ~True()~ THEN BEGIN 0 // from:
  SAY ~Seid gegrüßt, <RACE>. Was kann die mildtätige Maid heute für Euch Gutes tun?~ 
  IF ~~ THEN REPLY ~Wer seid Ihr?~ GOTO 1
  IF ~~ THEN REPLY ~Was tut Ihr hier?~ GOTO 1
END

IF ~~ THEN BEGIN 1 // from: 0.0
  SAY ~Ich bin eine Priesterin von Sharindlar, der Dame des Lebens. Meine Aufgabe ist es, die Versehrten und Kranken hier in unserem kleinen Tempel zu pflegen.~ 
  IF ~~ THEN REPLY ~Woran leiden diese Zwerge hier?~ GOTO 2
  IF ~Global("HelpHealing","ACIL52",0)~ THEN REPLY ~Ich könnte Euch helfen, die Kranken zu heilen.~ GOTO me_healer_too
  IF ~~ THEN REPLY ~Dann möchte ich Euch bei Eurer Tätigkeit nicht weiter stören.~  GOTO 3
END

	IF ~~ THEN BEGIN me_healer_too
	SAY ~Oh, das würdet Ihr wirklich tun?~
	IF ~~ THEN REPLY ~Ja, gerne.~ + yes_heal
	IF ~~ THEN REPLY ~Nein.~ GOTO nope
	END
	
		IF ~~ THEN BEGIN nope
		SAY ~Dann werde ich mich wieder um die Kranken kümmern.~
		IF ~~ THEN GOTO 3 
		END
		
		IF ~~ THEN BEGIN yes_heal
		SAY ~Das wäre sehr großherzig von Euch! Alles, was Ihr tun müsst, ist, einen beliebigen Heilzauber auf die Kranken hier zu wirken.~
		IF ~~ THEN REPLY ~Das dürfte nicht zu schwer sein.~ GOTO heal_lets_go
		IF ~~ THEN REPLY ~Ach nein, das werde ich doch nicht tun.~ GOTO nope
		END
		
			IF ~~ THEN BEGIN heal_lets_go
			SAY ~Dann wünsche ich Euch viel Erfolg. Allein für Euer Angebot möge Euch Sharindlar bereits küssen.~
			IF ~~ THEN DO ~SetGlobal("DwarfHealed","ACIL52",0)
			SetGlobal("HelpHealing","ACIL52",1)~ EXIT 
			END

IF ~~ THEN BEGIN 2
  SAY ~Oh, das ist ganz unterschiedlich. Gemeinsam ist allen aber, dass Ihr Leiden nicht durch einfache Tränke oder schnelle Magie gelindert werden kann.~
	IF ~Global("HelpHealing","ACIL52",0)~ THEN REPLY ~Ich könnte Euch helfen, die Kranken zu heilen.~ GOTO me_healer_too  
  IF ~~ THEN REPLY ~Dann möchte ich Euch bei Eurer Tätigkeit nicht weiter stören.~  GOTO 3
END

IF ~~ THEN BEGIN 3 
  SAY ~Möge die strahlende Tänzerin Euch immer Gesundheit schenken.~ 
  IF ~~ THEN EXIT
END

/*******************************************************************************************************
Dialog Mutgred, Haelas Kämpfer
*******************************************************************************************************/
BEGIN ~ac#52HA2~

IF ~Global("MutgredTraining","ACIL52",1)~ THEN BEGIN training_02
SAY ~So hält man einen Zweihänder an der Oberfläche? Ist ja interessant.~
IF ~~ THEN DO ~SetGlobal("MutgredTraining","ACIL52",2)
StartCutSceneMode()
StartCutScene("AC#52MT1")~ EXIT
END

IF ~Global("MutgredTraining","ACIL52",2)~ THEN BEGIN training_03
SAY ~Also ehrlich, ich hab' mich richtig gefreut, mal einen richtigen Krieger von der Oberfläche zu treffen. Habt Dank! Ihr seid eine Bereicherung für unsere Stadt.~
IF ~~ THEN DO ~SetGlobal("MutgredTraining","ACIL52",10)
SetGlobal("AC#FoughtwithMutgred","ACIL52",1)
IncrementGlobal("AC_Iltkazar_Reputation","GLOBAL",1)
AddexperienceParty(500)
DisplayStringNoName(Player1,@1021)~EXIT
END
		
IF ~Global("AC#FoughtwithMutgred","ACIL52",1)~ THEN BEGIN hello_again_after_fight
SAY ~He, es hat Spaß gemacht, mit Euch zu kämpfen!~
IF ~~ THEN
EXIT
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello
SAY ~Seid gegrüßt, Fremde. Ich bin Mutgred, Kriegerin der Haela. Wenn Ihr einen fähigen Schwertarm habt, würde ich mich über einen Austausch von Kampftechniken freuen.~
++ ~Warum habt Ihr keinen Trainigspartner?~ + why_alone
++ ~Vielleicht später.~ + no_training
END

IF ~True()~ THEN BEGIN hello_again
SAY ~Hallo, Fremde. Habt Ihr ein paar Kampftechniken, die ich von Euch lernen könnte?~
IF ~~ THEN GOTO why_alone
END

	IF ~~ THEN BEGIN why_alone
	SAY ~Meine *samman* wurde bei einem Kampf mit einem Betrachter getötet. Es blieb nichts von ihr übrig, als sie von einem seiner Augenstrahlen getroffen wurde. Also was ist, seid Ihr mit dem Führen des Zweihänders vertraut?~
	//IF ~CheckStatGT(LastTalkedToBy,0,PROFICIENCYTWOHANDEDSWORD)~ THEN REPLY ~Ich kann auch ganz gut mit dem Zweihänder umgehen.~ GOTO two_handed
	IF ~CheckStatGT(Player1,0,PROFICIENCYTWOHANDEDSWORD)~ THEN REPLY ~<PLAYER1> kann gut mit dem Zweihänder umgehen.~ GOTO two_handed
	IF ~CheckStatGT(Player2,0,PROFICIENCYTWOHANDEDSWORD)~ THEN REPLY ~<PLAYER2> kann gut mit dem Zweihänder umgehen.~ GOTO two_handed
	IF ~CheckStatGT(Player3,0,PROFICIENCYTWOHANDEDSWORD)~ THEN REPLY ~<PLAYER3> kann gut mit dem Zweihänder umgehen.~ GOTO two_handed
	IF ~CheckStatGT(Player4,0,PROFICIENCYTWOHANDEDSWORD)~ THEN REPLY ~<PLAYER4> kann gut mit dem Zweihänder umgehen.~ GOTO two_handed
	IF ~CheckStatGT(Player5,0,PROFICIENCYTWOHANDEDSWORD)~ THEN REPLY ~<PLAYER5> kann gut mit dem Zweihänder umgehen.~ GOTO two_handed
	IF ~CheckStatGT(Player6,0,PROFICIENCYTWOHANDEDSWORD)~ THEN REPLY ~<PLAYER6> kann gut mit dem Zweihänder umgehen.~ GOTO two_handed
	IF ~!CheckStatGT(Player1,0,PROFICIENCYTWOHANDEDSWORD)
	!CheckStatGT(Player2,0,PROFICIENCYTWOHANDEDSWORD)
	!CheckStatGT(Player3,0,PROFICIENCYTWOHANDEDSWORD)
	!CheckStatGT(Player4,0,PROFICIENCYTWOHANDEDSWORD)
	!CheckStatGT(Player5,0,PROFICIENCYTWOHANDEDSWORD)
	!CheckStatGT(Player6,0,PROFICIENCYTWOHANDEDSWORD)~ THEN REPLY ~Tut mir leid, aber in meiner Gruppe ist niemand fähig, den Zweihänder zu schwingen.~ GOTO no_training 
	IF ~~ THEN REPLY ~Ich bedaure, aber ich fühle mich derzeit nicht imstande, mit Euch zu trainieren.~ GOTO no_training
	END

// hier noch Check:  CheckStatGT(LastTalkedToBy,0,PROFICIENCYTWOHANDEDSWORD), dann Kampf mit LastTalkedToBy, wenn Trainingswaffe equipped?
		IF ~~ THEN BEGIN no_training
		SAY ~Naja, macht ja nichts. Wenn Ihr doch einmal Erfahrung mit solchen Waffen habt, würde ich mich gerne mit Euch messen!~
		IF ~~ THEN EXIT
		END
		
		IF ~~ THEN BEGIN two_handed
		SAY ~Gut. Zeigt mal her, wie haltet Ihr die Klinge? Wo ist Eure rechte Hand?~
		IF ~~ THEN DO ~SetGlobal("MutgredTraining","ACIL52",1)
		StartCutSceneMode()
		StartCutScene("AC#52MT1")~ EXIT
		END
		
		
		/*
		~Schöne Klinge habt Ihr da. Unsere Schmiede müssen sich erst noch daran gewöhnen, solch große Waffen fürs stämmige Volk zu schmieden.~
		*/
		


/*******************************************************************************************************
Dialog Betrangrid, Haelas Ritter
*******************************************************************************************************/
BEGIN ~ac#52HA1~

IF ~Global("AC#TalkedToBetrangrid","ACIL52",10)~ THEN BEGIN hello_bladebringer
SAY ~Ihr habt unser Vertrauen verdient. Wandelt im Lichte der Glücksmaid!~
IF ~~ THEN EXIT
END

IF ~Global("AC#TalkedToBetrangrid","ACIL52",5)~ THEN BEGIN hello
SAY ~Da seid Ihr ja wieder! Habt Ihr mein Schwert aus Fiebereisen schon geholt?~
++ ~Nein, ich konnte mich noch nicht darum kümmern.~ + nope
IF ~PartyHasItem("ac#52HA1")~ THEN REPLY ~Ja, ich habe es hier bei mir.~ + has_sword
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello
SAY ~Oh, Ihr seid doch die Abenteurer von der Oberfläche!~
++ ~Ja, das bin ich. Wer seid Ihr?~ + 2
++ ~Vielleicht.~ + 2
END

IF ~~ THEN BEGIN nope
SAY ~Ihr wisst ja, wo Ihr mich finden könnt, wenn Ihr das Schwert geholt habt.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN has_sword
SAY ~He, Ihr habt es tatsächlich bei Euch! Lasst mal sehen...~
IF ~~ THEN DO ~TakePartyItem("ac#52HA1")~ GOTO took_sword
END

IF ~~ THEN BEGIN took_sword
SAY ~Das Schwert liegt richtig gut in der Hand. Und seht nur, wie es aus dem Inneren glüht! Ja, wirklich, eine feine Waffe für einen edlen Krieger.~
=
~Ich glaube, wir können dem <PRO_RACE> von der Oberfläche vertrauen, Strahlendes Schwert Schwarzhorn!~
IF ~~ THEN DO ~SetGlobal("AC#TalkedToBetrangrid","ACIL52",10)~ EXTERN ~AC#52DW1~ trust_PC
END

IF ~~ THEN BEGIN yes_maam
SAY ~Ja, Herrin?~
IF ~~ THEN DO ~~ EXTERN ~AC#52DW1~ give_sword_back
END

IF ~~ THEN BEGIN give_sword_back_02
SAY ~Jawohl. Hier habt Ihr die Klinge zurück, <CHARNAME>.~
IF ~~ THEN DO ~GiveItem("ac#52HA1",Player1)~ GOTO give_sword_back_03
END

IF ~~ THEN BEGIN give_sword_back_03
SAY ~Schwingt sie mit stolz in Eurem Herzen.~
++ ~Ich möchte die Klinge nicht mehr.~ + dont_want_blade
++ ~Habt Dank.~ + thanks_4_blade
END

IF ~~ THEN BEGIN 2
SAY  ~Ich bin Betrangrid, treue Kriegerin Haelas. Sagt, kämpft Ihr gegen viele Ungeheuer an der Oberfläche?~
++ ~Ja, es gibt schon einige, gegen die man kämpfen muss.~ + 3
++ ~Das ist eine meiner Lieblingsbeschäftigungen!~ + 3
++ ~Ich versuche das so weit es geht zu vermeiden.~ + 3
END

IF ~~ THEN BEGIN 3
SAY ~Hier im Unterreich sind es immer nur die Üblichen: Duergar, Drow - und ab und zu ein Betrachter. Wie gerne würde ich einmal die Kräfte mit einem Unhold unter der Sonne messen!~
++ ~Warum seid Ihr so versessen auf das Kämpfen?~ + 4
++ ~Eine ehrenwerte Einstellung!~ + 4
++ ~Ich wäre eher froh, solchen Begegnungen aus dem Weg zu gehen.~ + 4
END

IF ~~ THEN BEGIN 4
SAY ~Ich folge der Lehre Haelas. Die Herrin des Gefechts lehrt uns, dass jeder Kampf eine Chance zur Ehre und zum Schutz unserer Gemeinschaft bietet. Deshalb versuche ich auch, mich in allen Kampftechniken zu schulen.~
++ ~Ich sehe, Ihr tragt einen Zweihänder. Ist das nicht ein wenig groß für eine... äh... Zwergin wie Euch?~ + 5
++ ~Ihr schwingt ein ziemlich großes Schwert.~ + 5
++ ~Dann möchte ich Euch dabei nicht weiter stören.~ + two_handed_02
END

IF ~~ THEN BEGIN 5
SAY ~Das denken wohl alle Oberflächenbewohner. Bei Euch müssen alle Zwerge mit Hämmern und Äxten umherziehen und grimmig dreinblicken, was?~
IF ~CheckStatGT(LastTalkedToBy,0,PROFICIENCYTWOHANDEDSWORD)~ THEN REPLY ~Ich kann auch ganz gut mit dem Zweihänder umgehen.~ GOTO two_handed
IF ~CheckStatGT(Player1,0,PROFICIENCYTWOHANDEDSWORD)~ THEN REPLY ~<PLAYER1> kann auch ganz gut mit dem Zweihänder umgehen.~ GOTO two_handed
IF ~CheckStatGT(Player2,0,PROFICIENCYTWOHANDEDSWORD)~ THEN REPLY ~<PLAYER2> kann auch ganz gut mit dem Zweihänder umgehen.~ GOTO two_handed
IF ~CheckStatGT(Player3,0,PROFICIENCYTWOHANDEDSWORD)~ THEN REPLY ~<PLAYER3> kann auch ganz gut mit dem Zweihänder umgehen.~ GOTO two_handed
IF ~CheckStatGT(Player4,0,PROFICIENCYTWOHANDEDSWORD)~ THEN REPLY ~<PLAYER4> kann auch ganz gut mit dem Zweihänder umgehen.~ GOTO two_handed
IF ~CheckStatGT(Player5,0,PROFICIENCYTWOHANDEDSWORD)~ THEN REPLY ~<PLAYER5> kann auch ganz gut mit dem Zweihänder umgehen.~ GOTO two_handed
IF ~CheckStatGT(Player6,0,PROFICIENCYTWOHANDEDSWORD)~ THEN REPLY ~<PLAYER6> kann auch ganz gut mit dem Zweihänder umgehen.~ GOTO two_handed
IF ~!CheckStatGT(Player1,0,PROFICIENCYTWOHANDEDSWORD)
!CheckStatGT(Player2,0,PROFICIENCYTWOHANDEDSWORD)
!CheckStatGT(Player3,0,PROFICIENCYTWOHANDEDSWORD)
!CheckStatGT(Player4,0,PROFICIENCYTWOHANDEDSWORD)
!CheckStatGT(Player5,0,PROFICIENCYTWOHANDEDSWORD)
!CheckStatGT(Player6,0,PROFICIENCYTWOHANDEDSWORD)~ THEN REPLY ~Auch wenn ich mich mit solch großen Klingen nicht besonders gut auskenne, bewundere ich diejenigen, die damit umgehen können, sehr - gleich welcher Rasse sie angehören.~ GOTO two_handed_02
IF ~~ THEN REPLY ~Das ist in der Tat ein Bild, das man an der Oberfläche von Zwergen hat, ja.~ GOTO two_handed_02
END

IF ~~ THEN BEGIN two_handed
SAY ~Wirklich? Hey, das ist ja toll! Wir haben hier eine Kämpferin, Mutgred, die gerne einen Lehrmeister hätte. Sprecht sie doch einfach einmal an und trainiert mit ihr.~ 
IF ~GlobalGT("AC#FoughtwithMutgred","ACIL52",0)~ THEN REPLY ~Ich habe meine Kräfte bereits mit ihr gemessen.~ GOTO already_fought_mutgred
IF ~~ THEN REPLY ~Eine gute Idee!~ GOTO two_handed_02
IF ~~ THEN REPLY ~Ich sehe einmal, ob sich das einrichten lässt.~ GOTO two_handed_02
END

	IF ~~ THEN BEGIN already_fought_mutgred
	SAY ~Ach! Sie konnte sicher eine Menge von Euch lernen!~ 
	IF ~~ THEN GOTO two_handed_02
	END

IF ~~ THEN BEGIN two_handed_02
SAY ~Wisst Ihr was? Ihr könntet mein neues Schwert aus Fiebereisen aus der Arnschädelhalle abholen.~
++ ~Ist das jetzt ein Botengang oder eine besondere Ehre?~ + both
++ ~Ihr vertraut einem Fremden Euer neues Schwert an?~ + fremder_schwert
++ ~Dafür habe ich keine Zeit.~ + bye_generic
END

	IF ~~ THEN BEGIN fremder_schwert
	SAY ~Ich mag Euch. Die anderen in der Stadt weniger, glaube ich. Wenn Ihr nicht wollt, braucht Ihr es nicht zu holen.~
	++ ~Doch, es wäre mir eine Ehre, Euch das Schwert zu bringen.~ + accept
	++ ~Ich habe wirklich andere Sorgen.~ + bye_generic
	END

	IF ~~ THEN BEGIN both
	SAY ~Beides. Ich mag Euch. Die anderen in der Stadt weniger, glaube ich. Wenn Ihr nicht wollt, braucht Ihr es nicht zu holen.~
	++ ~Doch, es wäre mir eine Ehre, Euch das Schwert zu bringen.~ + accept
	++ ~Ich habe wirklich andere Sorgen.~ + bye_generic
	END

IF ~~ THEN BEGIN accept
SAY ~Das finde ich richtig nett von Euch. Mein neues Schwert ist aus Fiebereisen geschmiedet. Für solche Arbeiten ist die Arnschädelhalle zuständig. Die Arnschädelhalle ist im Westen der Stadt. Da, wo es stinkt und Rauch aufsteigt, seid Ihr richtig. Ich freue mich, wenn Ihr es mir vorbeibringt.~
IF ~~ THEN DO ~SetGlobal("AC#TalkedToBetrangrid","ACIL52",5)
SetGlobal("AC#BetrangridQuest","GLOBAL",1)
AddJournalEntry(@52100,QUEST)~
EXIT
END

IF ~~ THEN BEGIN bye_generic
SAY ~Naja, egal, ich werde dann mal wieder weiter den Schwertkampf üben.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN dont_want_blade
SAY ~Das bleibt Euch überlassen. Für uns hat das Schwert seinen Wert bewiesen. Gehabt Euch wohl, <CHARNAME> Klingenträger.~
IF ~~ THEN DO ~IncrementGlobal("AC_Iltkazar_Reputation","GLOBAL",1)
SetGlobal("AC#BetrangridQuest","GLOBAL",10)
AddJournalEntry(@52110,QUEST_DONE)
DisplayStringNoName(Player1,@1021)~
EXIT
END

IF ~~ THEN BEGIN thanks_4_blade
SAY ~Schlagt damit ein paar Orks den Schädel ein, in Ordnung? Gehabt Euch wohl, <CHARNAME> Klingenträger.~
IF ~~ THEN DO ~IncrementGlobal("AC_Iltkazar_Reputation","GLOBAL",1)
SetGlobal("AC#BetrangridQuest","GLOBAL",10)
AddJournalEntry(@52110,QUEST_DONE)
DisplayStringNoName(Player1,@1021)~
EXIT
END

IF ~True()~ THEN BEGIN hello_true
SAY ~Möge Haela eure Klingen schärfen und euren Mut stärken, bis wir uns wieder im Gefecht befinden.~
IF ~~ THEN EXIT
END

/*******************************************************************************************************
Dialog Thardumin Goldview, dendritic armour seller
*******************************************************************************************************/

BEGIN ~AC#52DEN~

IF ~!GlobalTimerExpired("AC#S#DendriticArmor","GLOBAL")
Global("AC#S#MakeDendritic","GLOBAL",1)~ THEN BEGIN hello_wait_for_armor 
  SAY ~He, Ihr seid aber ungeduldig. Oder wollt Ihr Eurer Rüstung beim Wachsen zusehen? Kommt später wieder, der Kristall ist noch nicht fertig gewachsen.~  
  IF ~~ THEN EXIT
END

IF ~GlobalTimerExpired("AC#S#DendriticArmor","GLOBAL")
Global("AC#S#MakeDendritic","GLOBAL",1)~ THEN BEGIN hello_armor_finished
  SAY ~Der Kristall ist fertig! Hier ist Eure Rüstung. Schaut nur, wie sie funkelt! Viel Freude damit.~ 
  IF ~~ THEN DO ~GiveItemCreate("AC#DEND1",LastTalkedToBy,1,1,1)
SetGlobal("AC#S#MakeDendritic","GLOBAL",2)
EraseJournalEntry(@52200)
~ EXIT
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello
SAY ~Ein <RACE> in meiner Kristallzucht! Wie schön.~
++ ~Was sind das für seltsame Kristalle in dieser Höhle?~ + dendritic_crystals
IF ~Global("DendriticArmor","ACIL52",1)~ THEN REPLY ~Ich würde gerne wegen der Kristallrüstung mit Euch sprechen.~ + armor_01
END

IF ~True()~ THEN BEGIN hello_again
SAY ~Ein <RACE> in meiner Kristallzucht! Wie schön, Euch wiederzusehen.~
++ ~Ihr wollte nur einmal kurz vorbeischauen und muss mich wieder verabschieden. Lebt wohl.~ + bye
IF ~Global("DendriticArmor","ACIL52",1)~ THEN REPLY ~Ich würde gerne wegen der Kristallrüstung mit Euch sprechen.~ + armor_01
END

	IF ~~ THEN BEGIN dendritic_crystals
	SAY ~Dendritische Kristalle. Sie sprießen wie Pilze in die Höhe, und meine Aufgabe ist es, dafür zu sorgen, dass sie in die richtige Richtung wachsen.~
	++ ~Wozu braucht man so etwas?~ + why_dendritic_crystals
	END
	
		IF ~~ THEN BEGIN why_dendritic_crystals
		SAY ~Für ganz viele unterschiedliche Dinge! Viele Zwerge stellen sich solch einen Dendriten zur Zierde in ihr Heim. Man kann aber auch Rüstungen daraus machen.~
		++ ~Mehr wollte ich gar nicht wissen. Lebt wohl.~ + bye
		IF ~~ THEN REPLY ~Ihr könnt Rüstungen aus diesen Steinen herstellen?~ DO ~SetGlobal("DendriticArmor","ACIL52",1)~ + armor_01
		END
		
			IF ~~ THEN BEGIN armor_01
			SAY ~Aber klar doch! Wollt Ihr, dass ich Euch eine Rüstung wachsen lasse?~
			++ ~Was für einen Vorteil bieten diese Rüstungen im Vergleich zu denen aus Metall oder Leder?~ + armour_advantage 
			++ ~Ich hätte gerne eine Rüstung.~ + yes_want_armor
			++ ~Nein Danke.~ + bye
			END
			
				IF ~~ THEN BEGIN armour_advantage
				SAY ~Die Kristalle absorbieren Magie. Wenn Euch ein Drow-Magier mit einem Feuerball rösten möchte, stehen Eure Chancen gut, dass Ihr mit solch einer Rüstung unbeschadet aus dem Inferno herauskommt.~
				++ ~Und was für Nachteile hat die Rüstung?~ + armour_disadvantage 
				END
				
				IF ~~ THEN BEGIN armour_disadvantage
				SAY ~Na, sie ist eben aus Kristall und damit schwer und unhandlich. Letztlich muss es jeder selbst entscheiden, ob er mit solch einem Schmuckstück in die Schlacht ziehen möchte.~
				++ ~Ich hätte gerne eine Rüstung.~ + yes_want_armor
				++ ~Mehr wollte ich gar nicht wissen. Lebt wohl.~ + bye
				END
				
					IF ~~ THEN BEGIN yes_want_armor
					SAY ~He, toll! Das kostet Euch dann 6000 Goldmünzen.~
					++ ~Soviel Gold habe ich nicht.~ + not_enough_gold
					++ ~Das ist mir zu teuer.~ + too_much_gold
					IF ~PartyGoldGT(5999)~ THEN REPLY ~Gut. Das ist es mir wert, um später in Kristallen gekleidet herumlaufen zu können.~ + buy_armor
					END
			
						IF ~~ THEN BEGIN too_much_gold
						SAY ~Schade, aber Eure Entscheidung. Dann werde ich mich wieder um meine Kristalle kümmern.~
						IF ~~ THEN EXIT 
						END
						
						IF ~~ THEN BEGIN not_enough_gold
						SAY ~Wenn Ihr das Gold beisammen habt und immer noch an der Rüstung interessiert seid, wisst Ihr, wo ich zu finden bin.~
						IF ~~ THEN EXIT 
						END
						
						IF ~~ THEN BEGIN buy_armor 
						SAY ~Das ist toll! Und aufregend! Es ist nämlich das erste Mal, dass ich eine solche Rüstung einem Oberflächen-<RACE> anpassen kann. So, ich nehme noch kurz Maß, nicht, dass die Rüstung an den entscheidenden Stellen später zu eng ist und drückt...~
						=
						~Das wäre es. Kommt in fünf Tagen wieder, dass sollte die Rüstung fertig sein.~
						IF ~~ THEN DO ~TakePartyGold(6000)
						IncrementGlobal("AC_Iltkazar_Reputation","GLOBAL",1)
						DisplayStringNoName(Player1,@1021)
						SetGlobal("AC#S#MakeDendritic","GLOBAL",1)
						SetGlobalTimer("AC#S#DendriticArmor","GLOBAL",FIVE_DAYS)~ UNSOLVED_JOURNAL @52200 EXIT
						END
			
			IF ~~ THEN BEGIN bye
			SAY ~Na, dann werde ich meinen Kristallen wohl wieder beim Wachsen zusehen.~
			IF ~~ THEN EXIT 
			END

// Shagretor legacy

BEGIN ~AC#52DW7~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0 
  SAY ~Seid gegrüßt, <RACE>. Dies ist "Das Vermächtnis". Was kann der alte Shagretor heute für Euch tun?~
  IF ~~ THEN REPLY ~"Das Vermächtnis"? Ist das Euer Laden?~ GOTO 1
  IF ~~ THEN REPLY ~Ich gehe dann mal wieder.~ GOTO bye
  IF ~Global("AC#Return_to_Surface","GLOBAL",2)~ THEN REPLY ~Dorna Abgrundlied meinte, Ihr hättet eine Schwebescheibe der Drow, mit der ich wieder nach oben an die Oberfläche schweben könnte.~ + need_driftdisc
END

	IF ~~ THEN BEGIN need_driftdisc
	SAY ~Dass sie sich daran noch erinnert! Aber ja, die liegt da hinten, bei all den ganzen anderen Drow-Devotionalien. Einziges Problem ist, dass es nur noch eine Scheibe ist, die nicht mehr schwebt.~
	IF ~~ THEN REPLY ~Was wollt Ihr damit sagen?~ + disc_without_drift_01
	END
	
		IF ~~ THEN BEGIN disc_without_drift_01
		SAY ~Na, die Magie hat aufgehört zu wirken. Sie schwebte noch eine ganze Weile hier in meinem Archiv vor sich hin, bis es irgendwann *Peng* gemacht hat und sie zu Boden gefallen ist. Habe ich einen Schreck bekommen!~
		IF ~~ THEN REPLY ~Könnte man sie wieder zum Schweben bringen?~ + make_disc_drift_again
		END
		
			IF ~~ THEN BEGIN make_disc_drift_again
			SAY ~Wenn Ihr einen Drow-Magier findet, der sie Euch wieder verzaubert - ja, dann wird sie wieder schweben. Dürfte nur schwer sein, hier in der Stadt einen Drow zu finden, Höhö.~
			IF ~~ THEN + take_driftdisc
			END
			
				IF ~~ THEN BEGIN take_driftdisc
				SAY ~Jedenfalls ist die Scheibe da hinten. Nehmt sie Euch, hier ist sie eh' zu nichts mehr nütze.~
				IF ~~ THEN DO ~SetGlobal("AC#Return_to_Surface","GLOBAL",3)
				SetGlobal("Driftdisc","ACIL52",1)
				AddJournalEntry(@64208,QUEST)
				~ EXIT
				END
				
				IF ~~ THEN BEGIN bye
				SAY ~Macht das. Aber nehmt nichts mit außer Erinnerungen!~
				IF ~~ THEN EXIT
				END

IF ~~ THEN BEGIN 1 
  SAY ~Nein, "Das Vermächtnis" ist kein Geschäft. Wenngleich ich auch gelegentlich Gegenstände aufkaufe, ist dies eher eine Ansammlung von einigen der schönsten Stücke aus unserer glorreichen Vergangenheit, dem alten Shanatar.~ 
  IF ~~ THEN REPLY ~Ihr sammelt hier alte Artefakte und so etwas?~ GOTO 2
  IF ~~ THEN REPLY ~Ich gehe dann mal wieder.~ GOTO bye
END

IF ~~ THEN BEGIN 2 // from: 1.0
  SAY ~Weniger Artefakte als vielmehr Erinnerungen. Die mächtigen magischen Artefakte Shanatars sind schon seit langer Zeit über ganz Faerun verstreut. Was geblieben ist sind die Statuen und Bronzetafeln unserer Vorfahren. Und diese stelle ich hier für jeden Interessierten zur Schau. Seht Euch nur in Ruhe um und lasst die mächtigen Exponate auf Euch wirken.~ 
  IF ~~ THEN REPLY ~Das werde ich machen. Habt dank für Eure Erklärungen.~ GOTO 3
  IF ~~ THEN REPLY ~Ich gehe dann mal wieder.~ GOTO bye
END

IF ~~ THEN BEGIN 3 // from: 2.0
  SAY ~Wenn Ihr Fragen zu einzelnen Stücken habt, sprecht mich an, ich kann Euch noch viele Geschichten aus unserer Vergangenheit erzählen.~ 
  IF ~~ THEN EXIT
END

IF ~True()~ THEN BEGIN 4 // from:
  SAY ~Seid abermals gegrüßt. Was kann ich für Euch tun?~ 
  IF ~~ THEN REPLY ~Ich habe Fragen zu einigen Exponaten.~GOTO 6
  IF ~~ THEN REPLY ~Derzeit nichts. Ich komme vielleicht später wieder.~ GOTO 5
  //IF ~Global("AC#BackToSurface","GLOBAL",4)~ THEN REPLY ~Bettargh meinte, Ihr hättet eine Schwebescheibe der Drow, mit der ich wieder nach oben an die Oberfläche schweben könnte.~ + need_driftdisc
  IF ~Global("AC#Return_to_Surface","GLOBAL",2)~ THEN REPLY ~Dorna Abgrundlied meinte, Ihr hättet eine Schwebescheibe der Drow, mit der ich wieder nach oben an die Oberfläche schweben könnte.~ + need_driftdisc
END

IF ~~ THEN BEGIN 5 // from: 4.1
  SAY ~Gut. Möge Shanatars Glanz noch lange in Euch leuchten.~ 
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 6 // from: 4.0
  SAY ~Sehr gerne! Worüber soll ich Euch berichten?~ 
  IF ~~ THEN REPLY ~Was ist mit diesen beiden Statuen dort hinten? Sie sehen wie Zwerge aus.~ GOTO 7
  IF ~~ THEN REPLY ~Ist das ein Zwerg, der gegen einen Drachen kämpft?~ GOTO taark_fighting_dragon
  IF ~~ THEN REPLY ~Ihr habt einige Gegenstände der Duergar hier in Eurer Sammlung.~ + duergar
  IF ~Global("ShagretorShanatar","ACIL52",0)~ THEN REPLY ~Könnt Ihr mir etwas über dieses "Shanatar" erzählen?~ + about_shanatar
  IF ~Global("ShagretorShanatar","ACIL52",1)~ THEN REPLY ~Könnt Ihr mir noch einmal über "Shanatar" berichten?~ + about_shanatar_again
END

	IF ~~ THEN BEGIN taark_fighting_dragon
	SAY ~Das? Das nicht *ein* Zwerg - das ist Taark Shanat, Stammvater aller Schildzwerge! Gründer des legendären Reiches Shanatar. Die Statue stellt dar, wie er einen blauen Drachen erschlägt und somit seinem Volk ein Heim schafft.~
	IF ~~ THEN REPLY ~Ich habe Fragen zu weiteren Exponaten.~GOTO 6
	IF ~~ THEN REPLY ~Mehr wollte ich gar nicht wissen. Lebt wohl.~ GOTO 5
	END
	
	IF ~~ THEN BEGIN duergar
	SAY ~Ooh, die Duergar... ein ganz schlechtes Thema. Das hören meine Mitzwerge hier nicht gerne, wenn ich über sie spreche. Nur so viel: Clan Duergar war einst ein ganz regulärer Zwergenclan in einer Stadt, wie Iltkazar auch. Leider sind die Bewohner des Hauses Duergar irgendwann verschwunden. Als sie wieder auftauchten, waren sie zu diesen gehässigen, bösartigen Vettern unserer Rasse verwandelt, die man bergein, bergaus gemeinhin unter dem Namen Duergar kennt.~
	IF ~~ THEN REPLY ~Ich habe Fragen zu weiteren Exponaten.~GOTO 6
	IF ~~ THEN REPLY ~Mehr wollte ich gar nicht wissen. Lebt wohl.~ GOTO 5
	END
	
	IF ~~ THEN BEGIN about_shanatar
	SAY ~Ihr wollt wirklich die lange Geschichte unseres Volkes hören?~
	IF ~~ THEN REPLY ~Ja, erzählt mir darüber.~ + about_shanatar_02
	IF ~~ THEN REPLY ~Nein. Ich habe stattdessen Fragen zu weiteren Exponaten.~ GOTO 6
	IF ~~ THEN REPLY ~Nein, ich habe es mir anders überlegt. Lebt wohl.~ GOTO 5
	END
	
	IF ~~ THEN BEGIN about_shanatar_again
	SAY ~Ihr wollt Euch die lange Geschichte unseres Volkes noch einmal anhören?~
	IF ~~ THEN REPLY ~Ja, erzählt mir darüber.~ + about_shanatar_02
	IF ~~ THEN REPLY ~Nein. Ich habe stattdessen Fragen zu weiteren Exponaten.~ GOTO 6
	IF ~~ THEN REPLY ~Nein, ich habe es mir anders überlegt. Lebt wohl.~ GOTO 5
	END
	
		IF ~~ THEN BEGIN about_shanatar_02
		SAY ~In den Tiefen der Erde, unter den Ländern des Lichts, erstreckte sich einst unser großes Zwergenreich Shanatar. Gegründet wurde es von Taark Shanat und seinen tapferen Söhnen. Dieses Reich war in acht Königreiche unterteilt, jedes geführt von einem der Söhne Taarks, die sich jeweils einem Kinde Moradins verschrieben hatten.~
		IF ~~ THEN REPLY ~Fahrt fort.~ GOTO about_shanatar_03
		IF ~~ THEN REPLY ~Ich habe stattdessen Fragen zu weiteren Exponaten.~ GOTO 6
		IF ~~ THEN REPLY ~Ich muss Euch wieder verlassen. Lebt wohl.~ GOTO 5
		END
		
			IF ~~ THEN BEGIN about_shanatar_03
			SAY ~Shanatar war ein Ort des Glanzes, geprägt von mächtigen Königreichen wie dem eisernen Barakuir und dem mithrilenen Iltkazar. Doch trotz unserer Stärke und unseres Reichtums waren wir nicht frei von inneren Spannungen und Kriegen mit unseren Nachbarn wie den hinterhältigen Drow aus Guallidurth. Die Geschichte Shanatars ist daher eine Geschichte von Aufstieg und Fall, von großen Allianzen und bitteren Kriegen. Es gab Zeiten, in denen die Einheit unserer Königreiche stark war, wie zu Beginn des zweiten Großen Zeitalters, als wir die Drow erfolgreich zurückdrängten. Doch diese Zeiten der Einheit waren selten und die Spannungen zwischen den Königreichen oft groß.~
			IF ~~ THEN REPLY ~Fahrt fort.~ GOTO about_shanatar_04
			IF ~~ THEN REPLY ~Ich habe stattdessen Fragen zu weiteren Exponaten.~ GOTO 6
			IF ~~ THEN REPLY ~Ich muss Euch wieder verlassen. Lebt wohl.~ GOTO 5
			END
			
			IF ~~ THEN BEGIN about_shanatar_04
			SAY ~Die Drow waren ständige Bedrohungen in den Spinnenkriegen, und jedes Mal schienen sie stärker zurückzukommen. Doch der wahre Niedergang begann mit dem Zwist untereinander, besonders mit den Duergar, unseren eigenen entfremdeten Verwandten, die aus den Tiefen kamen und fast alles, was wir aufgebaut hatten, zerstörten.~
			IF ~~ THEN REPLY ~Fahrt fort.~ GOTO about_shanatar_05
			IF ~~ THEN REPLY ~Ich habe stattdessen Fragen zu weiteren Exponaten.~ GOTO 6
			IF ~~ THEN REPLY ~Ich muss Euch wieder verlassen. Lebt wohl.~ GOTO 5
			END
			
				IF ~~ THEN BEGIN about_shanatar_05
				SAY ~Heute ist von dem einst mächtigen Shanatar nur noch Iltkazar übrig, ein Reich, das sich tief in den Felsen verbirgt und dessen Geschichten und Legenden in den Hallen unserer Ahnen widerhallen. Wir erinnern uns an die Lehren unserer Vergangenheit und bewahren das Erbe Shanatars, in der Hoffnung, dass keine solche Finsternis je wieder über uns kommen möge.~
				=
				~So ist die Geschichte von Shanatar, ein Reich, das einst das Unterreich beherrschte und dessen Echo noch immer in den tiefen, dunklen Gängen unter der Erde zu hören ist. Wir halten das Andenken unserer Vorfahren in Ehren und erzählen ihre Geschichten weiter, auf dass sie niemals vergessen werden.~
				IF ~Global("ShagretorShanatar","ACIL52",0)~ THEN REPLY ~Danke, das war eine interessante Geschichte.~ GOTO about_shanatar_finish
				IF ~Global("ShagretorShanatar","ACIL52",1)~ THEN REPLY ~Danke, das war eine interessante Geschichte.~ GOTO about_shanatar_finish_02
				IF ~~ THEN REPLY ~Ich habe stattdessen Fragen zu weiteren Exponaten.~ GOTO 6
				IF ~~ THEN REPLY ~Ich muss Euch wieder verlassen. Lebt wohl.~ GOTO 5
				END
				
				IF ~~ THEN BEGIN about_shanatar_finish
				SAY ~Es freut mich, dass sich ein <PRO_RACE> von der Oberfläche dafür interessiert. Hätt' ich gar nicht gedacht! So verkehrt seid Ihr gar nicht, wisst Ihr?~
				IF ~~ THEN DO ~IncrementGlobal("AC_Iltkazar_Reputation","GLOBAL",1)
				SetGlobal("ShagretorShanatar","ACIL52",1)
				DisplayStringNoName(Player1,@1021)~EXIT
				END
				
				IF ~~ THEN BEGIN about_shanatar_finish_02
				SAY ~Ich erzähle sie Euch gerne immer wieder!~
				IF ~~ THEN EXIT
				END

IF ~~ THEN BEGIN 7 // from: 6.0
  SAY ~Das sind die Statuen von Diirinka und Diinkarazan. Ihr habt Recht, sie sehen wie Zwerge aus, und einst waren sie dies auch. Die beiden waren die Zwillingssöhne Moradins, und damit Geschwister von all den anderen Morndinsamman, die Berronar ihm gebar. Die Zwerge beteten Diinkarazan und Diirinka an, wie sie dies bei Clangeddin oder Sharindlar eben auch taten. Sie waren Schutzpatrone von Zwergenkönigreichen und schenkten ihren Anhänger Schutz und Wohlstand.~
  IF ~~ THEN GOTO 8
END

IF ~~ THEN BEGIN 8 // from: 7.0
  SAY ~Doch irgendwann befiel das Böse die beiden Zwillingsgötter, und sie begannen, habgierig und niederträchtig zu werden. In einem Versuch, noch mehr Macht zu erlangen, schlichen sie sich in die Hallen anderer böser Götter, um deren Macht zu erlangen.~ 
  IF ~~ THEN GOTO 9
END

IF ~~ THEN BEGIN 9 // from: 8.0
  SAY ~Diirinka verriet seinen Bruder, und dieser wurde in die Abyss verbannt. Aus Zorn über ihre bösen taten verbannte Moradin seine beiden Kinder aus seinen Hallen, und die Anhänger der beiden ehemaligen Zwergengötter wurden zu Derro, unseren  grausamen Vettern.~
  IF ~~ THEN REPLY ~Ich habe Fragen zu weiteren Exponaten.~GOTO 6
  IF ~~ THEN REPLY ~Mehr wollte ich gar nicht wissen. Lebt wohl.~ GOTO 5
END
