//Statuen in ACIL23

// Statue #1
// Frage: Die Frage der Zeit
BEGIN ~AC#23ST1~

IF ~Global("AC#23Statue01","ACIL23",2)~ THEN BEGIN 0 
  SAY ~Ihr habt meine Frage bereits richtig beantwortet.~ 
  IF ~~ THEN EXIT
END

IF ~Global("AC#23Statue01","ACIL23",1)~ THEN BEGIN 0 
  SAY ~Dies ist eine Halle der Prüfungen. Antwortet weise, und der Weg wird sich Euch öffnen.~ 
  IF ~~ THEN REPLY ~Stellt Eure Fragen, Statue.~ + ask_questions
  IF ~~ THEN REPLY ~Lasst die Statue in Ruhe.~ + leave_exit
END

	IF ~~ THEN BEGIN leave_exit 
	SAY ~Ihr wendet Euch wieder von der Statue ab.~ 
	IF ~~ THEN EXIT
	END
	
		IF ~~ THEN BEGIN ask_questions 
		  SAY ~Was vermehrt sich, je mehr man es teilt?~ 
		  IF ~~ THEN REPLY ~Gold.~ + false		  
		  IF ~~ THEN REPLY ~Wasser.~ + false
		  IF ~~ THEN REPLY ~Wissen.~ + right
		  IF ~~ THEN REPLY ~Feuer.~ + false
		END
		
			IF ~~ THEN BEGIN false 
			SAY ~Eure Antwort ist falsch!~ 
			IF ~~ THEN DO ~CreateCreatureObject("AC#TOMGU",LastTalkedToBy,0,0,0)~ EXIT
			END
			
			IF ~~ THEN BEGIN right 
			SAY ~Eure Antwort ist richtig. Wissen schwindet nicht durch Teilen, sondern wächst daran.~ 
			IF ~~ THEN DO ~SetGlobal("AC#23Statue01","ACIL23",2)~ EXIT
			END
			
// Statue #2
// Frage: Die Frage des Silberreichs
BEGIN ~AC#23ST2~

IF ~Global("AC#23Statue02","ACIL23",2)~ THEN BEGIN 0 
  SAY ~Ihr habt meine Frage bereits richtig beantwortet.~ 
  IF ~~ THEN EXIT
END

IF ~Global("AC#23Statue02","ACIL23",1)~ THEN BEGIN 0 
  SAY ~Dies ist eine Halle alter Wahrheit. Nur wer mit Weisheit antwortet, darf weitergehen.~ 
  IF ~~ THEN REPLY ~Stellt Eure Fragen, Statue.~ + ask_questions
  IF ~~ THEN REPLY ~Lasst die Statue in Ruhe.~ + leave_exit
END

	IF ~~ THEN BEGIN leave_exit 
	SAY ~Ihr wendet Euch wieder von der Statue ab.~ 
	IF ~~ THEN EXIT
	END
	
		IF ~~ THEN BEGIN ask_questions 
		  SAY ~Wo treiben Götterleiber wie Inseln im silbernen Meer?~ 
		  IF ~~ THEN REPLY ~In der Astralebene.~ + right
		  IF ~~ THEN REPLY ~Im Abyss.~ + false
		  IF ~~ THEN REPLY ~In der Schattenebene.~ + false
		  IF ~~ THEN REPLY ~In den Neun Höllen.~ + false
		END
		
			IF ~~ THEN BEGIN false 
			SAY ~Eure Antwort ist falsch!~ 
			IF ~~ THEN DO ~CreateCreatureObject("AC#TOMGU",LastTalkedToBy,0,0,0)~ EXIT
			END
			
			IF ~~ THEN BEGIN right 
			SAY ~Eure Antwort ist richtig. Die silbernen Reiche bergen Wahrheiten, die dem flüchtigen Blick verborgen bleiben.~ 
			IF ~~ THEN DO ~SetGlobal("AC#23Statue02","ACIL23",2)~ EXIT
			END
			
// Statue #3
// Frage: Die Frage der Tiefen
BEGIN ~AC#23ST3~

IF ~Global("AC#23Statue03","ACIL23",2)~ THEN BEGIN 0 
  SAY ~Ihr habt meine Frage bereits richtig beantwortet.~ 
  IF ~~ THEN EXIT
END

IF ~Global("AC#23Statue03","ACIL23",1)~ THEN BEGIN 0 
  SAY ~Hier prüfen alte Stimmen das Wissen der Wanderer. Antwortet weise.~ 
  IF ~~ THEN REPLY ~Stellt Eure Fragen, Statue.~ + ask_questions
  IF ~~ THEN REPLY ~Lasst die Statue in Ruhe.~ + leave_exit
