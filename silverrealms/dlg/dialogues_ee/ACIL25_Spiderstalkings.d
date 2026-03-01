/*******************************************************************************************************
Dialog Githyanki
*******************************************************************************************************/

BEGIN AC#25GI1

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#25GI1 hello_0
~Die Schleier sind dünn an diesem Ort. Und Ihr seid nicht allein.~
END
IF ~~ THEN REPLY ~Wer seid Ihr?~ EXTERN AC#25GI1 hall_of_bloodmoon_02
IF ~~ THEN REPLY ~Was sucht Ihr hier?~ EXTERN AC#25GI1 hall_of_bloodmoon_02
IF ~~ THEN REPLY ~Verschwindet.~ EXTERN AC#25GI1 hall_of_bloodmoon_03

CHAIN AC#25GI1 hall_of_bloodmoon_02
~Ihr stellt die falschen Fragen. Hütet Euch davor, die richtigen zu stellen!~
END
IF ~~ THEN EXTERN AC#25GI1 hall_of_bloodmoon_03

CHAIN AC#25GI1 hall_of_bloodmoon_03
~Wir beobachten. Noch. Vielleicht kreuzen sich unsere Wege erneut. Bleibt außerhalb dessen, was folgt.~
END
IF ~~ THEN DO ~SetGlobal("GithTeleport","ACIL25",1)~EXIT

/*******************************************************************************************************
Dialog Tür
*******************************************************************************************************/

BEGIN ~AC#25DO1~

IF ~True()~ THEN BEGIN 0
SAY ~Ein riesiger Kopf eines Zwergenkriegers ruht am Fuße der Treppe. Er blickt Euch mit einem ernsten und fragenden Ausdruck in seinem steinernen Gesicht an. Seine Augen scheinen manchmal zwischen der Tür und Euch hin und herzuwandern.~
IF ~~ THEN REPLY ~Öffne die Tür für mich!~ + do_nothing
IF ~GlobalGT("AC#25_Bloodmoon","GLOBAL",0)~ THEN REPLY ~Ich trete ein im Namen Clangeddin Silberbarts.~ + do_nothing
IF ~GlobalGT("AC#25_Bloodmoon","GLOBAL",0)~ THEN REPLY ~Ich trete ein im Namen Dumathoins.~ + do_nothing
IF ~GlobalGT("AC#25_Bloodmoon","GLOBAL",0)~ THEN REPLY ~Ich trete ein im Namen Moradins.~ + do_nothing
IF ~GlobalGT("AC#25_Bloodmoon","GLOBAL",0)~ THEN REPLY ~Ich trete ein im Namen Selunes und Clangeddin Silberbarts.~ + door_open
END

IF ~~THEN BEGIN do_nothing
SAY ~Die Tür bewegt sich nicht.~ 
   IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN door_open
SAY ~Einen kurzen Moment geschieht nichts, doch dann hört Ihr, wie sich ein unsichtbarer Mechanismus in Bewegung setzt. Mit einem lauten Quietschen öffnet sich die Tür, und Ihr spürt die Brise von kühler Luft, die aus den Tunneln jenseits der verschlossenen Tür ausströmt.~
IF ~~ THEN  DO ~SetGlobal("AC#Door25","ACIL25",2)
EraseJournalEntry(@23000)~ EXIT
END

/*******************************************************************************************************
Dialog mit Drow-Guard
*******************************************************************************************************/

BEGIN ~AC#DROW8~

IF ~~ THEN BEGIN more_drow
SAY ~Für diese Beleidigung werdet Ihr mit Eurem *qu'lith* bezahlen, dreckiger <PRO_RACE>!~
IF ~~ THEN  EXTERN ~AC#DROW6~ wait
END

IF ~~ THEN BEGIN whats_next
SAY ~Was sollen wir jetzt tun, Ilharess?~
IF ~~ THEN  EXTERN ~AC#DROW6~ whats_next_02
END

IF ~~ THEN BEGIN whats_next_03
SAY ~Und wenn sich hier doch noch die Geflüchteten aufhalten? Und sollten wir nicht wenigstens den Schrein dieser abtrünnigen Göttin hier vollständig entweihen, damit sich keiner mehr an ihrem Segen laben kann?~
IF ~~ THEN  EXTERN ~AC#DROW6~ whats_next_04
END																																																																																																																																																			
/*******************************************************************************************************
Dialog mit Zilna Khaven-Ghell
*******************************************************************************************************/

BEGIN ~AC#DROW6~

