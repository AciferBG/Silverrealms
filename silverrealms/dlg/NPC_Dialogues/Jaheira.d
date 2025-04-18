

/*******************************************************************************************************
Jaheira's dialogues
*******************************************************************************************************/

APPEND ~JAHEIRAJ~
IF WEIGHT #-999 ~Global("AC#Bronzescales","GLOBAL",0)
AreaCheck("ACIL85")
~ THEN BEGIN Jaheira_bronze_dragon01
   SAY ~Also wirklich, <CHARNAME>, wisst Ihr überhaupt, was Ihr da tut?~
   IF ~~ THEN DO ~SetGlobal("AC#Bronzescales","GLOBAL",2)~ REPLY ~Warum, Jaheira, was meint Ihr?~ GOTO Jaheira_bronze_dragon02
END

IF ~~ THEN BEGIN Jaheira_bronze_dragon02
   SAY ~Na diese Drachenschuppen, die Ihr habt. Sie gehören einem jungen Bronzedrachen, einem überaus guten Wesen, das an diesem Ort wohl einen qualvollen Tod gefunden hat. Und Ihr nehmt ihm einfach seine Schuppen ab!~
   IF ~~ THEN EXIT
END

IF WEIGHT #-998 ~Global("AC#RavenJaheira","GLOBAL",1)~ THEN BEGIN Jaheira_dislikes_raven_01
   SAY ~Raben sind sehr intelligente Vögel, <CHARNAME>. Dieser Magier kann sich glücklich schätzen, solch einen Vertrauten zu haben. Wobei mir irgendetwas an diesem Tier seltsam vorkommt. Wir sollten ein wenig wachsam sein, wenn wir weiter mit ihm zu tun haben. Denn ich bin mir ziemlich sicher, dass wir diesem Vogel noch häufiger begegnen werden.~
   IF ~~ THEN DO ~SetGlobal("AC#RavenJaheira","GLOBAL",2)~ EXIT
END

IF WEIGHT #-997 ~Global("AC#JaheiraTalkedToEllhimar","GLOBAL",1)~ THEN BEGIN Jaheira_dislikes_Ellhimar
   SAY ~Dieser Magier hat von der Oberfläche sowenig Ahnung wie ein Zwerg vom Rosenzüchten, <CHARNAME>. Wir sollten der Zwergin Vronia schleunigst unsere Eindrücke schildern, denn irgendetwas stimmt hier ganz und gar nicht.~ 
   IF ~~ THEN REPLY ~Denkt Ihr, dass er etwas mit dem mysteriösen Schlaf des Königs zu tun haben könnte?~ GOTO Jaheira_dislikes_Ellhimar_02
END

IF ~~ THEN BEGIN Jaheira_dislikes_Ellhimar_02
   SAY ~Ich weiß es nicht. Wir haben diese Stadt ja eben erst kennengelernt. Vielleicht ist es auch etwas zu einfach, einen Magier für all das hier verantwortlich zu machen. Lasst uns zu der alten Zwergin gehen und sehen, was sie dazu zu sagen hat.~
   IF ~~ THEN DO ~SetGlobal("AC#JaheiraTalkedToEllhimar","GLOBAL",2)~ EXIT
END
END

