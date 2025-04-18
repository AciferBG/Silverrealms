
// RestInterrupt: Guard

BEGIN ~AC#S#RES~

IF ~True()~ THEN BEGIN no_rest
  SAY ~He, Oberflächen-<RACE>! Ich weiß zwar nicht, wie Ihr das oben unter freiem Himmel handhabt, aber hier unten in unserer Stadt geht man in ein Wirtshaus, wenn man rasten möchte!~
	IF ~~ THEN DO ~EscapeArea()~ EXIT
	END

// ---------------------------------------------
// Iltkazar guardians before first encounter in regency council
// --------------------------------------------- 	

// Guard Ancient Forge

BEGIN ~AC#50D51~

IF ~True()~ THEN BEGIN no_access
  SAY ~Ich kann Euch hier keinen Einlass gewähren, <RACE>.~
   IF ~~ THEN REPLY ~Was ist das für ein Schacht hinter Euch?~ GOTO what_is_it
   IF ~~ THEN REPLY ~Entschuldigt die Störung.~ GOTO exit
END

	IF ~~ THEN BEGIN what_is_it
	SAY ~Das ist der Zugang zur Uralten Schmiede, den heiligen Hallen Moradins.~
	IF ~~ THEN GOTO exit
	END
	
	IF ~~ THEN BEGIN exit
	SAY ~Ihr solltet wirklich schleunigst vor den Rat treten, um Zugang zu allen Bereichen der Stadt zu erhalten, <RACE>!~
	IF ~~ THEN DO ~~ EXIT
	END

// Guard Haela's Halls

BEGIN ~AC#50D52~

IF ~True()~ THEN BEGIN haelas_halls_closed
  SAY ~Haelas Hallen bleiben solange für Euch geschlossen, bis Euch der Rat nicht Zutritt gewährt hat!~
   IF ~~ THEN REPLY ~Haelas Hallen?~ GOTO haelas_halls_01
   IF ~~ THEN REPLY ~Entschuldigt die Störung.~ GOTO exit
END

	IF ~~ THEN BEGIN haelas_halls_01
	SAY ~Haelas Hallen sind eine Zitadelle mit einem großen Tempel an Haela Leuchtaxt. Außerdem beherbergen sie den Gnädigen Hof, unser Lazarett mit einem Tempel, der Sharindlar geweiht ist.~
	IF ~~ THEN GOTO exit
	END
	
	IF ~~ THEN BEGIN exit
	SAY ~Ihr solltet wirklich schleunigst vor den Rat treten, um Zugang zu allen Bereichen der Stadt zu erhalten, <RACE>!~
	IF ~~ THEN DO ~~ EXIT
	END

// Guard Hall of Runestones

BEGIN ~AC#50D53~

IF ~True()~ THEN BEGIN swc_closed
  SAY ~Die Bibliotheken bleiben für Euch so lange geschlossen, bis Euch der Rat nicht den Zutritt herunter gestattet hat!~
   IF ~~ THEN REPLY ~Ihr habt hier unten eine Bibliothek?~ GOTO library
   IF ~~ THEN REPLY ~Entschuldigt die Störung.~ GOTO exit
	END

	IF ~~ THEN BEGIN library
	SAY ~Natürlich haben wir das. Clan Abgrundlied unterhält hier den Tempel Dugmarens und die größte Sammlung an Runensteinen des gesamten Unterreiches.~
	IF ~~ THEN GOTO exit
	END
	
	IF ~~ THEN BEGIN exit
	SAY ~Ihr solltet wirklich schleunigst vor den Rat treten, um Zugang zu allen Bereichen der Stadt zu erhalten, <RACE>!~
	IF ~~ THEN DO ~~ EXIT
	END

// Guard Tunnel's End
	
BEGIN ~AC#50D54~

IF ~True()~ THEN BEGIN swc_closed
  SAY ~Die Speichenbrunnenzitadellen bleiben für Euch so lange geschlossen, bis Euch der Rat nicht den Zutritt herunter gestattet hat!~
   IF ~~ THEN REPLY ~Speichenbrunnenzitadellen?~ GOTO spoked_wheel_citadel
   IF ~~ THEN REPLY ~Entschuldigt die Störung.~ GOTO exit
END

	IF ~~ THEN BEGIN spoked_wheel_citadel
	SAY ~Ja. Die Orte, in denen die meisten Bewohner Iltkazars hausen. Sie befinden sich unter dem Boden der großen Haupthöhle.~
	IF ~~ THEN REPLY ~Welche Speichenbrunnenzitadelle befindet sich hier neben Euch?~ GOTO spoked_wheel_citadel_54
	IF ~~ THEN REPLY ~Entschuldigt die Störung.~ GOTO exit
	END
	
		IF ~~ THEN BEGIN spoked_wheel_citadel_54
		SAY ~Hinter mir liegt ein Schacht, den wir "Das Blutige Bollwerk" nennen. Hier befinden sich die besten Tavernen der Stadt. Und auch allerlei Händler, eine Pilzfarm sowie unsere Brauerei, die ein starkes Bier zusammenbraut. Solltet Ihr mal probieren, weiß nur nicht, ob Ihr es vertragt.~
		IF ~~ THEN GOTO exit
		END

	IF ~~ THEN BEGIN exit
	SAY ~Ihr solltet wirklich schleunigst vor den Rat treten, um Zugang zu allen Bereichen der Stadt zu erhalten, <RACE>!~
	IF ~~ THEN DO ~~ EXIT
	END

