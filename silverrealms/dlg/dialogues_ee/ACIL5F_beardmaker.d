


/*******************************************************************************************************
Dialogue beardmaker
*******************************************************************************************************/

BEGIN ~AC#ILBDM~

CHAIN IF ~Global("AC#IL_Beardmaker","GLOBAL",5) GlobalTimerExpired("AC#IL_Beardmaker_Cloak","GLOBAL")~ THEN AC#ILBDM hello_cloak_not_ready
~Oh! Ihr seid es! Hier, seht, der Umhang ist gerade fertig geworden! Dürfte Euch bei Euren Reisen gute Dienste leisten. Und der Bart ist ebenfalls schön geworden! Wird mir eine große Menge Edelsteine einbringen.~
END
IF ~~ THEN DO ~SetGlobal("AC#IL_Beardmaker","GLOBAL",10)
AddJournalEntry(@53403,QUEST_DONE)
GiveItemCreate("AC#ILCK5",Player1,0,0,0) ~ EXIT

CHAIN IF ~Global("AC#IL_Beardmaker","GLOBAL",5) !GlobalTimerExpired("AC#IL_Beardmaker_Cloak","GLOBAL")~ THEN AC#ILBDM hello_cloak_not_ready
~Der Umhang ist noch nicht fertig. Kommt später wieder.~
END
IF ~~ THEN EXIT

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#ILBDM hello_0
~Ein Fremder. Tretet näher! Euer Bart sieht verbesserungswürdig aus.~
END
IF ~~ THEN REPLY ~Was genau macht Ihr hier?~ EXTERN AC#ILBDM what_do_you_do
IF ~~ THEN REPLY ~Ich habe gar keinen Bart.~ EXTERN AC#ILBDM dont_have_a_beard

