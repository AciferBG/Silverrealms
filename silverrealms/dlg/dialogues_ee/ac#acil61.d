/*******************************************************************************************************
Dwarven workers, to be rescued
*******************************************************************************************************/

BEGIN ~AC#61DW1~

IF ~True()~ THEN BEGIN hello
SAY ~Bei den Morndinsamman! Hier sind ja lauter Scheusale!~
IF ~~ THEN REPLY ~Sorni wartet am Eingang. Geht zu ihr und rettet Euch nach oben!~ GOTO 1
IF ~~ THEN REPLY ~Das ist nicht mein Problem.~ + not_my_cup_of_tea
END

IF ~~ THEN BEGIN not_my_cup_of_tea
SAY ~Oh! Was soll ich nur tun?~
IF ~~ THEN EXIT 
END

	IF ~~ THEN BEGIN 1
	SAY ~Oh! Danke für Eure Hilfe! Ich werde mich sofort auf den Weg machen.~
	IF ~~ THEN DO ~IncrementGlobal("RescueDwarves","ACIL61",1)
	EscapeArea()
   //EscapeAreaObject("TrAcil65A")~  EXIT
END

/*******************************************************************************************************
Dialog Sorni Arnschädel
*******************************************************************************************************/

BEGIN ~AC#SORN2~

IF ~Global("AC#SorniQuest","ACIL61",3)~ THEN BEGIN hello_escape
SAY ~Los, schnell nach oben!~
IF ~~ THEN DO ~SetGlobal("AC#SorniQuest","ACIL61",20)
EscapeArea()~ EXIT 
END

IF ~Global("AC#SorniQuest","ACIL61",2)~ THEN BEGIN hello_opengate
SAY ~Öfnnet das Wassertor, <CHARNAME>!~
IF ~~ THEN EXIT
END

IF ~Global("AC#SorniQuest","ACIL61",1)~ THEN BEGIN 1
SAY  ~Habt Ihr schon etwas in Erfahrung bringen können?~
++ ~Nein, noch nicht.~ + hurry_up
IF ~Global("AC#ACIL77TalkedToMalphas","GLOBAL",1)
Global("HeatUpOven","ACIL61",0)~ THEN REPLY ~Es gibt von der anderen Seite keine Möglichkeit, das Portal zu verschließen.~ + met_malphas
IF ~Global("AC#_Destroy_Oven","ACIL61",4)
Global("HeatUpOven","ACIL61",1)~ THEN REPLY ~Ich habe alle Öfen mit Anthrazit befeuert.~ + anthrazit_done
END

	IF ~~ THEN BEGIN hurry_up
	SAY ~Beeilt Euch Bitte. Ich habe das Gefühl, dass immer mehr Scheusale aus dem Portal drängen!~
	IF ~~ THEN DO ~~  EXIT
	END
	
	IF ~~ THEN BEGIN anthrazit_done
	SAY ~Oh, das ist gut. Jetzt bleibt uns nicht mehr viel Zeit.~
	IF ~~ THEN GOTO open_watergate
	END
	
		IF ~~ THEN BEGIN open_watergate
		SAY ~Hier ist der Schlüssel zum Wassertor. Ihr müsst das Tor öffnen und das Wasser einlassen. Danach habt Ihr nicht viel Zeit, die Halle zu verlassen. Sobald das Wasser auf die Schlacke in den Hochöfen trifft, wird es eine gewaltige Explosion geben.~
		IF ~~ THEN DO ~SetGlobal("AC#SorniQuest","ACIL61",2)
		SetGlobal("HeatUpOven","ACIL61",2)
		EraseJournalEntry(@61010)
		AddJournalEntry(@61011,QUEST)
		SetGlobal("AC#_Destroy_Oven","ACIL61",5)
		GiveItemCreate("AC#61KEY",LastTalkedToBy,1,0,0)~  EXIT
		END
	
	IF ~~ THEN BEGIN met_malphas
	SAY ~So, wie ich befürchtet hatte. Dann bleibt uns nur noch eine Möglichkeit.~
	IF ~~ THEN DO ~EraseJournalEntry(@61001)~ GOTO destroy_hall
	END
	
