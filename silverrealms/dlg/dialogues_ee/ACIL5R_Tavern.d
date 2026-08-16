// ---------------------------------------------
// ACIL54-Dialoge
// ---------------------------------------------

BEGIN ~AC#ILBR4~

//Dialog mit Viconia
IF ~Name("Viconia",LastTalkedToBy)~ THEN BEGIN hello_viconia
  SAY ~Leute Eures Schlages bediene ich nicht. Macht, dass Ihr rauskommt, Drow!~
  IF ~~ THEN EXIT
END

IF ~RACE(LastTalkedToBy,DWARF)~ THEN BEGIN 0
  SAY ~Seid gegrüßt, *mer*. Was kann ich für Euch tun?~
  IF ~~ THEN REPLY ~Würde es Euch etwas ausmachen, wenn ich Euch ein paar Fragen stelle?~ GOTO 12
  IF ~~ THEN REPLY ~Ich würde gerne Eure Dienste in Anspruch nehmen.~ GOTO 13
  IF ~~ THEN REPLY ~Ach, nichts. Bin schon wieder weg.~ GOTO 14
END

IF ~!RACE(LastTalkedToBy,DWARF)~ THEN BEGIN 1
  SAY ~Wesen Eurer Art sieht man nicht oft in Iltkazar. Was kann ich für Euch tun?~
  IF ~~ THEN REPLY ~Würde es Euch etwas ausmachen, wenn ich Euch ein paar Fragen stelle?~ GOTO 7
  IF ~~ THEN REPLY ~Ich würde gerne Eure Dienste in Anspruch nehmen.~ GOTO 8
  IF ~~ THEN REPLY ~Ach, nichts. Bin schon wieder weg.~ GOTO 9
END

IF ~~ THEN BEGIN 7
  SAY ~Wenn Ihr etwas wissen wollt, dann fragt. Solang Ihr nicht den ganzen Abend nur meinen Tresen blockiert, soll es mir recht sein.~
  IF ~~ THEN REPLY ~Dann würde ich gern erst einmal Eure Dienste in Anspruch nehmen.~ GOTO 8
  IF ~~ THEN REPLY ~Na, dann geh' ich doch lieber wieder.~ GOTO 9
END

IF ~~ THEN BEGIN 8
  SAY ~Also gut. Ich weiß zwar nicht, ob jemand wie Ihr unser *klos* verträgt, aber das ist dann nicht mein Problem. Sucht Euch einen Platz, solange noch einer frei ist.~
  IF ~~ THEN DO ~StartStore("AC#BAR03",LastTalkedToBy())~ EXIT
END

IF ~~ THEN BEGIN 9
  SAY ~Tut das. Und wenn Euch später doch der Durst packt, wißt Ihr ja, wo Ihr mich findet.~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 12
  SAY ~Was wollt Ihr wissen, *mer*? Wenn ich es beantworten kann, tu ich's. Wenn nicht, bekommt Ihr immerhin ein ehrliches Schulterzucken.~
  IF ~~ THEN REPLY ~Dann zeigt mir doch lieber, was Ihr anzubieten habt.~ GOTO 13
  IF ~~ THEN REPLY ~Schon gut, das genügt mir fürs Erste.~ GOTO 14
END

IF ~~ THEN BEGIN 13
  SAY ~Natürlich. Nehmt Platz, wo noch keiner schnarcht. Wir haben hier starkes *auraun*, ordentliches Bier und genug, um selbst einen langen Tag in den Hallen erträglich zu machen.~
  IF ~~ THEN DO ~StartStore("AC#BAR03",LastTalkedToBy())~ EXIT
END

IF ~~ THEN BEGIN 14
  SAY ~Wie Ihr meint. Ruft, wenn Ihr etwas braucht. Aber nicht zu leise — bei dem Lärm hier geht sonst jedes Wort verloren.~
  IF ~~ THEN EXIT
END

BEGIN ~AC#ILBR3~

//Dialog mit Viconia
IF ~Name("Viconia",LastTalkedToBy)~ THEN BEGIN hello_viconia
  SAY ~Leute Eures Schlages bediene ich nicht. Macht, dass Ihr rauskommt, Drow!~
  IF ~~ THEN EXIT
END

IF ~True()~ THEN BEGIN 1
  SAY ~Wenn Ihr etwas wollt sprecht mit der Schankmaid! Wo kämen wir denn dahin, wenn einfach jeder auf ein Schwätzchen bei mir vorbeikommen dürfte?~
  IF ~~ THEN EXIT
END