IF ~GlobalGT("AC#25PactLolthPriestess","GLOBAL",0)~ THEN BEGIN hello_killed_vhaeraun
SAY ~Da seid Ihr ja wieder, <PRO_RACE>. Habt Ihr mir das verfluchte Symbol dieses Vhaeraun-Priesters mitgebracht?~
IF ~PartyHasItem("AC#ILVHA")~ THEN REPLY ~Ja, hier ist es.~ DO ~TakePartyItem("AC#ILVHA") DestroyItem("AC#ILVHA")~ GOTO yes_vhaeraun_symbol
IF ~~ THEN REPLY ~Nein, noch nicht.~ GOTO no_vhaeraun_symbol_yet
END

				IF ~~ THEN BEGIN no_vhaeraun_symbol_yet
				SAY ~Dann solltet Ihr Euch besser beeilen! Meine Rasse ist nicht für ihre Geduld mit Euch *iblith* bekannt.~
				IF ~~ THEN EXIT 
				END
				
							IF ~~ THEN BEGIN yes_vhaeraun_symbol
							SAY ~Exzellent! Unsere Arbeit hier ist also getan.~
							=
							~Habt Dank für Eure Hilfe, <PRO_RACE>. Nicht viele können von sich behaupten, dass ihnen eine Ilharess gnädig gesonnen war. Hier, *iblith*, für Eure Mühen, eine Belohnung. Mehr seid Ihr nicht wert. Wir werden in unsere Stadt zurückkehren und unseren Sieg feiern. Gehen wir!~
							IF ~~ THEN DO ~GiveItemCreate("AC#ILRI5",Player1,1,0,0)
							SetGlobal("AC#25_LolthPriestess","GLOBAL",20)
							SetGlobal("AC#25PactLolthPriestess","GLOBAL",10)
							AddJournalEntry(@62030,QUEST_DONE)~ EXIT
							END