// hier Teil: Halle einstürzen lassen


		IF ~~ THEN BEGIN destroy_hall
		   SAY ~Wir müssen die gesamte Halle zum Einsturz bringen.~
		++ ~Wie Bitte? Ihr wollt das alles zerstören? Was wird aus der Schmiede und den Öfen?~ + 9
		IF ~IsValidForPartyDialog("Korgan")~ THEN EXTERN ~KORGANJ~ Korgan_comment_destruction
		END

		IF ~~ THEN BEGIN 9
		   SAY ~Alles, was Ihr hier seht, wäre dann unter einem riesigen Berg Stein begraben. Eine neue Gießerei könnten wir in einigen Jahrzehnten wieder aufbauen, eine gesamte Stadt nicht mehr.~
		++ ~Und wenn die ganze Stadt ebenso in sich zusammenbricht?~ + 10
		IF ~IsValidForPartyDialog("Edwin")~ THEN EXTERN ~EDWINJ~ edwin_comment_halls
		END

		IF ~~ THEN BEGIN 10
		   SAY ~Das wird nicht passieren, denn die Arnschädel- und Azerkyn-Hallen sind auf der anderen Seite des Flusses. Es wäre wie bei einer faulen und nässenden Wunde- besser, den kranken Körperteil abtrennen, als durch die Fäulnis komplett zugrundegerichtet zu werden.~
		++ ~Wie wollt Ihr das denn überhaupt hinbekommen? Und was ist mit den Arbeitern?~ + 11
		IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ Jaheira_wound_comment
		END

		IF ~~ THEN BEGIN 11
		   SAY ~Ich habe alle Arbeiter, die ich erreichen konnte, bereits nach draußen geschickt. Um ehrlich zu sein, habe ich das Loch in die Kuppel geschlagen, um meinen Leuten die Flucht zu ermöglichen. Um die Halle einstürzen zu lassen, brauche ich Eure Hilfe.~
		++ ~Wie schön.~ + 12
		IF ~GlobalGT("EarQ1","GLOBAL",1)~ THEN REPLY ~Ich habe im Unterreich schon einmal eine Grube zum Einsturz bringen müssen, nachdem ich gegen einen Dämon gekämpft habe. Und diese Grube war wesentlich kleiner als diese ganze Halle.~ + 12
		END

		IF ~~ THEN BEGIN 12
		   SAY ~Erwähnte nicht einer von Euch einmal, schon einmal eine ganze Mine des Orothiar-Clans überflutet zu haben?~
		++ ~Das ist richtig, ja. Aber ich bezweifle, ob sich Scheusale aus den unteren Ebenen von ein bisschen Wasser aufhalten lassen würden.~ + 13
		END

		IF ~~ THEN BEGIN 13
		   SAY ~Seht, ich will Euch erklären, was ich vorhabe. Wasser allein wird hier nichts nützen, das ist wohl wahr. Aber die ganze Halle ist voll Lava und Hochöfen. Wenn Wasser auf diese Massen trifft, gibt es eine riesige Dampfexplosion. Größer als alles, was Zauberer und Priester mit mächtiger Magie hervorrufen könnten. Bevor wir Wasserschleusen öffnen, müssen wir alles Eisen in den Hochöfen zum Schmelzen bringen und die Öfen so stark mit Anthrazit anfeuern, dass die Explosion groß genug ist, um den Biestern das Gemisch aus flüssigem Eisen und Lava um die Hörner fliegen zu lassen.~
		++ ~Ich habe schon gegen genug der Kreaturen gekämpft, um zu wissen, dass diese Wesen gegen Hitze absolut immun sind.~ + 14
		END

		IF ~~ THEN BEGIN 14
		   SAY ~Das musste ich leider auch schon feststellen. Aber gegen eine herabstürzende Höhlendecke sind sie machtlos. Wir schaffen Ihnen einen riesigen, undurchdringlichen Sarkophag und versiegeln das Portal unter Tonnen von Schutt und erstarrtem Eisen.~
		++ ~In dem wir dann selber bis in alle Ewigkeit feststecken werden?~ + 15
		END

		IF ~~ THEN BEGIN 15
		   SAY ~Wenn wir schnell sind, werden wir es alle bis nach draußen schaffen.~		
		IF ~~ THEN REPLY ~Was ist mit Bresk? Er ist doch auch hier irgendwo!~ GOTO bresk_01
		++ ~Was müssen wir also tun, um die Halle zum Einsturz zu bringen?~ + heat_up_oven
		END
		
				IF ~~ THEN BEGIN bresk_01
				SAY ~Ich hatte Bresk auf der anderen Seite getroffen und zurück nach oben geschickt, damit er dort die Arbeiter gegen die Scheusale verteidigen kann. Um ihn müsst Ihr Euch zunächst keine Sorgen machen.~		   
				++ ~Was müssen wir also tun, um die Halle zum Einsturz zu bringen?~ + heat_up_oven
				END
		
			IF ~~ THEN BEGIN heat_up_oven
			SAY ~Zunächst die Öfen anheizen. Wir haben hier unten viele Anthrazitquellen. Wisst Ihr, was Anthrazit ist?~
			IF ~~ THEN REPLY ~Ja.~ GOTO anthrazit_yes
			IF ~~ THEN REPLY ~Nein.~ GOTO anthrazit_no
			END
			
				IF ~~ THEN BEGIN anthrazit_yes
				SAY ~Gut.~				
				IF ~!PartyHasItem("ac#antr1")~ THEN GOTO heat_up_oven_02
				IF ~PartyHasItem("ac#antr1")~ THEN REPLY ~Ich glaube, ich habe schon etwas von diesem Anthrazit bei mir.~ + even_better
				END
				
				IF ~~ THEN BEGIN anthrazit_no
				SAY ~Anthrazit ist brennbares Gestein. Es ist härter als Kohle und brennt mit kräftiger Flamme. Dadurch kann man eine enorme Hitze erzeugen. Das kommt uns jetzt zugute.~
				IF ~!PartyHasItem("ac#antr1")~ THEN GOTO heat_up_oven_02
				IF ~PartyHasItem("ac#antr1")~ THEN REPLY ~Ich glaube, ich habe schon etwas von diesem Anthrazit bei mir.~ + even_better
				END
				
						IF ~~ THEN BEGIN even_better
						SAY ~Noch besser!~
						IF ~~ THEN GOTO heat_up_oven_02
						END
				
					IF ~~ THEN BEGIN heat_up_oven_02
					SAY ~Ihr müsst die drei Hochöfen auf dieser Seite des Lavaflusses mit Anthrazit befeuern und die geschmolzene Masse darin richtig zum Kochen bringen.~
					IF ~~ THEN REPLY ~Ich werde es versuchen.~ GOTO heat_up_oven_03
					IF ~Global("AC#_Destroy_Oven","ACIL61",4)~ THEN REPLY ~Ich alle bereits alle Öfen mit Anthrazit befeuert.~ + anthrazit_done_surprise					
					END
					
						IF ~~ THEN BEGIN anthrazit_done_surprise
						SAY ~Was? Ihr seid ja schneller als ein Vrock!~
						IF ~~ THEN GOTO open_watergate
						END
						
							IF ~~ THEN BEGIN heat_up_oven_03
							SAY ~Ich warte hier. Passt nur auf, dass Ihr Euch nicht verbrennt! Kehrt schnell zu mir zurück, wenn alle drei Hochöfen am Brennen sind.~
							IF ~~ THEN DO ~SetGlobal("HeatUpOven","ACIL61",1)
							AddJournalEntry(@61010,QUEST)~  EXIT
							END



IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY  ~Den Göttern sei Dank, dass Ihr kommt, <CHARNAME>! Ich stehe hier allein gegen die Horde Unholde, und ich weiß nicht, wie lange ich noch standhalten kann.~
++ ~Bresk hat mich hier heruntergeschickt, um Euch zu helfen. Wie ist die Lage?~ + 2
END

IF ~~ THEN BEGIN 2
SAY ~Nicht gut. Ich habe zwar mit Hilfe meines Schmetterhorns den südlichen Aufgang zum Einsturz bringen können, doch das wird die Biester sicher nicht lange aufhalten. Es drängen immer weitere in diese Hallen, wenngleich es gerade etwas ruhiger geworden ist. Doch ich habe das Gefühl, sie sammeln sich für die nächste Angriffswelle, denn es strömen immer wieder Scheusale durch das Portal.~
++ ~Wer hat das Portal geöffnet?~ + 3
/*
IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ Jaheira_Comment_Dumathoin
IF ~!IsValidForPartyDialog("Jaheira")~ THEN REPLY ~Was ist hier geschehen?~ + 3
*/
END

IF ~~ THEN BEGIN 3
   SAY ~Wer es geöffnet hat - ich weiß es nicht. Ich wagte nicht, einen Blick auf die andere Seite zu werfen. Das Schreckliche ist, dass ich mir mittlerweile sicher bin, dass das Portal schon die ganze Zeit da war. Es war nur versiegelt, doch nun ist es den Wesen von der anderen Seite gelungen, die Siegel zu durchbrechen.~
