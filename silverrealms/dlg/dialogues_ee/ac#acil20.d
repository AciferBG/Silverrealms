/*******************************************************************************************************
Dialoge beim Abschied aus Iltkazar
*******************************************************************************************************/

BEGIN ~AC#BRES9~

IF ~~ THEN BEGIN bad_goodbye
SAY ~Genau wie wir! <CHARNAME> sollte sich jetzt auf den Weg an die Oberfläche machen.~
IF ~~ THEN GOTO close_gates
END

IF ~~ THEN BEGIN good_goodbye
SAY ~Wir bauen auf Euch, <CHARNAME>! Ihr werdet uns nicht enttäuschen.~
IF ~~ THEN GOTO close_gates
END

	IF ~~ THEN BEGIN close_gates
	SAY ~Los, Bewohner Iltkazars! Lasst uns in die Stadt zurückkehren und für eine baldige Rückkehr <CHARNAME>s unsere Götter gnädig stimmen! Schließt die Tore hinter Euch, denn es könnte in der nächsten Zeit ein wenig ungemütlich hier draußen werden!~
	=
	~Lebt wohl, <CHARNAME>, und passt gut auf Euch auf.~
	IF ~~ THEN DO ~SetGlobal("AC#Goodbye_Iltkazar","GLOBAL",6)
	EraseJournalEntry(@64300)
	AddJournalEntry(@64301,QUEST_DONE)~ EXIT
	END

BEGIN ~AC#GROM9~

BEGIN ~AC#DUN20~

BEGIN ~AC#ELER9~

BEGIN ~AC#SORN9~

BEGIN ~AC#VRON9~

BEGIN ~AC#ANT20~

BEGIN ~AC#TURB9~

/*******************************************************************************************************
Dialog Hathar Steinschulter
*******************************************************************************************************/

BEGIN ~AC#HATH1~

IF ~GlobalGT("AC#_Iltkazar_Destroyed","GLOBAL",0)~ THEN BEGIN hello_saved_city
SAY ~Ihr habt geholfen, die Stadt zu retten! Die Zwerge Iltkazars werden Euch immer zu Dank verpflichtet sein, <CHARNAME>!~
IF ~~ THEN REPLY ~Ich muss weiter.~ GOTO saved_city_bye
END
 
	IF ~~ THEN BEGIN saved_city_bye
	SAY ~Natürlich! Hier ist alles ruhig. Kein Wunder, bei den vielen Monstern, die wir in der letzten Zeit erschlagen haben! Das wird ein Zwergenleben brauchen, bis sie davon wieder erholt haben!~
	IF ~~ THEN EXIT
	END

IF ~Global("AbishaiSpawn","ACIL20",2)~ THEN BEGIN hello_abishai
SAY ~<CHARNAME>! Gut, dass Ihr zurückkehrt! Helft mir gegen diese Scheusale, schnell!~
IF ~~ THEN REPLY ~Wo kommen die denn her?~ GOTO abishai_what_happened
END

	IF ~~ THEN BEGIN abishai_what_happened
	SAY ~Diese Monster strömen direkt aus unserer Stadt! Sie kommen aus Iltkazar, könnt Ihr Euch das vorstellen? Schnell, schicken wir sie zurück in den Abgrund!~
	IF ~~ THEN DO ~SetGlobal("AbishaiSpawn","ACIL20",3)~ EXIT 
	END


IF ~Global("AbishaiSpawn","ACIL20",3)
NumDeadLT("AC#20ABG",2)~ THEN BEGIN hello_abishai_not_dead
SAY ~Helft mir gegen diese Biester, <CHARNAME>!~
IF ~~ THEN EXIT 
END


IF ~Global("AbishaiSpawn","ACIL20",3)
NumDead("AC#20ABG",2)~ THEN BEGIN hello_abishai_dead
SAY ~Danke, dass Ihr mir gegen diese Biester geholfen habt! Geht und seht, ob Ihr in der Stadt helfen könnt. Ich halte derweil hier draußen die Stellung.~
IF ~~ THEN DO ~SetGlobal("AbishaiSpawn","ACIL20",4)
AddJournalEntry(@66000,QUEST)~ EXIT 
END

IF ~Global("AC#HatharDriftdisc","ACIL20",3)~ THEN BEGIN hello_drow_driftdisc_02
SAY ~Wie ich sehe, habt Ihr solch ein Drow-Schwebe-Ding ergattert!~
IF ~~ THEN REPLY ~Ich weiß leider nur nicht, was ich damit anfangen soll.~ + driftdisc_what_to_do
END

	IF ~~ THEN BEGIN driftdisc_what_to_do
	SAY ~Hm. Da kann ich Euch jetzt auch nicht weiterhelfen. Ihr solltet mit dem seltsamen Gerät einmal zum Rat gehen. Vielleicht weiß dort jemand weiter. Wenn alles nichts nützt, findet sich sicher jemand, der sich das als Tischplatte in die Speisekammer stellen möchte, hoho.~
	IF ~~ THEN DO ~SetGlobal("AC#HatharDriftdisc","ACIL20",4)~ EXIT 
	END

