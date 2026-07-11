

/*******************************************************************************************************
Dialog mit dem Kontrollschädel in Area ACIL78
*******************************************************************************************************/

BEGIN ~AC#Skul2~

IF ~True()~ THEN BEGIN 1
SAY ~Der Schädel pulsiert weiterhin mit ungeheurer Energie. Wenn Ihr möchtet, könnt Ihr allein mit Eurer Geisteskraft das Schiff manövrieren.~
++ ~Den Schädel loslassen.~ + 16
IF ~Global("AC#RevealACIL80","GLOBAL",1)~ THEN REPLY ~Bringt mich zu Mith Baraks Gefängnis.~  + 3
END

IF ~~ THEN BEGIN 3
SAY ~Das blaue Licht leuchtet stärker auf, und Euch überkommt ein tiefes Gefühl der Düsternis und Hoffnungslosigkeit. Ihr spürt, dass der Ort, an den Euch das astrale Schiff hinbringen wird, äußerst gefährlich sein wird und vielleicht Eure letzte Reise werden wird.~
++ ~Den Schädel loslassen.~ + 16
++ ~Ich habe keine andere Wahl. Bringt zur Festung, damit ich Mith Barak befreien kann.~  + 4
END

IF ~~THEN BEGIN 4
SAY ~Die Silberstreifen, welche die astrale Ebene durchziehen, scheinen sich plötzlich um Euer Schiff herum zu konzentrieren. Der Drachenkörper Kalzareinads beginnt zu verblassen...~
   IF ~~ THEN DO ~SetGlobal("AC#Astraltravel","ACIL78",1)
   ClearAllActions()
   StartCutSceneMode()
   Wait(1)
   StartCutScene("ac#cut78")~  EXIT
END

IF ~~ THEN BEGIN 16
   SAY  ~Ihr wendet Euch von dem Schädel ab.~
   IF ~~ THEN EXIT
END


