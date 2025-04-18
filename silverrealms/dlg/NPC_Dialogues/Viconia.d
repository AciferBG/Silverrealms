

/*******************************************************************************************************
Viconia's dialogues
*******************************************************************************************************/

APPEND ~VICONIJ~

IF  WEIGHT #-999 ~Global("Viconia_Zinzerena","ACIL25",1)~ THEN BEGIN viconia_zinzerena_comment
   SAY ~Das ist ein Abbild von Zinzerena!~
	IF ~~ THEN REPLY ~Wer ist Zinzerena?~ GOTO about_zinzerena_01
	END

	IF ~~ THEN BEGIN about_zinzerena_01
	SAY ~Die Drow-Göttin des Chaos und der Meuchelmörder. Zumindest war sie es, bevor dieses Miststück Lolth sie vernichtet und ihr Portfolio in sich aufgenommen hat. Früher war sie eine erbitterte Feindin der Spinnenkönigin - mit einer besonders tiefen Abneigung gegen jede Art von Spinnen. Was für eine Ironie des Schicksals, dass ihr Schrein ausgerechnet in diesem spinnenverseuchten Zwergentunnel die Zeit überdauert hat!~
	   IF ~~ THEN DO ~SetGlobal("Viconia_Zinzerena","ACIL25",2)~ EXIT
	END
	
IF  WEIGHT #-998 ~Global("FaerzressTalk","ACIL30",1)
AreaCheck("ACIL30")~ THEN BEGIN viconia_faerzress_comment
   SAY ~Faerzress.~
	IF ~~ THEN REPLY ~Was?~ GOTO faerzress_02
	END
	
	IF ~~ THEN BEGIN faerzress_02
	SAY ~Faerzress! Diese Gegend ist von Faerzress verseucht. Ihr wisst nicht, was Faerzress ist, <CHARNAME>?~
	IF ~~ THEN REPLY ~Ach so, DAS Faerzress. Natürlich.~ GOTO know_faerzress
	IF ~~ THEN REPLY ~Natürlich weiß ich, was Faerzress ist!~ + know_faerzress
	IF ~~ THEN REPLY ~Nein, weiß ich nicht.~ + not_know_faerzress
	END
	
	IF ~~ THEN BEGIN not_know_faerzress
	SAY ~Faerzress ist eine seltene magische Erscheinung, die im Unterreich zu finden ist - meistens in Verbindung mit mächtigen Erdknoten, die diese magische Energie anziehen. Leider macht die konzentrierte Ballung des Gewebes das Aussprechen von Zaubern und dergleichen zu einem riskanten Unterfangen, da an solchen Stellen Magie meist nicht so wirkt, wie man sich das wünschen würde. Ich würde mich nicht wundern, wenn wir hier auch allerlei mutierte Pflanzen finden würden, die diese wilde Form der Magie noch zusätzlich anheizen. Sussur-Bäume zum Beispiel. Sie überwuchern an solchen Orten meist alte Ruinen und treiben das magische Chaos auf die Spitze.~
	IF ~~ THEN GOTO faerzress_exit
	END
	
	IF ~~ THEN BEGIN know_faerzress
	SAY ~Dann ist ja gut.~
	IF ~~ THEN GOTO faerzress_exit
	END

	IF ~~ THEN BEGIN faerzress_exit
	SAY ~Lasst uns weitergehen und Augen und Ohren offenhalten. Dieser Ort wird noch einige Überraschungen für uns bereithalten!~
	   IF ~~ THEN DO ~SetGlobal("FaerzressTalk","ACIL30",20)~ EXIT
	END
	
IF  WEIGHT #-997 ~Global("DrowNPC_translate","ACIL24",1)~ THEN BEGIN viconia_translate_letter
   SAY ~Dieser Brief ist in der Drowsprache geschrieben. Lasst einmal sehen, ob ich ihn übersetzen kann.~
	IF ~~ THEN DO ~SetGlobal("DrowNPC_translate","ACIL24",2)~ GOTO viconia_translate_letter_02
	END

	IF ~~ THEN BEGIN viconia_translate_letter_02
	SAY ~Dieses Drow-Männchen hat sich wohl eine Notiz zu einem Tempel in den Spinnenschächten geschrieben. Es scheint wohl eine Art Zugangslosung zu geben, und diese Parole hat sich der Vhaeraun-Priester notiert. Hier ist sein Zettel, ich habe ihn für Euch übersetzt.~
	   IF ~~ THEN DO ~TakeItemReplace("AC#24DR2","AC#24DRL",Player1)  // Ring~ EXIT
	END
END

