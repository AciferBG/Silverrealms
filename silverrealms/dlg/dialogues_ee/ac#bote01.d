BEGIN ~AC#MES01~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY ~Verzeiht, <LADYLORD>, dass ich Euch so unvermittelt anspreche, aber ich habe eine Nachricht für Euch.~
  IF ~~ THEN REPLY ~Sicher, ich bin ganz Ohr. Worum geht es, Zwerg?~ GOTO 1
  // IF ~~ THEN REPLY ~Woher wisst, dass die Nachricht für mich ist, Zwerg?~ GOTO 2
  IF ~~ THEN REPLY ~Schert Euch fort, Zwerg. Ich habe es satt, ständig von jedem dahergelaufenen Straßenjungen Botschaften entgegen nehmen zu müssen.~ GOTO 3
END

IF ~~ THEN BEGIN 1
   SAY ~Ich weiß ehrlich gesagt nicht, um welchen Auftrag es sich handelt, denn ich bin nur ausgesandt worden, um Euch hier in der Stadt zu suchen und Euch diese Botschaft übermitteln. Normalerweise arbeite ich unten bei den Docks.~
   IF ~~ THEN REPLY ~Gut, gebt mir Euren Brief. Danke für die Nachricht.~ GOTO 4
   IF ~~ THEN REPLY ~Nein, kein Interesse.~ GOTO 3
END

IF ~~ THEN BEGIN 2
   SAY ~Der Mann, der mir diese Nachricht übergab, schien Euch sehr gut kennen. Er hat Euch genau so beschrieben, wie Ihr jetzt vor mir steht.~
   IF ~~ THEN REPLY ~Gut, gebt mir Euren Brief. Danke für die Nachricht.~ GOTO 4
   IF ~~ THEN REPLY ~Wie sah dieser Mann denn aus?~ GOTO 5
   IF ~~ THEN REPLY ~Nein, kein Interesse.~ GOTO 3
END

IF ~~ THEN BEGIN 3
   SAY ~Ich bitte Euch, <LADYLORD>, nehmt wenigstens den Brief an Euch. Was Ihr damit dann anstellt, ist dann Eure Sache.~
   IF ~~ THEN REPLY ~Gut, gebt mir Euren Brief.~ GOTO 4
   IF ~~ THEN REPLY ~Soll ich meinen Worten auch noch Taten folgen lassen? Schert Euch fort, bevor ich Euch Beine mache!~ GOTO escape
END

IF ~~ THEN BEGIN 4
   SAY ~Hier ist er. Scheint nicht aus Papier, sondern aus Leder gefertigt zu sein. Ich habe ihn sehr sorgfältig für Euch aufbewahrt.~
   IF ~~ THEN DO ~GiveItemCreate("AC#MES01",LastTalkedToBy,1,0,0)
   SetGlobal("AC#Mes01","GLOBAL",1)~ GOTO bye
END

IF ~~ THEN BEGIN 5
   SAY ~Das kann ich Euch gar nicht mehr genau sagen. Es ist, als könnte ich mich an sein Gesicht gar nicht mehr richtig erinnern, und je mehr ich es versuche, desto weiter entfernt scheint die Erinnerung zu sein. Egal, nehmt Ihr jetzt den Brief?~
   IF ~~ THEN REPLY ~Gut, gebt mir Euren Brief.~ GOTO 4
   IF ~~ THEN REPLY ~Soll ich meinen Worten auch noch Taten folgen lassen? Schert Euch fort, bevor ich Euch Beine mache!~ GOTO escape
END

IF ~~ THEN BEGIN bye
   SAY ~So, nun werde ich wohl wieder meiner Arbeit an den Docks nachgehen müssen. War ziemlich leicht verdientes Geld, diese Nachricht an Euch zu übermitteln. Die Zwerge, die mir die Nachricht gaben, zahlen gut. Wieviel Sie wohl Euch bieten werden? Aber das ist nicht meine Sache. Gehabt Euch wohl.~
   IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN escape
   SAY ~Nun, wie Ihr wollt. Gehabt Euch wohl.~
   IF ~~ THEN DO ~EscapeArea()~ EXIT
END