// ---------------------------------------------
// ACIL54-Dialoge
// ---------------------------------------------

BEGIN ~AC#BAR01~

//Dialog mit Viconia
IF ~Name("Viconia",LastTalkedToBy)~ THEN BEGIN hello_viconia
  SAY ~Leute Eures Schlages bediene ich nicht. Macht, dass Ihr rauskommt, Drow!~
  IF ~~ THEN EXIT
END

IF ~RACE(LastTalkedToBy,DWARF)~ THEN BEGIN 0
  SAY ~Seid gegrüßt, *mer*. Was kann ich für Euch tun?~
  IF ~~ THEN REPLY #47377 /* ~Ihr hört doch gewisse Dinge... würde es Euch etwas ausmachen, wenn ich Euch ein paar Fragen stelle?~ */ GOTO 12
  IF ~~ THEN REPLY #47378 /* ~Ich würde gerne Eure Dienste in Anspruch nehmen.~ */ GOTO 13
  IF ~~ THEN REPLY #47379 /* ~Ach nichts. Bin schon wieder weg.~ */ GOTO 14
END

IF ~!RACE(LastTalkedToBy,DWARF)~ THEN BEGIN 1 // from:
  SAY ~Wesen Eurer Art sieht man nicht oft in diesem Teil des Unterreichs. Was kann ich für Euch tun?~
  IF ~~ THEN REPLY #47384 /* ~Ich hört doch gewisse Dinge... würde es Euch etwas ausmachen, wenn ich Euch ein paar Fragen stelle?~ */ GOTO 7
  IF ~~ THEN REPLY #47385 /* ~Ich würde gerne Eure Dienste in Anspruch nehmen.~ */ GOTO 8
  IF ~~ THEN REPLY #47386 /* ~Ach nichts. Bin schon wieder weg.~ */ GOTO 9
END

IF ~~ THEN BEGIN 7 // from: 5.1 3.2 0.3
  SAY #47402 /* ~Natürlich macht's mir was aus. Glaubt Ihr eigentlich, ich hätte nichts Besseres zu tun? Wenn ihr Antworten auf Eure blöden Fragen sucht, dann geht doch von mir aus zum Orakel oder sonst wohin, aber lasst mich bloß in Ruhe!~ */
  IF ~~ THEN REPLY #47404 /* ~Ich würde gerne Eure Dienste in Anspruch nehmen.~ */ GOTO 8
  IF ~~ THEN REPLY #47405 /* ~Na, dann geh' ich doch lieber wieder.~ */ GOTO 9
END

IF ~~ THEN BEGIN 8 // from: 7.1 5.2 3.3 0.4
  SAY ~Also, ich weiß zwar nicht, ob jemand wie Ihr unser *klos* verträgt, aber das ist ja nicht mein Problem. Sucht Euch einen Platz.~
  IF ~~ THEN DO ~StartStore("AC#BAR01",LastTalkedToBy())~ EXIT
END

IF ~~ THEN BEGIN 9 // from: 7.2 5.3 3.4 0.5
  SAY #47407 /* ~Richtig. Seht Ihr die kleinen Tränchen, die mir gerade aus den Augen kullern? Die sind für Euch.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 12 // from: 11.0 1.1
  SAY ~Was wollt Ihr wissen?~
  IF ~~ THEN REPLY #47416 /* ~Vergesst es.... wenn ich statt dessen doch Eure Dienste in Anspruch nehmen dürfte?~ */ GOTO 13
  IF ~~ THEN REPLY #47417 /* ~Nein, ich gehe lieber wieder.~ */ GOTO 14
END

IF ~~ THEN BEGIN 13 // from: 17.1 15.1 12.2 11.1 1.2
  SAY  ~Natürlich. Nehmt Platz irgendwo, wo frei ist. Wir haben hier das Beste *auraun* im Unterreich!~
  IF ~~ THEN DO ~StartStore("AC#BAR01",LastTalkedToBy())~ EXIT
END

IF ~~ THEN BEGIN 14 // from: 17.2 15.2 12.3 11.2 1.3
  SAY #47419 /* ~Kommt wieder, wenn Ihr wollt.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN mead_01
  SAY ~Kommt sofort, Ihr Großmäuler!~
  IF ~~ THEN DO ~SetGlobal("AC#Battle_Tales","ACIL54",1)~ EXIT
END

IF ~~ THEN BEGIN more_mead_01
  SAY ~Kommt sofort, Ihr Helden!~
  IF ~~ THEN DO ~SetGlobal("AC#Hero_Story","ACIL54",1)~ EXIT
END

IF ~~ THEN BEGIN more_mead_after_tale
  SAY ~Ha, dieser <PRO_RACE> von der Oberfläche ist gut fürs Geschäft! Bier ist unterwegs, Ihr Prahlbärte!~
  IF ~~ THEN EXIT
END


// ---------------------------------------------
// Renrak Argamek
// ---------------------------------------------

BEGIN AC#BADW1  // Renrak Argamek

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello
SAY ~Mehr Met! Renrak und seine Freunde brauchen Flüssigkeit in der Kehle für ihre Heldengeschichten!~
IF ~~ THEN EXTERN ~AC#BAR01~ mead_01
END

IF ~Global("AC#Battle_Tales","ACIL54",3)~ THEN BEGIN 0
SAY ~Ein hoch auf <CHARNAME>, unseren Helden der Oberfläche!~ // ~Ein hoch auf <CHARNAME>, unseren Helden der Oberfläche!~
IF ~~ THEN EXIT
END

IF ~Global("AC#Battle_Tales","ACIL54",2)~ THEN BEGIN tale01
SAY ~Gesellt Euch ruhig zu uns, <GIRLBOY>, und lauscht den Geschichten ruhmreicher Taten dreier kampferprobter Zwerge!~
IF ~~ THEN EXTERN ~AC#BADW3~ tale02
END

IF ~~ THEN BEGIN PC_no_tale
SAY ~Hab' ich mir doch gedacht, dass bei Euch an der Oberfläche nichts los ist. Wenn Ihr doch was zu erzählen habt, wisst Ihr, wo wir zu finden sind. Nun denn Freunde, derweil saufen wir zu dritt fröhlich weiter!~
  IF ~~ THEN DO ~~ EXIT
END

IF ~~ THEN BEGIN PC_tale_firkraag
SAY ~Ha, <GIRLBOY>, Ihr tragt aber ganz schön dick auf! Ihr wollt einen *DURGARN* erlegt haben, noch dazu einen Roten?~
IF ~~ THEN REPLY ~In der Tat, das habe ich. Es war ein harter Kampf, doch letztendlich standen wir siegreich über der schuppigen Bestie.~ EXTERN ~AC#BADW2~ PC_tale_firkraag_02
END

IF ~~ THEN BEGIN PC_tale_firkraag_03
SAY ~Dann habt Ihr Euch unseren Respekt verdient, <PRO_RACE>! Ein hoch auf <CHARNAME> Drachentöter!~
//IF ~~ THEN REPLY ~Ich habe noch weitere Taten, die ich gerne mit Euch teilen möchte.~ EXTERN ~AC#BADW3~ PC_more_tales
IF ~~ THEN REPLY ~Habt Dank für Eure Worte. Ich werde mich jetzt verabschieden.~ EXTERN ~AC#BADW2~ PC_tales_finished
END

// ---------------------------------------------
// Nalric Dunron
// ---------------------------------------------

BEGIN AC#BADW2  // Nalric Dunron
IF ~Global("AC#Battle_Tales","ACIL54",3)~ THEN BEGIN 0
SAY ~Ein hoch auf <CHARNAME>, unseren Helden der Oberfläche!~ // ~Ein hoch auf <CHARNAME>, unseren Helden der Oberfläche!~
IF ~~ THEN EXIT
END

IF ~Global("AC#Battle_Tales","ACIL54",1)~ THEN BEGIN psst
SAY ~Hört ruhig zu, unser Gefährte Renrak erzählt gerade eine Geschichte seiner Heldentaten!~
IF ~~ THEN EXIT
END

/**************** HIER GEHT ES WEITER ****************************************************/
IF ~~ THEN BEGIN PC_tale_firkraag_02
SAY ~Dem grimmigen Blick in <HISHER> Augen nach zu schließen spricht er die Wahrheit, Renrak. So redet niemand, der nicht schon dem Tod um Haaresbreite entkommen ist.~
IF ~~ THEN DO ~SetGlobal("AC#Hero_Story","ACIL54",3)
IncrementGlobal("AC_Iltkazar_Reputation","GLOBAL",1)
SetGlobal("AC#Story_Firkraag","ACIL54",1)~ EXTERN ~AC#BADW1~ PC_tale_firkraag_03
END

IF ~~ THEN BEGIN PC_tales_finished
SAY ~Ihr habt uns gut unterhalten, <PRO_RACE>. Aber zuhören macht durstig! Noch ein Bier, Dolum!~
IF ~~ THEN DO ~SetGlobal("AC#Battle_Tales","ACIL54",3)~ EXTERN ~AC#BAR01~ more_mead_after_tale
END

// ---------------------------------------------
// Otur Palaad
// ---------------------------------------------

BEGIN AC#BADW3  // Otur Palaad
IF ~Global("AC#Battle_Tales","ACIL54",3)~ THEN BEGIN 0
SAY ~Ein hoch auf <CHARNAME>, unseren Helden der Oberfläche!~ // ~Ein hoch auf <CHARNAME>, unseren Helden der Oberfläche!~
IF ~~ THEN EXIT
END

IF ~Global("AC#Battle_Tales","ACIL54",1)~ THEN BEGIN psst
SAY ~Hört ruhig zu, unser Gefährte Renrak erzählt gerade eine Geschichte seiner Heldentaten!~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN tale02
SAY ~Vielleicht hat dieser <RACE> von der Oberfläche auch schon das ein oder andere Abenteuer erlebt, Freunde! Lasst uns hören, was <HESHE> uns zu erzählen hat!~
=
~Also was ist, <GIRLBOY>, habt Ihr an der Oberfläche eine Tat vollbracht, von er es mit Stolz geschwellter Brust zu berichten gibt?~
IF ~~ THEN REPLY ~Bedaure, meine Taten können sich mit den Euren in keiner Weise messen. Ich werde Euch jetzt verlassen.~ EXTERN ~AC#BADW1~ PC_no_tale
IF ~Dead("firkra02")~ THEN REPLY ~Meine Gefährten und ich haben vor einiger Zeit einen roten Drachen erlegt.~ EXTERN ~AC#BADW1~ PC_tale_firkraag
//IF ~Dead("ShaDra01")~ THEN REPLY ~Ich konnte einmal dem tödlichen Atem eines Schattendrachen widerstehen und ihn niederringen.~ EXTERN ~AC#BADW1~ PC_tale_ShaDra01
//IF ~Dead("TorGal")~ THEN REPLY ~Ich habe einmal eine Festung voller sich regenerierender Trolle gestürmt und deren Anführer getötet.~ EXTERN ~AC#BADW1~ PC_tale_TorGal
//IF ~Dead("UnseeingEye")~ THEN REPLY ~Ich habe in einer Stadt auf der Oberfläche einen Betrachterkult ausgelöscht.~ EXTERN ~AC#BADW1~ PC_tale_UnseeingEye
//IF ~Dead("Ardulace")~ THEN REPLY ~Ich habe in einer Drow-Stadt eine Mutter Oberin durch List und Trug vernichtet.~ EXTERN ~AC#BADW1~ PC_tale_Ardulace
//IF ~GlobalGT("LassalVampires","GLOBAL",2))~ THEN REPLY ~Wir haben ein Vampirlager unter einem Friedhof in meiner Heimat ausgerottet..~ EXTERN ~AC#BADW1~ PC_tale_vampire
//IF ~Dead("hldemi")~ THEN REPLY ~Ein Halbleichnam wollte uns zerstören, doch wir seinem untoten Dasein ein Ende bereitet.~ EXTERN ~AC#BADW1~ PC_tale_UnseeingEye
//IF ~~ THEN REPLY ~Wir haben Durlags Turm von einem Todesritter gesäubert.~ EXTERN ~AC#BADW1~ PC_tale_UnseeingEye
END

