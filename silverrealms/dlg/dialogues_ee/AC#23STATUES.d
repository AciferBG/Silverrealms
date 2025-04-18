//Statuen in ACIL23

// Statue #1
// Frage: Torglor = Silberkönigreich
BEGIN ~AC#23ST1~

IF ~Global("AC#23Statue01","ACIL23",2)~ THEN BEGIN 0 
  SAY ~Ihr habt meine Frage bereits richtig beantwortet.~ 
  IF ~~ THEN EXIT
END

IF ~Global("AC#23Statue01","ACIL23",1)~ THEN BEGIN 0 
  SAY ~Dies ist die Halle der Geschichte. Stellt Euch den Prüfungen, um ein wahrer Diener Shanatars zu werden.~ 
  IF ~~ THEN REPLY ~Stellt Eure Fragen, Statue.~ + ask_questions
  IF ~~ THEN REPLY ~Lasst die Statue in Ruhe.~ + leave_exit
END

	IF ~~ THEN BEGIN leave_exit 
	SAY ~Ihr wendet Euch wieder von der Statue ab.~ 
	IF ~~ THEN EXIT
	END
	
		IF ~~ THEN BEGIN ask_questions 
		  SAY ~Acht Königreiche bildeten neben Alatorin den Kern des Zwergenreiches Shanatar. Sagt mir, welches davon wurde das Silberkönigreich genannt?~ 
		  IF ~~ THEN REPLY ~Iltkazar.~ + false
		  IF ~~ THEN REPLY ~Korolnor.~ + false
		  IF ~~ THEN REPLY ~Torglor.~ + right
		  IF ~~ THEN REPLY ~Drakkalor.~ + false
		  IF ~~ THEN REPLY ~Xothaerin.~ + false
		  IF ~~ THEN REPLY ~Ultoksamrin.~ + false
		  IF ~~ THEN REPLY ~Barakuir.~ + false
		  IF ~~ THEN REPLY ~Sondarr.~ + false
		END
		
			IF ~~ THEN BEGIN false 
			SAY ~Eure Antwort ist falsch!~ 
			IF ~~ THEN DO ~CreateCreatureObject("AC#TOMGU",LastTalkedToBy,0,0,0)~ EXIT
			END
			
			IF ~~ THEN BEGIN right 
			SAY ~Ihr seid ein wahrer Kenner der Zwerge. Eure Antwort ist richtig.~ 
			IF ~~ THEN DO ~SetGlobal("AC#23Statue01","ACIL23",2)~ EXIT
			END
			
// Statue #2
// Frage: Iltkazar - Schutzpatron
BEGIN ~AC#23ST2~

IF ~Global("AC#23Statue02","ACIL23",2)~ THEN BEGIN 0 
  SAY ~Ihr habt meine Frage bereits richtig beantwortet.~ 
  IF ~~ THEN EXIT
END

IF ~Global("AC#23Statue02","ACIL23",1)~ THEN BEGIN 0 
  SAY ~Dies ist die Halle der Geschichte. Stellt Euch den Prüfungen, um ein wahrer Diener Shanatars zu werden.~ 
  IF ~~ THEN REPLY ~Stellt Eure Fragen, Statue.~ + ask_questions
  IF ~~ THEN REPLY ~Lasst die Statue in Ruhe.~ + leave_exit
