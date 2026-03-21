


/*******************************************************************************************************
Dialog mit Ruvan im Kerker
*******************************************************************************************************/

BEGIN ~AC#RUVA2~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
  SAY ~Ihr also. Ich habe mich gefragt, ob Ihr noch kommt, um den Gefallenen zu sehen. Nun, seht genau hin. So endet ein Zwerg, der glaubte, klüger zu sein als sein Eid.~
  IF ~~ THEN REPLY ~Ihr klingt nicht gerade reumütig.~ + 2
END

IF ~~ THEN BEGIN 2
  SAY ~Reue? Ich habe sie jede Stunde hier gekostet. Aber Reue sprengt keine Gitter. Ich sah einen Weg für mich, vielleicht sogar für Iltkazar ... und am Ende war es nur ein weiterer Pfad in die Finsternis.~
  IF ~~ THEN REPLY ~Dann sagt wenigstens die Wahrheit. Warum habt Ihr es getan?~ + 3
END

IF ~~ THEN BEGIN 3
  SAY ~Weil ich schwach war. Weil mir Versprechen gemacht wurden, die ein verbittertes Herz zu gern hört. Macht. Anerkennung. Ein Platz, der mir nie zustand. Und als ich begriff, wem ich wirklich diente, war der Verrat längst vollbracht.~
  IF ~~ THEN REPLY ~Ihr werdet mit dieser Schuld leben müssen. Das ist Strafe genug.~ + 4
END

IF ~~ THEN BEGIN 4
  SAY ~Nein. Strafe genug wäre gewesen, dem Blick meiner Ahnen standhalten zu können.~
  IF ~~ THEN + bye
END

IF ~~ THEN BEGIN bye
  SAY ~Geht jetzt. Ich habe nur noch meine Ketten und die Stimmen der Fehler, die ich nicht mehr ungeschehen machen kann.~
  IF ~~ THEN DO ~SetGlobal("AC#ACIL5P_Ruvan","GLOBAL",1)~ EXIT
END
						


