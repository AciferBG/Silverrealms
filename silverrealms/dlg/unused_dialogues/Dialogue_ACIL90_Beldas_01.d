BEGIN ~ac#dwf02~ //Beldas Creature No 2

IF ~Global("FoundEntry","ACIL90",1)~ THEN BEGIN see_you_again
SAY ~<CHARNAME>! Da seid Ihr ja!~
IF ~~ THEN REPLY ~Der Aufstieg war ganz schön schwierig, während Ihr offensichtlich die Abkürzung genommen habt!~ + aufstieg
IF ~~ THEN REPLY ~Wo kommt Ihr denn auf einmal her?~ + where_do_you_come_from
IF ~~ THEN REPLY ~Ja, wie versprochen, oben auf dem Gipfel.~ + summit
END

IF ~Global("AC#ClimbedUp","ACIL90",2)~ THEN BEGIN see_you_ontop
SAY ~Wir ziehen besser die Strickleiter wieder hoch, falls wir sie im Inneren noch benötigen...~
=
~Wir sehen uns auf dem Gipfel, <CHARNAME>! Passt auf Euch auf.~
IF ~~ THEN DO ~SetGlobal("AC#ClimbedUp","ACIL90",3)
ActionOverride("AC#DWF22",EscapeArea())
ActionOverride("AC#DWF32",EscapeArea())
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN aufstieg
SAY ~Es war in der Tat eine Tour auf Zwergenart. Wir haben einen alten Stollen unserer Vorfahren gefunden, der uns direkt bis hinauf zum Gipfel des Turbold-Berges gebracht hat.~
IF ~~ THEN REPLY ~Habt Ihr Inneren wenigstens das gefunden, wonach wir suchen?~ + found_something
IF ~~ THEN REPLY ~Wo ist Thradear?~ + wheres_Thradear
END

IF ~~ THEN BEGIN where_do_you_come_from
SAY ~Von drinnen. Wir haben einen alten Stollen unserer Vorfahren gefunden, der uns direkt bis hinauf zum Gipfel des Turbold-Berges gebracht hat.~
IF ~~ THEN REPLY ~Habt da drinnen wenigstens das gefunden, wonach wir suchen?~ + found_something
IF ~~ THEN REPLY ~Wo ist Thradear?~ + wheres_Thradear
END

IF ~~ THEN BEGIN summit
SAY ~Wir haben einen alten Stollen unserer Vorfahren gefunden, der uns direkt bis hinauf zum Gipfel des Turbold-Berges gebracht hat.~
IF ~~ THEN REPLY ~Und was machen wir jetzt?~ + follow_me
IF ~~ THEN REPLY ~Wo ist Thradear?~ + wheres_Thradear
END

	IF ~~ THEN BEGIN wheres_Thradear
	SAY ~Er zieht es vor, im Inneren der Turboldfeste zu warten.~
	IF ~~ THEN GOTO follow_me
	END

IF ~~ THEN BEGIN found_something
SAY ~Nicht ganz. Aber wir sind dennoch ein ganzes Stück weitergekommen.~
IF ~~ THEN GOTO follow_me
END

IF ~~ THEN BEGIN follow_me
SAY ~Folgt mir, ich muss Euch drinnen etwas zeigen!~
IF ~~ THEN DO ~SetGlobal("FoundEntry","ACIL90",2)
ActionOverride("AC#DWF22",EscapeArea())
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN not_used_to_thunder
SAY ~Nun, <CHARNAME>, dort, wo wir herkommen, kann einem höchstens ein Stein auf den Kopf fallen.~
=
~Aber seht her, Freunde: Gleich hier oben ist eine Höhle! Das sieht mir nach einem Ausgang aus, den unsere Vettern vor Jahrhunderten geschlagen haben könnten. Es brennt dort soagr noch das ewige Feuer in einem unserer Öl-Feuerbecken! Wir werden von dort drinnen einen Weg nach oben suchen, <CHARNAME>, während Ihr hier weiter draußen den Berg hochschreitet und sichert.~
IF ~~ THEN REPLY ~Wie wollt Ihr denn zu diesem Bergsims hinaufkommen, Beldas?~ EXTERN ~AC#DWF22~ use_rope
END

IF ~~ THEN BEGIN way_outside
SAY ~Ihr seid ein zäher <PRO_RACE>, <CHARNAME>, keine Frage, doch im Inneren eines Berges werden wir ohne Euch schneller unterwegs sein. Und hier draußen wären wir Euch nur eine Last.~
IF ~~ THEN GOTO lets_go
END

IF ~~ THEN BEGIN lets_go
SAY ~Los, kommt, meine zwei Gefährten, hoch auf das Sims und dann ab in die wohlbekannte Welt der Felsen!~
IF ~~ THEN DO ~SetGlobal("AC#ClimbedUp","ACIL90",1)~ EXIT
END


BEGIN ~AC#DWF22~ // Gormar

IF ~~ THEN BEGIN use_rope
SAY ~Na, mit einem Seil natürlich. Hier, seht, ich habe sogar eine Strickleiter aus dem Unterreich mit herauf an die Oberfläche gebracht.~
IF ~~ THEN EXTERN ~AC#DWF32~ verlass
END

BEGIN ~AC#DWF32~ // Thradear

IF ~~ THEN BEGIN no_10_rothe
SAY ~Ist mir egal, aber auf diesem Weg hier kriegen mich keine zehn Rothé weiter hinauf!~
IF ~~ THEN REPLY ~Ihr habt Angst vor einem Gewitter, Zwerg?~ EXTERN ~AC#dwf02~ not_used_to_thunder
END

IF ~~ THEN BEGIN verlass
SAY ~Ha, auf unseren Gormar ist eben immer Verlass!~
IF ~~ THEN REPLY ~Ich würde gerne mit Euch diese Höhle untersuchen.~ EXTERN ~AC#dwf02~ way_outside
END

CHAIN IF WEIGHT #-1 ~NumTimesTalkedTo(0)~ THEN AC#DWF32 1 //  Thradear is afraid of lightning
~Bei dem Seelenschmied, was für eine fürchterliche, offene Welt das hier oben doch ist! Es regnen sogar Blitze vom Himmel!~
== AC#dwf02 ~Beruhigt Euch, Thradear, dies ist eines der Gewitter, die diesen Berg häufiger durchziehen.~
END
IF ~~ THEN EXTERN ~AC#DWF32~ no_10_rothe

