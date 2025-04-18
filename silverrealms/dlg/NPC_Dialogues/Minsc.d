

/*******************************************************************************************************
Minsc-Interjections
*******************************************************************************************************/

APPEND ~MINSCJ~

IF WEIGHT #-999 ~Global("AC#RavenMinsc","GLOBAL",1)~ THEN BEGIN Boo_dislikes_raven_01
   SAY ~Boo mag diesen Vogel nicht. Boo hat ein sehr gutes Gespür dafür. Deshalb mag Minsk den Vogel auch nicht.~
   IF ~~ THEN DO ~SetGlobal("AC#RavenMinsc","GLOBAL",2)~ EXIT
END
END

