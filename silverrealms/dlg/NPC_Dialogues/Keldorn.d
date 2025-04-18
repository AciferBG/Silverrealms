

/*******************************************************************************************************
Keldorn's dialogues
*******************************************************************************************************/

APPEND ~KELDORJ~

IF  WEIGHT #-999 ~Global("AC#RavenKeldorn","GLOBAL",1)~ THEN BEGIN Keldorn_dislikes_raven_01
   SAY ~Mein ganzes Leben habe ich Jagd auf faule Magie gemacht, <CHARNAME>. Ich kann an diesem Vogel zwar nichts Böses feststellen, aber meine Erfahrung lehrt mich, dass wir dennoch auf der Hut sein sollten, wenn wir mit diesem Geschöpf und seinem Meister Geschäfte machen.~
   IF ~~ THEN DO ~SetGlobal("AC#RavenKeldorn","GLOBAL",2)~ EXIT
END

IF WEIGHT #-998 ~Global("AC#KeldornTalkedToEllhimar","GLOBAL",1)~ THEN BEGIN Keldorn_dislikes_Ellhimar
   SAY ~Irgendetwas gefällt mir an diesem Magier nicht, <CHARNAME>. Er gibt sich als weitgereister Gelehrter aus und ist doch so ahnungslos. Ich kann keine bösen Absichten an ihm erkennen, aber auch keine Guten.~
   IF ~~ THEN DO ~SetGlobal("AC#KeldornTalkedToEllhimar","GLOBAL",2)~ EXIT
END
END