IF ~Global("AC#HatharDriftdisc","ACIL20",1)~ THEN BEGIN hello_drow_driftdisc
SAY ~Viel Glück in den Spinnenschächten, Freunde!~
IF ~~ THEN REPLY ~Danke! Soll ich Euch eine Spinne mitbringen?~ + spidergift
END

	IF ~~ THEN BEGIN spidergift
	SAY ~Ha! Ein Drow wär' mir lieber! Nein, lasst alles schön da, wo es hingehört. Nur eben nicht lebendig.~
	IF ~~ THEN GOTO driftdisc_idea
	END
	
	IF ~~ THEN BEGIN driftdisc_idea
	SAY ~Da fällt mir noch was ein - wenn Ihr dort alten Hinterlassenschaften der Drow begegnet, solltet Ihr einmal genauer hinschauen. Die Spitzohren schwebten gerne mit allerlei Hilfsmitteln durch die Gegend. Wenn Ihr eins von diesen Schwebeteilen ergattern könntet, hättet Ihr es leichter, Euren Rückzug an die Oberfläche anzutreten!~
	IF ~~ THEN REPLY ~Weshalb?~ GOTO driftdisc_idea_02
	END
	
		IF ~~ THEN BEGIN driftdisc_idea_02
		SAY ~Habt Ihr Euch noch keine Gedanken gemacht, wie Ihr wieder von hier verschwinden wollt? Also, ich meine, nicht, dass ich Euch loswerden will! Aber diesen komischen Schacht, den Ihr heruntergekommen seid, werdet Ihr schwerlich einfach so wieder emporklettern können.~
		IF ~~ THEN REPLY ~Und dabei können mir die Drow mit ihren Gegenständen helfen?~ GOTO driftdisc_idea_03
		IF ~~ THEN REPLY ~Stimmt, zurück an die Oberfläche sollte ich auch irgendwann einmal wieder.~ + missing_surface_01
		IF ~~ THEN REPLY ~Gute Idee. Bin froh, wenn ich wieder unter freiem Himmel bin.~ + missing_surface_01
		END
		
			IF ~~ THEN BEGIN missing_surface_01
			SAY ~Bestimmt vermisst Ihr Euer Zuhause, <CHARNAME>, oder etwa nicht?~
			IF ~~ THEN REPLY ~Ja, ich vermisse die Oberfläche sehr.~ GOTO missing_surface_02
			IF ~~ THEN REPLY ~Eigentlich habe ich kein richtiges Zuhause.~ + no_home
			END
			
				IF ~~ THEN BEGIN missing_surface_02
				SAY ~Na, dann ist meine Idee mit den Drow-Geräten doch gar nicht mal so schlecht!~
				IF ~~ THEN GOTO driftdisc_idea_03
				END
				
				IF ~~ THEN BEGIN no_home
				SAY ~Wie, kein richtiges Zuhause? Ihr müsst doch an der Oberfläche auch einen Ort haben, an dem Ihr die Axt - oder Euer Schwert, oder was auch immer - einfach mal in die Ecke stellt und die Füße auf den Tisch legt?~
				IF ~~ THEN REPLY ~Solch einen Ort habe ich bisher noch nicht gefunden.~ GOTO no_such_place
				IF ~~ THEN REPLY ~Ja, so einen Ort gibt es schon, denke ich.~ + driftdisc_idea_03
				END
				
				IF ~~ THEN BEGIN no_such_place
				SAY ~Oh, das tut mir leid. Also, wenn's nach mir geht könnt Ihr hier solange bleiben, wie Ihr wollt! Wenn Ihr aber doch mal wieder nach oben reisen wollt, hätte ich da wie gesagt den Einfall mit diesem Drow-Flug-Gerät.~
				IF ~~ THEN GOTO driftdisc_idea_03
				END
					
			IF ~~ THEN BEGIN driftdisc_idea_03
			SAY ~Die meisten Erfindungen der Dunkelelfen würde ich nicht mit einer Bartspitze anfassen. Aber diese Scheiben, mit denen sie herumschweben, wären doch schon ganz praktisch, findet Ihr nicht? Früher sind die Drow manchmal hier die Schlucht vor den Stadttoren emporgestiegen. Hab' mehr als einem von den Scheißern mit dem Wurfhammer ihre verdammte Scheibe unterm Hintern weggeschossen, dass sie Knall auf Fall zurück in den Abgrund gestürzt sind. Das war ein Spaß sag' ich Euch! Aber jetzt trauen sich die Drow leider nicht mehr so nah vor die Tore, dass ich Euch hier eine von ihren Schwebescheiben besorgen könnte. Deshalb solltet Ihr in den verlassenen Minen einmal danach suchen.~
			IF ~~ THEN REPLY ~Danke. Ich werde meine Augen offen halten.~ GOTO driftdisc_thanks
			IF ~~ THEN REPLY ~Warum denkt Ihr, dass in den Spinnenschächten solch ein Gegenstand zu finden sein könnte?~ + why_driftdisc_in_spiderstalkings
			END
			
				IF ~~ THEN BEGIN why_driftdisc_in_spiderstalkings
				SAY ~Viele Orte dort waren Schauplatz legendärer Schlachten meiner Vorfahren gegen Dunkelelfen. Es gab Zeiten, da hatten sich die Drow dort richtig eingenistet - mit all ihren Spinnen, die jetzt noch in den Gängen ihre Netze spinnen. Man findet in der Gegend öfter mal etwas Drow-Zeug, warum dann nicht auch mit etwas Glück eine Flugscheibe?~
				IF ~~ THEN GOTO driftdisc_thanks
				END
			
				IF ~~ THEN BEGIN driftdisc_thanks
				SAY ~Mehr wollte ich Euch gar nicht mitteilen. Und jetzt geht in die Mine und schlagt ein paar Spinnenbeine ab, verstanden?~
				IF ~~ THEN DO ~SetGlobal("AC#HatharDriftdisc","ACIL20",2)
				AddJournalEntry(@20800,QUEST)~ EXIT 
				END


IF ~Global("AC#Ruvan_Treason","GLOBAL",2)~ THEN BEGIN hello_ruvan_treason
SAY ~Geht in die Stadt und sucht den Regentschaftsrat auf, <CHARNAME>! Mein Onkel wird für seine Lügen bezahlen, das schwöre ich bei Haela Leuchtaxt!~
IF ~~ THEN DO ~~ EXIT
END