// Guard Hall of Omlars and Crypt

BEGIN ~AC#50D58~

IF ~True()~ THEN BEGIN swc_closed
  SAY ~Niemand erhält Zugang zu der Halle der Omlare, bis es ihm nicht ausdrücklich vom Regentschaftsrat gestattet worden ist.~
   IF ~~ THEN REPLY ~Was ist die Halle der Omlare?~ GOTO hall_omlars
   IF ~~ THEN REPLY ~Entschuldigt die Störung.~ GOTO exit
END

		IF ~~ THEN BEGIN hall_omlars
		SAY ~Unser höchst heiliger Tempel Dumathoins wird in unserer Stadt Halle der Omlare genannt. Hier befinden sich auch die Krypten.~
		IF ~~ THEN GOTO exit
		END
		
	IF ~~ THEN BEGIN exit
	SAY ~Wenn Ihr hier rein wollt, geht das nur mit Erlaubnis des Rates. Solange behalte ich Euch im Auge, <RACE>!~
	IF ~~ THEN DO ~~ EXIT
	END

// generic Guard

BEGIN ~AC#50DW2~

IF ~RandomNum(3,1)~ THEN BEGIN go_council_01
  SAY ~Die Speichenbrunnenzitadellen bleiben für Euch so lange geschlossen, bis Euch der Rat nicht den Zutritt herunter gestattet hat!~
   IF ~~ THEN REPLY ~Speichenbrunnenzitadellen?~ GOTO spoked_wheel_citadel
   IF ~~ THEN REPLY ~Entschuldigt die Störung.~ GOTO exit
END

IF ~RandomNum(3,2)~ THEN BEGIN go_council_02
  SAY ~Geht weiter, <RACE>! Kriegsmeister Bresk hat Euch aufgetragen, vor den Rat zu treten!~
   IF ~~ THEN REPLY ~Entschuldigt die Störung.~ GOTO exit
END

IF ~RandomNum(3,3)~ THEN BEGIN go_council_03
  SAY ~Solange Ihr noch nicht beim Regentschaftsrat vorgesprochen habt, behalte ich Euch im Auge!~
   IF ~~ THEN REPLY ~Entschuldigt die Störung.~ GOTO exit
END

IF ~~ THEN BEGIN spoked_wheel_citadel
  SAY ~Ja. Die Orte, in denen die Bewohner Iltkazars zum Großteil hausen.~
   IF ~~ THEN + exit
END

IF ~~ THEN BEGIN exit
  SAY ~Ihr solltet wirklich schleunigst vor den Rat treten, um Zugang zu der Stadt zu erhalten, <RACE>!~
   IF ~~ THEN DO ~~ EXIT
END

// ---------------------------------------------
// Dialogue Dwarven fisherman
// --------------------------------------------- 	

BEGIN ~AC#50DWF~

IF ~Global("FishermanQuest","ACIL50",11)~ THEN BEGIN hello_harpoon
SAY ~He, <RACE>! Ihr wart doch die, die mir so freundlich gegen diesen Kuo Toa geholfen haben! Ich habe hier etwas für Euch.~
IF ~~ THEN GOTO harpoon_01 
END

	IF ~~ THEN BEGIN harpoon_01
	SAY ~Ich habe diese alte Waffe unserer Clangründer wieder hervorgekramt. Meine Familie beschäftigt sich schon seit Jahrhunderten mit dem Fischen und der Jagd auf Wasserbewohner. Und sie hat mir einen alten Speer vermacht, der einst dafür geschaffen wurde, die großen Übel unter dem Wasser zu bekämpfen. Da die Stadt jetzt wieder sicherer geworden zu sein scheint, dachte ich, dass Ihr diese Art Harpune jetzt besser gebrauchen könntet als ich.~
	IF ~~ THEN REPLY ~Das ist sehr freundlich von Euch, Danke!~ GOTO thanks_harpoon
	IF ~~ THEN REPLY ~So etwas brauche ich nicht.~ GOTO dont_need_harpoon
	END
	
	IF ~~ THEN BEGIN dont_need_harpoon
	SAY ~War nur ein Vorschlag. Nichts für Ungut, <RACE>!~
	IF ~~ THEN DO ~SetGlobal("FishermanQuest","ACIL50",20)
	EscapeArea()~ EXIT 
	END
	
	IF ~~ THEN BEGIN thanks_harpoon
	SAY ~Gerne! Und wenn Ihr damit was fangt, was schmackhaft aussieht, lasst es Euch im "Blutigen Bollwerk" mit etwas Gewürzflechten verfeinern!~
	IF ~~ THEN DO ~GiveItemCreate("AC#HAPO1",LastTalkedToBy,1,0,0)
	SetGlobal("FishermanQuest","ACIL50",20)
	EscapeArea()~ EXIT 
	END