//
// ---------------------------------------------
// CHAIN - Long Battletale
// ---------------------------------------------

CHAIN IF WEIGHT #-1 ~Global("AC#Battle_Tales","ACIL54",1)~ THEN AC#BADW1 1
~...und dann renne ich in Richtung der Kampfgeräusche meiner Kameraden, und plötzlich steht dieser verdammte Drow vor mir!~
DO ~SetGlobal("AC#Battle_Tales","ACIL54",2)~
== AC#BADW2 ~Ein Drow?~
== AC#BADW1 ~Ja, ein verfluchter Dunkelelf. Hat mich wohl schon kommen hören, dieser Mistkerl, mit seinen spitzen Ohren. Hat sofort einen seiner Armbrustbolzen auf mich abgeschossen, bevor ich überhaupt Luft holen konnte!~
== AC#BADW3 ~Diese Bolzen lassen einen doch ruckzuck das Bewusstsein verlieren, Renrak, weil sie mit diesem fiesen Drowgift getränkt sind, oder?~
== AC#BADW1 ~Richtig, Otur. Aber ich hatte zum Glück vorher einen der Tränke von Braustein, dem Svirfneblin zu mir genommen, und das Zeug hat mir nicht nur den Tag, sondern auch das Leben gerettet.~
END
IF ~~ THEN REPLY ~(Weiter zuhören.)~ EXTERN ~AC#BADW2~ chain_angeber_02
IF ~~ THEN REPLY ~(Weggehen.)~ EXTERN ~AC#BADW2~ chain_angeber_leave_01

	CHAIN IF ~~ THEN AC#BADW2 chain_angeber_leave_01
	~Los, trinken wir erst einmal eine Runde, bevor die Geschichte weitergeht, Freunde!~
	DO ~SetGlobal("Battle_Tale_Break","ACIL54",1)~ EXIT

	CHAIN IF ~Global("Battle_Tale_Break","ACIL54",1)~ THEN AC#BADW2 chain_angeber_cont_01
	~Wie hast Du das Spitzohr denn dann um die Ecke gebracht, Renrak?~
	END
	IF ~~ THEN DO ~SetGlobal("Battle_Tale_Break","ACIL54",1)~ EXTERN ~AC#BADW1~ chain_angeber_03
	
	CHAIN IF ~Global("Battle_Tale_Break","ACIL54",1)~ THEN AC#BADW3 chain_angeber_cont_01
	~Wie hast Du das Spitzohr denn dann um die Ecke gebracht, Renrak?~
	END
	IF ~~ THEN DO ~SetGlobal("Battle_Tale_Break","ACIL54",1)~ EXTERN ~AC#BADW1~ chain_angeber_03


	CHAIN IF ~Global("Battle_Tale_Break","ACIL54",1)~ THEN AC#BADW1 chain_angeber_cont_01
	~So... wo war ich stehengeblieben? Ach ja, beim Drow.~
	== AC#BADW2 ~Wie hast Du das Spitzohr dann um die Ecke gebracht, Renrak?~
	END
	IF ~~ THEN DO ~SetGlobal("Battle_Tale_Break","ACIL54",1)~ EXTERN ~AC#BADW1~ chain_angeber_03

	CHAIN IF ~~ THEN AC#BADW2 chain_angeber_02
	~Wie hast Du das Spitzohr denn dann um die Ecke gebracht, Renrak?~
	END
	IF ~~ THEN EXTERN ~AC#BADW1~ chain_angeber_03

CHAIN IF ~~ THEN AC#BADW1 chain_angeber_03
~Hab' ihm aus der Entfernung meinen Hammer genau zwischen die roten Augen geworfen. Damit hatte er nicht gerechnet, der Dunkelelf. Er ist kurz zurückgetaumelt, und da war ich dann schon mit meiner Axt über ihm. Er wollte noch sein Kurzschwert ziehen, bevor ich ihm den Arm abgehackt habe, und dann hab ich ihm mit einem zweiten Hieb den Schädel gespalten!~
== AC#BADW2 ~Ein Hoch auf Renrak Argamek, Sohn des Rarak, der ab nun Drowschlächter genannt werden wird!~
== AC#BADW3 ~Ein Hoch auf Renrak Drowschlächter!~
== AC#BADW1 ~Ha! Der Name passt! Hab an dem Tag noch drei weitere der *olven* getötet, das war ein guter Tag für Iltkazar!~
END
IF ~~ THEN REPLY ~(Weiter zuhören.)~ EXTERN ~AC#BADW2~ chain_angeber_05
IF ~~ THEN REPLY ~(Weggehen.)~ EXTERN ~AC#BADW3~ chain_angeber_leave_04

	CHAIN IF ~~ THEN AC#BADW3 chain_angeber_leave_04
	~Ein Prost auf den Drowschlächter! Möge uns nie das Blut unserer Feinde ausgehen!~
	== AC#BADW1 ~Vor allem das Blut der Dunkelelfen - das riecht so gut!~
	DO ~SetGlobal("Battle_Tale_Break","ACIL54",4)~ EXIT

		CHAIN IF ~Global("Battle_Tale_Break","ACIL54",4)~ THEN AC#BADW1 chain_angeber_cont_04
		~So, das war meine Kampfgeschichte, Freunde.~
		END
		IF ~~ THEN DO ~SetGlobal("Battle_Tale_Break","ACIL54",5)~ EXTERN ~AC#BADW2~ chain_angeber_05
		
		CHAIN IF ~Global("Battle_Tale_Break","ACIL54",4)~ THEN AC#BADW3 chain_angeber_cont_04
		~Herrlich, zu saufen und zu prahlen!~
		END
		IF ~~ THEN DO ~SetGlobal("Battle_Tale_Break","ACIL54",5)~ EXTERN ~AC#BADW2~ chain_angeber_05
		
		CHAIN IF ~Global("Battle_Tale_Break","ACIL54",4)~ THEN AC#BADW2 chain_angeber_cont_04
		~Nicht schlecht mit dem Drow, Renrak, nicht schlecht!~
		END
		IF ~~ THEN DO ~SetGlobal("Battle_Tale_Break","ACIL54",5)~ EXTERN ~AC#BADW2~ chain_angeber_05

CHAIN IF ~~ THEN AC#BADW2 chain_angeber_05	
~Das erinnert mich daran, wie ich einmal in den Kazardaern alleine vor einer Horde Grottenschrate stand.~
== AC#BADW3 ~Grottenschrate! Das sind in einer Gruppe ebenbürtige Gegner für einen einzelnen *dwar*!~
== AC#BADW1 ~Wie hast Du die Käferbären denn besiegt, Nalric?~
== AC#BADW2 ~Bin mittenrein gesprungen in die Gruppe, und einer war so verwundert, dass er seinem Kameraden vor Schreck den Kopf abschlug, weil er mich verfehlte. Zwei hab ich mit einem Schildstoss von der Klippe gestoßen, drei andere in einem langen Kampf niedergerungen. Der Anführer wollte abhauen, dem hab ich meine Wurfaxt in die Beine geworfen, dass es ihn von seinen Stiefeln geholt hat. Glaube, er hat noch in seiner fauligen Goblinsprache um Gnade geröchelt, als ich ihm schlussendlich meinen Dolch in den Hals trieb. Glaubt mir, Freunde, ich war so voller Grottenschrat-Blut, dass mich die Wache am Tor der Stadt nicht reinlassen wollte, weil sie mich nicht erkannte. Und mein Weib zuhause war so stolz auf mich, dass ich mich eine ganze Woche nicht waschen durfte!~
== AC#BADW3 ~Auf Nalric Dunron, Sohn des Tarak, den wir Blutbart nennen wollen!~
== AC#BADW1 ~Auf Nalric Blutbart!~
END
IF ~~ THEN REPLY ~(Weiter zuhören.)~ EXTERN ~AC#BADW3~ chain_angeber_06
IF ~~ THEN REPLY ~(Weggehen.)~ EXTERN ~AC#BADW2~ chain_angeber_leave_06

	CHAIN IF ~~ THEN AC#BADW2 chain_angeber_leave_06
	~Ja, das Blut unserer Feinde ist immer ein schöner Anblick. Da bekomme ich mächtig Durst!~
	DO ~SetGlobal("Battle_Tale_Break","ACIL54",6)~ EXIT
	
		CHAIN IF ~Global("Battle_Tale_Break","ACIL54",6)~ THEN AC#BADW1 chain_angeber_cont_06
		~Drow, Grottenschrate... wir sind schon eine mächtig mutige Truppe.~
		END
		IF ~~ THEN DO ~SetGlobal("Battle_Tale_Break","ACIL54",7)~ EXTERN ~AC#BADW3~ chain_angeber_06
		
		CHAIN IF ~Global("Battle_Tale_Break","ACIL54",6)~ THEN AC#BADW2 chain_angeber_cont_06
		~Drow, Grottenschrate... wir sind schon eine mächtig mutige Truppe.~
		END
		IF ~~ THEN DO ~SetGlobal("Battle_Tale_Break","ACIL54",7)~ EXTERN ~AC#BADW3~ chain_angeber_06
		
		CHAIN IF ~Global("Battle_Tale_Break","ACIL54",6)~ THEN AC#BADW3 chain_angeber_cont_06
		~Was für ein Zusammentreffen...~
		END
		IF ~~ THEN DO ~SetGlobal("Battle_Tale_Break","ACIL54",7)~ EXTERN ~AC#BADW3~ chain_angeber_06