IF ~Global("AC#RC_Sorni_Fourth","GLOBAL",7)~ THEN BEGIN hello_wait_for_boats
SAY ~Ihr solltet jetzt wirklich in die Tunnel gehen, bevor unsere Leute mit den Booten hier noch in Kämpfe verwickelt werden!~
IF ~~ THEN DO ~~ EXIT
END

IF ~Global("AC#RC_Sorni_Fourth","GLOBAL",6)
Global("ClearPassage","ACIL20",0)~ THEN BEGIN need_time_for_boats
SAY ~Mein Bruder Bresk und die anderen brauchen noch ein wenig, um die Boote hierher zu bekommen. Er hat mich beauftragt, hier auf sie zu warten.~
=
~Ihr solltet die Vorhut bilden und schon einmal in die Tunnel bis zu den Ufern des Den-Dunglor vorstoßen, <CHARNAME>. Sobald das Gebiet gesichert ist, werden wir mit den Booten nachziehen.~
IF ~~ THEN REPLY ~Gut. Was könnte mich da erwarten?~ + whats_in_tunnels
END

	IF ~~ THEN BEGIN whats_in_tunnels
	SAY ~Kuo-Toa wahrscheinlich. Genau weiß man das aber nie, was da so alles aus dem Wasser gekrochen kommt.~
	IF ~~ THEN REPLY ~Wie soll ich an den ganzen Steinbrocken und Metallkugeln vorbeikommen, die Ihr hier verteilt habt?~ GOTO stones_hr_01
	END
	
	IF ~~ THEN BEGIN stones_hr_01
	SAY ~Das lasst einmal meine Sorge sein. Kleriker? Wo steckt denn der verdammte Priester?~
	IF ~~ THEN DO ~SetGlobal("Wheres_Cleric","ACIL20",1)~ EXIT
	END
	
	
		IF ~~ THEN BEGIN remove_stones_hr
		SAY ~Tut das. Und Ihr anderen helft auch mit. Los geht's! Zeigen wir dem Oberflächen-<PRO_RACE> mal, wie wir hier in Iltkazar die Straßen reinigen. Ich will hier keinen Stein auf dem anderen mehr sehen!~
		IF ~~ THEN DO ~SetGlobal("ClearPassage","ACIL20",1)~ EXIT 
		END
	
	IF ~Global("ClearPassage","ACIL20",10)
	GlobalLT("AC#RC_Sorni_Fourth","GLOBAL",7)~ THEN BEGIN bye_kuo_toa
	SAY ~Gut gemacht! An der ganzen Kuo-Toa-Matsche müsst Ihr aber schon alleine vorbeikommen. Möge der Fels der Schlacht mit Euch sein!~
	IF ~~ THEN DO ~SetGlobal("AC#RC_Sorni_Fourth","GLOBAL",7)
	EraseJournalEntry(@62042)
	AddJournalEntry(@62043,QUEST)
	JumpToPoint([3252.652])
	MoveToPointNoInterrupt([3252.652])
	Face(4)~ EXIT
	END

IF ~Global("AC#_HatharDwarfPatrol","ACIL20",2)~ THEN BEGIN patrol_found
SAY ~Habt Ihr schon was entdeckt, <CHARNAME>?~
IF ~Global("Acil20_DeadDwarves","GLOBAL",1)~ THEN REPLY ~Ich habe Eure Gefährten gefunden. Sie sind alle tot. Es tut mir leid, Hathar.~ DO ~SetGlobal("AC#_HatharDwarfPatrol","ACIL20",3)~ GOTO patrol_dead
IF ~Global("Acil20_DeadDwarves","GLOBAL",0)~ THEN REPLY ~Ich habe noch nichts gefunden, tut mir leid.~ GOTO patrol_keep_searching
END

IF ~Global("AC#_HatharDwarfPatrol","ACIL20",1)~ THEN BEGIN Good_luck_patrol
SAY ~Viel Glück da draußen, <CHARNAME>. Eigentlich ist es eine Schande, dass der Rat einen <RACE> von der Oberfläche mit dieser Aufgabe betraut, aber sei's drum. Für mich ist es jedenfalls furchtbar zu wissen, dass da draußen im Unterreich irgendwo meine Clanbrüder Hilfe brauchen und ich mir hier vor den Toren die Beine in den Bauch stehen muss.~
IF ~~ THEN REPLY ~Ich werde Euch berichten, sobald ich etwas herausgefunden habe, Hathar. Bis bald.~ DO ~SetGlobal("AC#_HatharDwarfPatrol","ACIL20",2)~ GOTO lookup_dwarf_patrol
IF ~~ THEN REPLY ~Mir wäre es auch lieber, wenn die Zwerge Iltkazars sich selbst um ihre Angelegenheiten kümmern würden.~ DO ~SetGlobal("AC#_HatharDwarfPatrol","ACIL20",2)~ GOTO lookup_dwarf_patrol
END

	IF ~~ THEN BEGIN lookup_dwarf_patrol
	SAY ~Passt auf Euch auf da draußen. Es kommen ständig neue Widerlinge aus ihren Löchern gekrochen. Ihr könnt Euch nicht darauf verlassen, dass ein Gebiet, das Ihr bereits gesichert habt, nicht eine neue Überraschung bereithält!~
	=
	~Ach, da fällt mir ein - unsere Patrouillen markieren immer die Wege, die sie gesichert haben, mit speziellen Runen. Wenn Ihr solche Runen entdeckt, könnt Ihr versuchen, diesen zu folgen und erfahrt so vielleicht, welchen Weg die vermissten Soldaten eingeschlagen haben.~
	IF ~~ THEN REPLY ~Auf welche Zeichen soll ich achten?~ +  patrol_which_signs
	IF ~~ THEN REPLY ~Ich komme schon klar, danke.~ + goodbye_dwarfpatrol
	END
	
		IF ~~ THEN BEGIN patrol_which_signs
		SAY ~Achtet auf eine grüne Rune, die einen Stiefel und einen Pfeil darstellt. Das ist die Zwergenrune "Sicherer Weg", mit der wir unsere Passagen im Unterreich markieren. Die grüne Farbe ist weithin sichtbar, weil wir sie aus einem leuchtenden Pilz herstellen. Mit etwas Glück könntet Ihr somit einen Teil des Weges meiner Kameraden nachverfolgen.~
		IF ~~ THEN REPLY ~Das ist ein guter Hinweis. Danke!~ GOTO goodbye_dwarfpatrol
		IF ~~ THEN REPLY ~Ich komme schon klar, danke.~ + goodbye_dwarfpatrol
		END
	
	IF ~~ THEN BEGIN goodbye_dwarfpatrol
	SAY ~Wie dem auch sei. Viel Glück da draußen bei Eurer Suche.~
	IF ~~ THEN EXIT 
	END

