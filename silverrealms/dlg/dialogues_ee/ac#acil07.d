// Dialogue Cutscene Malphas searching Beldas
BEGIN AC#07MAL
BEGIN AC#07PES

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#07MAL hello_Malphas
	~Seid gegrüßt. Wo finde ich die Gaststätte zum Tanzenden Riesen?~ 
	== AC#07PES ~Bei den Göttern! Was seid Ihr denn für ein rabengesichtiges Scheusal?!~ 
	== AC#07MAL ~Ach, Maladomini. Das hatte ich ganz vergessen. Einen Moment bitte...~
	END
	IF ~~ THEN DO ~StartCutSceneMode()
	StartCutScene("AC#07CT2")~ EXIT
	
CHAIN IF ~True()~ THEN AC#07MAL hello_Malphas
	~So ist es besser. Also, noch einmal von vorne...~
	=
	~Seid gegrüßt, Freund. Sagt, finde ich hier in der Nähe die Gaststätte zum Tanzenden Riesen?~ 
	== AC#07PES ~Aber ja, Herr! Sie ist gleich hier die Straße herauf. Ihr könnt Sie nicht verfehlen! Ich komme gerade von dort!~ 
	== AC#07MAL ~Hervorragend! Wo Ihr gerade von dem Gasthaus kommt - Ihr habt dort nicht zufällig drei Zwerge gesehen?~
	== AC#07PES ~Doch, mein Herr! Sie hielten sich an einem der hinteren Tische auf. Einer von ihnen war richtig freundlich!~
	== AC#07MAL ~Schön! Ich denke, das sind genau die, nach denen ich suche.~
	== AC#07PES ~Kann ich sonst noch etwas für Euch tun, Herr?~
	== AC#07MAL ~Das wäre vorerst alles. Ihr dürft Euch entfernen.~
	END
	IF ~~ THEN DO ~StartCutSceneMode()
	StartCutScene("AC#07CT3")~ EXIT	

// Dialogue dying innkeeper
BEGIN ~AC#4IIN2~
CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#4IIN2 hello
~Beim feurigen Atem Kossuths, flieht, so lange Ihr noch könnt!~
END
IF ~~ THEN REPLY ~Was ist denn hier passiert?~ EXTERN AC#4IIN2 what_happened
IF ~~ THEN REPLY ~Haltet durch, ich helfe Euch!~ EXTERN AC#4IIN2 wait_i_help_you
IF ~~ THEN REPLY ~Wo sind die Zwerge, die sich bisher in der Taverne aufgehalten hatten?~ EXTERN AC#4IIN2 where_are_the_dwarves_01

	CHAIN AC#4IIN2 wait_i_help_you
	~Mir... ist glaube ich nicht mehr zu helfen, fürchte ich...~
	END
	IF ~~ THEN EXTERN AC#4IIN2 what_happened_02
	
	CHAIN AC#4IIN2 what_happened
	~Ich... weiß es nicht.~ 
	END
	IF ~~ THEN EXTERN AC#4IIN2 what_happened_02
	
	CHAIN AC#4IIN2 what_happened_02
	~Ich war drinnen in der Taverne, als draußen plötzlich großes Geschrei und Lärm ausbrach. Es gab einen lauten Knall, und dann ist plötzlich alles in Flammen gestanden! Ich konnte mich gerade noch nach draußen retten, bevor die brennenden Balken meiner schönen Gaststube hinter mir zusammenbrachen!~
	END
	IF ~~ THEN REPLY ~Wo sind die Zwerge, die sich bisher in der Taverne aufgehalten hatten?~ EXTERN AC#4IIN2 where_are_the_dwarves_01
	
	CHAIN AC#4IIN2 where_are_the_dwarves_01
	~Die Zwerge?  Die waren kurz vorher hastig abgereist. Oh - Fast hätte ich es vergessen: Ihr Anführer bat mich, Euch einen Brief zu geben.~
	END
	IF ~~ THEN REPLY ~Habt Ihr den Brief noch?~ DO ~GiveItemCreate("AC#4ILET",Player1,0,0,0)~ EXTERN AC#4IIN2 give_letter	
	IF ~~ THEN REPLY ~Und das sagt Ihr mir erst jetzt?~ DO ~GiveItemCreate("AC#4ILET",Player1,0,0,0)~ EXTERN AC#4IIN2 give_letter_02	
	
	CHAIN AC#4IIN2 give_letter
	~Aber sicher.~ 
	END
	IF ~~ THEN EXTERN AC#4IIN2 give_letter_02
	
	CHAIN AC#4IIN2 give_letter_02
	~Hier ist er... in meiner Tasche... hat das Feuer ganz gut überlebt - im Gegensatz zu mir!~
	END	
	IF ~~ THEN REPLY ~Haben die Zwerge erwähnt, wohin sie gegangen sind?~ EXTERN AC#4IIN2 where_did_they_go	
	IF ~~ THEN REPLY ~So, und jetzt haltet kurz still, damit ich Euch heilen kann.~ EXTERN AC#4IIN2 bye_02	
	IF ~~ THEN REPLY ~Danke für Eure Hilfe. Ich werde mich nun wieder auf den Weg machen.~ EXTERN AC#4IIN2 bye_02
	
		CHAIN AC#4IIN2 where_did_they_go
		~Sie sind ziemlich überhastet aufgebrochen - weit nach Süden, wie es scheint. Soweit ich weiß, wollten sie in Tethyr irgendeinen Berg erklimmen. Das hätte ich gerne gesehen: Einen Zwerg beim Klettern!~
		END
		IF ~~ THEN REPLY ~Danke für Eure Hilfe.~ EXTERN AC#4IIN2 bye_02
		
		
			CHAIN AC#4IIN2 bye_02
			~Ich... fürchte... das war das Letzte, was ich in diesem Leben getan habe...~
			END
			IF ~~ THEN DO ~SetGlobal("AC#IltkazarQuest#2","GLOBAL",20)
		RevealAreaOnMap("ACIL0A")
		EraseJournalEntry(@20070)
		EraseJournalEntry(@20002)		
		AddJournalEntry(@20010,QUEST)
		Kill(Myself)~ EXIT