CHAIN IF ~~ THEN AC#BADW3 chain_angeber_06 
~So, jetzt bin ich aber mal dran mit meiner Geschichte.~ //third hero-story
== AC#BADW1 ~Lasst mich raten, Ihr habt eine Horde Goblins allein mit Eurem Atem umgebracht? Harharhar!~
== AC#BADW2 ~Otur Todesatem - Harhar!~
== AC#BADW3 ~He, nicht so vorlaut Freunde, hab' auf meiner Axt noch ein paar Scharten frei, um freche Mäuler zu stopfen!~
== AC#BADW1 ~Ist ja gut, Otur, wir haben es nicht so gemeint. Erzählt Eure Heldengeschichte.~
== AC#BADW3 ~Nun gut. Ihr kennt ja diese große Narbe in meinem Gesicht, Freunde.~
== AC#BADW2 ~Ja, hab' mich immer schon gefragt, wer Euch diese zugefügt hat, mein Freund.~
== AC#BADW3 ~Das war ein *caradhak*.~
== AC#BADW1 ~Ein Gedankenschinder?~
== AC#BADW3 ~Korrekt. Ich war mit meiner Einheit vor vielen Herdfeuern im nördlichen Unterreich auf Patrouille, als wir auf eine Gruppe Duergar stießen. Sie schienen eine leichte Beute, und sofort stürzten wir uns in Hoffnung auf einen fairen Kampf auf sie. Als wir die Hälfte erschlagen hatten, traf uns plötzlich eine Welle verwirrender Gedanken, Geräusche und Gefühle wie ein Faustschlag aus dem Nichts.~
== AC#BADW2 ~Der Gedankenschlag eines *caradhak*!~
== AC#BADW3 ~Genau! Ich spürte noch, wie ich meine Axt fallen ließ, und dann überkam mich eine warme, tiefe Gefühllosigkeit. Ich konnte mich nicht mehr rühren! Dann sah ich den *caradhak*. Er nahm den Kopf eines meiner betäubten Gefährten in seine dreifingerigen Hände und stülpte ihm seine Tentakel übers Gesicht. Auch wenn ich mich nicht bewegen konnte, so hatte ich doch all' meine anderen Sinne beisammen, und ich konnte das Geräusch hören, als der Illithid meinem armen Kumpan mit einem Ruck das Gehirn aus dem Schädel riss! Seine Tentakel bewegten sich kurz schmatzend hin und her, und dann ließ er unseren Bruder achtlos zu Boden fallen.~
== AC#BADW1 ~Was ist dann passiert?~
== AC#BADW3 ~Ich konnte in meinem Geiste hören, wie der *caradhak* den überlebenden Duergar befahl, meine anderen Kameraden mitzunehmen, da er sie als Basis für die Umwandlung seiner Larven haben wollte.~
== AC#BADW2 ~Bei Haela! Das gleiche Schicksal, das unserem armen Schüttergeist vom Clan Arnschädel widerfahren ist!~
== AC#BADW1 ~... der aber wieder entkommen konnte! Wo in unserer Stadt lebt der Schüttergeist denn nun?~
== AC#BADW2 ~Ich glaube, sie haben ihn in der Halle der Runensteine eingesperrt, weil sie sich nicht sicher sind, ob er nach ganz bei Sinnen ist.~
== AC#BADW3 ~Ja, er ist in einer Kammer bei Bettargh Abgrundlied unter Beobachtung. Aber jetzt möchte ich mit meiner Geschichte fortahren, ja?~
= ~Also, die Duergar schultern meine betäubten Kameraden und machen sich auf den Weg zurück. Da wendet sich der *caradhak* mit seinem leeren Blick mir zu und streckt die Tentakel nach mir aus.~
== AC#BADW2 ~Bei Moradin!~
== AC#BADW3 ~Ich spürte, wie seine Tentakel in meine Nase glitten und mir das Hirn herausreißen wollten. Glaubt mir, es gibt kein schlimmeres Gefühl in den Reichen! Und ich konnte meine Arme doch nicht bewegen und meine Waffe greifen! Doch aus irgendeinem Grund - Moradin sei Dank - merkte ich, dass ich meine Kiefer noch bewegen konnte! Also tat ich das Einzige, das zu tun ich imstande war...~
= ~Rückartig drehte ich meinen Kopf, um die Tentakel des *caradhak* zwischen meine Zähne zu bekommen, und biss mit aller Macht, die mir Moradin der Allvater in diesem Moment noch ließ, zu. Zu meiner Überraschung waren meine Zähne stark genug, denn ich spürte zwei sich windende Illithiden-Tentakel in meinem Mund, die ich dem Scheusal abgebissen hatte! Mit seinen verbliebenen beiden weiteren fügte mir der *caradhak* meine Wunden im Gesicht zu, doch mein Kampfesgeist war wieder - Clangeddin sei gepriesen - erwacht! Ich konnte meine linke Hand wieder heben, und mit aller macht rammte ich dem Biest meinen Daumen in seine lidlosen Augen!~
== AC#BADW1 ~Was für ein *arglar*!~
== AC#BADW3 ~Nun bekam ich auch meinen rechten Arm frei und konnte dem Illithiden schließlich den Schädel brechen, bevor die zurückeilenden Duergar etwas unternehmen konnten. Entmutigt von meinem Sieg, ergriffen sie rasch die Flucht.~
== AC#BADW2 ~Was für eine Geschichte! Auf Otur Palaad, den Schinderschlächter!~
== AC#BADW1 ~Auf Otur!~
== AC#BADW2 ~So Jungs, ich hab von all den Geschichten reichlich Durst bekommen, lasst uns noch mehr Met leeren. He, Wirt, noch mehr Met für drei durstige *dwar* und ihre Gefährten!~ // drink
END
IF ~~ THEN EXTERN ~AC#BAR01~ more_mead_01



BEGIN ~AC#BAR02~

//Dialog mit Viconia
IF ~Name("Viconia",LastTalkedToBy)~ THEN BEGIN hello_viconia
  SAY ~Leute Eures Schlages bediene ich nicht, Drow. Macht, dass Ihr rauskommt!~
  IF ~~ THEN EXIT
END

IF ~Global("CanaryInn","ACIL54",0)~ THEN BEGIN 0
  SAY ~Seid gegrüßt, Besucher der Oberfläche. Hier im "zwitschernden Kanarienvogel" findet Ihr die feinsten Betten im Unterreich!~
	IF ~~ THEN DO ~SetGlobal("CanaryInn","ACIL54",1)~ GOTO wooden_beds
	END  
  
  IF ~~ THEN BEGIN wooden_beds
	SAY ~Wir haben sogar Betten aus Holz, um es den Gästen, die unsere Steinbetten nicht gewöhnt sind, eine angenehme Steinruhe zu ermöglichen.~
  IF ~~ THEN REPLY ~Die Zwerge hier schlafen auf Steinbetten?~  GOTO stonebed
  IF ~~ THEN REPLY ~Würde es Euch etwas ausmachen, wenn ich Euch ein paar Fragen stelle?~  GOTO 12
  IF ~~ THEN REPLY ~Ich würde gerne Eure Dienste in Anspruch nehmen und mich ein wenig ausruhen.~  GOTO 13
  IF ~~ THEN REPLY #47379 /* ~Ach nichts. Bin schon wieder weg.~ */ GOTO 14
END

IF ~True()~ THEN BEGIN 1
  SAY ~Schön, dass Ihr wieder bei mir vorbeischaut. Was kann ich für Euch tun?~
  IF ~~ THEN REPLY ~Würde es Euch etwas ausmachen, wenn ich Euch ein paar Fragen stelle?~  GOTO 12
  IF ~~ THEN REPLY #47385 /* ~Ich würde gerne Eure Dienste in Anspruch nehmen.~ */ GOTO 8
  IF ~~ THEN REPLY #47386 /* ~Ach nichts. Bin schon wieder weg.~ */ GOTO 9
END

IF ~~ THEN BEGIN stonebed
  SAY  ~Natürlich schlafen wir auf Steinbetten. Holz - oder *vruden*, wie wir Zwerge das Material nennen, ist hier bei uns ein seltener Rohstoff, der schwer zu beschaffen ist, wisst Ihr? Er lässt sich nur schwer ins Unterreich schaffen, und die wenigen Bäume, die hier wachsen, sind sehr wertvoll.~
  IF ~~ THEN REPLY ~Welche Bäume wachsen denn im Unterreich?~  GOTO stonebed02
  IF ~~ THEN REPLY #47404 /* ~Ich würde gerne Eure Dienste in Anspruch nehmen.~ */ GOTO 8
  IF ~~ THEN REPLY #47405 /* ~Na, dann geh' ich doch lieber wieder.~ */ GOTO 9
END

IF ~~ THEN BEGIN stonebed02
  SAY  ~Da müsst Ihr Euch mit Thungalos, unserem Pilzzüchter, unterhalten. Er kennt die ganzen Pflanzen, die bei uns wachsen, besser als ich. Ich kann Euch nur sagen, was gut schmeckt und sich zu gutem Gebräu verarbeiten lässt.~
  IF ~~ THEN REPLY #47404 /* ~Ich würde gerne Eure Dienste in Anspruch nehmen.~ */ GOTO 8
  IF ~~ THEN REPLY #47405 /* ~Na, dann geh' ich doch lieber wieder.~ */ GOTO 9
END

IF ~~ THEN BEGIN 8 // from: 7.1 5.2 3.3 0.4
  SAY ~Ich habe noch einige Betten frei. Sucht Euch einfach ein passendes aus, wir haben Betten jeder Größe und Bequemlichkeit.~
  IF ~~ THEN DO ~StartStore("AC#BAR02",LastTalkedToBy())~ EXIT
END

IF ~~ THEN BEGIN 9 // from: 7.2 5.3 3.4 0.5
  SAY ~Kommt wieder, wenn Ihr müde seid!~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 12 // from: 11.0 1.1
  SAY ~Was wollt Ihr wissen?~
  IF ~~ THEN REPLY ~Die Zwerge hier schlafen auf Steinbetten?~  GOTO stonebed
  IF ~~ THEN REPLY #47416 /* ~Vergesst es.... wenn ich statt dessen doch Eure Dienste in Anspruch nehmen dürfte?~ */ GOTO 13
  IF ~~ THEN REPLY #47417 /* ~Nein, ich gehe lieber wieder.~ */ GOTO 14
END

IF ~~ THEN BEGIN 13 // from: 17.1 15.1 12.2 11.1 1.2
  SAY  ~Natürlich. Nehmt Platz irgendwo, wo frei ist.~
  IF ~~ THEN DO ~StartStore("AC#BAR02",LastTalkedToBy())~ EXIT
END

IF ~~ THEN BEGIN 14 // from: 17.2 15.2 12.3 11.2 1.3
  SAY #47419 /* ~Kommt wieder, wenn Ihr wollt.~ */
  IF ~~ THEN EXIT
END


// Tunnel's end store
BEGIN ~AC#STO02~

IF ~Name("Viconia",LastTalkedToBy)~ THEN BEGIN hello_viconia
  SAY ~Leute Eures Schlages bediene ich nicht, Drow. Macht, dass Ihr rauskommt!~
  IF ~~ THEN EXIT
END

IF ~True()~ THEN BEGIN 0
  SAY ~Seid gegrüßt, <RACE> von der Oberfläche. Leute wie Ihr kommen nicht mehr oft hierher in unsere Stadt. Ich habe in meinem Laden "Das Ende des Tunnels" allerdings einiges an Ausrüstung, was für einen wie Euch von Interesse sein könnte.~
  IF ~~ THEN REPLY ~Lasst mich einen Blick auf Eure Waren werfen.~  DO ~StartStore("AC#STO02",LastTalkedToBy())~ EXIT
  IF ~~ THEN REPLY #26059 /* ~Nichts für mich, danke.~ */ GOTO 1
END

IF ~~ THEN BEGIN 1 // from: 0.1
  SAY #26057 /* ~Ganz wie Ihr wollt.~ */
  IF ~~ THEN EXIT
END



/*******************************************************************************************************
Dialog Pilzsammler Myconid
*******************************************************************************************************/
BEGIN ~AC#ILDW3~

IF ~Global("AC#Myconid","ACIL54",5)~ THEN BEGIN hello_again
SAY ~Da seid Ihr je wieder! Wollt Ihr etwas von meinen Pilzen versuchen?~
IF ~~ THEN
EXIT
END

IF ~Global("AC#Myconid","ACIL54",1)~ THEN BEGIN 1
SAY ~Hilfe! Fremde, helft mir! Ich werde von einem Pilzwesen angegriffen!~
IF ~~ THEN DO ~SetGlobal("AC#Myconid","ACIL54",2)~
EXIT
END

IF ~Global("AC#Myconid","ACIL54",4)~ THEN BEGIN 4
SAY  ~Habt Dank, dass Ihr mir gegen diese Kreatur geholfen habt. Es ist noch nie vorgekommen, dass sich diese Mykoniden derart nah an unsere Stadt heranwagen. Ich verdanke Euch mein Leben.~
++ ~Gern geschehen.~ + 2
++ ~Eigentlich hätte ich statt eines Dankes eher eine Belohnung erwartet. Ist Euch Euer Leben nicht etwas mehr Wert als ein paar hohle Worte?~ + 3
END

	IF ~~ THEN BEGIN 2
	SAY ~Für einen Fremden seid Ihr sehr großzügig. Eigentlich sind wir Bewohner Iltkazars Oberflächenbewohnern gegenüber immer sehr zurückhaltend, aber ich werde jedem erzählen, was für ein großartiger <RACE> Ihr seid!~
	IF ~~ THEN DO ~SetGlobal("AC#Myconid","ACIL54",5)~
	EXIT
	END

	IF ~~ THEN BEGIN 3
	SAY ~Ich habe nicht viel, das ich einem <CLASS> wie Euch geben könnte.~
	IF ~~ THEN DO ~SetGlobal("AC#Myconid","ACIL54",5)~
	EXIT
	END

