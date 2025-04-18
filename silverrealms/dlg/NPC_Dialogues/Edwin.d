

/*******************************************************************************************************
Edwin's dialogues
*******************************************************************************************************/

APPEND ~EDWINJ~


IF WEIGHT #-998 ~Global("AC#EdwinTalkedToEllhimar","GLOBAL",1)~ THEN BEGIN Edwin_dislikes_Ellhimar
   SAY ~In der Regel begegnen meiner Kaste andere Magier mit einer Mischung aus Respekt und Furcht. Bei diesem Magier konnte ich keins von beidem erkennen, nur eine Menge ungebildeter Arroganz, die ihm so gar nicht gut zu Gesicht steht. (Wie gerne würde ich diesem Einfaltspinsel seinen Hochmut langsam aus der Visage brennen, aber damit warte ich noch ein wenig.)~
   IF ~~ THEN DO ~SetGlobal("AC#EdwinTalkedToEllhimar","GLOBAL",2)~ EXIT
END
END