IF ~Global("FishermanQuest","ACIL50",1)~ THEN BEGIN hello_kuota
SAY ~Potzblitz, was haben wir denn da aus dem Wasser gefischt? Einen Kuo Toa!~
IF ~~ THEN DO ~SetGlobal("FishermanQuest","ACIL50",2)~ EXIT
END

IF ~Global("FishermanQuest","ACIL50",2)~ THEN BEGIN hello_thank_you
SAY ~Puh! Das war knapp!~
IF ~~ THEN GOTO that_was_close
END

	IF ~~ THEN BEGIN that_was_close
	SAY ~Danke, dass Ihr mir geholfen habt, <RACE>! Ohne Euch hätte mich das Ding glatt verschlungen!~
	IF ~~ THEN REPLY ~Gern geschehen.~ GOTO no_prob
	IF ~~ THEN REPLY ~Das war wirklich knapp.~ GOTO no_prob
	IF ~~ THEN REPLY ~Hättet Ihr nicht aufpassen können, was Ihr da aus dem Wasser zieht?~ GOTO no_prob
	END
	
		IF ~~ THEN BEGIN no_prob
		SAY ~Ich habe noch nie gesehen, dass es ein solches Wesen schafft, an Iltkazars Unterwassertoren vorbeizukommen. Unsere Runen wirken auch in der Tiefe der Flüsse. Es ist wahrlich schlecht um unsere Stadt bestellt, wenn wir jetzt selbst beim Angeln Acht geben müssen, nicht gefressen zu werden!~
		IF ~~ THEN GOTO thanks_01
		END
		
			IF ~~ THEN BEGIN thanks_01
			SAY ~Aber das soll nicht Eure Sorge sein. Und ich werde mich bestimmt nicht durch so etwas vom Fischen abhalten lassen! Habt Dank für Eure Hilfe, Oberflächenbewohner, die ich Euch so schnell nicht wieder vergessen werde!~
			IF ~~ THEN DO ~SetGlobal("FishermanQuest","ACIL50",10)
			IncrementGlobal("AC_Iltkazar_Reputation","GLOBAL",1)
	DisplayStringNoName(Player1,@1021)~ EXIT
	END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY ~He, <RACE>! Könntet Ihr mir hier mal ein bisschen zur Hand gehen?~
    IF ~~ THEN REPLY ~Was macht Ihr da?~  GOTO what_do_you_do
END

	IF ~~ THEN BEGIN what_do_you_do
	SAY ~Ich fische! Und irgendwas Großes hat hier gerade ... angebissen, das ich ... argh ... kaum aus dem Wasser bekomme... uff!~
	IF ~~ THEN REPLY ~Welche Fische findet man hier im Unterreich?~ GOTO what_kind_of_fish
	IF ~~ THEN REPLY ~Was muss ich tun?~ GOTO what_to_do
	END

	IF ~~ THEN BEGIN what_kind_of_fish
	SAY ~Tiefenflussforellen... klein, aber schmackhaft... nur das was ich jetzt ... uff... am Haken habe, fühlt sich wesentlich größer an!~
	IF ~~ THEN REPLY ~Was muss ich tun?~ GOTO what_to_do	
	END
	
	IF ~~ THEN BEGIN what_to_do
	SAY ~Ziehen helfen! Ich kann den Angelstecken ja kaum noch halten!~
	IF ~~ THEN REPLY ~Gut, ich packe mit an.~ GOTO yes 
	IF ~~ THEN REPLY ~Dafür habe ich keine Zeit.~ GOTO no 
	END
	
		IF ~~ THEN BEGIN no
		SAY ~Ach verflixt! Jetzt ist die Schnur gerissen. Das wäre eine fette Beute gewesen! Schade drum, dann habe ich wohl heute kein Glück beim Fischen gehabt.~
		IF ~~ THEN DO ~EscapeArea()~ EXIT 
		END
		
		IF ~~ THEN BEGIN yes
		SAY ~Danke! Hier ... einfach mal ein bisschen ziehen... helft mir, die Schnur immer gespannt zu halten...~
		=
		~Gleich haben wir es! Es wird müde! Noch ein kräftiger Zug...~
		IF ~~ THEN DO ~SetGlobal("FishermanQuest","ACIL50",1)
		CreateCreature("AC#50KUO",[732.813],0)~ EXIT 
		END

IF ~True()~ THEN BEGIN hello_true
SAY ~Danke für Eure Hilfe, <RACE>! Wenn Ihr in der Stadt seid, fühle ich mich beim Angeln viel sicherer!~
IF ~~ THEN EXIT
END