/*
IF ~Global("AC#_HatharCapture","ACIL20",1)~ THEN BEGIN Githtalk01
SAY ~Was soll das, Githyanki? Ihr haltet mich hier fest, obwohl ich Euch in der Vergangenheit geholfen habe?~
IF ~~ THEN EXTERN ~AC#SZAG1~ 11
END
*/

IF ~!NumTimesTalkedTo(0)
!CombatCounter(0)~ THEN BEGIN no_time_to_talk_fight
SAY ~Keine Zeit zu reden -  ich muss kämpfen!~
IF ~~ THEN EXIT
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY ~Heda Fremde! Wollt Ihr mir in diesem Kampf beistehen? Fremde Hilfe ist in Zeiten wie diesen immer gern willkommen!~
IF ~~ THEN DO ~SetGlobal("AC#_HatharCombat","ACIL20",1)~ EXIT
END

IF ~Global("AC#_HatharCombat","ACIL20",1)~ THEN BEGIN 2
SAY ~Habt Dank für Eure Unterstützung, Fremde. Ich bin Hathar Steinschulter, Soldat der Bronzemaske und Wächter der Tore Iltkazars. Wisset, dass Eure Hilfe nicht unbelohnt bleiben wird. Wer seid Ihr?~
++ ~Mein Name ist <CHARNAME>. Dies hier ist also tatsächlich der Eingang in die sagenumwobene Zwergenstadt Iltkazar?~ + 3
++ ~<CHARNAME>, von der Oberfläche.~ + 3
END

IF ~Global("AC#_HatharCombat","ACIL20",2)
Global("AC#Arrested","GLOBAL",0)~ THEN BEGIN doors_open
SAY ~Die Tore stehen Euch offen, Besucher aus der Oberwelt! Tretet ein, denn die Mithralstadt heißt Euch willkommen!~
IF ~~ THEN DO ~~ EXIT
END

IF ~~ THEN BEGIN goodbye_surface
SAY ~Ich freue mich schon, wenn ich Euch wieder vor den Toren erblicke, <CHARNAME>!~
IF ~~ THEN REPLY ~Habt Dank für diesen freundlichen Abschied. Dies bedeutet mir sehr viel.~ EXTERN ~AC#BRES9~ good_goodbye
IF ~~ THEN REPLY ~Eigentlich kann ich tränenreiche Abschiede nicht leiden.~ EXTERN ~AC#BRES9~ bad_goodbye
END

/*
IF ~~ THEN BEGIN Githtalk02
SAY ~Warum dieser Verrat? Wir lieferten Euch wie vereinbart alle Illithidenköpfe, die wir finden konnten...~
IF ~~ THEN EXTERN ~AC#SZAG1~ 15
END

IF ~~ THEN BEGIN Githtalk03
SAY ~...was sich als großer Fehler erwiesen hat, wie ich sehe! Ihr steckt hinter dem Angriff auf unsere Stadt, verfluchter Githyanki!~
IF ~~ THEN EXTERN ~AC#SZAG1~ 16
END


IF ~~ THEN BEGIN Githtalk04
SAY ~Vergesst es, ich werde Euch nicht noch weiter helfen!~
IF ~~ THEN DO ~~ EXIT
END
*/

IF ~~THEN BEGIN patrol_dead
SAY ~Bei den Morndinsamman! Sie sind tot! Ich hatte es befürchtet. Schnell, kehrt in die Stadt zurück und erstattet meinem Bruder Bresk und dem Rat Bericht. Ich werde die Wachen am Tor verstärken lassen, denn was immer sie getötet hat, könnte immer noch da draußen sein.~
IF ~~ THEN DO ~~ EXIT
END

IF ~~THEN BEGIN patrol_keep_searching
SAY ~Ich wünsche Euch weiterhin viel Glück bei der Suche.~
IF ~~ THEN DO ~~ EXIT
END

IF ~~THEN BEGIN 3
SAY ~Ihr steht vor dem Ultoksamrin-Tor nach Iltkazar, das Angehörigen aller guten Rassen den sichersten Unterschlupf bieten wird, den man nördlich der großen Spalte und südlich von Mithril-Halle in den Tiefen des Unterreichs finden kann. Sagt aber, was führt Euch vor die Tore Iltkazars?~
IF ~~ THEN REPLY ~Ich habe traurige Nachrichten, denn ich begegnete einem Bewohner Iltakazars, Beldas, der im Kampf gegen einen roten Drachen gefallen ist.~ + 5
IF ~~ THEN REPLY ~Der Zwerg Beldas hat mich hergeschickt. Falls es Euch kümmert: Er hat einen Kampf gegen einen roten Drachen nicht überstanden.~ + 5
END

