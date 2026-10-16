//Statuen in ACIL23

// Statue #1
// Frage: Die Frage des Fluchest
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
  SAY ~Ich werde ausgesprochen, doch nicht immer gehört. Ich bringe Leid, ohne eine Wunde zu schlagen. Ich kann Jahrhunderte überdauern, ohne zu altern. Selbst der Tod dessen, der mich erschuf, vermag mich nicht immer zu lösen. Was bin ich?~
  IF ~~ THEN REPLY ~Ein Schwur.~ + false
  IF ~~ THEN REPLY ~Ein Fluch.~ + right
  IF ~~ THEN REPLY ~Eine Prophezeiung.~ + false
  IF ~~ THEN REPLY ~Ein Gebet.~ + false
END

IF ~~ THEN BEGIN false
  SAY ~Eure Antwort ist falsch!~
  IF ~~ THEN DO ~CreateCreatureObject("AC#TOMGU",LastTalkedToBy,0,0,0)~ EXIT
END

IF ~~ THEN BEGIN right
  SAY ~Eure Antwort ist richtig. Ein Fluch mag selbst seinen Urheber überdauern, und nur wer seinen Ursprung erkennt, vermag ihn zu brechen.~
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
	  SAY ~Ich bin ein Meer ohne Wasser, eine Weite ohne Himmel. In mir ruht die Zeit, und die Leiber toter Götter treiben durch meine Unendlichkeit. Der Geist vermag mich ohne seinen Körper zu durchqueren, doch auch Fleisch und Blut können meine Grenzen überschreiten. Was bin ich?~
	  IF ~~ THEN REPLY ~Die Ätherebene.~ + false
	  IF ~~ THEN REPLY ~Die Astralebene.~ + right
	  IF ~~ THEN REPLY ~Die Schattenebene.~ + false
	  IF ~~ THEN REPLY ~Die Ebene der Träume.~ + false
	END

	IF ~~ THEN BEGIN false
	  SAY ~Eure Antwort ist falsch!~
	  IF ~~ THEN DO ~CreateCreatureObject("AC#TOMGU",LastTalkedToBy,0,0,0)~ EXIT
	END

	IF ~~ THEN BEGIN right
	  SAY ~Eure Antwort ist richtig. Auf zweierlei Wegen vermag ein Sterblicher die Silberne See zu durchqueren: Als Geist, der seinen Körper zurücklässt, oder mit Leib und Seele.~
	  IF ~~ THEN DO ~SetGlobal("AC#23Statue02","ACIL23",2)~ EXIT
	END

			
// Statue #3
// Frage: Die Frage der unteren Ebenen
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
	  SAY ~Ich bin Heimat und Kerker zugleich. Götter errichten in mir ihre Throne, andere schmachten hinter unsichtbaren Mauern. In meinen Tiefen wohnen Ordnung und Chaos, doch Frieden findet sich dort selten. Was bin ich?~
	  IF ~~ THEN REPLY ~Die Astralebene.~ + false
	  IF ~~ THEN REPLY ~Die Unteren Ebenen.~ + right
	  IF ~~ THEN REPLY ~Die Elementarebenen.~ + false
	  IF ~~ THEN REPLY ~Die Oberen Ebenen.~ + false
	END

	IF ~~ THEN BEGIN false
	  SAY ~Eure Antwort ist falsch!~
	  IF ~~ THEN DO ~CreateCreatureObject("AC#TOMGU",LastTalkedToBy,0,0,0)~ EXIT
	END

	IF ~~ THEN BEGIN right
	  SAY ~Eure Antwort ist richtig. Die Unteren Ebenen sind Heimstatt vieler finsterer Mächte, doch selbst Götter vermögen dort zu Gefangenen zu werden.~
	  IF ~~ THEN DO ~SetGlobal("AC#23Statue03","ACIL23",2)~ EXIT
	END

			
// Statue #4
// Frage: Die Frage der drachengötter
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
	  SAY ~Ich herrschte über Könige, und ganze Völker beugten sich vor mir. Weder Schwert noch Krankheit vermochten mich zu töten. Doch mit jedem verstummenden Gebet schwand meine Macht, bis selbst mein Name aus der Erinnerung der Welt verschwand. Was bin ich?~
	  IF ~~ THEN REPLY ~Ein gefallener König.~ + false
	  IF ~~ THEN REPLY ~Ein vergessener Gott.~ + right
	  IF ~~ THEN REPLY ~Ein uralter Drache.~ + false
	  IF ~~ THEN REPLY ~Ein verdammter Geist.~ + false
	END

	IF ~~ THEN BEGIN false
	  SAY ~Eure Antwort ist falsch!~
	  IF ~~ THEN DO ~CreateCreatureObject("AC#TOMGU",LastTalkedToBy,0,0,0)~ EXIT
	END

	IF ~~ THEN BEGIN right
	  SAY ~Weise gesprochen. Selbst die Macht der Götter ist vergänglich, denn wo der Glaube erlischt und ihre Namen vergessen werden, finden auch sie ihr Ende.~
	  IF ~~ THEN DO ~SetGlobal("AC#23Statue04","ACIL23",2)~ EXIT
	END

			
// Statue #5
// Frage: Die Frage der Unterkönigreiche
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
		  SAY ~Acht Brüder gründeten acht Reiche unter dem Stein. Eisen, Silber, Juwelen und unermessliche Schätze erfüllten ihre Hallen. Doch sieben Kronen versanken im Dunkel der Zeiten. Nur eine überdauerte den Untergang ihrer Brüder und bewahrt noch heute das Erbe Shanatars. Welches Reich überdauerte den Untergang seiner Brüder?~
		  IF ~~ THEN REPLY ~Barakuir, das Eisenkönigreich.~ + false
		  IF ~~ THEN REPLY ~Torglor, das Silberkönigreich.~ + false
		  IF ~~ THEN REPLY ~Iltkazar, das Mithrilkönigreich.~ + right
		  IF ~~ THEN REPLY ~Korolnor, das Juwelenkönigreich.~ + false
		END

	IF ~~ THEN BEGIN false
	  SAY ~Eure Antwort ist falsch!~
	  IF ~~ THEN DO ~CreateCreatureObject("AC#TOMGU",LastTalkedToBy,0,0,0)~ EXIT
	END

	IF ~~ THEN BEGIN right
	  SAY ~Eure Antwort ist richtig. Iltkazar, das Mithrilkönigreich, bewahrt als letztes der acht Unterkönigreiche das Vermächtnis Shanatars.~
	  IF ~~ THEN DO ~SetGlobal("AC#23Statue05","ACIL23",2)~ EXIT
	END

			