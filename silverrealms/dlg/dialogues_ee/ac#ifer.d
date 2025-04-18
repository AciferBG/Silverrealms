

/*******************************************************************************************************
Acifer the DM
*******************************************************************************************************/
BEGIN ~AC#IFER~

IF ~True()~ THEN BEGIN hello
SAY ~Ich bin der Spielleiter. Was kann ich für Euch tun?~
++ ~Nichts.~ EXIT
IF ~~ THEN REPLY ~Gib' mir Gold. (100.000 GM geben.)~ + give_gold
IF ~~ THEN REPLY ~Zeig' mir die Karten auf der Worldmap. (Alle Karten der Mod aufdecken.)~ GOTO show_worldmap
IF ~~ THEN REPLY ~Mach' mich fit für's Abenteuer. (200.000 Erfahrungspunkte geben.)~ + give_xp
IF ~~ THEN REPLY ~Gib' mir gute Ausrüstung! (Eine Auswahl guter Ausrüstung erschaffen.)~ + give_items
IF ~~ THEN REPLY ~Verschwinde.~ + get_off
END

IF ~~ THEN BEGIN give_gold
SAY ~Ihr werdet im Reichtum schwimmen!~
IF ~~ THEN DO ~GiveGoldForce(100000)~ EXIT 
END

	IF ~~ THEN BEGIN show_worldmap
	SAY ~Nichts leichter als das!~
	IF ~~ THEN DO ~RevealAreaOnMap("ACIL0A")
	RevealAreaOnMap("ACIL4M")
	RevealAreaOnMap("ACIL01")
	RevealAreaOnMap("ACIL03")
	RevealAreaOnMap("ACIL04")
	RevealAreaOnMap("ACIL06")
	RevealAreaOnMap("ACIL41")
	RevealAreaOnMap("ACIL20")
	RevealAreaOnMap("ACIL70")
	RevealAreaOnMap("ACIL9F")~ EXIT
	END
	
	IF ~~ THEN BEGIN give_xp
	SAY ~Hoffentlich fühlt Ihr Euch jetzt besser.~
	IF ~~ THEN DO ~	AddXPObject(Player1,200000)
		AddXPObject(Player2,200000)
		AddXPObject(Player3,200000)
		AddXPObject(Player4,200000)
		AddXPObject(Player5,200000)
		AddXPObject(Player6,200000)~ EXIT 
	END
	
	IF ~~ THEN BEGIN give_items
	SAY ~Soviel Ihr tragen könnt!~
	IF ~~ THEN DO ~GiveItemCreate("sw2h14",Player1,0,0,0)
	GiveItemCreate("helm07",Player1,0,0,0)
	GiveItemCreate("wa2plat",Player1,0,0,0)
	GiveItemCreate("wa2shiel",Player1,0,0,0)
	GiveItemCreate("helm06",Player1,0,0,0)
	GiveItemCreate("wa2helm",Player1,0,0,0)
	GiveItemCreate("amul16",Player1,0,0,0)
	GiveItemCreate("amul17",Player1,0,0,0)
	GiveItemCreate("amul21",Player1,0,0,0)
	GiveItemCreate("wa2amu",Player1,0,0,0)
	GiveItemCreate("wa2robe",Player1,0,0,0)
	GiveItemCreate("sw1h40",Player1,0,0,0)
	GiveItemCreate("ax1h12",Player1,0,0,0)
	GiveItemCreate("ax1h13",Player1,0,0,0)
	GiveItemCreate("hamm04",Player1,0,0,0)
	GiveItemCreate("bow12",Player1,0,0,0)
	GiveItemCreate("bow14",Player1,0,0,0)
	GiveItemCreate("bow15",Player1,0,0,0)
	GiveItemCreate("bow19",Player1,0,0,0)
	GiveItemCreate("brac04",Player1,0,0,0)
	GiveItemCreate("brac15",Player1,0,0,0)
	GiveItemCreate("brac06",Player1,0,0,0)
	GiveItemCreate("brac07",Player1,0,0,0)
	GiveItemCreate("brac17",Player1,0,0,0)
	GiveItemCreate("belt06",Player1,0,0,0)
	GiveItemCreate("belt08",Player1,0,0,0)
	GiveItemCreate("amul22",Player1,0,0,0)
	GiveItemCreate("amul14",Player1,0,0,0)
	GiveItemCreate("ring09",Player1,0,0,0)
	GiveItemCreate("ring31",Player1,0,0,0)
	GiveItemCreate("ring34",Player1,0,0,0)
	GiveItemCreate("ring35",Player1,0,0,0)
	GiveItemCreate("ring39",Player1,0,0,0)
	GiveItemCreate("ring07",Player1,0,0,0)
	GiveItemCreate("ring22",Player1,0,0,0)
	GiveItemCreate("leat16",Player1,0,0,0)
	GiveItemCreate("leat17",Player1,0,0,0)
	GiveItemCreate("plat16",Player1,0,0,0)
	GiveItemCreate("misc38",Player1,0,0,0)
	GiveItemCreate("plat04",Player1,0,0,0)
	GiveItemCreate("plat19",Player1,0,0,0)
	GiveItemCreate("shld19",Player1,0,0,0)
	GiveItemCreate("shld22",Player1,0,0,0)
	GiveItemCreate("shld23",Player1,0,0,0)
	GiveItemCreate("shld28",Player1,0,0,0)
	GiveItemCreate("bag03",Player1,0,0,0)
	GiveItemCreate("bag04",Player1,0,0,0)
	GiveItemCreate("bag02",Player1,0,0,0)
	GiveItemCreate("bag06",Player1,0,0,0)
	GiveItemCreate("slng03",Player1,0,0,0)
	GiveItemCreate("slng02",Player1,0,0,0)
	GiveItemCreate("xbow03",Player1,0,0,0)
	GiveItemCreate("xbow15",Player1,0,0,0)
	GiveItemCreate("staf08",Player1,0,0,0)
	GiveItemCreate("staf20",Player1,0,0,0)
	GiveItemCreate("wand11",Player1,0,0,0)
	GiveItemCreate("wand13",Player1,0,0,0)
	GiveItemCreate("wand03",Player1,0,0,0)
	GiveItemCreate("bull03",Player1,40,0,0)
	GiveItemCreate("arow11",Player1,40,0,0)
	GiveItemCreate("arow12",Player1,40,0,0)
	GiveItemCreate("arow16",Player1,40,0,0)
	GiveItemCreate("bolt04",Player1,40,0,0)
	GiveItemCreate("bolt06",Player1,40,0,0)
	GiveItemCreate("bolt06",Player1,40,0,0)
	GiveItemCreate("potn52",Player1,30,0,0)
	GiveItemCreate("potn20",Player1,30,0,0)
	GiveItemCreate("scrl1v",Player1,0,0,0)
	GiveItemCreate("scrl6n",Player1,0,0,0)
	GiveItemCreate("scrl1w",Player1,0,0,0)
	GiveItemCreate("scrl2e",Player1,0,0,0)
	GiveItemCreate("scrl5i",Player1,0,0,0)
	GiveItemCreate("scrl5p",Player1,0,0,0)
	GiveItemCreate("scrl7m",Player1,0,0,0)
	GiveItemCreate("scrl6u",Player1,0,0,0)~ EXIT 
	END
	
	IF ~~ THEN BEGIN get_off
	SAY ~Und tschüss!~
	IF ~~ THEN DO ~DestroySelf()~ EXIT 
	END





