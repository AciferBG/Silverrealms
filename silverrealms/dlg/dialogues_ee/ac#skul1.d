

/*******************************************************************************************************
Dialog mit dem Kontrollschädel
*******************************************************************************************************/

BEGIN ~AC#Skul1~

IF ~NumTimesTalkedToGT(0)~ THEN BEGIN hello_again
SAY @0
++ @2 /* ~Den Schädel losslassen.~ */ + 16
IF ~Global("EarthNodeActivation","ACIL31",7)~ THEN REPLY @3 /* ~Bringt mich zur Astralebene.~ */ + 3
IF ~!Global("EarthNodeActivation","ACIL31",7)~ THEN REPLY @3 /* ~Bringt mich zur Astralebene.~ */ + must_node_activate
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY @1
++ @2 /* ~Den Schädel losslassen.~ */ + 16
IF ~Global("EarthNodeActivation","ACIL31",7)~ THEN REPLY @3 /* ~Bringt mich zur Astralebene.~ */ + 3
IF ~!Global("EarthNodeActivation","ACIL31",7)~ THEN REPLY @3 /* ~Bringt mich zur Astralebene.~ */ + must_node_activate
END

IF ~~ THEN BEGIN 3
   SAY @4 /* ~Nichts geschieht. Ihr werdet Eure Gedanken genauer fokussieren müssen, um die Reise in Gang zu bringen.~ */
++ @2 + 16
++ @5 /* ~Ihr stellt Euch die tote Drachengottheit Kalzareinad vor, wie sie Euch der alte Drache Maldraedior beschrieben hat. Vor Eurem geistigen Auge formt sich ein Bild, das Bild eines riesigen Drachenkadavers, der in einem Meer aus Silber zu treiben scheint...~ */ + 4
END

IF ~~THEN BEGIN 4
SAY @6
   IF ~~ THEN DO ~SetGlobal("AC#Astraltravel","ACIL31",1)~  EXIT
END

/*
IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ Jaheira_Comment_Dumathoin
IF ~!IsValidForPartyDialog("Jaheira")~ THEN REPLY ~Was ist hier geschehen?~ + 3
*/

IF ~~ THEN BEGIN 16
   SAY @7
   IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN must_node_activate
   SAY @8
   IF ~~ THEN EXIT
END


