/*******************************************************************************************************
Dunnabar-Dialog
*******************************************************************************************************/
BEGIN ~AC#DUN02~

IF ~Global("AC#Goapspawn","GLOBAL",7)~ THEN BEGIN hello_find_bresk
SAY ~Geht und seht nach meinem Sohn Bresk. Er wird als Kriegsmeister außen die Verteidung der Stadt organisieren. Meine Pflicht ist es, hier innen die Stellung zu halten und den König zu beschützen.~
IF ~~ THEN EXIT 
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
  SAY ~Gut, dass Ihr hier seid, <CHARNAME>! Die Stadt steht unter Angriff. Habt Ihr meine Söhne gesehen? Was geschieht da draußen?~
  ++ ~Hathar hält noch immer das äußere Tor. Bresk organisiert die Verteidigung in der Stadt. Er hat mich geschickt, um den König zu schützen.~ + 2
  ++ ~Beide erfüllen ihre Pflicht. Hathar hält die Feinde auf, Bresk koordiniert die Verteidigung. Nun soll ich dem König beistehen.~ + 2
  ++ ~Sorgt Euch nicht um Eure Söhne. Sie kämpfen tapfer für Iltkazar. Bresk schickte mich zum Königspalast.~ + 2
END

IF ~~ THEN BEGIN 2
  SAY ~Den König beschützen? Das ist meine Aufgabe. Die Hizaagkur-Tore sind versiegelt. Kein Feind wird diese Hallen je erreichen können.~
  ++ ~Bresk glaubt, dass die Angreifer nur eines wollen: Mith Barak. Wir müssen damit rechnen, dass sie einen Weg hierher finden.~ + 3
  ++ ~Gerade deshalb hat Bresk mich geschickt. Er ist überzeugt, dass der König das eigentliche Ziel des Angriffs ist.~ + 3
  ++ ~Ich hoffe, Ihr habt recht. Doch Bresk erwartet einen Kampf in diesen Hallen.~ + 3
END

IF ~~ THEN BEGIN 3
  SAY ~Dann sind dies düstere Nachrichten. Ihr habt unserer Stadt bereits große Dienste erwiesen, <CHARNAME>. Werdet Ihr heute erneut an unserer Seite kämpfen?~
//  ++ ~Ich werde Euch helfen, den König und Iltkazar zu verteidigen.~ + 4
  ++ ~Ihr könnt auf meine Klinge zählen!~ + 4
  ++ ~Ich habe nicht vor, diese Stadt ihrem Schicksal zu überlassen.~ + 4
  ++ ~Ich kämpfe nicht für Iltkazar, sondern für meine eigenen Ziele. Heute läuft es auf dasselbe hinaus.~ + 4
++ ~Schon wieder eine Stadt retten? Irgendwann sollte man mir dafür eine Statue errichten!~ + 4
//++ ~Mit Vergnügen! Lasst uns diesen Bestien zeigen, mit wem sie sich angelegt haben.~ + 4
++ ~Ich bin nicht den ganzen Weg hierher gekommen, um mich vor einem Kampf zu drücken.~ + 4
//++ ~Dann wollen wir den Feinden einen Empfang bereiten, den sie nicht vergessen werden.~ + 4	
END

IF ~~ THEN BEGIN 4
  SAY ~Habt Ihr es gehört, Zwerge Iltkazars? Heute kämpfen wir Seite an Seite mit unseren Freunden! Zu den Waffen! Für den König!~

  IF ~~ THEN DO ~SetGlobal("AC#Goapspawn","GLOBAL",1)
  EraseJournalEntry(@66001)~ EXIT
END

IF ~~ THEN BEGIN 10
   SAY ~Kehrt zurück in die Hölle, aus der Ihr entsprungen seid, Scheusal! Euer Weg endet hier, denn meine Gefährten und ich werden keinen Fuß zurückweichen!~
IF ~~ THEN EXTERN ~AC#GOAP1~ 2
END

/*******************************************************************************************************
Goap-Dialog
*******************************************************************************************************/
BEGIN ~AC#GOAP1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY  ~Die Verderbnis ist über Eure Stadt gekommen, Zwergenpriester. Geht beiseite und überlasst uns Euren greisen König, denn Euer Kampf ist ohnehin vergebens.~
IF ~~ THEN EXTERN ~AC#DUN02~ 10
END

IF ~~ THEN BEGIN 2
   SAY ~So sei es denn. Ich hätte Euch einen raschen Tod gegönnt, doch nun sollt Ihr ewig in den Neun Höllen leiden.~
   IF ~~ THEN DO ~SetGlobal("AC#Goapspawn","GLOBAL",5)
   Enemy()
   ActionOverride("AC#CORN1",Enemy())
   ActionOverride("AC#CORN2",Enemy())~  EXIT
END

/*******************************************************************************************************
Dialog des Boten nach Goaps Tod
*******************************************************************************************************/
BEGIN ~AC#DWMS1~

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#DWMS1 1
~<CHARNAME>! Bresk Steinschulter schickt mich. Es ist noch nicht vorbei. Wir wissen, wo diese Teufel herkommen!~ 
=
~Sie haben die Kuppel der Arnschädelhalle durchbrochen und strömen in Massen aus den unteren Bereichen der Azerkyn-Halle empor!~
END
++ ~Das sind schlechte Nachrichten.~ + 2
++ ~Wo ist Bresk jetzt?~ + 2

CHAIN AC#DWMS1 2
~Bresk versucht mit den verbliebenen Kriegern, die Brücke über den Fluss zu halten, doch es sind zu viele Scheusale. Sie werden die Brücke nicht lange halten können!~
=
~Er möchte in die unteren Hallen vordringen und benötigt dabei Eure Hilfe.~
END
++ ~Wir haben hier gerade den Anführer der Unholde erschlagen.~ + 3
++ ~Mache mich sogleich auf den Weg.~ + 4


CHAIN AC#DWMS1 3
~Dieser hier, den Ihr getötet habt? Ich fürchte nicht. Ich bitte Euch, beeilt Euch und schlagt Euch zu Kriegsmeister Bresk vor, sonst wir alle verloren!~
== AC#DUN02 ~Geht und seht nach meinem Sohn Bresk! Meine Pflicht ist es, hier innen die Stellung zu halten und den König zu beschützen.~
END
IF ~~ THEN EXTERN ~AC#DWMS1~ 4

CHAIN AC#DWMS1 4
~Beeilt Euch! Ich werde versuchen, in der Stadt weitere versprengte Verteidiger zusammen zu trommeln.~
END
   IF ~~ THEN DO ~SetGlobal("AC#Goapspawn","GLOBAL",7)
   EscapeArea()~  EXIT


