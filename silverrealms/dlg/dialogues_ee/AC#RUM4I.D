
BEGIN ~AC#RUM4I~

IF ~RandomNum(4,1)~ THEN BEGIN 1 
  SAY ~Zweiwasser wurde früher als Steinbruch genutzt. Ihr könnt noch hinter den Hütten der Bauern die behauenen Felsen erkennen.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(4,2)~ THEN BEGIN 2
  SAY ~Unsere Taverne steht an der Straße zwischen Atkatla und Eshpurta. Viele Händler kommen hier vorbei, wenn sie aus der Stadt des Geldes kommen und in anderen Teilen Amns Geschäfte machen wollen.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(4,3)~ THEN BEGIN 3
SAY ~Das ganze Gebiet hier wird "der Grat" genannt. Es ist der östliche Ausläufer des Wolkengipfelgebirges.~
IF ~~ THEN EXIT 
END

IF ~RandomNum(4,4)~ THEN BEGIN 4
SAY ~Die Menschen hier haben seit Jahrhunderten vom Bergbau gelebt. Die ganze Gegend hier ist ausgehöhlt wie ein Talländer Käse!~
IF ~~ THEN EXIT 
END