END

	IF ~~ THEN BEGIN leave_exit 
	SAY ~Ihr wendet Euch wieder von der Statue ab.~ 
	IF ~~ THEN EXIT
	END
	
		IF ~~ THEN BEGIN ask_questions 
		  SAY ~Was kann selbst in tiefster Finsternis wachsen und dennoch kein Licht sehen?~ 
		  IF ~~ THEN REPLY ~Pilze.~ + false
		  IF ~~ THEN REPLY ~Hoffnung.~ + right
		  IF ~~ THEN REPLY ~Moos.~ + false
		  IF ~~ THEN REPLY ~Schatten.~ + false
		END
		
			IF ~~ THEN BEGIN false 
			SAY ~Eure Antwort ist falsch!~ 
			IF ~~ THEN DO ~CreateCreatureObject("AC#TOMGU",LastTalkedToBy,0,0,0)~ EXIT
			END
			
			IF ~~ THEN BEGIN right 
			SAY ~Eure Antwort ist richtig. Hoffnung ist ein Licht, das selbst die Tiefen nicht ersticken können.~
			IF ~~ THEN DO ~SetGlobal("AC#23Statue03","ACIL23",2)~ EXIT
			END
			
// Statue #4
// Frage: Die Frage der Zwerge
BEGIN ~AC#23ST4~

IF ~Global("AC#23Statue04","ACIL23",2)~ THEN BEGIN 0 
  SAY ~Ihr habt meine Frage bereits richtig beantwortet.~ 
  IF ~~ THEN EXIT
END

IF ~Global("AC#23Statue04","ACIL23",1)~ THEN BEGIN 0 
  SAY ~Wir sind die Stimmen aus vergessenen Zeiten. Antwortet weise, Wanderer, und der Weg wird sich Euch öffnen.~ 
  IF ~~ THEN REPLY ~Stellt Eure Fragen, Statue.~ + ask_questions
  IF ~~ THEN REPLY ~Lasst die Statue in Ruhe.~ + leave_exit
END

	IF ~~ THEN BEGIN leave_exit 
	SAY ~Ihr wendet Euch wieder von der Statue ab.~ 
	IF ~~ THEN EXIT
	END
	
		IF ~~ THEN BEGIN ask_questions 
		  SAY ~Was wird durch Gebrauch schärfer und durch Stillstand stumpf?~ 
		  IF ~~ THEN REPLY ~Ein Schwert.~ + false
		  IF ~~ THEN REPLY ~Ein Hammer.~ + false
		  IF ~~ THEN REPLY ~Ein Schild.~ + false
		  IF ~~ THEN REPLY ~Der Verstand.~ + right
		END
		
			IF ~~ THEN BEGIN false 
			SAY ~Eure Antwort ist falsch!~ 
			IF ~~ THEN DO ~CreateCreatureObject("AC#TOMGU",LastTalkedToBy,0,0,0)~ EXIT
			END
			
			IF ~~ THEN BEGIN right 
			SAY ~Weise gesprochen. Ein wacher Verstand ist die schärfste Klinge.~ 
			IF ~~ THEN DO ~SetGlobal("AC#23Statue04","ACIL23",2)~ EXIT
			END
			
// Statue #5
// Frage: Die Frage der Drachen
BEGIN ~AC#23ST5~

IF ~Global("AC#23Statue05","ACIL23",2)~ THEN BEGIN 0 
  SAY ~Ihr habt meine Frage bereits richtig beantwortet.~ 
  IF ~~ THEN EXIT
END

IF ~Global("AC#23Statue05","ACIL23",1)~ THEN BEGIN 0 
  SAY ~Fünf Fragen bewachen den Weg. Antwortet weise – oder kehrt um.~ 
  IF ~~ THEN REPLY ~Stellt Eure Fragen, Statue.~ + ask_questions
  IF ~~ THEN REPLY ~Lasst die Statue in Ruhe.~ + leave_exit
END

	IF ~~ THEN BEGIN leave_exit 
	SAY ~Ihr wendet Euch wieder von der Statue ab.~ 
	IF ~~ THEN EXIT
	END
	
		IF ~~ THEN BEGIN ask_questions 
		  SAY ~Was wächst mit jedem Jahrhundert und ist der größte Reichtum eines Drachen?~ 
		  IF ~~ THEN REPLY ~Sein Hort.~ + false
		  IF ~~ THEN REPLY ~Seine Macht.~ + false
		  IF ~~ THEN REPLY ~Sein Alter.~ + right
		  IF ~~ THEN REPLY ~Sein Feuer.~ + false
		END
		
			IF ~~ THEN BEGIN false 
			SAY ~Eure Antwort ist falsch!~ 
			IF ~~ THEN DO ~CreateCreatureObject("AC#TOMGU",LastTalkedToBy,0,0,0)~ EXIT
			END
			
			IF ~~ THEN BEGIN right 
			SAY ~Eure Antwort ist richtig. Selbst uralte Macht vergeht, doch was ein Wesen im Innersten ist, überdauert jeden Schatz.~ 
			IF ~~ THEN DO ~SetGlobal("AC#23Statue05","ACIL23",2)~ EXIT
			END