CHAIN IF ~True()~ THEN AC#ILBDM hello_1
~Willkommen in meiner Werkstatt. Fasst nichts an. Was auch immer Ihr sucht, es wächst nicht von allein.~
END
IF ~~ THEN REPLY ~Was genau macht Ihr hier?~ EXTERN AC#ILBDM what_do_you_do
IF ~Global("AC#IL_Beardmaker","GLOBAL",0)~ THEN REPLY ~Bin schon wieder weg.~ EXTERN AC#ILBDM bye_first_02
IF ~GlobalGT("AC#IL_Beardmaker","GLOBAL",0)~ THEN REPLY ~Bin schon wieder weg.~ EXTERN AC#ILBDM bye_01
IF ~GlobalGT("AC#IL_Beardmaker","GLOBAL",0)~ THEN REPLY ~Wegen der Materialien für Bärte...~ EXTERN AC#ILBDM about_materials

	CHAIN AC#ILBDM about_materials
	~Oh! Habt Ihr etwas gefunden, das ich verwenden könnte?~
	END
	IF ~PartyHasItem("AC#ILBDM")~ THEN REPLY ~Wie wäre es mit dieser Drider-Seide?~ DO ~TakePartyItem("AC#ILBDM") DestroyItem("AC#ILBDM")~ EXTERN AC#ILBDM have_drider_silk
	IF ~~ THEN REPLY ~Leider noch nicht, nein.~ EXTERN AC#ILBDM bye_no_materials

		CHAIN AC#ILBDM have_drider_silk
		~Bei Moradins Bart… was habt Ihr mir da gebracht? Drider-Seide? Lebendig gesponnen. Wisst Ihr, wie viele Zwerge sich wünschen würden, so etwas nie berührt zu haben?~
		END
		IF ~~ THEN REPLY ~Und Ihr?~ EXTERN AC#ILBDM have_drider_silk_02
		
		CHAIN AC#ILBDM have_drider_silk_02
		~Diese Seide hält. Und ist weich. Sie hat außerdem ein strahlendes weiß. Es ist schwierig, einen sehr weichen weißen Bart zu machen. Ich werde daraus ein schönes Stück für ältere Zwerge herstellen. Etwas, das besser ist als die Kreatur, die sie geschaffen hat!~
		END
		IF ~~ THEN EXTERN AC#ILBDM have_drider_silk_create_cloak
		
			CHAIN AC#ILBDM have_drider_silk_create_cloak
			~War sicher nicht einfach, so etwas zu finden. Da Ihr mir von dem Zeug ausreichend viel mitgebracht habt, kann ich Euch daraus noch einen Mantel weben. Oder hättet Ihr lieber einen Bart?~
			END
			IF ~~ THEN REPLY ~Nein, ein Umhang würde und ganz und gar reichen.~ EXTERN AC#ILBDM create_cloak_bye
			
			CHAIN AC#ILBDM create_cloak_bye
			~Habe ich mir schon gedacht. Also gut, kommt morgen wieder vorbei, dann ist Euer Gewand fertig. Mache mich gleich an die Arbeit!~
			END
			IF ~~ THEN DO ~SetGlobal("AC#IL_Beardmaker","GLOBAL",5)
			SetGlobalTimer("AC#IL_Beardmaker_Cloak","GLOBAL",ONE_DAY)
			AddJournalEntry(@53402,QUEST)~ EXIT
			
			CHAIN AC#ILBDM bye_no_materials
			~Hm. Ihr wisst, wo Ihr mich finden könnt, wenn Ihr etwas gefunden habt.~
			END
			IF ~~ THEN EXIT
		
		CHAIN AC#ILBDM dont_have_a_beard
		~Na eben deshalb. Könnte Euch einen guten Bart verkaufen, wenn Euch danach der Sinn steht.~
		END
		IF ~~ THEN REPLY ~Ihr verkauft also... falsche Bärte?~ EXTERN AC#ILBDM false_beards

	CHAIN AC#ILBDM what_do_you_do
	~Ich mache Bärte. Gute Bärte. Dichte, stolze, ehrwürdige Bärte. Für Zwerge und alle anderen, die es ernst meinen mit ihrem Aussehen.~
	END
	IF ~~ THEN REPLY ~Ihr verkauft also... falsche Bärte?~ EXTERN AC#ILBDM false_beards
						
						
		CHAIN AC#ILBDM false_beards
		~Falsch? Nein. Gewachsen durch Kunst, Geduld und altes Wissen. Andere schmieden Helme, ich flechte Bärte.~
		END
		IF ~~ THEN REPLY ~Und warum braucht ein Zwerg so etwas?~ EXTERN AC#ILBDM why_need
		IF ~~ THEN REPLY ~Ich muss weiter.~ EXTERN AC#ILBDM bye_first_02
						

		CHAIN AC#ILBDM why_need
		~Weil ein Bart spricht, bevor ein Zwerg es tut. Und nicht jeder Bart sagt das Richtige. Meine Bärte schon!~
		END
		IF ~~ THEN REPLY ~Verstehe.~ EXTERN AC#ILBDM bye_first
						

			CHAIN AC#ILBDM bye_first
			~Wenn Ihr je Eindruck machen wollt – bei einem Rat, einer Feier oder einem Duell – Ihr wisst, wo Ihr mich findet.~
			END
			IF ~Global("AC#IL_Beardmaker","GLOBAL",0)~ THEN REPLY ~Ich werde es beherzigen. Lebt wohl.~ EXTERN AC#ILBDM bye_first_02
			IF ~GlobalGT("AC#IL_Beardmaker","GLOBAL",0)~ THEN REPLY ~Ich werde es beherzigen. Lebt wohl.~ EXTERN AC#ILBDM bye_01
						
			CHAIN AC#ILBDM bye_first_02
			~Ehe Ihr geht, noch ein Wort.~
			END
			IF ~~ THEN REPLY ~Sicher, was wollt Ihr?~ EXTERN AC#ILBDM quest_crafting
			IF ~~ THEN REPLY ~Dafür habe ich keine Zeit.~ EXTERN AC#ILBDM bye_01
						
			CHAIN AC#ILBDM quest_crafting
			~Hörte, Ihr streift doch regelmäßig durch das Unterreich, richtig?~
			END
			IF ~~ THEN REPLY ~Ja, gezwungenermaßen.~ EXTERN AC#ILBDM quest_crafting_02
						
			CHAIN AC#ILBDM quest_crafting_02
			~Im Unterreich gibt es Dinge, die kein Zwerg hier je zu Gesicht bekommt. Ich bin immer auf der Suche nach Dingen, die meine Bärte verbessern könnten.~
			END
			IF ~~ THEN EXTERN AC#ILBDM quest_crafting_03
						
			CHAIN AC#ILBDM quest_crafting_03
			~Solltet Ihr auf solches Material stoßen – sauber, unverdorben, ungewöhnlich – bringt es mir. Aus manchem wächst kein Bart von selbst... aber unter meinen Händen wird er einer. Denn ein Bart mit Geschichte sitzt besser als jeder Helm.~
			END
			IF ~PartyHasItem("AC#ILBDM")~ THEN REPLY ~Wie wäre es mit dieser Drider-Seide?~ DO ~TakePartyItem("AC#ILBDM") DestroyItem("AC#ILBDM")~ EXTERN AC#ILBDM have_drider_silk
			IF ~~ THEN REPLY ~Ich werde die Augen offenhalten.~ EXTERN AC#ILBDM quest_crafting_bye
			IF ~~ THEN REPLY ~Wenn ich etwas Ungewöhnliches finde, bringe ich es Euch.~ EXTERN AC#ILBDM quest_crafting_bye
			IF ~~ THEN REPLY ~Ich verspreche nichts – aber ich merke es mir.~ EXTERN AC#ILBDM quest_crafting_bye
			IF ~~ THEN REPLY ~Euer Handwerk in Ehren, aber das ist nicht meine Aufgabe.~ EXTERN AC#ILBDM quest_crafting_bye
						
			CHAIN AC#ILBDM quest_crafting_bye
			~Wie Euch beliebt. Ihr wisst, wo Ihr mich finden könnt.~
			END
			IF ~~ THEN DO ~SetGlobal("AC#IL_Beardmaker","GLOBAL",1)
			AddJournalEntry(@53400,QUEST)~ EXIT
			
			CHAIN AC#ILBDM bye_01
			~Möge der Bart nie reißen und der Mut nicht ausfransen.~
			END
			IF ~~ THEN EXIT
						