CHAIN IF ~True()~ THEN AC#4IIN2 hello
~Ich hätte nie gedacht, dass sterben so lange dauert! *Hust*~
END
IF ~~ THEN REPLY ~Was ist denn hier passiert?~ EXTERN AC#4IIN2 what_happened
IF ~~ THEN REPLY ~Wo sind die Zwerge, die sich bisher in der Taverne aufgehalten hatten?~ EXTERN AC#4IIN2 where_are_the_dwarves_01	
/*******************************************************************************************************
Dialog Tiamataner in ACIL07
*******************************************************************************************************/

/*
BEGIN ~AC#CLTI1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY  ~Hmm... lasst einmal sehen... <PRO_RACE>, <PRO_MALEFEMALE>, ja, das könnte hinkommen. Ihr müsst <CHARNAME> sein.~
++ ~Was wollt Ihr von mir?~ + 2
END

	IF ~~ THEN BEGIN 2
	SAY ~Ihr mischt Euch in Angelegenheiten ein, die Euch nichts angehen.~
	++ ~Seid Ihr für die Verwüstungen hier verantwortlich?~ + 3
	END

		IF ~~ THEN BEGIN 3
		   SAY ~Natürlich sind wir das. Und dies ist erst der Anfang! Bald wird wieder die Zeit gekommen sein, in der die Drachen wieder Faerun beherrschen werden!~
		++ ~Ihr seid ein unverantwortlicher Spinner.~ + 4
		++ ~Tut mir leid, aber ich betrachte diesen Teil Faeruns mittlerweile als meine Heimat. Brennende Häuser möchte ich dort keine sehen.~ + 4
		++ ~Das klingt gut!~ + 5
		END
		
			IF ~~ THEN BEGIN 4
			SAY ~Auf Euren Kopf ist von meiner Kirche ein hoher Preis ausgesetzt worden! Diesen werde ich mir nun verdienen!~
			IF ~~ THEN DO ~Enemy()
			ActionOverride("AC#FITI1",Enemy())
			ActionOverride("AC#FITI1",Enemy())~  EXIT
			END	
			
			IF ~~ THEN BEGIN 5
			SAY ~Ja, nicht? Auf Euren Kopf ist aber von meiner Kirche ein hoher Preis ausgesetzt worden. Diesen werde ich mir nun verdienen!~
			IF ~~ THEN DO ~Enemy()
			ActionOverride("AC#FITI1",Enemy())
			ActionOverride("AC#FITI1",Enemy())~  EXIT
			END	
*/