++ ~Es war schon immer da? Wohin führt es denn? Und wer hat es angelegt?~ + 4
++ ~Ich habe so eine Ahnung, wie das Portal wieder eröffnet worden sein könnte. Wo führt es hin?~ + 4
END

IF ~~ THEN BEGIN 4
   SAY ~Es führt direkt in das Feuer, <CHARNAME>. Wir haben nicht viel Zeit zu Erklärungen, doch ich denke, ich sollte Euch kurz erzählen, was ich darüber weiß.~
++ ~Ihr habt es schon vorher gewusst und in Kauf genommen, dass unter der Stadt ein Zugang in andere Ebenen existiert?~ + 5
IF ~~ THEN REPLY ~Ich höre.~ + about_portal
END

	IF ~~ THEN BEGIN 5
	SAY ~Was hätte ich denn machen sollen? Die Bewohner Iltkazars lebten seit Jahrhunderten mit diesem Portal, und es war ein steter Quell glühender Hitze für unsere Schmiedeöfen.~ 
	IF ~~ THEN + about_portal
	IF ~IsValidForPartyDialog("Viconia")~ THEN EXTERN ~VICONIJ~ viconia_comment_portal
	END
   
	IF ~~ THEN BEGIN about_portal
	SAY ~Ich denke, dass das Portal ursprünglich von Clan Azerkyn angelegt worden ist. Diesem Clan hat unsere Halle hier ihren Namen zu verdanken. Der Azerkyn-Clan trug Blut der Feuerebene in sich, und er hatte dementsprechend immer eine Affinität zu heißen Orten. Die Mitglieder der Azerkyns haben an zahlreichen Stellen Portale zur Feuerebene genutzt, um ihre herausragenden Hochöfen zu befeuern.~
	++ ~Ihr meint, die Azerkyn haben in Iltkazar ein Portal in die Feuerebene erschaffen?~ + 6
	END

IF ~~ THEN BEGIN 6
   SAY ~Ich weiß es nicht. Man kann sie nicht mehr fragen, denn der Azerkyn-Clan und sein Reich Xothaerin sind schon lange von dieser Welt verschwunden. Vielleicht gibt es in den Aufzeichnungen unserer Bibliothek Hinweise darüber, aber darüber solltet Ihr mit Bettargh reden und nicht mit mir.~
