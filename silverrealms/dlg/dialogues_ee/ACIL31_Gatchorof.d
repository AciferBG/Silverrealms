

/*******************************************************************************************************
Dialog mit dem Kontrollschädel
*******************************************************************************************************/

BEGIN ~AC#Skul1~

IF ~NumTimesTalkedToGT(0)~ THEN BEGIN hello_again
SAY ~Der Schädel pulsiert noch immer in einem blauen Licht. Seine Flammen lecken an Euren Fingern und scheinen auf einen geistigen Befehl von Euch zu warten.~
++ ~Den Schädel loslassen.~ + 16
IF ~Global("EarthNodeActivation","ACIL31",7)~ THEN REPLY ~Bringt mich zur Astralebene.~ + 3
IF ~!Global("EarthNodeActivation","ACIL31",7)~ THEN REPLY ~Bringt mich zur Astralebene.~ + must_node_activate
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY ~Ihr haltet Eure Hand über das blaue Feuer, das aus dem Schädel hervorlodert. Zu Eurer Überraschung ist die Flamme nicht heiß, sondern fühlt sich kühl und weich an. Kurz darauf pulsiert der Schädel mit ungeheurer Energie. Nach einem kurzen geistigen Ringen habt Ihr die Kontrolle über ihn gewonnen. Ihr bemerkt, wie Ihr allein mit Eurer Geisteskraft das Schiff manövrieren könnt.~
++ ~Den Schädel loslassen.~ + 16
IF ~Global("EarthNodeActivation","ACIL31",7)~ THEN REPLY ~Bringt mich zur Astralebene.~ + 3
IF ~!Global("EarthNodeActivation","ACIL31",7)~ THEN REPLY ~Bringt mich zur Astralebene.~ + must_node_activate
END

IF ~~ THEN BEGIN 3
   SAY ~Nichts geschieht. Ihr werdet Eure Gedanken genauer fokussieren müssen, um die Reise in Gang zu bringen.~
++ ~Den Schädel losslassen.~ + 16
++ ~Ihr stellt Euch die tote Drachengottheit Kalzareinad vor, wie sie Euch der alte Drache Maldraedior beschrieben hat. Vor Eurem geistigen Auge formt sich ein Bild, das Bild eines riesigen Drachenkadavers, der in einem Meer aus Silber zu treiben scheint...~ + 4
END

IF ~~THEN BEGIN 4
SAY ~Die Wirklichkeit um Euch verschwimmt, und Ihr habt das gefühl, als würde Euer Geist den Körper verlassen. Ihr fühlt Euch leicht und frei, und die Höhle, in der Ihr Euch gerade noch befandet, verschwindet in einem Meer aus Licht...~
   IF ~~ THEN DO ~SetGlobal("AC#Astraltravel","ACIL31",1)~  EXIT
END

IF ~~ THEN BEGIN 16
   SAY ~Ihr wendet Euch von dem Schädel ab.~
   IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN must_node_activate
   SAY ~Es scheint sich im Inneren des Schiffes etwas zu regen, doch so schnell es begonnen hat, so schnell ist es auch wieder vorüber. Ihr könnt zwar das Schiff kontrollieren, aber ohne ein Portal, durch das es sich teleportieren kann, ist das Astralschiff ziemlich nutzlos.~
   IF ~~ THEN EXIT
END




/*******************************************************************************************************
Dialog Area ACIL31 Harmswa
*******************************************************************************************************/
BEGIN ~AC#HARM2~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY ~Ihr habt es tatsächlich bis hier herunter in unseren Stützpunkt geschafft. Keine schlechte Leistung für einen <RACE>.~
++  ~Es braucht schon mehr als eine Horde Kobolde, um mich von meinem Ziel abzubringen, Githyanki.~ + 2
END

IF ~~ THEN BEGIN 2
SAY ~Was kümmern uns schon die Kobolde? Die Krieger meiner Rasse sind die Besten im gesamten Multiversum! Weiter als hierher werdet Ihr nicht mehr kommen, denn wir sind Euch in jeder Hinsicht überlegen!~
++  ~Das werden wir ja sehen.~ + 3
++ ~Ich bin schon mit mehr von Eurer Art zusammengetroffen, und ich muss sagen, dass es bisher für mich immer besser ausgegangen ist als für Euresgleichen.~ + 3
END

IF ~~ THEN BEGIN 3
SAY ~Glaubt Ihr wirklich, dass ein Sieg über uns an dem Konflikt etwas bewirken könnte? In diesem Kampf sind wir lediglich genauso Söldner wie Ihr auch, gebunden an unseren Auftrag durch einen uralten Pakt. Sollten wir wirklich fallen, werden andere meiner Art für unsere Sache eintreten.~
++  ~Ich werde alles, was sich mir in den Weg stellt, beiseite räumen!~ + 4
END

IF ~~ THEN BEGIN 4
SAY ~Es wird Zeit, Euren frechen Mund zu stopfen! Meine Hauptmänner werden Euch die Haut abziehen und mir daraus ein Paar Stiefel machen! Soldaten, zeigt diesem <RACE>, weshalb die Githyanki über die ganzen Ebenen hinweg so gefürchtet sind!~
IF ~~ THEN DO
   ~EraseJournalEntry(@64900)
   ForceSpell(Myself,DRYAD_TELEPORT)
~EXIT
END