END

	IF ~~ THEN BEGIN leave_exit 
	SAY ~Ihr wendet Euch wieder von der Statue ab.~ 
	IF ~~ THEN EXIT
	END
	
		IF ~~ THEN BEGIN ask_questions 
		  SAY ~Die Schutzpatrone boten den neu gegründeten Zwergenreichen Sicherheit und Stabilität. Welchen Schutzpatron wählte das Königreich Iltkazar, welches bis heute das Wappen des Mithrilkönigreiches ziert?~ 
		  IF ~~ THEN REPLY ~Berronar.~ + false
		  IF ~~ THEN REPLY ~Selune.~ + false
		  IF ~~ THEN REPLY ~Clangeddin.~ + right
		  IF ~~ THEN REPLY ~Dumathoin.~ + false
		  IF ~~ THEN REPLY ~Moradin.~ + false
		  IF ~~ THEN REPLY ~Talos.~ + false
		  IF ~~ THEN REPLY ~Bhaal.~ + false
		  IF ~~ THEN REPLY ~Laduguer.~ + false
		END
		
			IF ~~ THEN BEGIN false 
			SAY ~Eure Antwort ist falsch!~ 
			IF ~~ THEN DO ~CreateCreatureObject("AC#TOMGU",LastTalkedToBy,0,0,0)~ EXIT
			END
			
			IF ~~ THEN BEGIN right 
			SAY ~Ihr seid ein wahrer Kenner der Zwerge. Eure Antwort ist richtig.~ 
			IF ~~ THEN DO ~SetGlobal("AC#23Statue02","ACIL23",2)~ EXIT
			END
			
// Statue #3
// Frage: Zwerge - Elfen
BEGIN ~AC#23ST3~

IF ~Global("AC#23Statue03","ACIL23",2)~ THEN BEGIN 0 
  SAY ~Ihr habt meine Frage bereits richtig beantwortet.~ 
  IF ~~ THEN EXIT
END

IF ~Global("AC#23Statue03","ACIL23",1)~ THEN BEGIN 0 
  SAY ~Dies ist die Halle der Geschichte. Stellt Euch den Prüfungen, um ein wahrer Diener Shanatars zu werden.~ 
  IF ~~ THEN REPLY ~Stellt Eure Fragen, Statue.~ + ask_questions
  IF ~~ THEN REPLY ~Lasst die Statue in Ruhe.~ + leave_exit
END

	IF ~~ THEN BEGIN leave_exit 
	SAY ~Ihr wendet Euch wieder von der Statue ab.~ 
	IF ~~ THEN EXIT
	END
	
		IF ~~ THEN BEGIN ask_questions 
		  SAY ~Die Zwerge suchten sich Verbündete an der Oberfläche, die Elfen. Gegen welchen Feind haben die Elfen in einer ihrer ersten Schlachten gekämpft und ihm die Herrschaft über die oberen Länder abgerungen?~ 
		  IF ~~ THEN REPLY ~Riesen.~ + false
		  IF ~~ THEN REPLY ~Dunkelelfen.~ + false
		  IF ~~ THEN REPLY ~Betrachter.~ + false
		  IF ~~ THEN REPLY ~Menschen.~ + false
		  IF ~~ THEN REPLY ~Goblins.~ + false
		  IF ~~ THEN REPLY ~Drachen.~ + right
		  IF ~~ THEN REPLY ~Orks.~ + false
		  IF ~~ THEN REPLY ~Dämonen.~ + false
		END
		
			IF ~~ THEN BEGIN false 
			SAY ~Eure Antwort ist falsch!~ 
			IF ~~ THEN DO ~CreateCreatureObject("AC#TOMGU",LastTalkedToBy,0,0,0)~ EXIT
			END
			
			IF ~~ THEN BEGIN right 
			SAY ~Eure Antwort ist richtig. Nun wisst Ihr ein wenig mehr über die Verbündeten Shanatars.~ 
			IF ~~ THEN DO ~SetGlobal("AC#23Statue03","ACIL23",2)~ EXIT
			END
			
// Statue #4
// Frage: Zwerge - Ursache für den Fall Shanatars
BEGIN ~AC#23ST4~

IF ~Global("AC#23Statue04","ACIL23",2)~ THEN BEGIN 0 
  SAY ~Ihr habt meine Frage bereits richtig beantwortet.~ 
  IF ~~ THEN EXIT
END

IF ~Global("AC#23Statue04","ACIL23",1)~ THEN BEGIN 0 
  SAY ~Dies ist die Halle der Geschichte. Stellt Euch den Prüfungen, um ein wahrer Diener Shanatars zu werden.~ 
  IF ~~ THEN REPLY ~Stellt Eure Fragen, Statue.~ + ask_questions
  IF ~~ THEN REPLY ~Lasst die Statue in Ruhe.~ + leave_exit
