//_________________________________________________________________________________________________________________
BEGIN ~ac#dwf03~ //Beldas Creature No 3 before Fight with Charvekannathor

IF ~~ THEN BEGIN found_us
SAY ~Bleibt zurück, <CHARNAME>!~
IF ~~ THEN  EXTERN ~ac#drar1~ stay_back
END

IF ~~ THEN BEGIN not_their_fight
SAY ~Ich wollte <CHARNAME> nicht in unsere Angelegenheit mit hineinziehen, Charvekannathor. Und das sollten wir auch weiterhin nicht tun.~
IF ~~ THEN  EXTERN ~ac#drar1~ you_did
END

IF ~~ THEN BEGIN use_electricity
SAY ~<CHARNAME>! Aktiviert die alten Zwergensäulen! Sie können uns im Kampf gegen diese Bestie helfen! Wir werden solange versuchen, den Drachen zu beschäftigen.~
IF ~~ THEN EXTERN ~ac#drar1~ last_dialog_before_fight
END

//________________________________________________________________________________________________________________________
BEGIN ~ac#drar1~ // Charvekannathor

IF ~Global("AC#CharvekannathorHurt","ACIL90",1)~ THEN BEGIN hurt
SAY ~Argh... verflucht...~
=
~Trotz aller List und Tücke ... Ihr werdet mich hier oben nicht besiegen, <CHARNAME>! Dies war nicht das letzte Mal, dass wir uns getroffen haben! Ich werde Euch bis an das Ende Eurer Tage jagen, kleiner <PRO_RACE>.~
=
~Der Himmel ist mein Zuhause. Ihr werdet niemals mehr ruhigen Gewissens den frischen Wind und die Sonne genießen können, ohne an mich und meine Rache denken zu müssen!~ [AC#ILCH2]
IF ~~ THEN DO ~SetGlobal("AC#CharvekannathorHurt","ACIL90",2)
SetGlobal("AC#Charvekannathor","GLOBAL",5)
ForceSpellRES("ac#drar1",LastTalkedToBy)
Wait(1)
DestroySelf()~ EXIT
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello
SAY ~So treffen wir uns also wieder, Beldas. Hattet Ihr gedacht, die Hilfe von Euren neuen Freunden an der Oberfläche könnte Euch ein Wiedersehen mit mir ersparen?~ [AC#ILCH1]
IF ~~ THEN  EXTERN ~AC#dwf03~ found_us
END

IF ~~ THEN BEGIN stay_back
SAY ~<CHARNAME>? Ein interessanter Name... wo habe ich den nur schon einmal gehört?~
=
~Wie dem auch sei. Es überrascht mich, dass Ihr so leichtfertig in meine Falle getappt seid und dem dämlichen Runenstein Glauben geschenkt habt. Nun seid Ihr hier, alle zusammen. Ich muss Euch leider enttäuschen - hier oben gibt es keinen Weg hinab ins Unterreich. Hier erwartet Euch nur der Tod.~
=
~Dies ist aber nicht Euer Kampf, <CHARNAME>. Ich bin lediglich wegen der Zwerge hier.~
IF ~~ THEN REPLY ~Mit dieser Angelegenheit möchte ich nichts zu tun haben.~ + not_my_business
IF ~~ THEN REPLY ~Was geht hier vor, Beldas?~ + know_nothing
IF ~~ THEN REPLY ~Mit einem roten Drachen werde ich nicht verhandeln. Zeit, Euch die Schuppen abzuziehen, widerliche Bestie!~ + direct_fight
END

IF ~~ THEN BEGIN know_nothing
SAY ~Ihr habt <PRO_HIMHER> nicht gesagt, dass Ihr wegen mir hier durch die Wildnis irrt, Beldas?~
IF ~~ THEN  EXTERN ~AC#dwf03~ not_their_fight
END

IF ~~ THEN BEGIN you_did
SAY ~Das habt Ihr aber. Wie es aussieht war Euer zwergischer Freund nicht ganz ehrlich zu Euch, <CHARNAME>.~
IF ~~ THEN REPLY ~Warum seid Ihr hier, Drache?~ + why_are_you_here
++ ~Ich vertraue ihm aber.~ + trust_him
END

	IF ~~ THEN BEGIN trust_him
	SAY ~Ihr vertraut ihm? Wie liebreizend. Ihr solltet Euch die Gefährten besser aussuchen, mit denen Ihr reist. Sie führen Euch manchmal... in die Irre. In diesem besonderen Fall hat Euch Beldas jedoch schnurstracks zu mir geführt.~
	IF ~~ THEN REPLY ~Lasst von ihm ab, dann könnten wir uns vielleicht gütlich einigen.~ + change_your_mid
	IF ~~ THEN REPLY ~Mit dieser Angelegenheit möchte ich nichts zu tun haben.~ + not_my_business
	END
	
	IF ~~ THEN BEGIN why_are_you_here
	SAY ~Aus vielerlei Gründen. Der Wichtigste ist, dass ich einem Wesen diene, das diese Zwerge hier gerne tot sehen will.~
	IF ~~ THEN REPLY ~Dann könntet Ihr Euch ja noch einmal überlegen, ob auch *Ihr* das wirklich wollt.~ + change_your_mid
	IF ~~ THEN REPLY ~Was für einem Wesen dient Ihr denn?~ + what_entity
	END

		IF ~~ THEN BEGIN change_your_mid
		SAY ~Soll das eine Drohung sein? Ihr wisst gar nicht, in welche Angelegenheiten Ihr Euch hier einmischt, <CHARNAME>!~
		IF ~~ THEN + annoying
		END
		
		IF ~~ THEN BEGIN what_entity
		SAY ~Das geht Euch nichts an, <CHARNAME>! Oder vielmehr doch, es geht Euch etwas an, jetzt, da Ihr mit diesen Zwergen gereist seid.~
		IF ~~ THEN + annoying
		END

IF ~~ THEN BEGIN annoying
SAY ~Aber diese Plauderei langweilt mich, und das Wetter hier oben gefällt mir auch nicht. Viel zu kalt für diese Jahreszeit, findet Ihr nicht? Zeit, Euren erbärmlichen Körpern etwas einzuheizen!~
IF ~~ THEN  EXTERN ~AC#dwf03~ use_electricity
END

IF ~~ THEN BEGIN direct_fight
SAY ~Ihr fordert mich heraus? Hier oben? Da habt Ihr Euch aber ein paar törichte Gefährten ausgesucht, Beldas!~
IF ~~ THEN  EXTERN ~AC#dwf03~ use_electricity
END

IF ~~ THEN BEGIN not_my_business
SAY ~Dann macht jetzt Platz und werdet Zeuge, wie ich Euren falschen Gefährten einen qualvollen Tod bereite!~
IF ~~ THEN  EXTERN ~AC#dwf03~ use_electricity
END

IF ~~ THEN BEGIN last_dialog_before_fight
SAY ~Eure kleinen Tricks werden gegen meine Macht nichts ausrichten können!~
IF ~~ THEN DO ~SetGlobal("AC#Charvekannathor","GLOBAL",3)
ActionOverride("AC#DWF23",Attack("ac#drar1"))
ActionOverride("AC#DWF33",Attack("ac#drar1"))
Enemy()~ EXIT
END

//________________________________________________________________________________________________________________________
BEGIN ~ac#dwf10~ //Beldas Creature No 10: Dying

IF ~Global("AC#BeldasDies","GLOBAL",1)~ THEN BEGIN its_over
SAY ~Es... tut mir leid, <CHARNAME>.~
IF ~~ THEN REPLY ~Was tut Euch leid?~ + what
IF ~~ THEN REPLY ~Ich sehe, dass Euch das Sprechen anstrengt, Beldas.~ + do_not_talk
IF ~~ THEN REPLY ~Tut mir bitte einen letzten Gefallen und sterbt schneller.~ + not_much_time
END

	IF ~~ THEN BEGIN do_not_talk
	SAY ~Bitte... unterbrecht mich nicht! Es ... ist wichtig, was ich Euch ... nun zu sagen habe...~
	IF ~~ THEN + what
	END
	
IF ~~ THEN BEGIN what
SAY ~Ich... hätte Euch sagen sollen, was... Euch erwarten könnte...~
IF ~~ THEN REPLY ~Das ist jetzt nicht mehr zu ändern.~ + others
IF ~~ THEN REPLY ~Das hättet Ihr wirklich.~ + i_am_sorry
END

	IF ~~ THEN BEGIN i_am_sorry
	SAY ~Ich ... entschuldige mich... für ... mein Verhalten. Ich wollte uns alle nicht in Gefahr bringen .... und habe es dadurch erst Recht getan!~
	IF ~~ THEN + others
	END

IF ~~ THEN BEGIN others
SAY ~Wo... sind... meine Gefährten? Ich... kann nichts mehr erkennen, dieser... Drache hat mich geblendet...~
IF ~~ THEN REPLY ~Sie sind alle tot, Beldas.~ + all_dead
IF ~~ THEN REPLY ~Ich weiß es nicht.~ + no_idea

END

	IF ~~ THEN BEGIN no_idea
	SAY ~Nun, es ist wohl auch nicht ... mehr ... wichtig.~
	IF ~NumInParty(1)~ THEN + your_job
	IF ~NumInPartyGT(1)~ THEN GOTO your_comrades_dead
	END

	IF ~~ THEN BEGIN all_dead
	SAY ~Tot.. mögen sie in der Seelenschmiede in Frieden Ruhen...~
	IF ~NumInParty(1)~ THEN REPLY ~Ihr seid noch am Leben. Wir werden Euch heilen.~ + no_heal
	IF ~NumInPartyGT(1)~ THEN GOTO your_comrades_dead
	END

		IF ~~ THEN BEGIN your_comrades_dead
		SAY ~Wie hat es Eure Gruppe getroffen, <CHARNAME>? *hust*...~
		IF ~~ THEN GOTO comrades_alive
		IF ~OR(5)
		HPLT(Player2,1)
		HPLT(Player3,1)
		HPLT(Player4,1)
		HPLT(Player5,1)
		HPLT(Player6,1)~ THEN GOTO some_are_dead
		END
		// Dead(Player2)
		/*
		IF ~~ THEN BEGIN your_comrades_dead
		SAY ~Wie hat es Eure Gruppe getroffen, <CHARNAME>? *hust*...~
		IF ~~ THEN GOTO comrades_alive
		IF ~OR(5)
		Dead(Player2)
		Dead(Player3)
		Dead(Player4)
		Dead(Player5)
		Dead(Player6)~ THEN GOTO some_are_dead
		END
		*/
		
		IF ~~ THEN BEGIN comrades_alive
		SAY ~Sind noch alle am Leben?~
		IF ~~ THEN REPLY ~Es sind alle am Leben, Beldas.~ GOTO all_alive
		END
		
		IF ~~ THEN BEGIN some_are_dead
		SAY ~Sind noch alle am Leben?~
		IF ~OR(5)
		HPLT(Player2,1)
		HPLT(Player3,1)
		HPLT(Player4,1)
		HPLT(Player5,1)
		HPLT(Player6,1)~ THEN REPLY ~Einige meiner Gefährten sind im Kampf gefallen.~ GOTO some_npc_dead
		END
		
			IF ~~ THEN BEGIN all_alive
			SAY ~Gut. Das ist gut. Es ist schon schlimm genug, für meine Gefährten die Verantwortung übernehmen zu müssen. Wichtiger ist jetzt, dass Ihr unseren Auftrag fortführt!~
			IF ~~ THEN GOTO your_job
			END
			
			IF ~~ THEN BEGIN some_npc_dead
			SAY ~Das... tut mir leid. Meinetwegen hat es heute noch mehr Tote gegeben. Ich habe einen Stab bei mir, der wieder Leben schenken kann. Denn wichtig ist jetzt, dass Ihr unseren Auftrag fortführt!~
			IF ~~ THEN GOTO your_job
			END



IF ~~ THEN BEGIN no_heal
SAY ~Nein, <CHARNAME>... ich spüre, dass mein Ende gekommen ist... und mein verwundener Lebenspfad durch den irrenden Wanderer nunmehr zum Ziel führt ....ich kann schon den Fluss aus Gold sehen, der mich zu den Morndinsamman bringen wird!~
IF ~~ THEN REPLY ~Gebt Euch nicht so schnell auf!~ + dont_give_up
++ ~Was gibt es für mich dann hier noch zu tun?~ + your_job
END

	IF ~~ THEN BEGIN dont_give_up
	SAY ~Ich gebe... nicht auf... vielmehr... vielmehr erkenne ich, dass meine Aufgabe hier beendet ist.~
	IF ~~ THEN + your_job
	END

IF ~~ THEN BEGIN your_job
SAY ~Ich war ... so... vermessen zu glauben, dass die Rolle *mir* zustehen würde, unseren... geliebten König zu retten... doch diese Aufgabe ist für Euch bestimmt! Ich ... kann ... es spüren!~
IF ~~ THEN REPLY ~Also ich...~ + not_much_time
IF ~~ THEN REPLY ~Ich denke nicht, dass ich dafür auserkoren bin.~ + not_much_time
IF ~~ THEN REPLY ~Das ist albern.~ + not_much_time
IF ~~ THEN REPLY ~Da habt Ihr sicher Recht!~ + not_much_time
END

IF ~~ THEN BEGIN not_much_time
SAY ~Wartet... lass mich sprechen. Ich habe... nicht mehr viel Zeit, bevor der Allvater mich zu sich rufen wird...~
=
~Hört gut... zu!  Ihr müsst das Buch... in unsere Stadt... bringen. Ich hoffe, Ihr habt es noch...~
IF ~PartyHasItem("AC#SRBK1")~ THEN REPLY ~Im Großen und Ganzen habe ich es noch, ja.~ + secret_door
IF ~PartyHasItem("AC#SRBK1")~ THEN REPLY ~Es ist ziemlich mitgenommen. Man kann es kaum noch lesen.~ + secret_door
IF ~!PartyHasItem("AC#SRBK1")~ THEN REPLY ~Scheint, dass ich es unterwegs verloren habe.~ + dont_have_book
END

	IF ~~ THEN BEGIN dont_have_book
	SAY ~Oh weh, welch ein Unglück! Seht zu, dass Ihr es wiederbeschafft und damit nach Iltkazar geht!~
	IF ~~ THEN GOTO secret_door
	END

IF ~~ THEN BEGIN secret_door
SAY  ~Ihr müsst wieder von diesem Berg herunter. Der direkte Weg ist Euch versperrt, da die Zugbrücke eingestürzt ist. Wir sind bei unserem Aufstieg durch eine kleine Höhle ins Innere des Berges geklettert und dann durch die alten Zwergenkammern an den Gipfel gelangt. Wir dachten, wir könnten auf diese Weise den Drachen abschütteln, der uns auf den Fersen war.~
IF ~~ THEN REPLY ~Warum hat der Drache Euch eigentlich verfolgt?~ GOTO about_the_dragon
IF ~~ THEN REPLY ~Das hat ja wunderbar funktioniert.~ + need_key
IF ~~ THEN REPLY ~Fahrt fort.~ + need_key
END

	IF ~~ THEN BEGIN about_the_dragon
	SAY ~Das ist eine schwierige Geschichte. Ich fürchte, ich habe nicht mehr so viel Zeit, Euch alles zu erklären. Lasst mich Euch zunächst sagen, wie Ihr von diesem Berg wieder herunterkommt.~
	IF ~~ THEN GOTO need_key
	END

IF ~~ THEN BEGIN need_key
SAY ~Ich habe den Schlüssel ins Innere der Turblodfeste bei mir. In ihrem Inneren befindet sich ...eine Geheimtür... bei der Statue Iltkazars... die Ihr nach unten nehmen müsst... auf diesem... Wege... sind wir nach oben gelangt... Sie ist Euer einziger Weg von diesem Berg herunter... Ihr... Ihr müsst vorher mit Hilfe der Räder die Platte auf Clangeddins Schild ausrichten, um sie zu öffnen...~
IF ~~ THEN DO ~AddJournalEntry(@90010,QUEST)~ + ladder
END

IF ~~ THEN BEGIN ladder
SAY  ~Und... Ihr braucht eine Leiter, um wieder... vollends... herunterzukommen... wir haben eine Strickleiter im Inneren der Zwergenkammern zurückgelassen.~
IF ~~ THEN DO ~AddJournalEntry(@90020,QUEST)~ + way_underdark_01
END

	IF ~~ THEN BEGIN way_underdark_01
	SAY  ~Wenn Ihr den Berg herabgestiegen seid, müsst Ihr ins Unterreich gelangen und meine Stadt retten!~
	IF ~~ THEN REPLY ~Wie soll ich denn ohne Zugang ins Unterreich kommen?~ GOTO way_underdark_02
	IF ~~ THEN REPLY ~Dann sagt mir jetzt, wie Ihr aus Iltkazar hier heraufgekommen seid, und ich nehme den gleichen Weg zurück.~ GOTO way_underdark_dragon
	IF ~~ THEN REPLY ~Natürlich! Berg heruntersteigen, und dann weiter ins Unterreich...~ + way_underdark_02
	IF ~~ THEN REPLY ~Ach ja, stimmt. Das hatte ich vor lauter Drachen fast vergessen.~ + way_underdark_02
	END
	
		IF ~~ THEN BEGIN way_underdark_dragon
		SAY  ~Nein! Diesen Weg dürft Ihr nicht gehen! Er führt Euch direkt zum Drachen!~
		IF ~~ THEN GOTO way_underdark_02
		END
		
		IF ~~ THEN BEGIN way_underdark_02
		SAY  ~Der... der Weg, den wir gekommen sind... er führte durch den Hort des roten Drachen, den Ihr gerade kennengelernt habt. Es ist schlimm, doch der einzige bekannte Weg von Iltkazar an die Oberfläche wird von diesem Biest bewacht! Wir schafften es mit viel List, uns an ihm vorbeizuschleichen... wir hätten nicht gedacht, dass der Drache den Auftrag hatte, den Zugang zu bewachen... und... uns weiter daran hindern würde. Er verfolgte uns gen Norden, doch wir konnten ihn abschütteln. Irgendwie muss er uns wieder gefunden haben und hier seine Falle platziert haben.~
		IF ~~ THEN GOTO way_underdark_03
		END
		
		IF ~~ THEN BEGIN way_underdark_03
		SAY  ~Doch... es gibt auch eine gute Nachricht. Im Inneren dieser Festung hinter mir entdeckten wir in einer gesonderten Kammer eine große alte metallene Zwergenkarte, die weitere Zugänge ins Unterreich markiert. Ihr müsst... den Mechanismus, mit dem Ihr auch die Ausgangstüre öffnen könnt, auf die Tür ausrichten, um den Kartenraum zu öffnen. Und zwar, bevor Ihr den Berg verlasst!~
		IF ~~ THEN DO ~EraseJournalEntry(@20010)
		EraseJournalEntry(@20062)
		AddJournalEntry(@20011,QUEST)~ GOTO ravimors_cave_01
		END
		
		IF ~~ THEN BEGIN ravimors_cave_01
		SAY ~Geht ins Innere und seht Euch die Karte an! Danach müsst Ihr die Geheimtüre öffnen, indem Ihr die Axt auf das Wappen Iltkazars - Clangeddins Zwillingsäxte - einstellt!~
		IF ~~ THEN REPLY ~Das klingt alles mächtig kompliziert.~ GOTO vow_01
		IF ~~ THEN REPLY ~Natürlich. Nichts leichter als das.~ GOTO vow_01
		IF ~~ THEN REPLY ~Ich hoffe, ich kann mir all das merken.~ GOTO vow_01
		END
								
IF ~~ THEN BEGIN vow_01
SAY ~Sucht einen Zugang ins Unterreich! Flieht von diesem verfluchten Berg! Begebt Euch nach Iltkazar! Bitte, <CHARNAME>, rettet... meine Heimat!~
IF ~~ THEN REPLY ~Ich werde es versuchen.~ + vow_02
IF ~~ THEN REPLY ~Natürlich, Beldas.~ + vow_02
IF ~~ THEN REPLY ~Was interessiert mich noch Eure Heimat?~ + vow_02
END

IF ~~ THEN BEGIN vow_02
SAY ~Bitte, schwört es, bei... allem... was Euch heilig ist...gebt einem sterbenden Manne in... seinen letzten Atemzügen die Gewissheit... dass Ihr an seiner statt diese Aufgabe zu Ende bringt!~
IF ~~ THEN REPLY ~Also gut, ich schwöre es.~ + vow_yes
IF ~~ THEN REPLY ~Ich möchte nichts versprechen, was ich nicht halten kann.~ + vow_no
IF ~~ THEN REPLY ~Das kann ich nicht.~ + vow_no
END

	IF ~~ THEN BEGIN vow_yes
	SAY ~Ich danke Euch... Ihr seid ein guter <PRO_RACE>, <CHARNAME>! Ich wünschte, ich ... hätte mehr von Euch kennenlernen können. Nun kann ich in Frieden von dieser Welt scheiden. Lasst die Körper meiner Gefährten und mich hier oben im Kreise meiner Ahnen ihre letzte Ruhe finden...~
	IF ~~ THEN + last_wish
	END
	
	IF ~~ THEN BEGIN vow_no
	SAY ~So liege ich denn hier, und das ganz umsonst? Es ist schwer verständlich, was der irrende Wanderer mit mir vorhat.~
	IF ~~ THEN + last_wish
	END

IF ~~ THEN BEGIN last_wish
SAY ~Eine... letzte Bitte habe ich noch, <CHARNAME>. Wenn... wenn Ihr...~
IF ~~ THEN DO ~SetGlobal("AC#BeldasDies","GLOBAL",2)
Kill(Myself)~ EXIT
END

