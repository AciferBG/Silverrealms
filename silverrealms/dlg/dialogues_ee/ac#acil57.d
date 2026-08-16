/*******************************************************************************************************
Turbaern-Dialog
*******************************************************************************************************/
BEGIN ~AC#TURB1~

IF ~Global("Retrieve_Hammer","ACIL57",1)~ THEN BEGIN hello_hammer
SAY  ~Habt Ihr den Hammer gefunden?~
IF ~PartyHasItem("AC#HADUM")~ THEN REPLY ~Ja, hier ist er.~ + has_hammer
IF ~!PartyHasItem("AC#HADUM")~ THEN REPLY ~Nein. Ich bin noch auf der Suche.~ + search_hammer
END

IF ~NumTimesTalkedToGT(0)~ THEN BEGIN Hello_again
SAY  ~Wie sieht es aus? Konntet Ihr Durhgathu schon zur Rechenschaft ziehen?~
IF ~Dead("AC#DURG1")~ THEN REPLY ~Ja, die Zwergin ist tot. Sie hatte einen Dämon beschworen!~ + durhgathu_is_dead
IF ~!Dead("AC#DURG1")~ THEN REPLY ~Nein, ich bin noch auf der Suche nach ihr.~ + keep_on_trying
IF ~!Dead("AC#BANS1")
Global("AC#MournInfo","ACIL57",1)~ THEN REPLY ~Was ist das für ein Wehklagen in der östlichen Kammer?~ + mourning
IF ~Dead("AC#BANS1")~ THEN REPLY ~In der östlichen Kammer war hinter einer zugemauerten Tür eine Todesfee!~ + banshee
END

	IF ~~ THEN BEGIN durhgathu_is_dead
	SAY ~Das sind großartige Neuigkeiten! Habt Ihr unseren heiligen Hammer?~
	IF ~PartyHasItem("AC#HADUM")~ THEN REPLY ~Ja, hier ist er.~ + has_hammer
	IF ~!PartyHasItem("AC#HADUM")~ THEN REPLY ~Nein. Hätte ich den etwa mitnehmen sollen?~ + no_hammer
	END
	
		IF ~~ THEN BEGIN no_hammer
		SAY ~Aber natürlich! Er ist das Heiligtum unseres Tempels. Bitte sucht ihn, ohne ihn könen wir nicht von diesem Ort verschwinden.~
		IF ~~ THEN DO ~SetGlobal("Retrieve_Hammer","ACIL57",1)~  EXIT
		END
		
		IF ~~ THEN BEGIN search_hammer
		SAY ~Bitte beeilt Euch! Ich weiß nicht, wie lange ich hier noch durchhalte!~
		IF ~~ THEN DO ~~  EXIT
		END
		
		IF ~~ THEN BEGIN has_hammer
		SAY ~Ihr seid ein großartiger <PRO_RACE>! Wenn Ihr mich nach oben tragen könntet, kann ich Euch den Weg aus dieser Krypta weisen!~
		IF ~~ THEN DO ~GiveItemCreate("AC#57TUR",Player1,1,0,0)
		AddJournalEntry(@58008,QUEST)
		DestroySelf()~  EXIT
		END
	
	IF ~~ THEN BEGIN keep_on_trying
	SAY ~Beeilt Euch Bitte! Ich möchte mir gar nicht ausmalen, was diese *norogh* gerade für Schäden anrichtet!~
	IF ~~ THEN DO ~~  EXIT
	END
	
	IF ~~ THEN BEGIN mourning
	SAY ~Haltet Euch von dieser Kammer fern! Unsere Urahnen haben dort etwas unbeschreiblich Böses eingesperrt!~
	++ ~Was für eine Art Böses soll das denn sein?~ + mourning02
	END
	
		IF ~~ THEN BEGIN mourning02
		SAY ~Ich weiß es nicht. Es ist überliefert, dass dort einige Elfen begraben liegen. Das allein sollte schon reichen, einen großen Bogen um dieses Gebiet zu machen. Konzentriert Euch auf Eure Aufgabe, <PRO_RACE>, und vergeudet keine unnötigen Kräfte!~
		IF ~~ THEN DO ~~  EXIT
		END

	IF ~~ THEN BEGIN banshee
	SAY ~Bei dem Hüter unter dem Berge! Dann waren die Geschichten also wahr, dass unsere Vorfahren hier eine elfische Prinzessin eingesperrt hatten!~
	++ ~Wozu diese grausame Tat?~ + why_banshee
	END
	
		IF ~~ THEN BEGIN why_banshee
		SAY ~Einst waren wir Zwerge mit den Elfen dieser Region verbündet. Doch die Elfen haben uns im Stich gelassen. Die Legende besagt, dass unser damaliger König die Tochter des Elfenherrschers als Faustpfand hier gefangen genommen hatte.~
		++ ~"Gefangennehmen" ist wohl kaum der richtige Ausdruck, jemanden bei lebendigem Leibe einzumauern!~ + why_banshee_02
		END
		
			IF ~~ THEN BEGIN why_banshee_02
			SAY ~Hört zu, <CHARNAME>, wir können nicht für alles, was unsere Ahnen getan haben, die Verantwortung übernehmen. Unsere einzige Möglichkeit ist, es besser zu machen. Helft mir also Bitte, die verrückte Zwergin zu stoppen!~
			IF ~!Dead("AC#DURG1")~ THEN REPLY ~Ja, ich werde mich alsbald wieder darum kümmern.~ + keep_on_trying
			IF ~Dead("AC#DURG1")~ THEN REPLY ~Ich habe die Zwergin bereits getötet. Sie hatte einen Dämon beschworen!~ + durhgathu_is_dead
			END
	
IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY  ~Wohlauf, Fremde! Seid Ihr die, die als Verstärkung geschickt wurden? Beim Wächter und Schild des Berges, Ihr kommt zu spät.~ [AC#ILTUA]
++ ~Wir wurden von den anderen Priestern Dumathoins hier herunter geschickt, um Euch zu helfen.~ + 2
++ ~Wer seid Ihr und was ist hier passiert?~ + 2
END

IF ~~ THEN BEGIN 2
SAY ~Ich bin Turbaern Ghalmrin, doch meine Tage als Priester Dumathoins scheinen hier unten ein jähes Ende gefunden zu haben. Gegen die Schrecken, die hier hausen, bin selbst ich nicht gewappnet.~ [AC#ILTUB]
IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ Jaheira_Comment_Dumathoin
IF ~!IsValidForPartyDialog("Jaheira")~ THEN REPLY ~Was ist hier geschehen?~ + 3
END

IF ~~ THEN BEGIN 3
   SAY ~Wir wurden von einer der Unseren hintergangen. Diese Zwergin, Durhgathu Maendrar, hat uns hierher gelockt. Ich hielt sie für eine viel versprechende angehende Priesterin Dumathoins, doch in Wahrheit diente sie niemals dem Hüter der Berge.~
   =
   ~Sie stahl den heiligen Hammer Dumathoins! Mit dessen Hilfe zerstörte sie die vielen Schutzrunen, die unserer Stadt hier unten seit Jahrhunderten Sicherheit und Obhut schenken.~
   =
   ~Nur mit Mühe konnten wir die ganzen Schrecken, die dieses Weib entfesselt hatte, niederringen. Irgendeine andersweltliche Kreatur lag hier wohl viele Jahrhunderte verborgen, und dieses törichte Mädchen hat sie befreit!~
++ ~Was für eine Kreatur war das?~ + 4
END

IF ~~ THEN BEGIN 4
   SAY ~Ich weiß es nicht. Ich bin diesem Wesen nur um Haaresbreite entkommen, das könnt Ihr mir glauben. All meine Zauber hatte ich gegen das Untier geschleudert, doch am Ende blieb mir nicht viel mehr, als die verdammte Decke einstürzen zu lassen.~
	=
   ~Letztendlich hat mir der Fels das Leben gerettet. All meine Gefährten hatten weniger Glück.~
++ ~Was ist mit den Anderen passiert?~ + 5
END

IF ~~ THEN BEGIN 5
   SAY ~Sie wurden von dem Wesen in Fetzen gerissen, und die, die flüchten konnten, wurden von Horden von Untoten, die ihren Gräbern entstiegen sind, überrannt.~
	=
~Ich konnte gerade noch die Türen zu den südlichen Krypten versiegeln, bevor die Monster auch über mich hergefallen wären. Ich hörte die Schreie meiner sterbenden Männer!~ 
=
~Das Geräusch, wie die Untoten ihnen nach ihrem Tod das Fleisch von den Knochen abnagten, verfolgt mich noch bis jetzt. So liege ich nun hier und sterbe den Tod eines Feiglings, anstelle zu kämpfen.~
++ ~Wir werden versuchen, Euch zu heilen.~ + 6
END

IF ~~ THEN BEGIN 6
   SAY ~Nein, spart Euch Eure Zauber für die bevorstehenden Kämpfe auf. Ihr könnt mir einen anderen Dienst erweisen.~ 
   =
   ~Durhgathu Maendrar, diese Verräterin an unseren zwergischen Rasse, ist immer noch am Leben. Ich kann sie im nördlichen Altarraum hören, wie sie versucht, irgendeine Zeremonie vorzubereiten. Sie hat die Türen dort hinein verriegelt, doch es gibt eine Möglichkeit, diese wieder von außen zu öffnen.~ 
  IF ~~ THEN + 7
END

IF ~~ THEN BEGIN 7
   SAY ~Die großen Steintore lassen sich mit Körperkraft allein nicht bewegen, auch wenn Ihr über die Stärke eines Riesen verfügen würdet. Wir benutzen Wasserdampf, um die Tore zu öffnen und zu schließen.~ 
   =
   ~Durhgathu hat den Druck abgedreht, bevor sie sich in der Kammer eingeschlossen hat. Glücklicherweise liegt der Regler hierfür außerhalb des Altarraumes, im Einbalsamierungsraum im Norden. Ihr müsst Euch Zugang zum Altarraum verschaffen und die falsche Priesterin vernichten, bevor sie noch schlimmeres Unheil anrichten kann.~
   =
   ~Hier habe ich den Schlüssel zu der Tür in die südliche Krypta. Im Norden befindet sich eine Kammer, in der meine Priester allerlei Tränke gelagert haben. Rüstet Euch gut aus, denn die Gefahren hier sind zahlreich.~
++ ~Ich werde die Tore öffnen, die Priesterin besiegen und Euch danach retten.~ + 8
END

IF ~~ THEN BEGIN 8
   SAY ~Um mich braucht Ihr Euch am wenigsten Sorgen zu machen.~ 
   =
   ~Ich wünschte, ich könnte Euch eine Hilfe sein, doch alles, was ich tun kann, ist hier liegen und für Euren Sieg beten.~ [AC#ILTUC]
   IF ~~ THEN DO ~GiveItemCreate("AC#KEY57",Player1,1,0,0)
	AddJournalEntry(@58006,QUEST)~  EXIT
END

/*******************************************************************************************************
Durhgathu-Dialog
*******************************************************************************************************/
BEGIN ~AC#DURG1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_01
SAY  ~Kommt zu mir, Kreaturen der Unterwelt! Zeigt Euch Eurer treuen Dienerin und helft mir, diesen Ort wieder zu einem Ort des wahren Glaubens zu machen!~
   IF ~~ THEN DO ~SetGlobal("AC#Baphometspawn","GLOBAL",1)
   ForceSpell(Myself,LONG_RED_MIGHT)~  EXIT
END
/*
IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY  ~Ich rufe Euch an, mächtiger Baphomet! Zeigt Euch Eurer treuen Dienerin! Ich habe ein Geschenk, das Eurer würdig ist!~
   IF ~~ THEN DO ~SetGlobal("AC#Baphometspawn","GLOBAL",1)
   ForceSpell(Myself,LONG_RED_MIGHT)~  EXIT
END
*/

IF ~~ THEN BEGIN durga_help_me
SAY ~Helft mir im Kampf gegen all die Ungläubigen und Ihr dürft Euch an den Gefallenen dieser Stadt laben!~
IF ~~ THEN EXTERN ~AC#IL49C~ good_proposal
END

IF ~~ THEN BEGIN 4
   SAY ~Ich grüße Euch, mächtiger Maexhar. Ich möchte Iltkazar wieder zu dem rechten Glauben an die alten Wege zurückführen, so wie es einst war, als in dieser Stadt Baphomet verehrt wurde. Seht, ich habe den heiligen Hammer Dumathoins aus dem Tempel gestohlen und mit ihm die Siegel der Stadt zerstört, um Euch beschwören zu können. Nun biete ich Euch die Waffe als Austausch für Eure Dienste an!~
IF ~~ THEN EXTERN ~AC#IL49C~ 2
END

IF ~~ THEN BEGIN 5
   SAY ~Vernichtet meine Feinde und helft mir, die Stadt zu erobern, damit ich...~
++ ~Die einzige, die vernichtet werden wird, seid Ihr selbst, Durhgathu! Mit Dämonen schließt man keine Pakte, und ich werde Euch aufhalten!~ + Weg_hinein
END

	IF ~~ THEN BEGIN Weg_hinein
	SAY  ~Ihr? Wer seid Ihr, <RACE>? Hat Turbaern Euch geschickt? Egal. Mein Meister Baphomet wird Euch durch den mächtigen Maexhar vernichten - so wie er ganz Iltkazar in Trümmer legen wird, damit es in neuem Glanz wieder auferstehen kann.~
	++ ~Wir werden Euch Einhalt gebieten, böses Weib! Ihr könnt so viele Meister anrufen, wie Ihr wollt- es wird Euch nichts nützen!~ + 2
	END
	
		IF ~~ THEN BEGIN 2
		SAY ~Glaubt Ihr, Ihr könntet mich aufhalten? Iltkazars König ist zur Statue erstarrt, und die ganzen Schwächlinge des Rates tun es ihm gleich. Es wird Zeit, dass die Macht wieder in unsere Hallen zurückkehrt- wie in den alten Tagen Shanatars.~
		++ ~Was wisst Ihr über den König von Iltkazar? Habt Ihr mit seinem Schweigen etwas zu tun?~ + 3
		END
		
			IF ~~ THEN BEGIN 3
			SAY ~Ich weiß nichts-rein gar nichts, und es ist mir auch reichlich egal, was mit ihm passiert ist. Ich weiß nur, dass ich diese Situation jetzt für mich ausnutzen sollte, und Ihr werdet jetzt Zeuge meiner neu gewonnenen Kräfte werden!~
			IF ~~ THEN EXTERN ~AC#IL49C~ 3
			END

					IF ~~ THEN BEGIN 6
					   SAY ~So nehmt den Hammer, mächtiger Maexhar, und steht mir in dem Kampf mit den Ungläubigen bei!~
					   IF ~~ THEN DO ~SetGlobal("AC#Baphometspawn","GLOBAL",3)
					   Enemy()
					   ActionOverride("AC#IL49C",Enemy())~  EXIT
					END
					
					IF ~~ THEN BEGIN fight
					   SAY ~Und schon kommen die ersten Narren, die den bitteren Geschmack der Verdammnis kosten wollen!~
					   IF ~~ THEN DO ~SetGlobal("AC#Baphometspawn","GLOBAL",3)
					   Enemy()
					   ActionOverride("AC#IL49C",Enemy())~  EXIT
					END

/*******************************************************************************************************
Glabrezu-Dialog
*******************************************************************************************************/
BEGIN ~AC#IL49C~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_01
SAY  ~Wer ruft die Diener der Dunklen Dame? Ein Zwergenweib?~ [cornu01]
IF ~~ THEN EXTERN ~AC#DURG1~ durga_help_me
END
/*
IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY  ~Ich bin Maexhar, Diener des Baphomet und komme in seinem Namen. Ihr wagt es, den Namen des Gehörnten anzurufen? Was wollt Ihr vom Mächtigsten aller Dämonenfürsten, Zwergenweib?~
IF ~~ THEN EXTERN ~AC#DURG1~ 4
END
*/

IF ~~ THEN BEGIN good_proposal
SAY ~Nun gut, Zwergin. Dies ist ein Vorschlag ganz nach meinem Geschmack!~
IF ~~ THEN EXTERN ~AC#DURG1~ fight
END

IF ~~ THEN BEGIN 2
   SAY ~Eine mächtige Waffe des Guten, deren bloßer Anblick in meinen Augen brennt. Welche Dienste verlangt Ihr von mir, sollte ich dieses Geschenk annehmen?~
IF ~~ THEN EXTERN ~AC#DURG1~ 5
END

IF ~~ THEN BEGIN 3
   SAY ~Ihr seid töricht, Zwergenfrau, dass Ihr Euch so leicht überrumpeln lasst. Doch ich werde Euer Angebot annehmen.~
IF ~~ THEN EXTERN ~AC#DURG1~ 6
END

/*******************************************************************************************************
Todesfee-Dialog
*******************************************************************************************************/
BEGIN ~AC#BANS1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY  ~Frei! Endlich frei! Seit Äonen warte ich hier, möchte sterben und finde doch keine Ruhe, möchte leben und fühle doch keinen Atem. Eingekerkert haben sie mich, ohne Grund, ohne Ziel, dies niederträchtige Volk der Zwerge!~
++ ~Ihr wart hier eingesperrt? Wer seid Ihr?~ + 2
END

IF ~~ THEN BEGIN 2
   SAY ~Wer... bin ich? Einst war ich... Aeryinis, Prinzessin von Keltormir, dies war der Name der mir einst gegeben wurde. Einst war das Leben... das Leben war schön... die Wälder Keltormirs, mein Gemahl Glaerzofir... die... die Liebe...~
   =
   ~Die Liebe... wo ist sie geblieben? Die Zwerge... sie wollten ein Bündnis... brauchten Hilfe... und wir, die Tel-Quessir kamen, stiegen hinab in die Tiefe, in die steinernen Hallen des kurzen Volkes...mein Gemahl und ich, die Sonne hinter uns lassend, herab in ewige Dunkelheit...~
++ ~Ihr seid von der Oberfläche hier heruntergekommen? Wie kommt es, dass Ihr hier gefangen wurdet?~ + 3
END

IF ~~ THEN BEGIN 3
   SAY ~Sie...sie zogen in den Krieg... und ich... ich blieb hier. Ich musste verweilen- als Pfand. Ich musste warten -auf die Rückkehr meines treuen Prinzen. Doch er kam nicht, er konnte nicht, er kam nimmer mehr, denn die Zwerge hatten ihn verraten, hatten uns verraten, und mich, mich stolze Prinzessin... sie wollten mich nicht gehen lassen, sperrten mich ein- hinter kalten Mauern, unter kaltem Fels...~ 
   =
   ~Ich weinte, ich weinte... ich weinte... vergoss Tränen des Leids, der Liebe und des Zorns, bis ich keine Tränen mehr hatte, die ich vergießen konnte. Aber sie hatten keine Gnade, zeigten kein Erbarmen... ich musste bleiben, musste hoffen...~
   =
   ~Doch nun bin ich frei, und suche meinen Gemahl. Oh Glaerzofir, mein Prinz, wo seid Ihr? Ihr seid fort, ich spüre es, und auch ich möchte gehen, doch ich kann nicht. Mein Herz hat vor langer Zeit aufgehört zu schlagen, und doch fühle ich noch etwas... ich fühle... Rache! Ich werde die Zwerge für das, was sie uns angetan haben, bezahlen lassen! Ihr räche uns, mein Liebster, und dann warte ich...~
   =
   ~Ich warte auf Dich in den Gewölben des Todes mein Liebster!~ //[AC#BAN01]
   IF ~~ THEN DO ~SetGlobal("AC#Banshee_free","GLOBAL",1)
   Enemy()~  EXIT
END

/*******************************************************************************************************
NPC-Dialoge
*******************************************************************************************************/

APPEND ~JAHEIRAJ~
IF ~~ THEN BEGIN Jaheira_Comment_Dumathoin
   SAY ~Wir haben den Hohepriester Dumathoins also schneller gefunden, als ich gedacht habe, <CHARNAME>. Doch sein Zustand scheint sehr kritisch zu sein. Wir sollten ihn befragen und dann heilen. Ich bin gespannt, was er zu berichten hat.~
   IF ~~ THEN EXTERN ~AC#TURB1~ 3
END
END
