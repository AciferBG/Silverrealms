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
   SAY ~Kehrt zurück in die Hölle, aus der Ihr entsprungen seid, Scheusal! Und richtet Eurer Göttin aus, dass ich mich einen feuchten Dreck um sie schere. Meine Gefährten und ich werden keinen Schritt zurückweichen, um unseren König zu schützen!~
IF ~~ THEN EXTERN ~AC#GOAP1~ 2
END

/*******************************************************************************************************
Goap-Dialog
*******************************************************************************************************/
BEGIN ~AC#GOAP1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY ~Die Verderbnis ist über Eure Stadt gekommen, Zwergenpriester. Geht beiseite und überlasst mir Euren greisen König. Die Göttin Tiamat verlangt nach ihm, und wer ihrer Forderung trotzt, wird auf ewig in den Neun Höllen schmoren.~
IF ~~ THEN EXTERN ~AC#DUN02~ 10
END

IF ~~ THEN BEGIN 2
   SAY ~So sei es denn. Ich hätte Euch einen raschen Tod gegönnt. Doch Tiamat wird Gefallen daran finden, Euch leiden zu sehen!~
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
   AddJournalEntry(@66002,QUEST)
   EscapeArea()~  EXIT
   
/*******************************************************************************************************
Dialog Bettargh - Tiamat Symbol
*******************************************************************************************************/
BEGIN ~AC#BETT6~

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#BETT6 hello_0
~Beim wandernden Tüftler! Ihr lebt! Und der Angriff auf den Thronsaal scheint vorerst abgewehrt!~
== AC#DUN02 ~Vorerst. Und dank <CHARNAME>. Sonst wären wir jetzt alle verloren.~
== AC#DUN02 ~Seht Euch dieses Brandmal an! Die Scheusale haben es in den Boden des Thronsaals gebrannt.~
== AC#BETT6 ~Ein fünfköpfiger Drache...~
== AC#DUN02 ~Das Zeichen Tiamats?~
== AC#BETT6 ~Wie kommt Ihr darauf?~
== AC#DUN02 ~Das Scheusal dort drüben hatte es uns gesagt, bevor es in den Staub geschickt wurde.~
== AC#BETT6 ~Dann wird es so sein. Tiamat, die Drachenkönigin... Herrin zahlloser böser Drachen und Gebieterin über die Abishai. Jener Teufel, die gerade unsere Stadt angreifen!~
== AC#DUN02 ~Dann steckt also tatsächlich sie hinter diesem Wahnsinn?~
== AC#BETT6 ~Vielleicht. Doch für Spekulationen bleibt keine Zeit. Die Kämpfe an der Brücke zur Arnschädelhalle dauern an, und die Lage dort ist unklar.~
== AC#BETT6 ~Dunnabar, Ihr solltet zum König zurückkehren. <CHARNAME> wird an der Brücke gebraucht.~
== AC#DUN02 ~Nun denn, <CHARNAME>! Scheint, wir haben keine Zeit zum Ausruhen. Ich werde neben dem König Wache halten, und Ihr geht schnell und sucht meinen Sohn im Nordwesten der Stadt an der Brücke zur Arnschädelhalle.~
END
IF ~~ THEN DO ~SetGlobal("AC#IL_TiamatSymbol","GLOBAL",1)
ActionOverride("AC#BETT6",EscapeArea())
EscapeAreaObject("TrACIL64")
~ EXIT
/*
CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#BETT6 hello_0
~Beim wandernden Tüftler! Ihr lebt! Und der Angriff auf den Thronsaal scheint abgewehrt!~ 
== AC#DUN02 ~Nur um Haaresbreite. Und Dank <CHARNAME>!~
== AC#DUN02 ~Seht Euch dieses scheußliche Symbol an, das man uns hier in den schönen Boden gebrannt hat!~
== AC#BETT6 ~Ein fünfköpfiger Drache? Das Symbol von...~
== AC#DUN02 ~...einer gewissen Tiamat. Wenn ich die erwische werde ich...~
== AC#BETT6 ~Darum kümmern wir uns später! <CHARNAME> wird an der brücke erwartet, der Angriff scheint abgeebbt zu sein, doch er iost noch nicht vorbei! Dunnabar, Ihr solltet zum Thron des Königs gehen und dort nach dem rechten sehen.~
== AC#DUN02 ~Nun denn, <CHARNAME>, wir haben keine Zeit zum Ausruhen! Ich werde neben dem König Wache halten, und Ihr geht shcnell und sucht meinen Sohn im Nordwesten der Stadt an der Brücke zur Arnschädelhalle.~
END
IF ~~ THEN DO ~ActionOverride("AC#BETT6",EscapeArea())
EscapeAreaObject("TrACIL64")~  EXIT   
*/
   
   
   