/*******************************************************************************************************
Dialog Cathor Steinschnitter
*******************************************************************************************************/
BEGIN ~AC#ILDW4~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY ~Cathor Steinschnitter, vom Clan Steinschnitter, zu Euren Diensten. Ihr werdet in Iltkazar niemanden finden, der sich besser mit *glander* auskennt wie der alte Cathor.~
    IF ~~ THEN REPLY ~Was sind "Glander"?~  GOTO glander
  IF ~~ THEN REPLY #26059 /* ~Nichts für mich, danke.~ */ GOTO 1
END

IF ~NumTimesTalkedToGT(0)~ THEN BEGIN 2
  SAY ~Schön, Euch wiederzusehen! Möchtet Ihr meine Schätze begutachten?~
  IF ~~ THEN REPLY ~Gerne! Lasst mich einen Blick auf Eure Waren werfen.~  DO ~StartStore("AC#ILDW4",LastTalkedToBy())~ EXIT
  IF ~Global("AC#BackToSurface","GLOBAL",2)
  !PartyHasItem("AC#SRLAD")~ THEN REPLY ~Ich suche nach einer Strickleiter, mit der ich einen Schacht hinuntersteigen kann. Könnt Ihr mir sagen, wo ich so etwas finde?~  GOTO ladder
  IF ~~ THEN REPLY #26059 /* ~Nichts für mich, danke.~ */ GOTO 1
END

		IF ~~ THEN BEGIN ladder
		SAY ~Mit so etwas kann ich Euch leider nicht weiterhelfen, bedaure.~
		IF ~~ THEN EXIT
		END

	IF ~~ THEN BEGIN glander
	  SAY ~*Glander* sind in der Zwergensprache Edelsteine jeglicher Art, insbesondere die Ungeschliffenen, die unsere Rasse zu den schönsten Kunstwerken verarbeiten kann, die es auf Toril gibt. Möchtet Ihr einige Exemplare sehen?~
	  IF ~~ THEN REPLY ~Ich würde gerne Eure Edelsteine einmal aus der Nähe sehen.~  DO ~StartStore("AC#ILDW4",LastTalkedToBy())~ EXIT
	  IF ~~ THEN REPLY #26059 /* ~Nichts für mich, danke.~ */ GOTO 1
	END

	IF ~~ THEN BEGIN 1 // from: 0.1
	  SAY #26057 /* ~Ganz wie Ihr wollt.~ */
	  IF ~~ THEN EXIT
	END

/*******************************************************************************************************
Dialog Joshiah Steinfreund
*******************************************************************************************************/
BEGIN ~AC#ILHM1~

IF ~RACE(LastTalkedToBy,DWARF)~ THEN BEGIN 3
  SAY ~Ihr müsst der Zwerg von der Oberfläche sein! Seid gegrüßt, <BROTHERSISTER>!~
  IF ~~ THEN REPLY #47378 /* ~Ich würde gerne Eure Dienste in Anspruch nehmen.~ */ GOTO 4
  IF ~~ THEN REPLY #47379 /* ~Ach nichts. Bin schon wieder weg.~ */ GOTO 1
END

IF ~!RACE(LastTalkedToBy,DWARF)~ THEN BEGIN 2 // from:
  SAY ~Seid gegrüßt, <RACE>, was kann ich in meinem bescheidenen Laden Euch heute anbieten?~
  IF ~Global("AC#BackToSurface","GLOBAL",2)
  !PartyHasItem("AC#SRLAD")~ THEN REPLY ~Ich suche nach einer Strickleiter, mit der ich einen Schacht hinuntersteigen kann. Könnt Ihr mir sagen, wo ich so etwas finde?~  GOTO ladder
  IF ~~ THEN REPLY #47385 /* ~Ich würde gerne Eure Dienste in Anspruch nehmen.~ */ GOTO 4
  IF ~~ THEN REPLY #47386 /* ~Ach nichts. Bin schon wieder weg.~ */ GOTO 1
END
		
		IF ~~ THEN BEGIN ladder
		SAY ~Mit so etwas kann ich Euch leider nicht weiterhelfen, bedaure.~
		IF ~~ THEN EXIT
		END

IF ~True()~ THEN BEGIN 0
  SAY ~Seid gegrüßt, <RACE>, was kann ich in meinem bescheidenen Laden Euch heute anbieten?~
  IF ~~ THEN REPLY ~Lasst mich einen Blick auf Eure Waren werfen.~  DO ~StartStore("AC#ILHM1",LastTalkedToBy())~ EXIT
  IF ~~ THEN REPLY #26059 /* ~Nichts für mich, danke.~ */ GOTO 1
END

	IF ~~ THEN BEGIN 1 // from: 0.1
	  SAY #26057 /* ~Ganz wie Ihr wollt.~ */
	  IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN 4
	  SAY ~Sehr gerne! Seht Euch in Ruhe um.~
	  IF ~~ THEN  DO ~StartStore("AC#ILHM1",LastTalkedToBy())~ EXIT
	END

/*******************************************************************************************************
Dialog Brunnenreiniger Fargil
*******************************************************************************************************/
BEGIN ~AC#ILDW5~

IF ~Global("AC#Waterwell","GLOBAL",5)~ THEN BEGIN thank_you
SAY ~Dank Euch hat die Speichenbrunnenzitadelle wieder fließend Wasser!~
IF ~~ THEN REPLY ~Das freut mich. Gehabt Euch wohl.~  GOTO again_exit
IF ~~ THEN REPLY ~Ich müsste noch einmal nach unten gelassen werden.~  GOTO down_again
END

IF ~Global("AC#Waterwell","GLOBAL",4)~ THEN BEGIN hello_job_done
SAY ~Da seid Ihr ja wieder!~
IF ~~ THEN DO ~SetGlobal("Waterwell_repaired","ACIL54",1)~ EXTERN ~AC#ILDW6~ wet_01
END

IF ~Global("AC#Waterwell_wait","ACIL54",1)~ THEN BEGIN hello_again
SAY ~Und? Habt Ihr es Euch anders überlegt und wollt uns jetzt helfen?~
    IF ~~ THEN REPLY ~Nun gut, lasst uns nach unten.~  GOTO down
    IF ~~ THEN REPLY ~Ich muss erst weiter darüber nachdenken.~  GOTO bye_before_well
    IF ~~ THEN REPLY ~Nein.~  GOTO bye_before_well
END

IF ~Global("AC#Waterwell","GLOBAL",0)~ THEN BEGIN 0
SAY ~Verdammt, Nili, der Brunnen klemmt fest!~
IF ~~ THEN EXTERN ~AC#ILDW6~ 01
END

		IF ~~ THEN BEGIN again_exit
		SAY ~Geht am Besten in die Taverne "Blutiges Bollwerk", das Bier schmeckt sicher jetzt schon viel frischer!~
		IF ~~ THEN EXIT
		END

		IF ~~ THEN BEGIN down_again
		SAY ~Na, Ihr seid aber hart im Nehmen! Los, Nili, lasst unseren neuen Freund wieder nach unten!~
		IF ~~ THEN DO ~ClearAllActions()
		StartCutSceneMode()
		StartCutScene("ac#ct54B")~
		EXIT
		END

		IF ~~ THEN BEGIN 2
		SAY ~Seid Ihr verrückt? Womöglich könnten die Gewinde bersten! Jemand muss nach unten gehen und nach dem Rechten sehen.~
		IF ~~ THEN EXTERN ~AC#ILDW6~ 02
		END

		IF ~~ THEN BEGIN 4
		SAY ~Warum denn ich? Nur weil Ihr zu fett seid, muss ich nicht die ganze Drecksarbeit erledigen!~
		IF ~~ THEN EXTERN ~AC#ILDW6~ 03
		END

		IF ~~ THEN BEGIN 5
		SAY ~Wage es ja nicht! Du hast Dir schneller eine eingefangen als Du gucken kannst!~
			IF ~~ THEN REPLY ~Wo ist hier das Problem?~  EXTERN ~AC#ILDW6~ problem
			IF ~~ THEN REPLY ~Dann streitet einmal schön weiter.~  GOTO bye_before_well
		END

		IF ~~ THEN BEGIN 6
		SAY ~Hör zu, Nili, vielleicht kann uns der Fremdling hier ja helfen!~
		=
		~Dieser Brunnen ist verkantet, müsst Ihr wissen. Mit seinen Rädern pumpen wir das Wasser aus dem Zentralschacht wieder zurück in die verschiedenen Speichen dieser Zitadelle, um alle mit frischem Wasser zu versorgen.~
		IF ~~ THEN EXTERN ~AC#ILDW6~ 04
		END

		IF ~~ THEN BEGIN 7
		SAY ~...oder sich zu waschen. Könnte Euch einmal guttun, Nili. Also Fremder, wollt Ihr uns helfen, die Räder wieder in Gang zu bringen?~
			IF ~~ THEN REPLY ~Sicher, was muss ich tun?~  GOTO 8
			IF ~~ THEN REPLY ~Nein.~  GOTO bye_before_well
		END

		IF ~~ THEN BEGIN 8
		SAY ~Wir brauchen einen Freiwilligen, der sich an dem Seil nach unten führen lässt, um die Räder wieder in Gang zu bringen.~
			IF ~~ THEN REPLY ~Es will offensichtlich niemand von Euch beiden diese wichtige Aufgabe übernehmen...~  GOTO 9
			IF ~~ THEN REPLY ~Und Ihr habt mich dazu auserkoren, dieser Freiwillige zu sein?~  GOTO 9
		END

		IF ~~ THEN BEGIN 9
		SAY ~Die beiden Seilwinden müssen von zwei Leuten bedient werden, das hatte mein Partner hier nicht bedacht.~
			IF ~~ THEN REPLY ~Nun gut, lasst uns nach unten.~  GOTO down
			IF ~~ THEN REPLY ~He, Moment! Ich weiß ja gar nicht, was mich dort unten erwartet.~  GOTO dunno
			IF ~~ THEN REPLY ~Vergesst es.~  GOTO bye_before_well
		END

		IF ~~ THEN BEGIN dunno
		SAY ~Also hört mal zu, <RACE>, wenn wir das wüssten, würden wir es selbst machen. Geht Ihr jetzt nach unten oder nicht?~
			IF ~~ THEN REPLY ~Nun gut, lasst uns nach unten.~  GOTO down
			IF ~~ THEN REPLY ~Ich muss erst darüber nachdenken.~  GOTO think_about
		END

		IF ~~ THEN BEGIN go_down_again
		SAY ~Schön, Euch wiederzusehen! Geht Ihr jetzt nach unten oder nicht?~
			IF ~~ THEN REPLY ~Nun gut, lasst uns nach unten.~  GOTO down
			IF ~~ THEN REPLY ~Ich muss erst weiter darüber nachdenken.~  GOTO think_about
			IF ~~ THEN REPLY ~Nein.~  GOTO bye_before_well
		END

		IF ~~ THEN BEGIN think_about
		SAY ~Nun gut, dann werden wir hier noch ein wenig warten und weiter miteinander streiten.~
		IF ~~ THEN DO ~SetGlobal("AC#Waterwell_wait","ACIL54",1)~
		EXIT
		END

		IF ~~ THEN BEGIN down
		SAY ~Eine ausgezeichnete Entscheidung! Los, Nili, lasst unseren neuen Freund hier nach unten!~
		IF ~~ THEN DO ~SetGlobal("AC#Waterwell","GLOBAL",1)~
		EXIT
		END
		
		IF ~~ THEN BEGIN bye_before_well
		SAY ~Hach, warum ist das hier alles so fürchterlich kompliziert?~
		IF ~~ THEN EXIT
		END

IF ~~ THEN BEGIN done_is_done
SAY ~Naja, wenigstens dreht sich das Rad wieder! Danke für Eure Hilfe, <RACE>! Ihr seid gar nicht so übel für einen Oberflächenbewohner!~
IF ~~ THEN DO ~SetGlobal("AC#Waterwell","GLOBAL",5)~
EXIT
END

/*******************************************************************************************************
Dialog Brunnenreiniger Nili
*******************************************************************************************************/

