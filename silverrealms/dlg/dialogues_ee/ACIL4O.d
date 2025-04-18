
/*******************************************************************************************************
Dialogue in area ACIL4O: Map golem, revealing Ravimor's cave area
*******************************************************************************************************/

BEGIN ~AC#4OGOL~

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#4OGOL hello_01
~Seid gegrüßt, Wanderer. Sucht Ihr nach dem rechten Weg zurück zu Eurem Clan?~
END
IF~~THEN REPLY ~Das tue ich.~ EXTERN AC#4OGOL travel_yes


CHAIN IF ~~ THEN AC#4OGOL travel_yes
~Wo soll Euch Eure Reise hinführen?~
END
IF~~THEN REPLY ~Nach Iltkazar.~ EXTERN AC#4OGOL travel_iltkazar

CHAIN IF ~~ THEN AC#4OGOL travel_iltkazar
~Iltkazar, das Mithrilkönigreich. Ravimors Höhle ist noch offen - wenngleich wenige wagen, die Pfade der Alten zu gehen.~
DO ~SetGlobal("Ravimor_revealed","GLOBAL",1)
RevealAreaOnMap("ACIL01")~ EXIT