IF ~~THEN BEGIN 5
SAY ~Gegen einen roten Drachen haben sie gekämpft? Dann... hat Beldas seinen Plan also tatsächlich in die Tat umgesetzt. Ich habe ihn vor einiger Zeit durch dieses Tor gehen lassen, und mein Gefühl sagte mir, dass ich ihn nicht würde aufhalten können- auch wenn ich mir wünschte, ihn wieder lebend durch das Tor zurücklassen zu dürfen. Ich fühle mich, als wäre es erst gestern gewesen, dass ich ihm Lebwohl und viel Glück auf seiner Reise gewünscht habe. Er wollte an die Oberfläche reisen, um unserer Stadt zu helfen.~
++ ~Ich komme aus Amn an der Oberfläche. Er suchte Hilfe für seinen schlafenden König.~ + 6
++ ~Damit hatte er nicht viel Glück. Deshalb bin ich hier, wegen Eures Königs.~ + 6
END

IF ~~THEN BEGIN 6
SAY ~Dann hat er Euch also davon erzählt? Ihr müsst sein Vertrauen schnell gewonnen haben, wenn er Euch gegenüber so offenherzig war.~
++ ~Ich denke, er sah keine andere Möglichkeit, als an der Oberfläche nach Hilfe zu suchen, um seine Stadt zu retten.~ + 7
++ ~Es war eines der letzten Dinge, die von seinen sterbenden Lippen kamen.~ + 7
++ ~Offenherzig würde ich es nicht nennen. Er hat mich in den Kampf mit diesem Drachen hineingezogen. Im Gegensatz zu ihm habe ich aber überlebt.~ + 7
END

IF ~~THEN BEGIN 7
SAY ~Ich sehe schon, Ihr wisst viel über uns, auch wenn wir wenig von Euch und den Landen, aus denen Ihr kommt, wissen. Und wenn Ihr den ganzen Weg hierher auf Euch genommen habt, scheint Ihr in guten Absichten zu kommen.~
IF ~~ THEN GOTO 8
IF ~InParty("viconia") !StateCheck("viconia",CD_STATE_NOTVALID)~ THEN GOTO chain_hathar_viconia
END

IF ~~THEN BEGIN 8
SAY ~Ich habe beschlossen, Euch Zutritt in die Stadt zu gewähren. Ihr müsst Euch bei meinem Bruder Bresk Steinschulter melden, der die Brücke über den Fluss Dhalnadar bewacht und oberster Kriegsmeister von Iltkazar ist. Er wird entscheiden, wie weiter zu verfahren ist.~
IF ~~ THEN GOTO 10
END

IF ~~THEN BEGIN 10
SAY ~Ich wünschte, ich könnte Euch begleiten, doch meine Pflicht erlaubt mir nicht, die Tore zu verlassen.~
IF ~~ THEN GOTO 11
END

IF ~~THEN BEGIN 11
SAY ~Ich möchte Euch jedoch zu bedenken geben, dass alle Entscheidungen, die Euch betreffen, mit Sicherheit vom Regentschaftsrat abgesegnet werden müssen. Und dessen Mitglieder sind leider manchmal sehr schwierig, wenn es um Fremdlinge wie Euch geht. Doch es steht mir nicht zu, dies zu entscheiden. Ich kann Euch nur in die Stadt hineinlassen, wie es dort mit Euch weitergeht, werden andere entscheiden müssen.~
= 
~Öffnet die Tore! Und heißt <CHARNAME> aus Amn in der Mithrilstadt willkommen!~
IF ~~ THEN DO ~EraseJournalEntry(@21021)
AddJournalEntry(@21022,QUEST_DONE)
SetGlobal("AC#_HatharCombat","ACIL20",2)~ EXIT
END

IF ~True()~ THEN BEGIN hello_idle
SAY ~Passt in den Tunneln um Iltkazar auf, <CHARNAME>. Ständig kommt dort etwas Neues aus den Spalten gekrochen, das Euch töten will!~
IF ~~ THEN EXIT
END