BEGIN ~AC#ILDW6~

IF ~Global("AC#Waterwell","GLOBAL",5)~ THEN BEGIN thank_you_02
SAY ~Dank Euch hat die Speichenbrunnenzitadelle wieder fließend Wasser!~
IF ~~ THEN EXIT
END

IF ~Global("AC#Waterwell","GLOBAL",4)~ THEN BEGIN hello_job_done_02
SAY ~Da seid Ihr ja wieder!~
IF ~~ THEN GOTO wet_01
END

IF ~Global("AC#Waterwell_wait","ACIL54",1)~ THEN BEGIN hello_again_02
SAY ~Sieh einmal, Fargil, die Fremden von der Oberfläche sind wieder da!~
IF ~~ THEN EXTERN ~AC#ILDW5~ go_down_again
END

IF ~Global("AC#Waterwell","GLOBAL",0)~ THEN BEGIN 0
SAY ~Der Brunnen klemmt fest! Ihr müsst stärker drehen, damit sich die Räder wieder lösen!~
IF ~~ THEN EXTERN ~AC#ILDW5~ 2
END

IF ~~ THEN BEGIN wet_01
SAY ~Und Ihr seid ja ganz nass! Was ist denn mit Euch passiert, bei Sharindlar!~
    IF ~~ THEN REPLY ~Ich bin in Eurem Brunnen einem Monster begegnet.~  EXTERN ~AC#ILDW5~ done_is_done
END

IF ~~ THEN BEGIN 01
SAY ~Das merke ich auch, Fargil! Ihr müsst stärker drehen, damit sich die Räder wieder lösen!~
IF ~~ THEN EXTERN ~AC#ILDW5~ 2
END

IF ~~ THEN BEGIN 02
SAY ~Das ist eine gute Idee! Haltet Euch am Seil fest, ich lasse Euch nach unten!~
IF ~~ THEN EXTERN ~AC#ILDW5~ 4
END

IF ~~ THEN BEGIN 03
SAY ~Verdammt, Fargil, Du bist so ein *jargh*! Pass auf, gleich werfe ich Dich einfach so herunter!~
IF ~~ THEN EXTERN ~AC#ILDW5~ 5
END

IF ~~ THEN BEGIN problem
SAY ~Das Problem, <RACE>, ist, dass ich jeden Tag mit einem völligen Idioten zusammenarbeiten muss!~
IF ~~ THEN EXTERN ~AC#ILDW5~ 6
END

IF ~~ THEN BEGIN 04
SAY ~Keine, Pumpe, kein frisches Wasser, um Met zu brauen, Bier zu strecken, Pilzspiritus zu brennen und all die Dinge...~
IF ~~ THEN EXTERN ~AC#ILDW5~ 7
END

/*******************************************************************************************************
Dialog Thifthic Gurarr
*******************************************************************************************************/
BEGIN ~AC#ILME2~

IF ~Name("Viconia",LastTalkedToBy)~ THEN BEGIN hello_viconia
  SAY ~Leute Eures Schlages bediene ich nicht, Drow. Macht, dass Ihr rauskommt!~
  IF ~~ THEN EXIT
END

IF ~True()~ THEN BEGIN 0
  SAY ~Delvars Ausrüstungen! Alles zum Graben, Meißeln, Schürfen! Schaufeln, Spitzhacken, Grubenlampen! Was kann Thifthic heute für Euch tun?~
  IF ~~ THEN REPLY ~Warum verkauft Ihr all diese Dinge hier?~  GOTO 2
  IF ~Global("AC#Fruntuck","GLOBAL",1)
  Global("AcquiredLadder","ACIL54",0)~ THEN REPLY ~Ich suche nach einer Strickleiter, mit der ich einen Schacht hinuntersteigen kann. Könnt Ihr mir sagen, wo ich so etwas finde?~  GOTO ladder
  IF ~~ THEN REPLY #47378 /* ~Ich würde gerne Eure Dienste in Anspruch nehmen.~ */ GOTO 4
  IF ~~ THEN REPLY #47379 /* ~Ach nichts. Bin schon wieder weg.~ */ GOTO 1
END

	IF ~~ THEN BEGIN ladder
	SAY ~Eine Strickleiter? Klar habe ich so etwas! Es ist aber die Letzte. Beldas hat eine bei mir gekauft, bevor er an die Oberfläche aufgebrochen ist. Hat ihm leider nicht viel Glück gebracht, die Leiter.~
    IF ~~ THEN GOTO buy_ladder
    IF ~GlobalGT("AC#Pickaxe","GLOBAL",1)~ THEN GOTO give_ladder
	END
	
		IF ~~ THEN BEGIN give_ladder
		SAY ~Wisst Ihr was? Ihr seid ein feiner <PRO_RACE>. Ihr habt doch Dhundala Ihre Hacke gebracht. Ich schenke Euch die beste Leiter, die es in Iltkazar gibt. Sie ist leicht und lässt sich bis auf 300 Fuß auseinanderklappen!~
		IF ~~ THEN  DO ~SetGlobal("AcquiredLadder","ACIL54",1)
		GiveItemCreate("AC#SRLAD",LastTalkedToBy,0,0,0)
		EraseJournalEntry(@64201)
		AddJournalEntry(@64203,QUEST)~ EXIT
		END
		
		IF ~~ THEN BEGIN buy_ladder
		SAY ~Das macht 100 Goldmünzen.~
		IF ~PartyGoldLT(100)~ THEN REPLY ~Soviel Gold habe ich nicht.~  GOTO have_no_gold
		IF ~PartyGoldGT(99)~ THEN REPLY ~Hier ist das Gold.~  GOTO buy_ladder_02
		END
		
			IF ~~ THEN BEGIN buy_ladder_02
			SAY ~Gut, hier ist Eure Leiter. geht sorgsam damit um, Ihr werdet kein besseres Exemplar mehr in ganz Iltkazar finden!~
			IF ~~ THEN  DO ~TakePartyGold(100)
			SetGlobal("AcquiredLadder","ACIL54",1)
			GiveItemCreate("AC#SRLAD",LastTalkedToBy,0,0,0)
			EraseJournalEntry(@64201)
			AddJournalEntry(@64203,QUEST)~ EXIT
			END
			
			IF ~~ THEN BEGIN have_no_gold
			SAY ~Tja, kein Gold, nix zu klettern. Ich reserviere sie aber für Euch, bis Ihr das Gold zusammenhabt, versprochen!~
			IF ~~ THEN EXIT
			END

IF ~~ THEN BEGIN 2
SAY ~Es gibt ein altes Zwergensprichwort, das in Eure Sprache übersetzt soviel bedeutet wie "Man findet kein Gold, indem man nur am Felsen leckt." Deshalb habe ich hier alles, was ein *delvar* für seine Arbeit benötigt.~
    IF ~~ THEN REPLY ~Was ist ein "Delvar"?~  GOTO 3
END

IF ~~ THEN BEGIN 3
  SAY ~Die *delvar* sind bei uns Zwergen die Tunnelbauer, Edelsteinschürfer und Erzklopfer, die in einer großen Gilde organisiert sind. Ihr findet unsere Gildenräume im Heiligtum Dumathoins im Osten der Stadt, denn der Hüter der Geheimnisse unter dem Berg ist unser Schutzpatron. Wenn es für Euch von Interesse ist, seht dort einmal vorbei, denn meine *saman* haben viel zu erzählen.~
// IF ~~ THEN GOTO joboffer02 // hier möchte Thifthic die Hacke seiner Ahnen aus den Spinnenschächten gerettet haben
IF ~GlobalGT("AC#Pickaxe","GLOBAL",0)~ THEN GOTO sale
IF ~Global("AC#Pickaxe","GLOBAL",0)~ THEN GOTO joboffer01 // hier möchte Thifthic eine Spitzhacke zu den Delvern im Tempel Dumathoins überbracht haben
END

IF ~~ THEN BEGIN joboffer01
SAY ~Also ehrlich gesagt könntet Ihr mir, wenn Ihr Euch so für die *delvar* interessiert, einen Gefallen tun.~
    IF ~~ THEN REPLY ~Tut mir leid, kein Interesse.~  GOTO no_interest
    IF ~~ THEN REPLY ~Was müsste ich für Euch tun?~  GOTO yes_interest
END

IF ~~ THEN BEGIN yes_interest
SAY ~Ich habe hier eine Spitzhacke, die ich einem der *delvar* noch vorbeibringen müsste. Allerdings warte ich noch auf einen anderen meiner Kunden. Wärt Ihr so freundlich und würdet die Hacke für mich in Dumathoins Tempel, der Halle der Omlare, überbringen?~
    IF ~~ THEN REPLY ~Tut mir leid, kein Interesse.~  GOTO no_interest
    IF ~~ THEN REPLY ~Gut, in Ordnung. Wem soll ich sie bringen?~  GOTO job01_accepted
END

IF ~~ THEN BEGIN job01_accepted
  SAY ~Danke Euch! Hier ist die Hacke. Passt auf, dass Ihr Euch damit nicht ins Bein hackt. Bringt sie zu Dhundala zur Delvarsgilde in der Halle der Omlare, etwas weiter nordöstlich von hier.~
  IF ~~ THEN  DO ~SetGlobal("AC#Pickaxe","GLOBAL",1)
GiveItemCreate("AC#SRPAX",LastTalkedToBy,0,0,0)
AddJournalEntry(@54601,QUEST)~ EXIT
END

IF ~~ THEN BEGIN no_interest
  SAY ~War nur eine Frage. Und ehrlich gesagt weiß ich selbst nicht genau, ob ein Oberflächenbewohner wie Ihr mit den Dingen, die ich anbiete, etwas anfangen kann. Wollt Ihr dennoch einen Blick auf meine Waren werfen?~
  IF ~~ THEN REPLY #47378 /* ~Ich würde gerne Eure Dienste in Anspruch nehmen.~ */ GOTO 4
  IF ~~ THEN REPLY #47379 /* ~Ach nichts. Bin schon wieder weg.~ */ GOTO 1
END

IF ~~ THEN BEGIN sale
  SAY ~Aber ehrlich gesagt weiß ich selbst nicht genau, ob ein Oberflächenbewohner wie Ihr mit den Dingen, die ich anbiete, etwas anfangen kann. Wollt Ihr dennoch einen Blick auf meine Waren werfen?~
  IF ~~ THEN REPLY #47378 /* ~Ich würde gerne Eure Dienste in Anspruch nehmen.~ */ GOTO 4
  IF ~~ THEN REPLY #47379 /* ~Ach nichts. Bin schon wieder weg.~ */ GOTO 1
END

IF ~~ THEN BEGIN 1 // from: 0.1
  SAY #26057 /* ~Ganz wie Ihr wollt.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 4
  SAY ~Sehr gerne! Seht Euch in Ruhe um.~
  IF ~~ THEN  DO ~StartStore("AC#ILME2",LastTalkedToBy())~ EXIT
END

/*******************************************************************************************************
Dialog Danko Felsenbrand
*******************************************************************************************************/
BEGIN ~AC#ILDW7~

IF ~True()~ THEN BEGIN 0
  SAY ~Heda, wer stört mich hier schon wieder beim Bierbrauen? Hier gibt's nix für Euch, schon gar nicht für einen Oberflächen-<RACE> mit so wenig Bartwuchs!~
  IF ~~ THEN REPLY ~Ihr braut Bier hier?~  GOTO 2
  IF ~~ THEN REPLY #47379 /* ~Ach nichts. Bin schon wieder weg.~ */ GOTO 1
END

IF ~~ THEN BEGIN 2
SAY ~Jau, und wenn Ihr davon was probieren wollt, dann geht gefälligst ins "Blutige Bollwerk" oder den "Zwitschernden Kanarienvogel" und zahlt anständig dafür! Immer kommen alle zu dem alten Danko und wollen "nur einmal kosten" und schwups ist die ganze Maische des Vortages im Eimer!~
    IF ~~ THEN REPLY ~Keine Angst, ich möchte nichts probieren, mich interessiert nur, woraus Ihr hier Euer Bier braut.~  GOTO 3
  IF ~~ THEN REPLY #47379 /* ~Ach nichts. Bin schon wieder weg.~ */ GOTO 1
