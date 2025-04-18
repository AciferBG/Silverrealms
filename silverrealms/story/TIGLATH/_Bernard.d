APPEND DOGHMA

IF ~~ THEN BEGIN Oghma2
   SAY ~Eine Karte von Amn? Selbstverständlich. Die Kartografen Oghmas gehören zu Besten Faerun. Welcher Bereich möchtet Ihr denn bereisen?~
     IF ~~ THEN REPLY ~Ich suche einen Ort namens Magars Hügel.~ GOTO magar
END

IF ~~ THEN BEGIN magar
   SAY ~Magars Hügel? Das liegt in den Trollbergen. Dieses Gebiet ist in der Kartografie nicht besonders gut dokumentiert. Doch seltsam, erst vor Kurzem hat ein Fremder Gelehrter unserem bescheidenen Tempel eine Karte mit genau dieser Region überlassen.~
   IF ~~ THEN REPLY ~Ich würde dieses Karte gerne kaufen.~ GOTO magar2
END

IF ~~ THEN BEGIN magar2
   SAY ~Selbstverständlich. Gegen eine Spende von 300 Goldmünzen werde ich Euch die Karte gerne überlassen~
IF ~PartyGoldLT(300)~ THEN REPLY ~Soviel Geld habe ich momentan leider nicht.~ GOTO nomoney
IF ~PartyGoldGT(299)~ THEN REPLY ~Sicher, hier ist das Geld.~ GOTO money
END

IF ~~ THEN BEGIN nomoney
   SAY ~Der Hüter des Wissens ist geduldigt. Kehrt zurück, wenn Ihr das geld beisammen habt.~
   IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN money
   SAY ~Gut. Hier ist die Karte.~
   IF ~~ THEN DO ~SetGlobal("AC#MAP01","GLOBAL",1)
   TakePartyGold(300)
   GiveItemCreate("AC#MAP01",LastTalkedToBy,1,0,0)~ GOTO warning
END

IF ~~ THEN BEGIN warning
   SAY ~Noch eine Warnung, <LADYLORD>. Diese Gegend hat keinen besonders guten Ruf in Amn. Es soll dort von Schlangen und Trollen nur so wimmeln.~
   IF ~~ THEN REPLY ~Danke für den Hinweis, doch ich weiß mich durchaus zu verteidigen.~ GOTO bye
END

IF ~~ THEN BEGIN bye
   SAY ~Ich wollte es nur gesagt haben. Gehabt Euch wohl~
   IF ~~ THEN EXIT
END
END

EXTEND_BOTTOM DOGHMA 0
        IF ~Global("AC#Mes01","GLOBAL",1)~ THEN REPLY ~Ich suche nach einer Karte von Amn. Verkauft Ihr solch etwas hier in Eurem Tempel?~ GOTO Oghma2
END