END

	IF ~~ THEN BEGIN leave_exit 
	SAY ~Ihr wendet Euch wieder von der Statue ab.~ 
	IF ~~ THEN EXIT
	END
	
		IF ~~ THEN BEGIN ask_questions 
		  SAY ~Was führte zum Untergang Shanatars?~ 
		  IF ~~ THEN REPLY ~Versklavung durch die Illithiden.~ + false
		  IF ~~ THEN REPLY ~Baatezu.~ + false
		  IF ~~ THEN REPLY ~Verrat durch die Duergar.~ + false
		  IF ~~ THEN REPLY ~Ein Erdbeben.~ + false
		  IF ~~ THEN REPLY ~Goblins.~ + false
		  IF ~~ THEN REPLY ~Zwist in den eigenen Reihen.~ + right
		  IF ~~ THEN REPLY ~Ein Hinterhalt der Elfen.~ + false
		  IF ~~ THEN REPLY ~Dämonen.~ + false
		END
		
			IF ~~ THEN BEGIN false 
			SAY ~Eure Antwort ist falsch!~ 
			IF ~~ THEN DO ~CreateCreatureObject("AC#TOMGU",LastTalkedToBy,0,0,0)~ EXIT
			END
			
			IF ~~ THEN BEGIN right 
			SAY ~Eure Antwort ist richtig. Einigkeit ist das wichtigste Gut in einer Gemeinschaft.~ 
			IF ~~ THEN DO ~SetGlobal("AC#23Statue04","ACIL23",2)~ EXIT
			END
			
// Statue #5
// Frage: Mith Barak
BEGIN ~AC#23ST5~

IF ~Global("AC#23Statue05","ACIL23",2)~ THEN BEGIN 0 
  SAY ~Ihr habt meine Frage bereits richtig beantwortet.~ 
  IF ~~ THEN EXIT
END

IF ~Global("AC#23Statue05","ACIL23",1)~ THEN BEGIN 0 
  SAY ~Dies ist die Halle der Geschichte. Stellt Euch den Prüfungen, um ein wahrer Diener Shanatars zu werden.~ 
  IF ~~ THEN REPLY ~Stellt Eure Fragen, Statue.~ + ask_questions
  IF ~~ THEN REPLY ~Lasst die Statue in Ruhe.~ + leave_exit
END

	IF ~~ THEN BEGIN leave_exit 
	SAY ~Ihr wendet Euch wieder von der Statue ab.~ 
	IF ~~ THEN EXIT
	END
	
		IF ~~ THEN BEGIN ask_questions 
		  SAY ~Woher stammte König Mith Barak?~ 
		  IF ~~ THEN REPLY ~Aus Mithril-Halle.~ + false
		  IF ~~ THEN REPLY ~Aus Amn.~ + false
		  IF ~~ THEN REPLY ~Ich weiß es nicht.~ + right
		  IF ~~ THEN REPLY ~Aus dem Eiswindtal.~ + false
		  IF ~~ THEN REPLY ~Aus Calimshan.~ + false
		  IF ~~ THEN REPLY ~Aus der Zitadelle Felbarr.~ + false
		  IF ~~ THEN REPLY ~Aus Mirabar.~ + false
		  IF ~~ THEN REPLY ~Aus der großen Spalte.~ + false
		END
		
			IF ~~ THEN BEGIN false 
			SAY ~Eure Antwort ist falsch!~ 
			IF ~~ THEN DO ~CreateCreatureObject("AC#TOMGU",LastTalkedToBy,0,0,0)~ EXIT
			END
			
			IF ~~ THEN BEGIN right 
			SAY ~Eure Antwort ist richtig. Dies weiß keiner der Zwerge. Die Aufzeichnungen enden hier und müssten weitergeschrieben werden, um darauf eine Antwort zu erhalten.~ 
			IF ~~ THEN DO ~SetGlobal("AC#23Statue05","ACIL23",2)~ EXIT
			END