END

IF ~~ THEN BEGIN 3
  SAY ~Na wenn das so ist will Euch mal aufklären, Ziegenmilchtrinker. Die Zutaten sind wie überall im Unterreich die gleichen- Pilze der verschiedensten Sorten, je nachdem, ob man eher helles oder dunkles Bier brauen möchte. Es kommt eher auf die Erfahrung und die richtige Mischung an, um ein wohlschmeckendes Aroma hinzubekommen.~
    IF ~~ THEN REPLY ~Ihr nehmt also keinen Weizen, Hopfen oder Gerste wie bei uns an der Oberfläche?~  GOTO 4
  IF ~~ THEN REPLY  ~Mehr wollte ich gar nicht wissen. Bin schon wieder weg.~  GOTO 1
END

IF ~~ THEN BEGIN 4
  SAY ~Mit so miesem Zeug braut Ihr an der Oberfläche Euer Bier? Kein Wunder, dass Euch kein gescheiter Bart wächst, <GIRLBOY>!~
  IF ~~ THEN REPLY  ~Mehr wollte ich gar nicht wissen. Bin schon wieder weg.~  GOTO 1
END

IF ~~ THEN BEGIN 1 // from: 0.1
  SAY  ~Macht das. Und wehe, es fehlt ein Tropfen aus einem meiner Fässer!~
  IF ~~ THEN EXIT
END

/*******************************************************************************************************
Dialog Ebermeister Ligar
*******************************************************************************************************/
BEGIN ~AC#ILDW8~

IF ~Global("AC#Boar","ACIL54",6)~ THEN BEGIN hello_again
SAY ~Nochmals vielen Dank, dass Ihr diese wilde Sau erlegt habt. Gar nicht auszudenken, was so ein wildgewordenes Vieh alles für Unheil anrichten könnte.~
IF ~~ THEN
EXIT
END

IF ~Global("AC#Boar","ACIL54",1)~ THEN BEGIN 1
SAY ~Vorsicht alle Mann! Die wilde Sau ist los!~
IF ~~ THEN REPLY  ~Wilde Sau?~ GOTO wild_boar
IF ~~ THEN REPLY  ~Ach Du dickes Schwein!~ GOTO wild_boar
IF ~~ THEN REPLY  ~Kein Sorge - ich bin schon mit schwierigeren Widersachern fertig geworden.~ GOTO wild_boar
END

	IF ~~ THEN BEGIN wild_boar
	SAY ~Ich kann sie nicht mehr halten! Nehmt Euch in Acht!~
	IF ~~ THEN EXIT
	END

IF ~Global("AC#Boar","ACIL54",4)~ THEN BEGIN 4
SAY  ~Ein guter Schlag, Respekt. Ihr versteht etwas vom Töten, <RACE>.~
++ ~Eigentlich habe ich mich mehr aufs Erschlagen von Monstern spezialisiert und schlachte seltener Haustiere.~ + 2
++ ~Ihr haltet hier unten recht große Schweine.~ + 2
END

	IF ~~ THEN BEGIN 2
	SAY ~Oh, das Viehzeug ist alles andere als leicht zu erledigen, müsst Ihr wissen. Wir nutzen es hier zwar für Fleisch, Fell und Milch, aber die Krieger in der Bronzemaske haben eine eigene Kavallerieeinheit mit speziell gezüchteten Tiefenebern.~
	IF ~~ THEN DO ~SetGlobal("AC#Boar","ACIL54",5)~ GOTO 3
	END

		IF ~~ THEN BEGIN 3
		SAY ~Aber jetzt ist ja alles wieder im Reinen. Vielleicht sieht man sich mal wieder. Ich werde jetzt mal die Sau ausweiden, für ein gutes Stück Fleisch im zwitschernden Kanarielvogel ist das allemal Wert!~
		IF ~~ THEN
		EXIT
		END

/*******************************************************************************************************
Dialog Snorri, der Rothézüchter
*******************************************************************************************************/
BEGIN ~AC#ILDW9~

IF ~Global("RotheAttack","ACIL54",20)~ THEN BEGIN hello_sigh
SAY ~*Seufz*.~
IF ~~ THEN REPLY ~Wie dem auch sei. Ich ziehe weiter.~ GOTO borug_attacked_exit
IF ~PartyHasItem("MISC42")~ THEN REPLY  ~Ihr könntet Eurer Frau vielleicht doch diesen Diamanten hier schenken.~ GOTO give_diamond
END

IF ~Global("RotheAttack","ACIL54",10)~ THEN BEGIN saved_my_life
SAY ~Puh, das war ja vielleicht knapp! Um ein Haar hätte mich Borug umgebracht!~
IF ~~ THEN REPLY  ~Der Trank hat ihn anscheinend ziemlich aggressiv gemacht.~ GOTO borug_attacked_01
END

	IF ~~ THEN BEGIN borug_attacked_01
	SAY ~Ja. Und ich habe keinen Zuchtbullen mehr. Wie erkläre ich das alles meiner Hilfilda?~
	IF ~~ THEN REPLY  ~Das ist nicht mehr mein Problem. Gehabt Euch wohl.~ GOTO borug_attacked_exit
	IF ~PartyHasItem("MISC42")~ THEN REPLY  ~Ihr könntet Eurer Frau vielleicht doch diesen Diamanten hier schenken.~ GOTO give_diamond
	END
	
		IF ~~ THEN BEGIN give_diamond
		SAY ~Hmm. Meint Ihr, sie würde den Diamanten mehr schätzen als die Tiefenrothé?~
		IF ~~ THEN REPLY  ~Auf der Oberfläche gibt es Frauen, die einen Edelstein einem Rothé in jedem Falle vorziehen würden.~ GOTO give_diamond_02
		IF ~~ THEN REPLY  ~Ich kenne Eure Frau nicht, aber es wäre einen Versuch wert.~ GOTO give_diamond_02
		IF ~~ THEN REPLY  ~Ihr habt Recht. Das war eine dumme Idee.~ GOTO borug_attacked_exit
		END
		
			IF ~~ THEN BEGIN give_diamond_02
			SAY ~Und Ihr würdet mir den Diamanten wieder zurückgeben und auf Eure Belohnung verzichten?~
			IF ~~ THEN REPLY ~Ja, nehmt ihn schon.~ GOTO yes_give_diamond
			IF ~~ THEN REPLY ~Offen gesagt - nein.~ GOTO not_give_diamond			
			END
			
				IF ~~ THEN BEGIN yes_give_diamond
				SAY ~Ich danke Euch. Das wird zwar nur ein schwacher Trost sein, aber immerhin besser als gar nichts!~
				IF ~~ THEN DO ~SetGlobal("RotheAttack","ACIL54",20)
				TakePartyItemNum("MISC42",1)~ GOTO diamoned_given_bye_leave
				END
				
					IF ~~ THEN BEGIN diamoned_given_bye_leave
					SAY ~Ihr seid gar nicht mal so verkehrt, wisst Ihr? Ich werde jetzt einmal meine Frau besuchen. Ich hoffe, das wird weniger aufregend als der Angriff meines eigenen Rothé-Bullen...~
					IF ~~ THEN DO ~EscapeArea()~ EXIT 
					END
				
				IF ~~ THEN BEGIN not_give_diamond
				SAY ~Ich kann Euch verstehen. Naja, sei's drum, damit muss ich wohl jetzt irgendwie klarkommen.~
				IF ~~ THEN  GOTO borug_attacked_exit
				END
	
		IF ~~ THEN BEGIN borug_attacked_exit
		SAY ~*Seufz*~
		IF ~~ THEN DO  ~SetGlobal("RotheAttack","ACIL54",20)~ EXIT
		END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello
SAY ~Kennt Ihr das Gefühl, wenn Ihr nach vielen Jahren der Ehe keine Lust mehr habt, das Bett miteinander zu teilen?~
IF ~~ THEN REPLY  ~Bitte was?~ GOTO rothe_story_01
IF ~~ THEN REPLY  ~Nein, das Gefühl kenne ich nicht.~ GOTO rothe_story_01
IF ~~ THEN REPLY  ~Für so etwas habe ich keine Zeit.~ GOTO rothe_story_bye
END

	IF ~~ THEN BEGIN rothe_story_bye
	SAY ~Da könnt Ihr Euch glücklich schätzen, <PRO_RACE>.~
	IF ~~ THEN EXIT
	END

IF ~Global("AC#RotheQuest","GLOBAL",2)~ THEN BEGIN wait_for_drug
SAY ~Und, habt Ihr schon mit Chiksul gesprochen?~
IF ~~ THEN REPLY  ~Nein, noch nicht.~ GOTO still_wait_for_drug
IF ~PartyHasItem("POTN28")~ THEN REPLY  ~Ich habe hier einen Trank der Lebenskraft, wollt Ihr es einmal damit versuchen?~ GOTO has_potion
IF ~NumItemsPartyGT("POTN28",9)~ THEN REPLY  ~Zehn Tränke der Lebenskraft könnten das Feuer in Eurem Rothé wieder neu entfachen.~ GOTO have_many_potions
END

IF ~Global("AC#RotheQuest","GLOBAL",1)~ THEN BEGIN hello_again
SAY ~Oh, Ihr schon wieder. Borug und Bula bewegen sich nicht von der Stelle.~
IF ~~ THEN REPLY  ~Also mit so etwas möchte ich mich nun wirklich nicht befassen.~ GOTO skip_rothe_story
IF ~~ THEN REPLY  ~Kann ich Euch bei Euren Nachwuchssorgen irgendwie helfen?~ GOTO begin_rothe_quest
END

IF ~~ THEN BEGIN rothe_story_01
SAY ~Wenn Euch das Gefühl beschleicht, Euer Partner begehrt Euch nicht mehr und Euch macht es noch nicht einmal etwas aus?~
IF ~~ THEN REPLY  ~Das klingt ja furchtbar! Wie ist es in Eurer Ehe dazu gekommen?~ GOTO rothe_story_02
END

IF ~~ THEN BEGIN rothe_story_02
SAY ~Oh nein, bei mir und meiner Hilfilda läuft alles Bestens. Mir macht aber mein Borug mit seiner Bula Sorgen.~
=
~Einst waren sie der Stolz meiner Zucht, aber seit sie in die Jahre gekommen sind, hat sich ihr Liebesfeuer abgeschwächt und mein Rothé-Nachwuchs gerät ins Stocken.~
IF ~~ THEN REPLY  ~Ihr meint diese haarigen Kühe da?~ GOTO rothe_story_03
END

IF ~~ THEN BEGIN rothe_story_03
SAY ~Ja, die Rothé. Einst konnten wir sie draußen vor der Stadt grasen lassen, aber seit die Feinde vor Iltkazar so zahlreich sind, lassen wir sie lieber hier unten, was sich nicht gut mit ihrem Paarungsverhalten verträgt.~
IF ~~ THEN REPLY  ~Also mit so etwas möchte ich mich nun wirklich nicht befassen.~ GOTO skip_rothe_story
IF ~~ THEN REPLY  ~Wozu benötigt Ihr die Rothé?~ GOTO why_rothe
END

IF ~~ THEN BEGIN still_wait_for_drug
SAY ~Wie Ihr meint. Aber macht die Tiere mit Eurer Anwesenheit nicht noch zusätzlich nervös, ja?~
IF ~~ THEN DO ~~ EXIT
END

IF ~~ THEN BEGIN skip_rothe_story
SAY ~Wie Ihr meint. Aber macht die Tiere mit Eurer Anwesenheit nicht noch zusätzlich nervös, ja?~
IF ~~ THEN DO ~SetGlobal("AC#RotheQuest","GLOBAL",1)~
EXIT
END

