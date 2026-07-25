
/*******************************************************************************************************
Dialog Malphas- Five Claws of Tiamat Cutscene
*******************************************************************************************************/
BEGIN AC#MAL03
BEGIN AC#IL801 // red claw
BEGIN AC#IL802 // blue claw
BEGIN AC#IL803 // green claw
BEGIN AC#IL804 // black claw
BEGIN AC#IL805 // white claw

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#IL801 chain_mith_celebration_01
~Unsere Feinde sind  an den äußeren Plattformen gelandet, Meister. Sollen wir sie mit unseren Ballisten zu vernichten?~
== AC#MAL03 ~Nein. Lasst sie ruhig kommen. Der psychische Wind ist hier besonders stark. Von diesem Ort gibt es kein Entkommen.~
== AC#IL802 ~Dann werden wir den Weg zum Tor mit ihrem Blut pflastern.~
== AC#IL803 ~Unterschätzt sie nicht. Dieser <PRO_RACE> hat bereits mehr erreicht, als ihm je hätte gelingen dürfen.~
== AC#IL804 ~Es spielt keine Rolle. Wer den Willen der Drachenkönigin herausfordert, wird sterben!~
== AC#IL805 ~Gebt den Befehl, Meister. Wir werden <PRO_HISHER>en Kopf Tiamat zu Füßen legen.~
== AC#MAL03 ~Eben deshalb habe ich Euch ausgewählt. Ihr seid die Fünf Klauen Tiamats – ihre stärksten sterblichen Diener. Niemand darf diese Tore passieren.~
== AC#MAL03 ~Ich ziehe mich nun ins Herz der Festung zurück und bereite die letzte Verteidigung vor. Verschließt die Tore hinter mir. Haltet <CHARNAME> so lange wie möglich auf!~
== AC#IL801 ~Wie Ihr befehlt, Meister.~
== AC#MAL03 ~Und wagt es nicht zu versagen. Sollte <CHARNAME> diese Tore durchschreiten, wird Tiamats Zorn das Geringste Eurer Leiden sein.~
== AC#IL802 ~Dann soll <CHARNAME> kommen. Heute wird eine weitere Seele der Drachenkönigin gehören!~
END
IF ~~ THEN DO~StartCutSceneMode()
   SetGlobal("AC#ACIL80CutScene2","GLOBAL",1)
   ActionOverride("AC#MAL03",EscapeArea())
    Wait(1)
    CloseDoor("DOOR03")
    Lock("DOOR03")
	ActionOverride("CUTSPY",DestroySelf())
    Wait(1)
	MoveViewPoint([267.265],INSTANT)
    EndCutSceneMode()~EXIT						   


