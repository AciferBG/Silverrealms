

/*******************************************************************************************************
Dialog Bote Eldaths
*******************************************************************************************************/

BEGIN ~ac#elda9~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY  ~<CHARNAME>! Ihr seid zurückgekehrt! Der Herrin der Wasser sei gedankt. Ich wurde von Tethtoril aus dem Dämmerwaldtal hierher entsandt, um auf Eure Rückkehr zu warten.~
++ ~Wie geht es Tethtoril?~ + 2
END

IF ~~THEN BEGIN 2
SAY ~Tethtoril ist wohlauf. Er hat zahlreiche alte Schriften studiert, um Euch bei Eurer Suche zu helfen, und er hat etwas herausgefunden, was er Euch dringen mitteilen muss. Ich soll Euch zu ihm bringen.~
++ ~Das sind schöne Neuigkeiten! Bringt mich ins Dämmerwaldtal.~ + 3
END

IF ~~THEN BEGIN 3
SAY ~Gut. Bleibt dicht zusammen, damit Ihr im Wald nicht verloren geht.~
   IF ~~ THEN DO ~SetGlobal("AC#TethQuest02","GLOBAL",1)~  EXIT
END