IF ~~ THEN BEGIN hey_you
SAY ~Ihr da, <PRO_RACE>! Was habt Ihr hier zu schaffen?~
IF ~~ THEN REPLY ~Dasselbe könnte ich Euch fragen.~ + same_question
IF ~~ THEN REPLY ~Das geht Euch nichts an.~ + same_question
IF ~~ THEN REPLY ~Noch mehr Drow? Mit Euch werde ich genau so leicht fertig wie mit den anderen!~ EXTERN ~AC#DROW8~ more_drow
IF ~~ THEN REPLY ~Habe gerade ein paar Drow getötet.~ EXTERN ~AC#DROW8~ more_drow
END

	IF ~~ THEN BEGIN same_question
	SAY ~Normalerweise würde ich Euch allein für diese Frechheit einen qualvollen Tod bereiten lassen. Doch ich habe nicht viel Zeit, deshalb gebe ich Euch eine zweite Chance.~
	=
	~Ich bin Ilharess Zilna vom Hause Khaven-Ghell. Wir hegen keine bösartigen Absichten gegen Euch, <PRO_RACE>.~
	IF ~~ THEN REPLY ~Ich bin <CHARNAME>, und dies sind meine Gefährten.~ + more_drow_2
	IF ~~ THEN REPLY ~Das ist mir egal. Ich werde Euch trotzdem töten.~ + kill_drow
	IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ Jaheira_comment_drow
	END
	
	IF ~~ THEN BEGIN wait
	SAY ~Warte, *wael*! Ab jetzt rede *ich* mit diesem Oberflächen-<PRO_RACE>.~
	=
	~Steht still, Fremdlinge. Ich bin Ilharess Zilna vom Hause Khaven-Ghell. Wir hegen keine bösartigen Absichten gegen Euch, <PRO_RACE>.~
	IF ~~ THEN REPLY ~Ich bin <CHARNAME>, und dies sind meine Gefährten.~ + more_drow_2
	IF ~~ THEN REPLY ~Das ist mir egal. Ich werde Euch trotzdem töten.~ + kill_drow
	IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ Jaheira_comment_drow
	END

		IF ~~ THEN BEGIN more_drow_2
		SAY ~Ihr erwähntet, dass Ihr hier noch andere unserer Rasse begegnet seid. Was ist mit ihnen geschehen?~
		IF ~!IsValidForPartyDialog("Minsc")~ THEN REPLY ~Ich habe sie alle getötet.~ + killed_all_drow
		IF ~IsValidForPartyDialog("Minsc")~ THEN REPLY ~Ich habe sie alle getötet.~ EXTERN ~MINSCJ~ Minsc_confused	
		IF ~~ THEN REPLY ~Sie verstecken sich in einem zerfallenen Tempel südlich von hier.~ EXTERN AC#DROW6 chain_tell_about_vhaeraun_01
		IF ~~ THEN REPLY ~Ich tausche keine Freundlichkeiten mit einer Drow aus! Zeit zu sterben!~ + kill_drow
		END
		
				IF ~~ THEN BEGIN drow_minsc_confused_01
				SAY ~Was redet Euer Gefährte dort? Erklärt Euch!~
				IF ~~ THEN REPLY ~Er ist manchmal etwas verwirrt. Minsc, würdet Ihr dieser Dame Euren Tiergefährten zeigen?~ EXTERN ~MINSCJ~ Minsc_show_boo 
				IF ~~ THEN REPLY ~Mein Gefährte hat Recht. Die von Euch gesuchten Drow verstecken sich in einem zerfallenen Tempel südlich von hier.~ EXTERN AC#DROW6 chain_tell_about_vhaeraun_01
				END
		
			IF ~~ THEN BEGIN killed_all_drow
			SAY ~Entweder Ihr seid ein Aufschneider oder ein mächtiger Vertreter Eurer Rasse. Im ersteren Fall würden wir Euch töten, im Zweiten würden wir Euch gehen lassen und nicht weiter behelligen. Sprecht also schnell: Habt Ihr irgendwelche Beweise, dass Ihr es hier mit Vertretern unserer Rasse aufnehmen konntet?~
			IF ~~ THEN REPLY ~Ich habe eine der Leichen hier bei mir. Seht her.~ DO ~TakePartyItem("AC#DDRO2") DestroyItem("AC#DDRO2")~ + have_a_corpse
			IF ~~ THEN REPLY ~Die von Euch gesuchten Drow verstecken sich in einem zerfallenen Tempel südlich von hier.~ EXTERN AC#DROW6 chain_tell_about_vhaeraun_01
			IF ~~ THEN REPLY ~Ich tausche keine Freundlichkeiten mit einer Drow aus! Zeit zu sterben!~ + kill_drow
			END
			
				IF ~~ THEN BEGIN have_a_corpse
				SAY ~In der Tat, das ist ein Drow. Oh, ich erkenne die Tätowierungen am Hals. Das ist ein Magier aus Sshamath!~
				=
				~Er stammt aus dem Hause Helviiryn, der Schule der Verwandlung.~
				=
				~Sagt, habt Ihr noch andere Drow hier gesehen?~
				IF ~~ THEN REPLY ~Nur ein paar seiner Leibwächter. Die sind jetzt alle tot.~ + no_more_drow
				END
				
					IF ~~ THEN BEGIN no_more_drow
					SAY ~Alle tot. Hmm...~
					IF ~~ THEN  EXTERN ~AC#DROW8~ whats_next
					END
					
						IF ~~ THEN BEGIN whats_next_02
						SAY ~Die Suche ist hiermit beendet. Wir kehren nach Guallidurth zurück.~
						IF ~~ THEN  EXTERN ~AC#DROW8~ whats_next_03
						END
						
							IF ~~ THEN BEGIN whats_next_04
							SAY ~Das ist mir alles egal. Wir haben den Leichnam eines Magiers aus dieser Männerstadt. Das dürfte meiner Mutter genügen. Ich kann es mir nicht erlauben, hier noch länger zu verweilen, während dieses Miststück Zollgarza zuhause an meinem Stuhl sägt.~
							=
							~Habt Dank für Eure Hilfe, <PRO_RACE>. Nicht viele können von sich behaupten, dass ihnen eine Ilharess gnädig gesonnen war. Wir werden in unsere Stadt zurückkehren und Euch nicht weiter behelligen.~
							IF ~~ THEN DO ~SetGlobal("AC#25_LolthPriestess","GLOBAL",3)
							AddJournalEntry(@62026,QUEST)~ EXIT
							END
							
							IF ~~ THEN BEGIN kill_drow
							SAY ~Was für ein dummer Oberflächen-<PRO_RACE> Ihr doch seid. Legt sich gleich mit einer Ilharess an. Kommt, Männer, zeigen diesem Wurm einmal, wer die Herren des Unterreiches sind!~
							IF ~~ THEN DO ~Shout(151)
							Enemy()~ EXIT
							END


//----------------------------------------
// CHAIN
// ---------------------------------------
CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#DROW8 chain_see_pc
~Seht, Ilharess Khaven-Ghell! Eine Gruppe mit einem <PRO_RACE> von der Oberfläche! Zieht Eure Schwerter, Männer!~
== AC#DROW6 ~Beruhigt Euch, *sargtlin*. Vielleicht können uns diese *ryld* von Nutzen sein.~
END
IF ~~ THEN EXTERN ~AC#DROW6~ hey_you