/*******************************************************************************************************
Dialog Illithid prisoner ACIL31
*******************************************************************************************************/
BEGIN ~AC#ILLI1~

IF ~Global("FreedIllithid","ACIL31",10)~ THEN BEGIN goodbye
SAY ~Damit ist mein Werk hier vollendet. Viel Erfolg, <RACE>, wo immer Eure Reise Euch auch hinführt!~
IF ~~ THEN DO ~ForceSpell(Myself,POOF_GONE)~ EXIT
END

IF ~Global("FreedIllithid","ACIL31",2)~ THEN BEGIN hello_brainbuddy
SAY ~Was wollt Ihr, <RACE>?~
++ ~Nichts. Lasst uns weiterkämpfen.~ + lets_fight
IF ~~ THEN REPLY ~Ich benötige Eure Dienste nicht mehr. Ihr könnt gehen.~ + dismissed_01
IF ~PartyHasItem("AC#ASTR1")~ THEN REPLY ~Was mache ich mit dieser Steuereinheit hier?~ + astral_ship_01
IF ~GlobalLT("EarthNodeActivation","ACIL31",7)~ THEN REPLY ~Wie kann ich von hier in die Astralebene reisen?~ + astral_travel
END

	IF ~~ THEN BEGIN astral_travel
	SAY ~Dieser Ort ist durch und durch von Magie durchdrungen. Direkt unter dem tiefen Schacht schlummert ein Portal, das nur aktiviert werden muss. Sucht nach den Erdknoten.~
	IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN astral_ship_01
	SAY ~Ihr könnt damit das Astralschiff der Gith aktivieren. Dadurch erwacht der Kontrollschädel zum Leben, mit dem Ihr das Schiff navigieren könnt.~
	IF ~~ THEN EXIT
	END
	
	IF ~~ THEN BEGIN lets_fight
	SAY ~Gemeinsam werden wir die verfluchten Gith leiden lassen!~
	IF ~~ THEN EXIT
	END
	
	IF ~~ THEN BEGIN dismissed_01
	SAY ~Es sind zwar noch einige Gith-Gehirne übrig, aber wenn Ihr meint, werde ich zu meinen Gefährten zurückkehren.~
	IF ~~ THEN DO ~ForceSpell(Myself,POOF_GONE)~ EXIT
	END

IF ~Global("IllithidDoorOpen","ACIL31",1)~ THEN BEGIN hello_door_open
SAY ~Sehr gut. Endlich steht wieder Gehirn auf dem Speiseplan! Gemeinsam werden wir die verfluchten Gith leiden lassen!~
IF ~~ THEN DO ~SetGlobal("FreedIllithid","ACIL31",1)
SetGlobal("IllithidDoorOpen","ACIL31",2)~ EXIT
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY ~Ihr gehört nicht zu den Gith, <RACE>. Was sucht Ihr hier?~
++  ~Dasselbe könnte ich Euch fragen. Ein gefangener Gedankenschinder?~ + prisoner_01
END

	IF ~~ THEN BEGIN prisoner_01
	SAY ~In der Tat, die Gith haben mich geschnappt. Wenn Ihr mich freilasst, werde ich Euch helfen.~
	++  ~Ihr wollt mir helfen? Solche Worte habe ich noch nie aus dem... Mund... eines Illithiden gehört.~ + free_me_01
	END
	
		IF ~~ THEN BEGIN free_me_01
		SAY ~Die Gith werden Euch ebenso töten wie den Rest meiner Einheit, wenn wir hier nicht zusammenarbeiten! Hütet Euch vor der Anführerin, sie hat ein Silberschwert, mit dem sie Euch mühelos den Kopf abschlagen kann!~
		IF ~!Dead("AC#GITH1")~ THEN REPLY ~Was schlagt Ihr also vor?~ + harmswa_not_dead
		IF ~Dead("AC#GITH1")~ THEN REPLY ~Um die habe ich mich schon gekümmert.~ + harmswa_dead
		END
		
			IF ~~ THEN BEGIN harmswa_not_dead
			SAY ~Öffnet die Tür, dann werde ich Euch im Kampf unterstützen und danach das Weite suchen und Euch weiterziehen lassen.~
			++  ~Ihr bekommt die Tür nicht selbst auf?~ + open_door_01
			END
			
				IF ~~ THEN BEGIN open_door_01
				SAY ~Die Gith haben das Schloss manipuliert, dass ich es mit meinen vier Fingern nicht öffnen kann.~
				++  ~Das ist gut zu wissen. Dann bleibt Ihr dort auf alle Ewigkeiten gefangen.~ + not_open_door
				++  ~Gut, das kann ich machen.~ + yes_open_door
				END
				
					IF ~~ THEN BEGIN not_open_door
					SAY ~Nein! Das könnt Ihr doch nicht machen!~
					IF ~~ THEN EXIT
					END
					
					IF ~~ THEN BEGIN yes_open_door
					SAY ~Hervorragend! Ich werde Euch nach Kräften unterstützen, wenn die Tür geöffnet ist!~
					IF ~~ THEN EXIT
					END

			IF ~~ THEN BEGIN harmswa_dead
			SAY ~Dann könnt Ihr mich ja jetzt gehen lassen. Öffnet die Tür, und ich werde meines Weges ziehen.~
			++  ~Ihr bekommt die Tür nicht selbst auf?~ + open_door_01
			END
			