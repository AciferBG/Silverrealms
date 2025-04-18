BEGIN ~AC#ILDW1~

IF ~RandomNum(7,1)~ THEN BEGIN 0 // from:
  SAY ~Manchmal hören die Bewohner Iltkazars die Steine um sich herum sprechen. Sie erzählen von den alten, glorreichen Zeiten Shanatars. Seltsam, nicht?~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,2)~ THEN BEGIN 1 // from:
  SAY ~(Rülps!)~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,3)~ THEN BEGIN 2 // from:
  SAY ~Der Regentschaftsrat führt uns in den Zeiten, in denen unser weiser König schläft.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,4)~ THEN BEGIN 3 // from:
  SAY ~(Seufz.)~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,5)~ THEN BEGIN 4 // from:
  SAY ~Ich weiß, ich sollte meinen Bart besser pflegen, aber in der Feuchtigkeit der Minen verfilzen die Haare so schnell.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,6)~ THEN BEGIN 5 // from:
  SAY ~Man erzählt sich, dass die Omlare, die wir hier finden, zu verzauberten Edelsteinen geschliffen werden können.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,7)~ THEN BEGIN 6 // from:
  SAY ~Unsere Schmiede in der Arnschädelhalle ist die Beste des gesamten Unterreichs!~ 
  IF ~~ THEN EXIT
END

BEGIN ~AC#ILDW2~

IF ~RandomNum(4,1)~ THEN BEGIN 0 // from:
  SAY #67132 /* ~Verschwindet! Es bleibt uns ohnehin wenig genug Zeit, um zu entspannen!~ */
  IF ~~ THEN EXIT
END

IF ~RandomNum(4,2)~ THEN BEGIN 1 // from:
  SAY #67133 /* ~Ihr gehört zu den Fremden, die gerade eben in der Stadt angekommen sind, oder? Nun, wir dürfen geschäftliche Dinge nicht mit Euch besprechen. Wenn Ihr also bitte gehen wollt ...~ */
  IF ~~ THEN EXIT
END

IF ~RandomNum(4,3)~ THEN BEGIN 2 // from:
  SAY #67134 /* ~Ich trinke hier nur mein Bier. Lasst mich einfach in Ruhe und trinkt Euer Bier, Fremder!~ */
  IF ~~ THEN EXIT
END

IF ~RandomNum(4,4)~ THEN BEGIN 3 // from:
  SAY ~Wenn Ihr gerne Arbeit erledigen möchtet, redet mit den Priestern in den Speichenbrunnenzitadellen.~ 
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 4 // from:
  SAY #73784 /* ~Ähhh ... oh. Ahem, tut mir Leid, <LADYLORD>. Verzeiht, dass ich so unhöflich war ...~ */
  IF ~~ THEN EXIT
END