CHAIN AC#DROW6 chain_tell_about_vhaeraun_01
~Was? Dann ist es tatsächlich wahr, dass sich die *dobluth* hier verkrochen haben? Was haben sie Euch gesagt?~
END
IF ~~ THEN REPLY ~Ich soll Euch glauben machen, dass ich sie alle getötet habe und Euch diese Leiche übergeben.~ DO ~TakePartyItem("AC#DDRO2") DestroyItem("AC#DDRO2")~ EXTERN ~AC#DROW6~ chain_tell_about_vhaeraun_02

	CHAIN AC#DROW6 chain_tell_about_vhaeraun_02
	~Das ist ein Magier aus Sshamath, den Ihr mir da präsentiert. Aber die meisten Drow halten sich versteckt, sagt Ihr? Vhaeraun-Anhänger, nehme ich an?~
	END
	IF ~~ THEN REPLY ~Was ist Euch diese Information wert?~ EXTERN ~AC#DROW6~ chain_what_info_worth
	
		CHAIN AC#DROW6 chain_what_info_worth
		~Mir? Nichts. Aber Euch Euer Leben, *pera'dene*. Und meine Gunst. Also sprecht schnell, wenn Ihr überhaupt eine Belohnung in Erwägung zieht.~
		END
		IF ~~ THEN REPLY ~Sie verstecken sich in einem entweihten Tempel Lolths.~ EXTERN ~AC#DROW6~ chain_tell_about_vhaeraun_03
		
		CHAIN AC#DROW6 chain_tell_about_vhaeraun_03
		~*Cha'kohk*!~
		== AC#DROW8 ~Sollen wir in diesen Tempel marschieren und die Abtrünnigen vernichten, Ilharess?~
		== AC#DROW6 ~Nein. Das wird unser neuer *abbil* hier für uns erledigen.~
		= ~Ihr da, <PRO_RACE>! Euch wird die Ehre zuteil, diese Häretiker auszuschalten! Kehrt mit dem Symbol des Vhaeraun-Priesters, an das er sich so verzweifelt klammert, als Beweis für Eure gute Tat zu mir zurück. Neben meiner Gunst werdet Ihr eine fürstliche Belohnung erhalten.~
		END
		IF ~~ THEN REPLY ~Ich werde Euch nicht enttäuschen.~ EXTERN ~AC#DROW6~ chain_yes_kill_vhaeraun_not_disappoint
		IF ~~ THEN REPLY ~Ist so gut wie erledigt.~ EXTERN ~AC#DROW6~ chain_yes_kill_vhaeraun
		IF ~~ THEN REPLY ~Ich weiß nicht...~ EXTERN ~AC#DROW6~ chain_no_kill_vhaeraun
		
			CHAIN AC#DROW6 chain_no_kill_vhaeraun
			~Wie dumm seid Ihr eigentlich? Ihr habt mir von ihnen erzählt, also werdet Ihr sie auch für mich töten.~
			END
			IF ~~ THEN EXTERN ~AC#DROW6~ chain_yes_kill_vhaeraun 
			
			CHAIN AC#DROW6 chain_yes_kill_vhaeraun_not_disappoint
			~Natürlich werdet Ihr das.~
			END
			IF ~~ THEN EXTERN ~AC#DROW6~ chain_yes_kill_vhaeraun 
		
		CHAIN AC#DROW6 chain_yes_kill_vhaeraun
		~Jetzt verschwindet und kümmert Euch um diese Vhaerauniten!~
		END
		IF ~~ THEN DO ~SetGlobal("AC#25PactLolthPriestess","GLOBAL",1)
		AddJournalEntry(@62028,QUEST)~ EXIT




//----------------------------------------
// NPCs
// ---------------------------------------
// Jaheira
APPEND ~JAHEIRAJ~
IF ~~ THEN BEGIN Jaheira_comment_drow
   SAY ~Es überrascht mich immer wieder, wie überzeugend Drow lügen können.~
   IF ~~ THEN REPLY ~Seid gegrüßt, Ilharess. Ich bin <CHARNAME>, und dies sind meine Gefährten.~ EXTERN ~AC#DROW6~ more_drow_2
END

IF ~~ THEN BEGIN Jaheira_minsc_confused
   SAY ~Minsc...~
   IF ~~ THEN EXTERN ~AC#DROW6~ drow_minsc_confused_01
END
END

// Minsc
APPEND ~MINSCJ~
IF ~~ THEN BEGIN Minsc_confused
   SAY ~Minsc versteht nicht, <CHARNAME>. Wir haben doch extra alle am Leben gelassen?~
   IF ~~ THEN EXTERN ~AC#DROW6~ drow_minsc_confused_01
   IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ Jaheira_minsc_confused
END

IF ~~ THEN BEGIN Minsc_show_boo
   SAY ~Oh! Gerne! Seht her, Drow-Dame! Mein Miniatur-Riesenhamster!~
   IF ~~ THEN EXTERN ~AC#DROW6~ killed_all_drow
END
END