IF ~~ THEN BEGIN why_rothe
SAY ~Für sehr viel. Fleisch, Milch, Fell, als Antrieb für Mühlen - ohne die Tiere wäre das Leben in Iltkazar ziemlich öde, versteht Ihr?~
IF ~~ THEN REPLY  ~Also mit so etwas möchte ich mich nun wirklich nicht befassen.~ GOTO skip_rothe_story
IF ~~ THEN REPLY  ~Kann ich Euch bei Euren Nachwuchssorgen irgendwie helfen?~ GOTO begin_rothe_quest
IF ~~ THEN REPLY  ~Was müsste man tun, um das Feuer der Liebe wieder in Euren Kühen zu entfachen?~ GOTO begin_rothe_quest
END

IF ~~ THEN BEGIN begin_rothe_quest
SAY ~Ich habe schon so ziemlich alles versucht. Viel Bewegung, sie frei laufen lassen, wärmende Bäder...~
=
~Unser Gnomen-Alchemist will mir nicht helfen, weil er der Meinung ist, dass seine Tränke nicht für Tiere geschaffen sind. Pah! Wahrscheinlich hat er nur Angst, dass dann ganz Iltkazar mit solchen Problemen zu ihm kommen könnte.~
IF ~~ THEN REPLY  ~Er hat gute Gründe. Ich muss jetzt weiter.~ GOTO skip_rothe_story
IF ~~ THEN REPLY  ~Ich könnte ja einmal versuchen, mit Eurem Alchemisten zu reden.~ GOTO talk_to_alchemist
IF ~PartyHasItem("POTN28")~ THEN REPLY  ~Ich habe hier einen Trank der Lebenskraft, wollt Ihr es einmal damit versuchen?~ GOTO has_potion
END

IF ~~ THEN BEGIN has_potion
SAY ~Das ist zwar eine gute Idee, aber die Wirkung ist für so einen kräftigen Rothé-Bullen viel zu niedrig.~
IF ~NumItemsPartyLT("POTN28",10)~ THEN REPLY  ~Also sollte ich wohl doch besser den Alchemisten aufsuchen.~ GOTO talk_to_alchemist_02
IF ~NumItemsPartyGT("POTN28",9)~ THEN REPLY  ~Ich habe aber ganz schön viele dieser Tränke bei mir.~ GOTO have_many_potions
END

IF ~~ THEN BEGIN have_many_potions
SAY ~Oh, mit so vielen Tränken könnte es vielleicht funktionieren, ja! Ich gebe Euch einen Diamanten für diese Tränke.~
IF ~~ THEN REPLY  ~In Ordnung, hier sind die Tränke.~ DO ~TakePartyItemNum("POTN28",10)~ GOTO give_potions
IF ~Global("ChiksulRothe","ACIL54",1)~ THEN REPLY  ~Chiksul meinte, diese Tränke könnten Euren Bullen gefährlich aggressiv machen.~ GOTO chiksul_dangerous
END

	IF ~~ THEN BEGIN chiksul_dangerous
	SAY ~Ach, Unsinn. Ich kenne meinen Borug schon so lange, der kann keiner Fledermaus etwas zuleide tun!~
	IF ~~ THEN REPLY  ~In Ordnung, hier sind die Tränke.~ DO ~TakePartyItemNum("POTN28",10)~ GOTO give_potions
	IF ~~ THEN REPLY  ~Ich wollte es nur gesagt haben.~ DO ~TakePartyItemNum("POTN28",10)~ GOTO give_potions
	END

IF ~~ THEN BEGIN give_potions
SAY ~Danke, das ist sehr nett von Euch! Hier ist der Diamant. Den wollte ich eigentlich meiner Hilfilda schenken, aber die Rothé sind nun einmal wichtiger! Das wird sie sicher verstehen.~
IF ~~ THEN DO ~SetGlobal("AC#RotheQuest","GLOBAL",10)
GiveItemCreate("MISC42",Player1,1,0,0)
EraseJournalEntry(@54200)
AddJournalEntry(@54210,QUEST_DONE)~
+ give_borug_potn28
END

	IF ~~ THEN BEGIN give_borug_potn28
	SAY ~Hier, ich werde meinem Borug gleich diese Tränke einfößen. Wäre doch gelacht, wenn er nicht gleich ein wenig... aktiver werden würde!~
	IF ~~ THEN DO ~SetGlobal("RotheAttack","ACIL54",1)
	EraseJournalEntry(@54200)~ EXIT
	END

IF ~~ THEN BEGIN talk_to_alchemist
SAY ~Hey, das ist ja mal eine gute Idee! Aber erwähnt auf keinen Fall, dass das Gebräu, das er herstellen soll, für meine Rothé ist! Er würde es Euch bestimmt nicht geben.~
IF ~~ THEN REPLY  ~Da müsst Ihr Euch jemand anderen suchen.~ GOTO skip_rothe_story
IF ~~ THEN REPLY  ~Gut, ich werde mit dem Alchemisten reden.~ GOTO talk_to_alchemist_02
END

IF ~~ THEN BEGIN talk_to_alchemist_02
SAY ~Das würdet Ihr für Borug tun? Ist ja mal endlich wieder eine erfreuliche Sache in dieser Stadt! Er heißt Chiksul und ist gleich gegenüber, den Gang nach Osten herunter. Eigentlich eine Schande, dass er mir nicht helfen will, wo wir doch fast Nachbarn sind! Aber jetzt habe ich ja Euch. Habt schon einmal vielen Dank, Fremde!~
IF ~~ THEN DO ~SetGlobal("AC#RotheQuest","GLOBAL",2)
AddJournalEntry(@54200,QUEST)~
EXIT
END

IF ~True()~ THEN BEGIN hello_0
SAY ~Kennt Ihr das Gefühl, wenn Ihr nach vielen Jahren der Ehe keine Lust mehr habt, das Bett miteinander zu teilen?~
IF ~~ THEN REPLY  ~Bitte was?~ GOTO rothe_story_01
IF ~~ THEN REPLY  ~Für so etwas habe ich keine Zeit.~ GOTO rothe_story_bye
END

/*******************************************************************************************************
Dialog Hamli, der Rattenfänger
*******************************************************************************************************/
BEGIN ~AC#ILBEE~

BEGIN ~AC#ILHA1~

IF ~Global("AC#Catch_the_rat","ACIL54",3)~ THEN BEGIN has_rattail
SAY ~Habt Ihr die Rattenschwänze zusammen?~
IF ~NumItemsPartyLT("AC#RATTL",10)~ THEN REPLY  ~Nein, ich bin noch auf der Suche.~ GOTO wait_for_tail
IF ~NumItemsPartyGT("AC#RATTL",9)~ THEN REPLY  ~Ja, seht her - hier sind sie.~ GOTO have_10_tails
IF ~~ THEN REPLY ~Komme bald zurück.~ + wait_for_tail
END

	IF ~~ THEN BEGIN wait_for_tail
	SAY ~Na, das hat ja auch etwas Gutes. Wär ja schlimm, wenn Ihr an jeder Ecke eine Ratte finden würdet. Ihr wisst, wo Ihr mich findet, wenn Ihr die Rattenschwänze zusammenhabt!~
	IF ~~ THEN EXIT
	END
	
//_Questende	
	IF ~~ THEN BEGIN have_10_tails
	SAY ~Lasst mal sehen...~
	IF ~~ THEN DO ~TakePartyItemNum("AC#RATTL",10)~ GOTO chew01
	END
	
		IF ~~ THEN BEGIN chew01
		SAY ~Das sieht gut aus! Einer davon ist für mich...~
		=
		~*Schmatz*, gnah, gnn, grrn, hrrm...~
		=
		~*Schluck*. Mmh, schmeckt gar nicht mal so übel!~
		IF ~~ THEN DO ~~ GOTO job_done
		END
		
			IF ~~THEN BEGIN job_done
			SAY ~Danke für Eure Hilfe, <RACE>. Hier ist Eure Belohnung. Ein Helm aus meiner Ahnentruhe. Ihr könnt ihn mehr gebrauchen als ich. Ihr seid gar nicht so verkehrt! Und werde ich den Käfern einmal beibringen, was für eine Delikatesse unsere Ratten hier mit sich herumtragen! Nur noch einen werde ich mir selbst gönnen...*mmm*~
			IF ~~ THEN DO ~SetGlobal("AC#Catch_the_rat","ACIL54",10)
				AddexperienceParty(1000)
				EraseJournalEntry(@54500)
				AddJournalEntry(@54501,QUEST_DONE)
				GiveItemCreate("AC#HELMI",Player1,1,0,0)~ EXIT
			END

IF ~Global("AC#Catch_the_rat","ACIL54",2)~ THEN BEGIN hello_before_job
SAY ~Na, habt Ihr es Euch anders überlegt?~
++ ~Nein.~ + job_decline
++ ~Ja, ich tue es.~ + job_accept
++ ~Wie war nochmal Euer Angebot?~ + what_offer
END

	IF ~~THEN BEGIN what_offer
	SAY ~Zehn Rattenschwänze für einen Helm.~
	++ ~In Ordnung, ich tue es.~ + job_accept
	++ ~Vergesst es.~ + job_decline
	END				

