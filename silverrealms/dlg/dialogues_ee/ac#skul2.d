

/*******************************************************************************************************
Dialog mit dem Kontrollschädel
*******************************************************************************************************/

BEGIN ~AC#Skul2~

IF ~True()~ THEN BEGIN 1
SAY @1 /*Der Schädel pulsiert weiterhin mit ungeheurer Energie. Wenn Ihr möchtet, könnt Ihr allein mit Eurer Geisteskraft das Schiff manövrieren.*/
++ @2 /* ~Den Schädel losslassen.~ */ + 16
IF ~Global("AC#RevealACIL80","GLOBAL",1)~ THEN REPLY @3 /* ~Bringt mich zur Festung der zerschmetterten Seelen.~ */ + 3
END

IF ~~ THEN BEGIN 3
   SAY @4 /* ~Das blaue Licht leuchtet stärker auf, und Euch überkommt ein tiefes Gefühl der Düsternis und Hoffnungslosigkeit. Ihr spürt, dass der Ort, an den Euch das astrale Schiff hinbringen wird, äußerst gefährlich sein wird und vielleicht Eure letzte Reise sein wird..~ */
++ @2 + 16
++ @5 /* ~Ich habe keine andere Wahl. Bringt zur Festung, damit ich Mith Barak befreien kann.~ */ + 4
END

IF ~~THEN BEGIN 4
SAY @6
   IF ~~ THEN DO ~SetGlobal("AC#Astraltravel","ACIL78",1)~  EXIT
END

/*
IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ Jaheira_Comment_Dumathoin
IF ~!IsValidForPartyDialog("Jaheira")~ THEN REPLY ~Was ist hier geschehen?~ + 3
*/

IF ~~ THEN BEGIN 16
   SAY @7
   IF ~~ THEN EXIT
END


