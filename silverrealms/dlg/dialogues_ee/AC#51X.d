// ---------------------------------------------
// Adepten des Amboss
// ---------------------------------------------

BEGIN ~AC#51DW1~

IF ~RandomNum(7,1)~ THEN BEGIN 0 // from:
  SAY ~Ich bin nur ein Adept des Amboss. Irgendwann werde ich in den Rang der Hämmerer des Krieges aufsteigen und edlere Waffen und Rüstungen herstellen dürfen.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,2)~ THEN BEGIN 1 // from:
  SAY ~Man muss das Eisen schmieden, solange es noch heiß ist!~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,3)~ THEN BEGIN 2 // from:
  SAY ~Mein erster Versuch, das Feuerschweißen anzuwenden, ging leider schief. Ich habe die beiden Werkstücke zu heiß gemacht und sie sind unter meinem Hammer einfach weggebrannt.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,4)~ THEN BEGIN 3 // from:
  SAY ~Ich lerne gerade, die Klinge zu härten. Man erhitzt sie, bis sie richtig schön rot glüht. Dann wird sie in Wasser abgeschreckt und auf einen heißen Stahlblock gelegt. Die Klinge leuchtet dann nacheinander in vielen verschiedenen Farben. Wenn sie matt wie Honig glüht, wird das Werkstück in Öl abgeschreckt.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,5)~ THEN BEGIN 4 // from:
  SAY ~Wisst Ihr, wo der Blatthammer ist? Ich habe ihn irgendwo beim Biegeeisen liegen gelassen. So viele unterschiedliche Dinge, die man benötigt, und ich kann sie mir noch nicht alle merken!~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,6)~ THEN BEGIN 5 // from:
  SAY ~Der Klang der Hämmer erfüllt mein Herz mit Freude.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,7)~ THEN BEGIN 6 // from:
  SAY ~Die Schmiedemeister des Moradin sind die Besten der gesamten Zwergenrasse!~
  IF ~~ THEN EXIT
END

// ---------------------------------------------
// Hämmerer des Krieges
// ---------------------------------------------

BEGIN ~AC#51DW6~

IF ~RandomNum(7,1)~ THEN BEGIN 0 // from:
  SAY ~Ich bin ein Hämmerer des Krieges. Dank Moradins Gnade darf ich die schönsten Metallstücke bearbeiten, die man sich nur vorstellen kann.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,2)~ THEN BEGIN 1 // from:
  SAY ~Es gibt nichts Schöneres als den Anblick von glühendem Eisen, das man auf dem Amboss formen kann.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,3)~ THEN BEGIN 2 // from:
  SAY ~Das Eisen nach dem Ausglühen anzublasen ist eine Kunst, die man ein Leben lang lernen muss.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,4)~ THEN BEGIN 3 // from:
  SAY ~Anthan Diamantklinge ist unser oberster Priester und der beste Schmied, den es in unserer Stadt gibt. Eines Tages wünsche ich mir, ihm einmal beim Schmieden zusehen zu dürfen.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,5)~ THEN BEGIN 4 // from:
  SAY ~Einige der Gegenstände, die wir hier schmieden, könnt Ihr bei unserem Seelenschmied Vichorn Goldhammer erwerben. Vielleicht ist auch etwas dabei, das ich geschmiedet habe? Es wäre mir eine große Freude, wenn Ihr eine von mir gefertigte Waffe im Kampfe schwingen würdet.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,6)~ THEN BEGIN 5 // from:
  SAY ~Der Klang der Hämmer erfüllt mein Herz mit Freude.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,7)~ THEN BEGIN 6 // from:
  SAY ~Die Schmiedemeister des Moradin sind die Besten der gesamten Zwergenrasse!~
  IF ~~ THEN EXIT
END
