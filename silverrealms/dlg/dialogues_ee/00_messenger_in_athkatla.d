BEGIN ~AC#S#MS1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY ~Verzeiht, <LADYLORD>, dass ich Euch so unvermittelt anspreche, aber ich habe einen Brief für Euch.~
  IF ~~ THEN REPLY ~Sicher, gebt ihn mir. Worum geht es?~ GOTO 1
  IF ~~ THEN REPLY ~Woher wisst Ihr, dass der Brief für mich ist?~ GOTO 2
  IF ~~ THEN REPLY ~Kein Interesse.~ GOTO 3
END

IF ~~ THEN BEGIN 1
   SAY ~Ich weiß ehrlich gesagt nicht, worum es geht, denn ich bin nur ausgesandt worden, Euch hier in der Stadt zu suchen und diese Botschaft übermitteln. Normalerweise arbeite ich unten bei den Docks.~
   IF ~~ THEN REPLY ~Gut, gebt mir Eure Nachricht.~ GOTO 4
   IF ~~ THEN REPLY ~Nein, kein Interesse.~ GOTO 3
END

IF ~~ THEN BEGIN 2
   SAY ~Die Zwerge, die mir den Brief übergaben, schienen Euch zu kennen. Sie haben Euch genau so beschrieben, wie Ihr jetzt vor mir steht.~
   IF ~~ THEN REPLY ~Gut, gebt mir den Brief.~ GOTO 4
   IF ~~ THEN REPLY ~Dieser Brief ist von Zwergen? Könnt Ihr mir Genaueres über sie erzählen?~ GOTO 5
   IF ~~ THEN REPLY ~Nein, kein Interesse.~ GOTO 3
END

IF ~~ THEN BEGIN 3
   SAY ~Ich bitte Euch, <LADYLORD>, nehmt wenigstens den Brief an Euch. Was Ihr damit dann anstellt, ist dann Eure Sache.~
   IF ~~ THEN REPLY ~Gut, gebt mir Euren Brief.~ GOTO 4
   IF ~~ THEN REPLY ~Soll ich meinen Worten auch noch Taten folgen lassen? Schert Euch fort, bevor ich Euch Beine mache!~ GOTO escape
END

IF ~~ THEN BEGIN 4
   SAY ~Hier ist er. Scheint aus besonderem Papier gefertigt zu sein. So etwas habe ich in Amn noch nie gesehen! Ich habe ihn sehr sorgfältig für Euch aufbewahrt.~
   IF ~~ THEN DO ~GiveItemCreate("ac#s#ms1",Player1,1,0,0)
   SetGlobal("AC#BeldasPlotStart","GLOBAL",2)~ GOTO bye
END

IF ~~ THEN BEGIN 5
   SAY ~Ich habe sie vorher noch nie in der Stadt gesehen, bevor sie mich baten, Euch den Brief zu übermitteln. Gut bezahlt haben sie mich! Einer von ihnen hat so gar nichts zwergisches an sich, sondern würde eher in eine Bibliothek passen. Egal, nehmt Ihr jetzt den Brief?~
   IF ~~ THEN REPLY ~Gut, gebt mir Euren Brief.~ GOTO 4
   IF ~~ THEN REPLY ~Soll ich meinen Worten auch noch Taten folgen lassen? Schert Euch fort, bevor ich Euch Beine mache!~ GOTO escape
END

IF ~~ THEN BEGIN bye
   SAY ~So, nun werde ich wohl wieder meiner Arbeit an den Docks nachgehen müssen. War ziemlich leicht verdientes Geld, diese Nachricht an Euch zu übermitteln. Die Zwerge, die mir die Nachricht gaben, zahlen gut. Wieviel Sie wohl Euch bieten werden? Aber das ist nicht meine Sache. Gehabt Euch wohl.~
   IF ~~ THEN DO ~EscapeArea()
   RevealAreaOnMap("ACIL04")
   AddJournalEntry(@20000,QUEST)~ EXIT
END

IF ~~ THEN BEGIN escape
   SAY ~Nun, wie Ihr wollt. Gehabt Euch wohl.~
   IF ~~ THEN DO ~EscapeArea()~ EXIT
END