CHAIN IF ~~ THEN AC#HATH1 chain_hathar_viconia
~Verdammt, das sehe ich ja jetzt erst. Armbrustschützen - legt an! <CHARNAME> hat eine verdammte Drow in <PRO_HISHER>er Gruppe!~
== ViconiJ IF ~InParty("viconia") !StateCheck("viconia",CD_STATE_NOTVALID)~ THEN ~Sorgt Euch nicht, Zwerg. Ich komme nicht, um Eure kostbaren Steine zu stehlen oder Eure kleinen Geheimnisse zu lernen. Ich reise in Begleitung von <CHARNAME>, mehr nicht.~
== AC#HATH1 ~Pah! Warum sollte ich Euch vertrauen? Ich kenne Euch und Euresgleichen! Jedes Wort aus dem Munde einer Drow ist so giftig wie die Spinnen, die sie verehren.~
== ViconiJ ~Ihr kennt mein Volk? Dann wisst Ihr sicher auch, dass wir nicht alle gleich sind. Ich diene Shar, der Herrin der Nacht, nicht Lolth. Oder fürchtet Ihr Euch vielleicht ein wenig vor der Dunkelheit, Zwerg?~
== AC#HATH1 ~Furcht gehört nicht zu den Tugenden eines Zwerges. Aber Vorsicht ist der Bruder der Weisheit. Ihr gebt vor, eine Ausgestoßene der Dunkelelfen zu sein? Beweist es!~
== ViconiJ ~Was mehr sollte ich denn beweisen, als in einer Gruppe mit einem <PRO_RACE> von der Oberfläche zu reisen und Euch gerade in diesem Kampfe geholfen zu haben?~
== AC#HATH1 ~Ehe ich Euch passieren lasse, Dunkelelfe, müsst Ihr einen Beweis Eurer Abkehr von Lolth erbringen. Erkennt Ihr dieses Symbol, das ich hier aus meiner Tasche hole?~
== ViconiJ  ~Natürlich erkenne ich es. Es ist das Symbol der Spinnenkönigin. Warum tragt Ihr es mit Euch herum, Zwerg?~
== AC#HATH1 ~Habe es einer Drow-Priesterin vor einigen Tagen abgenommen. Die Schöne hatte ganz schön geröchelt, als ich ihr ganz langsam meine Axt durch die Kehle trieb. Aber mein Sieg soll nicht Eure Sorge sein. Spuckt auf das Symbol Lolths und verflucht ihren Namen hier und jetzt, als Zeichen Eures Bruchs mit der Spinnenkönigin.~
== ViconiJ ~Ich... soll vor einem Zwerg den Namen der Spinnenkönigin in den Schmutz ziehen?~
== AC#HATH1 ~Ganz genau, schönes schwarzes Mädchen. Wenn Ihr ihr wirklich abgeschworen habt, müsst Ihr ohnehin bergein, bergauf um Euer Leben fürchten - ob Ihr ihren Namen hier vor mir zusätzlich durch den Dreck zieht ist dabei nicht mehr von Belang!~
== ViconiJ ~Nun gut. Lolth mag die Gebieterin der Lügen und der Täuschung sein, aber ich diene ihr nicht mehr. Mögen die Spinnen, die sie so liebt, sich gegen sie wenden und ihre Netze zu ihrem eigenen Gefängnis spinnen. Ich spucke auf ihren Namen und verachte ihren Glauben.~
== AC#HATH1 ~Das ist ein schöner starker Fluch, Dunkelelfe. Ich werde Euch einlassen, aber bedenkt: Die Augen von Iltkazar ruhen auf Euch. Jeder Schritt, jeder Atemzug wird beobachtet werden. Ihr wäret nicht die erste, die versucht, uns zu täuschen, und es wäre klug, wenn Ihr nicht versucht, die letzte zu sein.~
END
IF~~THEN GOTO 8	
/*******************************************************************************************************
Dialog Hathar mit Githyanki
*******************************************************************************************************/

BEGIN ~AC#SZAG1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN gith_hello
SAY ~Ihr kommt zu spät, <PRO_RACE>.~
IF ~~ THEN REPLY ~Wieder die Githyanki! Gebt zu, Ihr steckt mit diesen Teufeln unter einer Decke!~ + 12
END

IF ~~ THEN BEGIN 12
SAY ~Glaubt mir, wir spielen in dieser ganzen Geschichte nur eine unbedeutende Nebenrolle. Es gibt alte Verträge, die zu erfüllen wir verpflichtet sind, und mit unserer Unterstützung haben wir nur unseren Teil einer tausend Jahre alten Abmachung erfüllt.~
IF ~~ THEN REPLY ~Abmachung? Was für eine Abmachung?~ + 17
END

IF ~~ THEN BEGIN 17
SAY ~Warum sollte ich Euch das sagen? Oder warum sollte ich es Euch nicht sagen? Egal- in dieser Angelegenheit helfen wir der Herrin der Drachen. Doch Ihr, <CHARNAME>, habt unseren Plänen durch die Rettung der Stadt einen Strich durch die Rechnung gemacht. Wir schlagen Euch als letzten Akt der Güte einen Handel vor. Euer Leben gegen das Leben des Königs.~
IF ~~ THEN REPLY ~Ihr wollt, dass ich König Mith Barak töte?~ + 18
END

IF ~~ THEN BEGIN 18
SAY ~Wie blutrünstig von Euch! Nein, wir möchten nur seine klägliche Hülle, die auf diesem Thron sitzt.~
IF ~~ THEN REPLY ~Ihr habt Hathar getötet.~ + 19
END

IF ~~ THEN BEGIN 19
SAY ~Ja, das habe ich. Dazu waren diese kläglichen Abishai offenbar nicht in der Lage.~
IF ~~ THEN REPLY ~Und mit so jemandem soll ich einen Handel eingehen?~ + 20
IF ~~ THEN REPLY ~Ich werde Euch für diese Tat zur Rechenschaft ziehen!~ + 20
END

IF ~~ THEN BEGIN 20
SAY ~Ach, das ist jetzt auch egal. Ich habe es mir anders überlegt und werde Euch hier einen qualvollen Tod bereiten!~
IF ~~ THEN DO ~SetGlobal("AC#HatharQuest","GLOBAL",3)
Enemy()~
EXIT
END

/*******************************************************************************************************
Dialog mit Zofe Lolth
*******************************************************************************************************/