IF ~~ THEN REPLY ~Ich hatte vor einiger Zeit ein Zepter dieses Clans in der Hand, das mir aber wieder von einem Scheusal gestohlen wurde.~ GOTO xothaerin_scepter
END

	IF ~~ THEN BEGIN xothaerin_scepter
	SAY ~Ihr hattet ein Herrschaftszepter Xothaerins? Das erklärt einiges. Warum sagt Ihr das erst jetzt?~
	IF ~~ THEN REPLY ~Weil ich nicht wusste, dass es wichtig war.~ GOTO no_time
	IF ~~ THEN REPLY ~Ich hatte es zwischenzeitlich vergessen.~ + no_time
	END

IF ~~ THEN BEGIN no_time
SAY ~Egal. Wir vergeuden gerade sowieso viel zu viel Zeit, <CHARNAME>. Wenn wir nichts tun, wird die Stadt untergehen.~
++ ~Was sollen wir denn Eurer Meinung nach unternehmen?~ + check_portal
END

	IF ~~ THEN BEGIN check_portal
	SAY ~Die einfachste Möglichkeit bestünde darin, durch das Portal auf die andere Seite zu wechseln und zu sehen, ob es von dort irgendwie wieder verschlossen werden kann. Ehrlich gesagt glaube ich nicht, dass dies klappen wird, aber es wäre einen Versuch wert.~
	IF ~~ THEN REPLY ~Ihr wollt, dass ich durch das Portal schreite?~ GOTO walk_portal
	END
	
	IF ~~ THEN BEGIN walk_portal
	SAY ~Ja, Ich kann das nicht tun. Hathar hatte damals am Eisensee Recht. Ich bin kein Krieger. Meine Aufgabe ist es, alle Überlebenden nach draußen zu geleiten. Wenn jemand durch das Portal schreiten kann, dann seid Ihr das.~
	++ ~Ich werde mir das Portal einmal ansehen.~ + check_portal_02
	END

		IF ~~ THEN BEGIN check_portal_02
		SAY ~Ich danke Euch. Geht und seht Euch das Feuertor aus der Nähe an. Aber die Zeit arbeitet gegen uns, <CHARNAME>. Ich werde solange hier warten. Wenn Ihr Überlebende in diesen verfluchten Hallen findet, schickt sie zu mir, damit ich sie sicher nach draußen schicken kann.~
		IF ~~ THEN DO ~SetGlobal("AC#SorniQuest","ACIL61",1)
		AddJournalEntry(@61000,QUEST)
		AddJournalEntry(@61020,QUEST)~  EXIT
		END

/******************************************************************
NPC comments
*****************************************************************/
// Jaheira
APPEND ~JAHEIRAJ~
IF ~~ THEN BEGIN Jaheira_wound_comment
   SAY ~Ein passender Vergleich. Der Vorschlag klingt scheußlich, aber vernünftig.~
   IF ~~ THEN EXTERN ~AC#SORN2~ 11
END
END

// Edwin
APPEND ~EDWINJ~
IF ~~ THEN BEGIN edwin_comment_halls
   SAY ~Mit etwas Glück könnte sogar die ganze Stadt zusammenstürzen und wir hätten endlich unsere Ruhe!~
   IF ~~ THEN EXTERN ~AC#SORN2~ 10 
END
END

// Korgan
APPEND ~KORGANJ~
IF ~~ THEN BEGIN Korgan_comment_destruction
   SAY ~Ha! Das wird ein Spektakel!~
   IF ~~ THEN REPLY ~Ihr wollt das alles zerstören? Was wird aus der Schmiede und den Öfen?~ EXTERN ~AC#SORN2~ 9
END
END

APPEND ~VICONIJ~
IF ~~ THEN BEGIN viconia_comment_portal
   SAY ~Wie töricht von den Zwergen! Vor lauter Gier trifft sie nun eine gerechte Strafe. Und jetzt wird wieder gejammert. Sollen sie doch selbst sehen, wie sie sich aus diesem Unheil retten!~
   IF ~~ THEN EXTERN ~AC#SORN2~ about_portal  
END
END