IF ~Global("AC#Catch_the_rat","ACIL54",1)~ THEN BEGIN hello
SAY ~Was wollt Ihr von Hamli, <RACE>?~
++ ~Was ist das für ein komischer Käfer da an Eurer Seite?~ + beetle
++ ~Nichts. Ich gehe wieder.~ + bye_idle
END

	IF ~~THEN BEGIN beetle
	SAY ~Das? Das ist ein Feuerkäfer.~
	++ ~Ein Feuerkäfer? Kann der Feuerspeien oder ähnliches?~ + firebeetle
	++ ~Ihr habt hier unten aber seltsame Käfer.~ + why_firebeetle
	++ ~Interessant. Ich muss weiter.~ + bye_idle
	END
	
		IF ~~THEN BEGIN firebeetle
		SAY ~Ha! Das wäre wahrhaftig eine feine Sache. Nein, das Vieh kann leider kein Feuer spucken.~
		++ ~Warum heißt das Tier dann Feuerkäfer?~ + why_firebeetle
		END
		
			IF ~~THEN BEGIN why_firebeetle
			SAY ~Ich sehe, Ihr seid nicht von hier, <RACE>. Die Feuerkäfer haben ihren Namen dem Umstand zu verdanken, dass sie an bestimmten Stellen ihres Chitinpanzers Leuchtplatten besitzen, die feuerrot aufleuchten können. Sehr praktisch, um dunkle Tunnel und Minenschächte zu erhellen. Leider sehr unpraktisch, wenn man so ein Tier dazu abrichten möchte, etwas anderes zu machen als vor sich hin zu leuchten.~
			++ ~Ihr wolltet das Tier zum Rattenfangen abrichten, habe ich Recht?~ + hunt_rats
			END
			
				IF ~~THEN BEGIN hunt_rats
				SAY ~Ja, das habe ich vor. Leider steht bei dem Käfer Ratte nicht auf dem Speiseplan. Das Fleisch scheint den Tieren nicht zu schmecken, deshalb beachten sie die Ratten nicht.~
				++ ~Habt Ihr so ein starkes Rattenproblem in der Stadt?~ + rat_problem
				END
				
					IF ~~THEN BEGIN rat_problem
					SAY ~Eigentlich nicht. Aber ich bin eben mit dieser Aufgabe betraut. Wenn die Rattenplage erstmal da ist, heißt es: "Hamli, warum hast Du nichts dagegen unternommen?" Also versuche ich, der Sache vorzubeugen, was nicht ganz einfach ist, seit mein Partner in der Gilde die Stadt verlassen hat.~
					++ ~Euer Rattenfänger-Partner hat die Stadt verlassen? Warum?~ + why_left_town
					++ ~Könntet Ihr dem Käfer die Ratten nicht irgendwie schmackhaft machen?~ + beetle_likes_rats
					++ ~Gibt es kein anderes Tier, das diese Aufgabe übernehmen könnte?~ + another_animal
					END
					
						IF ~~THEN BEGIN why_left_town
						SAY ~Na seht Euch doch mal um. Hier ist nichts mehr sicher und nichts mehr los. Viele Zwerge sind deshalb gen Norden aufgebrochen, in die großen Zitadellen unseres Volkes, weil sie sich dort ein besseres Leben vorstellen. Glaub' kaum, dass viele es überhaupt bis dahin geschafft haben. Und nun sitze ich hier mit meinem Rattenproblem.~
						++ ~Könntet Ihr dem Käfer die Ratten nicht irgendwie schmackhaft machen?~ + beetle_likes_rats
						++ ~Gibt es kein anderes Tier, das diese Aufgabe übernehmen könnte?~ + another_animal
						END
						
							IF ~~THEN BEGIN another_animal
							SAY ~Für die Höhlenkatzen sind diese fetten Ratten zu groß. Die anderen Tiere des Unterreichs wie Rieseneidechsen sind bei uns in der Stadt nicht vorhanden. Wir sind ja schließlich keine Drow!~
							IF ~~ THEN + rat_part
							END 
							
							IF ~~THEN BEGIN beetle_likes_rats
							SAY ~Also wenn ich jede verdammte Ratte, bevor sie der blöde Käfer frisst, erst garnieren müsste, könnte ich mir die ganze Arbeit gleich sparen.~
							IF ~~ THEN + rat_part
							END 
							
								IF ~~THEN BEGIN rat_part
								SAY ~Aber he, mir kommt da gerade eine Idee. Vielleicht mögen die Käfer ja kein Rattenfleisch, aber andere Teile? Der Schwanz einer Ratte könnte funktionieren. Mein Kumpel Yalil hat gerne auf den Dingern herumgekaut.~
								=
								~Also passt auf, das wäre ein Versuch wert. Ihr bringt mir ein paar Rattenschwänze, sagen wir zehn, und ich versuche dann, sie dem Käfer schmackhaft zu machen.~
								++ ~So einen unwürdigen Auftrag habe ich schon seit langer Zeit nicht mehr angeboten bekommen.~ + no_ratquest
								++ ~Was bekäme ich dafür?~ + ratquest_reward
								++ ~Klingt gut.~ + ratquest_reward
								++ ~Kein Interesse. Ich lasse Euch mit Eurem Käferproblem nun wieder allein~ + bye_idle
								END
								
									IF ~~THEN BEGIN no_ratquest
									SAY ~Müsst Ihr ja nicht machen.~ 									
									IF ~~ THEN GOTO ratquest_reward
									END
									
									IF ~~THEN BEGIN ratquest_reward
									SAY ~Eure Hilfe wäre auch nicht umsonst! Habe hier noch einen alten Helm von meinem Clan, den ich Euch geben würde.~
									++ ~Was ist das für ein Helm?~ + what_kind_helm
									END 
									
									IF ~~THEN BEGIN what_kind_helm
									SAY ~Weiß ich doch nicht! Ein alter Helm eben. Also beschafft Ihr mir jetzt ein paar Rattenschwänze oder nicht?~
									++ ~In Ordnung, ich tue es.~ + job_accept
									++ ~Vergesst es.~ + job_decline
									END

										IF ~~ THEN BEGIN job_decline
										SAY ~Wie Ihr meint. Dann lasst mich aber jetzt auch wieder in Ruhe, kapiert?~
										IF ~~ THEN DO ~SetGlobal("AC#Catch_the_rat","ACIL54",2)~
										EXIT
										END

										IF ~~ THEN BEGIN job_accept
										SAY ~Hey, gut! Bringt mir zehn Stück, und Ihr bekommt den Helm.~
										IF ~~ THEN DO ~SetGlobal("AC#Catch_the_rat","ACIL54",3)
										AddJournalEntry(@54500,QUEST)~
										EXIT
										END
										
										IF ~~ THEN BEGIN bye_idle
										SAY ~Wie Ihr meint.~
										IF ~~ THEN EXIT
										END

IF ~~ THEN BEGIN catch_rat_02
SAY ~Ach, verflucht! Alles muss man selber machen!~
IF ~~ THEN DO ~SetGlobal("AC#Catch_the_rat","ACIL54",1)
Attack("AC#54RA2")~
EXIT
END

IF ~True()~ THEN BEGIN hello_true
SAY ~Ein guter Tag zum Ratten fangen, nicht wahr, <RACE>?~
IF ~~ THEN EXIT
END

CHAIN IF WEIGHT #-1 ~NumTimesTalkedTo(0)~ THEN AC#ILHA1 chain_catch_rat
~Los, fang die Ratte! Fang sie!~
== AC#ILBEE ~...~
== AC#ILHA1 ~Fang die Ratte, blödes Vieh!~
== AC#ILBEE ~...~
END
IF ~~ THEN EXTERN ~AC#ILHA1~ catch_rat_02

// Die drei Rülps-Zwerge
BEGIN AC#IL54A 
BEGIN AC#IL54B 
BEGIN AC#IL54C 

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#IL54A chain_burp_1
~(...)~ [AC#BURPA]
== AC#IL54B ~(...)~ [AC#BURPB]
== AC#IL54C ~(...)~ [AC#BURPC]
EXIT

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#IL54B chain_burp_2
~(...)~ [AC#BURPB]
== AC#IL54A ~(...)~ [AC#BURPA]
== AC#IL54C ~(...)~ [AC#BURPC]
EXIT

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#IL54C chain_burp_3
~(...)~ [AC#BURPC]
== AC#IL54A ~(...)~ [AC#BURPA]
== AC#IL54B ~(...)~ [AC#BURPB]
EXIT

CHAIN IF ~NumTimesTalkedTo(1)~ THEN AC#IL54A chain_burp_4
~Zieh Leine, <GIRLBOY>, Du verpestest hier unsere gute Luft!~
EXIT

CHAIN IF ~NumTimesTalkedTo(1)~ THEN AC#IL54B chain_burp_5
~Zieh Leine, <GIRLBOY>, Du verpestest hier unsere gute Luft!~
EXIT

CHAIN IF ~NumTimesTalkedTo(1)~ THEN AC#IL54C chain_burp_6
~Zieh Leine, <GIRLBOY>, Du verpestest hier unsere gute Luft!~
EXIT

CHAIN IF ~True()~ THEN AC#IL54A chain_burp_a
~(...)~ [AC#BURPA]
== AC#IL54B ~(...)~ [AC#BURPB]
== AC#IL54C ~(...)~ [AC#BURPC]
EXIT

CHAIN IF ~True()~ THEN AC#IL54B chain_burp_b
~(...)~ [AC#BURPB]
== AC#IL54A ~(...)~ [AC#BURPA]
== AC#IL54C ~(...)~ [AC#BURPC]
EXIT

CHAIN IF ~True()~ THEN AC#IL54C chain_burp_c
~(...)~ [AC#BURPC]
== AC#IL54A ~(...)~ [AC#BURPA]
== AC#IL54B ~(...)~ [AC#BURPB]
EXIT

// Die drei Sing-Zwerge
BEGIN AC#IL54D 
BEGIN AC#IL54E 
BEGIN AC#IL54F 
BEGIN AC#IL54G 

CHAIN IF ~RandomNum(2,1)~ THEN AC#IL54D song_01
~Hebt die Krüge, lasst sie klingen,
Freunde, lasst das Bier uns bringen!~ 
== AC#IL54E ~Unter Bergen, tief im Stein,
fließt das Bier ganz klar und rein.~ 
== AC#IL54F ~Von dunklen Minen, edlem Erz,
hallt der Gesang, erfüllt das Herz!~
== AC#IL54G ~Trinkt, bis der Schmiedetag erneut beginnt,
hier beim Bier, wo Zwerge Brüder sind.~
EXIT

CHAIN IF ~RandomNum(2,2)~ THEN AC#IL54D song_02
~Durch das Echo unsrer Halle,
steigt das Lied, stimmt ein jetzt alle!~ 
== AC#IL54E ~Mit dem Hammer, Schlag um Schlag,
feiern wir bis zum Morgentag.~ 
== AC#IL54F ~Brüder, schenkt noch einmal ein,
keiner soll heut' durstig sein!~
== AC#IL54G ~In der Tiefe, stolz und frei,
lebt der Zwerg, so froh und treu.~
EXIT

// Zwerg #2
CHAIN IF ~RandomNum(2,1)~ THEN AC#IL54E song_01
~Hebt die Krüge, lasst sie klingen,
Freunde, lasst das Bier uns bringen!~ 
== AC#IL54D ~Unter Bergen, tief im Stein,
fließt das Bier ganz klar und rein.~ 
== AC#IL54F ~Von dunklen Minen, edlem Erz,
hallt der Gesang, erfüllt das Herz!~
== AC#IL54G ~Trinkt, bis der Schmiedetag erneut beginnt,
hier beim Bier, wo Zwerge Brüder sind.~
EXIT

CHAIN IF ~RandomNum(2,2)~ THEN AC#IL54E song_02
~Durch das Echo unsrer Halle,
steigt das Lied, stimmt ein jetzt alle!~ 
== AC#IL54D ~Mit dem Hammer, Schlag um Schlag,
feiern wir bis zum Morgentag.~ 
== AC#IL54F ~Brüder, schenkt noch einmal ein,
keiner soll heut' durstig sein!~
== AC#IL54G ~In der Tiefe, stolz und frei,
lebt der Zwerg, so froh und treu.~
EXIT

// Zwerg #3
CHAIN IF ~RandomNum(2,1)~ THEN AC#IL54F song_01
~Hebt die Krüge, lasst sie klingen,
Freunde, lasst das Bier uns bringen!~ 
== AC#IL54E ~Unter Bergen, tief im Stein,
fließt das Bier ganz klar und rein.~ 
== AC#IL54F ~Von dunklen Minen, edlem Erz,
hallt der Gesang, erfüllt das Herz!~
== AC#IL54G ~Trinkt, bis der Schmiedetag erneut beginnt,
hier beim Bier, wo Zwerge Brüder sind.~
EXIT

CHAIN IF ~RandomNum(2,2)~ THEN AC#IL54F song_02
~Durch das Echo unsrer Halle,
steigt das Lied, stimmt ein jetzt alle!~ 
== AC#IL54E ~Mit dem Hammer, Schlag um Schlag,
feiern wir bis zum Morgentag.~ 
== AC#IL54D ~Brüder, schenkt noch einmal ein,
keiner soll heut' durstig sein!~
== AC#IL54D ~In der Tiefe, stolz und frei,
lebt der Zwerg, so froh und treu.~
EXIT

// Zwerg #4
CHAIN IF ~RandomNum(2,1)~ THEN AC#IL54G song_01
~Hebt die Krüge, lasst sie klingen,
Freunde, lasst das Bier uns bringen!~ 
== AC#IL54E ~Unter Bergen, tief im Stein,
fließt das Bier ganz klar und rein.~ 
== AC#IL54F ~Von dunklen Minen, edlem Erz,
hallt der Gesang, erfüllt das Herz!~
== AC#IL54D ~Trinkt, bis der Schmiedetag erneut beginnt,
hier beim Bier, wo Zwerge Brüder sind.~
EXIT

CHAIN IF ~RandomNum(2,2)~ THEN AC#IL54G song_02
~Durch das Echo unsrer Halle,
steigt das Lied, stimmt ein jetzt alle!~ 
== AC#IL54E ~Mit dem Hammer, Schlag um Schlag,
feiern wir bis zum Morgentag.~ 
== AC#IL54F ~Brüder, schenkt noch einmal ein,
keiner soll heut' durstig sein!~
== AC#IL54D ~In der Tiefe, stolz und frei,
lebt der Zwerg, so froh und treu.~
EXIT