BEGIN ~AC#DROW3~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY ~Halt, <RACE>! Keinen Schritt weiter!~
IF ~~ THEN REPLY ~Wer seid Ihr?~ + 2
END

	IF ~~ THEN BEGIN 2
	SAY ~Wir sind die, die Euch einen schnellen Tod bereiten werden, wenn Ihr näher kommt!~
	IF ~~ THEN REPLY ~Das ist gut zu wissen, Drow.~ + 3
	IF ~~ THEN REPLY ~Ihr würdet mich so oder so töten wollen, Drow. Wenn nicht jetzt, dann später.~ + 3
	END

		IF ~~ THEN BEGIN 3
		SAY ~Hört gut zu, <RACE>. Wenn Ihr mir eine Frage beantwortet, lassen wir Euch vielleicht wirklich am Leben.~
		IF ~!IsValidForPartyDialog("Viconia")~ THEN REPLY ~Und was für eine Frage soll das denn sein?~ + what_kinda_question
		IF ~IsValidForPartyDialog("Viconia")~ THEN EXTERN ~VICONIJ~ dont_trust_drow
		END

		IF ~~ THEN BEGIN what_kinda_question
		SAY ~Wir suchen nach einigen Abtrünnigen, die aus der Tempelstadt Lolths geflohen sind. Sie beten nun Vhaeraun, das dreckige Schwein, an. Habt Ihr sie gesehen?~
		IF ~~ THEN REPLY ~Nein.~ + nope
		IF ~~ THEN REPLY ~Was wäre Euch solch eine Information wert?~ + worth
		END
		
			IF ~~ THEN BEGIN worth
			SAY ~Euer Leben.~
			IF ~~ THEN REPLY ~Bedaure, aber darüber entscheide immer noch ich.~ + fight_02
			IF ~~ THEN REPLY ~Das klingt gut.~ + life_ok
			END
			
				IF ~~ THEN BEGIN life_ok
				SAY ~Nun gut, also frage ich noch einmal: Habt Ihr die Vhaeraun-Anbeter hier irgendwo gesehen?~
				IF ~~ THEN REPLY ~Nein.~ + nope
				END
				
					IF ~~ THEN BEGIN nope
					SAY ~Gut. Dann haben sie sich wahrscheinlich schon an die Oberfläche verkrochen, wo sie uns keinen Ärger mehr bereiten können.~
					IF ~~ THEN + farewell
					END
					
						IF ~~ THEN BEGIN farewell
						SAY ~Die Spinnenkönigin ist Euch heute gnädig gestimmt, <RACE>. Ich werde Euer erbärmliches Leben verschonen und meine Kraft für wichtigere Begegnungen aufheben.~
						IF ~~ THEN REPLY ~Wer sagt denn, dass ich *Euer* Leben verschonen möchte?~ + fight_02
						IF ~~ THEN REPLY ~Gehabt Euch wohl, Drow.~ + farewell_02
						END
						
						IF ~~ THEN BEGIN fight_02
						SAY ~Niemand spricht in solch einem Ton zu mir, unwürdiger *iblith*! Ihr werdet noch um einen schnellen Tod betteln, wenn die Macht der Spinnenkönigen über Euch entfesselt ist!~
						IF ~~ THEN DO ~SetGlobal("AC#BreskDrowPriestess","GLOBAL",4)
						Enemy()
						ActionOverride("AC#DROW4",Enemy())~ EXIT
						END

IF ~~ THEN BEGIN farewell_02
SAY ~Los, Männchen, mit dem *iblith* sind wir fertig. Wir ziehen weiter.~
IF ~~ THEN DO ~SetGlobal("AC#BreskDrowPriestess","GLOBAL",5)
ActionOverride("AC#DROW4",EscapeArea())
EscapeArea()~ EXIT
END

// ---------------------------------------------
// CHAIN - Abschied aus Iltkazar 01
// ---------------------------------------------

CHAIN IF WEIGHT #-1 ~Global("AC#Goodbye_Iltkazar","GLOBAL",4)~ THEN AC#BRES9 1
~So, <CHARNAME>, jetzt heißt es wirklich, Euch vorerst Lebewohl zu sagen. Seht, es sind alle gekommen!~
DO ~SetGlobal("AC#Goodbye_Iltkazar","GLOBAL",5)~
== AC#GROM9 ~Wir wünschen Euch viel Erfolg bei Eurer Reise, <CHARNAME>!~
== AC#DUN20 ~Passt gut auf Euch auf, <PRO_RACE>!~
== AC#ELER9 ~Ich freue mich schon auf ein Wiedersehen, <CHARNAME>. Möge der Irrende Wanderer über Euch wachen!~
== AC#ANT20 ~Und geht mit Moradins Segen!~
== AC#ELER9 ~Anthan?~
== AC#ANT20 ~Ja, hier bin ich. Jetzt ist nicht die Zeit für alte Fehden. Die Hoffnung der Stadt und meine ganz persönliche Hoffnung ruht auf Euch, <CHARNAME>!~
== AC#SORN9 ~Ihr werdet uns nicht enttäuschen, <CHARNAME>! Gehabt Euch wohl.~
== AC#VRON9 ~Eure Mission ist keine Leichte, vergesst das nicht.~
== AC#TURB9 ~Wenn jemand das Unmögliche schaffen könnte, unseren König aus dem Schlaf zu befreien, dann Ihr, <CHARNAME>!~
END
IF ~~ THEN EXTERN ~AC#HATH1~ goodbye_surface

/*******************************************************************************************************
Dialog dwarven warriors guarding the entrance to the lake
*******************************************************************************************************/

BEGIN ~AC#20DW8~

IF ~True()~ THEN BEGIN hello01
SAY ~Die Durchgänge nach Osten zum Eisensee bleiben verschlossen, bis Bresk Steinschulter uns befiehlt, diese wieder freizuschaffen. Sprecht mit ihm, wenn Ihr hier passieren wollt.~
IF ~~ THEN EXIT
END

// Dwarven Cleric
BEGIN ~AC#20DW9~

IF ~Global("Wheres_Cleric","ACIL20",1)~ THEN BEGIN i_am_here_hathar
SAY ~Ich bin hier, Hathar. Soll ich den Weg freiräumen?~
IF ~~ THEN DO ~SetGlobal("Wheres_Cleric","ACIL20",10)~ EXTERN ~AC#HATH1~ remove_stones_hr
END

IF ~True()~ THEN BEGIN hello01
SAY ~Die Durchgänge nach Osten zum Eisensee bleiben verschlossen, bis Bresk Steinschulter uns befiehlt, diese wieder freizuschaffen. Sprecht mit ihm, wenn Ihr hier passieren wollt.~
IF ~~ THEN EXIT
END

