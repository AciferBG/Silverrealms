
/*******************************************************************************************************
Dialogue in area ACIL95: dwarven map, revealing Ravimor's cave area
*******************************************************************************************************/

BEGIN ~AC#95MAP~

CHAIN IF ~Global("Ravimor_revealed","ACIL95",2)~ THEN AC#95MAP hello_ravimor_revealed
		~Geht zu Ravimors Höhle, um Iltkazar zu erreichen. Doch nehmt Euch in Acht, Wanderer, denn die Höhle hat lange kein Zwerg mehr betreten, und der Weg von dort durch das Unterreich bleibt voller Tücken...~ [AC#MGSS1]
		DO ~SetGlobal("Ravimor_revealed","ACIL95",3)~ EXIT
		
CHAIN IF ~Global("Iltkazar_revealed","ACIL95",2)~ THEN AC#95MAP hello_iltkazar_revealed
~Hier liegt Iltkazar, tief unter dem Gestein der Omlarandinberge. Die Zugänge nach Iltkazar waren zahlreich, doch die meisten sind mittlerweile verschlossen... Welche Zugänge gibt es noch, die Ihr nehmen könnt?~ [AC#MGSS1]
DO ~SetGlobal("Iltkazar_revealed","ACIL95",3)~ EXTERN AC#95MAP iltkazar_entry

	CHAIN IF ~~ THEN AC#95MAP iltkazar_entry
	~Drakkalor ist von einem unbekannten Übel befallen und nicht sicher. Die Halle des Blutmondes ist versiegelt. Als einziger Zugang nach Iltkazar bleibt Ravimors Höhle; im Norden der Kuldingipfel nördlich der Omlarandinberge gelegen.~ 
	END
	IF~~THEN REPLY ~Ravimors Höhle?~ EXTERN AC#95MAP ravimors_cave_01
	IF~~THEN REPLY ~Wie komme ich dorthin?~ EXTERN AC#95MAP ravimors_cave_01
	
	CHAIN IF ~~ THEN AC#95MAP ravimors_cave_01
	~Ravimors Höhle... auch dieser Zugang ist als unsicher markiert. Doch er bleibt Eure einzige Wahl. Die Höhle wurde nicht von Zwergenhand geschaffen. Sie ist so alt wie die Schöpferrassen, beinahe älter als die Berge selbst.~
	=
	~Die Figur zeigt Euch den Weg zu Ravimors Höhle...~
	DO ~SetGlobal("Ravimor_revealed","ACIL95",1)
		ClearAllActions()
		StartCutSceneMode()
		StartCutScene("AC#IL95R")~ EXIT

CHAIN IF ~GlobalGT("Ravimor_map","ACIL95",0)~ THEN AC#95MAP hello_01_revealed
~Seid gegrüßt, Suchender. Steht in Ehrfurcht und staunt über die Errungenschaften der zwergischen Rasse. Dieser Raum zeigt Euch jeden Ort, den Ihr im glorreichen Shanatar erreichen wollt. Geschaffen in zahllosen Stunden harter Arbeit unter den wachsamen Augen Borthuns des Wanderers. In ewiges Metall gegossen, um die Reise zwischen allen Zwergenreichen zu ermöglichen.~ [AC#MGSS1]
END
IF~~THEN DO ~SetGlobal("TalkToStatue","ACIL95",2)~ EXTERN AC#95MAP hello_01_cont

	CHAIN IF ~~ THEN AC#95MAP hello_01_cont
	~Jeder Zwerg, der seinen Weg nicht kennt, kommt hierher. Danach weiß er, wo er hingehen muss. Wo wird es Euch hinführen?~
	END
	IF~~THEN REPLY ~Ihr könnt mir Orte zeigen, die ich noch nicht kenne?~ EXTERN AC#95MAP show_places_start
	IF~~THEN REPLY ~Ich muss nach Iltkazar.~ EXTERN AC#95MAP seek_Iltkazar
	IF~~THEN REPLY ~Ich komme später wieder.~ EXTERN AC#95MAP leave

CHAIN IF ~Global("TalkToStatue","ACIL95",1)~ THEN AC#95MAP hello_wheel
~Seid gegrüßt, Suchender. Steht in Ehrfurcht und staunt über die Errungenschaften der zwergischen Rasse. Dieser Raum zeigt Euch jeden Ort, den Ihr im glorreichen Shanatar erreichen wollt. Geschaffen in zahllosen Stunden harter Arbeit unter den wachsamen Augen Borthuns des Wanderers. In ewiges Metall gegossen, um die Reise zwischen allen Zwergenreichen zu ermöglichen.~ [AC#MGSS1]
END
IF~~THEN DO ~SetGlobal("TalkToStatue","ACIL95",2)~ EXTERN AC#95MAP hello_00_cont	

CHAIN IF ~Global("TalkToStatue","ACIL95",0)~ THEN AC#95MAP hello_00
~Seid gegrüßt, Suchender. Steht in Ehrfurcht und staunt über die Errungenschaften der zwergischen Rasse. Dieser Raum zeigt Euch jeden Ort, den Ihr im glorreichen Shanatar erreichen wollt. Geschaffen in zahllosen Stunden harter Arbeit unter den wachsamen Augen Borthuns des Wanderers. In ewiges Metall gegossen, um die Reise zwischen allen Zwergenreichen zu ermöglichen.~ [AC#MGSS1]
END
IF~~THEN DO ~SetGlobal("TalkToStatue","ACIL95",1)~ EXTERN AC#95MAP hello_00_cont

	CHAIN IF ~~ THEN AC#95MAP hello_00_cont
	~Jeder Zwerg, der seinen Weg nicht kennt, kommt hierher. Danach weiß er, wo er hingehen muss. Wo wird es Euch hinführen?~
	END
	//IF~~THEN REPLY ~Ihr könnt mir Orte zeigen, die ich noch nicht kenne?~ EXTERN AC#95MAP show_places_start
	IF~~THEN REPLY ~Ich muss nach Iltkazar.~ EXTERN AC#95MAP seek_Iltkazar
	//IF~~THEN REPLY ~Ich komme später wieder.~ EXTERN AC#95MAP leave

CHAIN IF ~True()~ THEN AC#95MAP hello_01
~Seid gegrüßt, Suchender. Steht in Ehrfurcht und staunt über die Errungenschaften der zwergischen Rasse. Dieser Raum zeigt Euch jeden Ort, den Ihr im glorreichen Shanatar erreichen wollt. Geschaffen in zahllosen Stunden harter Arbeit unter den wachsamen Augen Borthuns des Wanderers. In ewiges Metall gegossen, um die Reise zwischen allen Zwergenreichen zu ermöglichen.~ [AC#MGSS1]
END
IF~~THEN EXTERN AC#95MAP hello_00_cont


	CHAIN IF ~~ THEN AC#95MAP show_places_start
	~Dieser Raum kann Euch die Orte des glorreichen Shanatar zeigen. Welchen Ort wollt Ihr aufsuchen?~
	END
	IF~~THEN REPLY ~Iltkazar.~ EXTERN AC#95MAP seek_Iltkazar
	IF~~THEN REPLY ~Kerzenburg.~ EXTERN AC#95MAP candlekeep
	IF~~THEN REPLY ~Athkatla.~ EXTERN AC#95MAP athkatla
	IF~~THEN REPLY ~Tiefwasser.~ EXTERN AC#95MAP waterdeep
	IF~~THEN REPLY ~Ich komme später wieder.~ EXTERN AC#95MAP leave

		CHAIN IF ~~ THEN AC#95MAP seek_Iltkazar
		~Iltkazar, das Mithrilkönigreich. Tief verborgen unter den Omlarandinbergen unter den Ländern Tethyrs. Einen Moment, die Figur auf der Karte wird aktiviert...~
		DO ~SetGlobal("Iltkazar_revealed","ACIL95",1)
		ClearAllActions()
		StartCutSceneMode()
		StartCutScene("AC#IL95I")~ EXIT
		
		CHAIN IF ~~ THEN AC#95MAP candlekeep
		~Kerzenburg? Solch ein Ort existiert nicht.~
		END
		IF~~THEN EXTERN AC#95MAP show_places_start
		
		CHAIN IF ~~ THEN AC#95MAP athkatla
		~Athkatla? Solch ein Ort existiert nicht.~
		END
		IF~~THEN EXTERN AC#95MAP show_places_start
		
		CHAIN IF ~~ THEN AC#95MAP waterdeep
		~Tiefwasser ist nichts als ein unbedeutendes Fischerdorf im Norden.~
		END
		IF~~THEN EXTERN AC#95MAP show_places_start

CHAIN IF ~~ THEN AC#95MAP leave
~Zieht Eures Weges, Wanderer.~
EXIT