/*******************************************************************************************************
Dialog mit Drow
*******************************************************************************************************/

BEGIN ~AC#DROW1~

IF ~Global("AC#Drow_Mercy","GLOBAL",1)~ THEN BEGIN 1
SAY ~Naut usstan elghinn!~
IF ~~ THEN REPLY ~Was sagt Ihr da? Ich kann Euch nicht verstehen, Drow!~ DO ~SetGlobal("AC#_Drow_Mercy","ACIL20",2)~ + 2
END

IF ~~ THEN BEGIN 2
SAY ~Naut usstan elghinn! Naut usstan elghinn!~
IF ~IsValidForPartyDialog("Korgan")~ THEN EXTERN ~KORGANJ~ Korgan_Kill_Drow
IF ~IsValidForPartyDialog("Viconia")~ THEN EXTERN ~VICONIJ~ Viconia_Kill_Drow
IF ~!IsValidForPartyDialog("Viconia")
!IsValidForPartyDialog("Korgan")~ THEN REPLY ~Ich kann Euch nicht verstehen. Zeit zu sterben, Drow.~  + death
END

IF ~~ THEN BEGIN guallidurth
SAY ~Usstan doeb Guallidurth, yath Lolth.~
IF ~IsValidForPartyDialog("Viconia")~ THEN EXTERN ~VICONIJ~ guallidurth02
END

IF ~~ THEN BEGIN iltkazar01
SAY ~Zhaunil naubol - a'quarth ilhar. Ilindith kyorl.~
IF ~IsValidForPartyDialog("Viconia")~ THEN EXTERN ~VICONIJ~ iltkazar02
END

IF ~~ THEN BEGIN death
SAY ~Naut usstan elghinn! NAUT USSTAN ELGHINN!~
IF ~~ THEN DO ~SetGlobal("AC#_Drow_Death","GLOBAL",1)~ EXIT
END

/*******************************************************************************************************
NPC-Dialoge
*******************************************************************************************************/

APPEND ~KORGANJ~
IF ~~ THEN BEGIN Korgan_Kill_Drow
   SAY ~Ach, ist doch egal, was er sagt! Schlagen wir ihm den Kopf ab und gehen weiter!~
   IF ~~ THEN EXTERN ~AC#DROW1~ death
END
END

APPEND ~VICONIJ~
IF ~~ THEN BEGIN dont_trust_drow
   SAY ~Verhandelt nicht mit denen, <CHARNAME>. Sie werden Euch so oder so hintergehen.~
   IF ~~ THEN REPLY ~Lasst uns zunächst einmal ihre Frage anhören. He, Drow, was wollt Ihr von mir wissen?~ EXTERN ~AC#DROW3~ what_kinda_question
END

IF ~~ THEN BEGIN Viconia_Kill_Drow
   SAY ~Er winselt um Gnade und fleht Euch an, ihn nicht zu töten. Was für ein Schwächling!~
   IF ~~ THEN REPLY ~Viconia, könnt Ihr für mich übersetzen?~ + translate1
END

IF ~~ THEN BEGIN translate1
   SAY ~Was gebt Ihr Euch überhaupt mit so einem Männchen ab? Er hat Euch angegriffen, tötet ihn! Er wird Euch ohnehin bei der nächsten Gelegenheit das Schwert in die Brust rammen.~
   IF ~~ THEN REPLY ~Das ist meine Sache. Fragt ihn, woher er kommt.~ + translate2
END

IF ~~ THEN BEGIN translate2
   SAY ~Vel'klar el'lar dossta?~
   IF ~~ THEN EXTERN ~AC#DROW1~ guallidurth
END

IF ~~ THEN BEGIN guallidurth02
   SAY ~Er sagt, er stamme aus der Stadt Guallidurth, der Tempelstadt von Lolth.~
   IF ~~ THEN REPLY ~Habt Ihr von dieser Stadt schon einmal gehört?~ + guallidurth03
END

IF ~~ THEN BEGIN guallidurth03
   SAY ~Guallidurth ist eine der größten Drow-Städte weit im Süden. Die Verehrung Lolths ist dort besonders stark. Die Drow von dort führen einen Jahrtausende alten Kampf gegen die Oberflächenbewohner Calimshans.~
   IF ~~ THEN REPLY ~Fragt ihn bitte, warum er hier ist.~ + translate3
END

IF ~~ THEN BEGIN translate3
   SAY ~Doer nindyne Iltkazar?~
   IF ~~ THEN EXTERN ~AC#DROW1~ iltkazar01
END

IF ~~ THEN BEGIN iltkazar02
   SAY ~Er weiß es nicht. Offenbar wurde er von einer Mutter Oberin einfach auf Patrouille geschickt. Es sieht nicht so aus, dass er etwas über unsere Angelegenheit weiß. Ich denke auch nicht, dass jemand in Guallidurth Interesse an Iltkazar zu haben scheint, sonst hätten sie nicht so einen kläglichen Haufen auf diese Mission entsandt.~
   IF ~~ THEN REPLY ~Meint Ihr, er spricht die Wahrheit?~ + truth01
END

IF ~~ THEN BEGIN truth01
   SAY ~Seht ihn doch einmal an, <CHARNAME>, wie er zittert und vor sich hin stammelt. Wesen in Todesangst sprechen meistens die Wahrheit, um ihr wertloses Leben zu retten.~
   IF ~~ THEN REPLY ~Was sollen wir nun mit ihm machen?~ + kill01
END

IF ~~ THEN BEGIN kill01
   SAY ~Töten, was sonst?~
   IF ~~ THEN REPLY ~Ihr habt vermutlich Recht. Nun gut, Zeit zu sterben, Drow!~ EXTERN ~AC#DROW1~ death
END
END
