

/*******************************************************************************************************
Dialog Malphas Cutscene  ACIL88: Talk mit Mithbarak
*******************************************************************************************************/
BEGIN ~AC#MITH2~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY ~Hört Ihr die Kampfgeräusche, Teufel? Es scheint, dass meine Rettung naht und als ob Eure Pläne von einem einfachen Sterblichen durchkreuzt werden würden!~ [AC#ILMIA]
IF ~~ THEN EXTERN ~AC#MAL02~ 01
END

IF ~Global("AC#Cut1","ACIL88",2)
Global("AC#Mithbarak_Free","GLOBAL",0)
!Dead("AC#MAL02")~ THEN BEGIN 4
SAY  ~Ihr seid diejenigen, die gekommen sind, um mich zu retten, habe ich Recht? Gut.~ [AC#ILMIB]
++ ~Das sind wir, ja.~ + 5
END

IF ~~ THEN BEGIN 2
SAY ~Ich bin ebenso wenig ein Zwerg, Krähengesicht, wie Ihr ein Rabe seid. Denkt Ihr, ich hätte Eure Pläne nicht durchschaut? Ein Fluch zwingt Euch in diesen armseligen Körper - genau wie mich. Doch im Gegensatz zu mir werdet Ihr in dieser jämmerlichen Form sterben! Mit den Githyanki habt Ihr Euch überworfen, und die wenigen Diener, die Euch noch bleiben, werden Euch den Rücken kehren, sobald ihnen klar wird, dass Ihr verloren habt, um sich nicht auch noch den Zorn Eurer launischen Herrin auf sich zu ziehen.~
IF ~~ THEN EXTERN ~AC#MAL02~ 02
END

IF ~~ THEN BEGIN 3
SAY ~Vernichtet? Ihr könnt mich hier nicht töten, denn das würde meine Rückkehr in meinen Körper auf der materiellen Ebene bedeuten! Und damit meine Befreiung! Und meine Befreier sind schon auf dem Weg hierher!~
IF ~~ THEN EXTERN ~AC#MAL02~ 03
END

IF ~~THEN BEGIN 5
SAY ~Hört zu, wir haben nicht viel Zeit, solange dieser Teufel Malphas noch am Leben ist. Ihr müsst mich so schnell wie möglich töten.~
++ ~Bitte entschuldigt, aber ich glaube, ich habe mich verhört. Ich soll Euch töten?~ + 6
END

IF ~~THEN BEGIN 6
SAY ~Genau! Dies ist nicht mein wahrer Körper, den Ihr hier seht. Dieser befindet sich auf der materiellen Ebene, in meinem Thronsaal in Iltkazar. Ich denke, dort habt Ihr mich schon zu Gesicht bekommen.~
=
~Wenn Ihr diese astrale Projektion meines Körpers hier vernichtet, kehrt meine Seele und Bewusstsein wieder in meinen echten Körper zurück. Sobald ich wieder die Kontrolle über mich habe, werde ich ein Portal öffnen, um Euch hier herauszuholen.~
++ ~Wollt Ihr mir in dem Kampf um Eure Befreiung, der um uns tobt, nicht wenigstens ein wenig beistehen?~ + 7
END

IF ~~THEN BEGIN 7
SAY ~Glaubt mir, wenn ich hier irgendwelche Macht hätte, hätte ich mich schon längst selbst befreit. Doch auf dieser Ebene bin ich Euch nicht viel nütze.~
=
~Ich kann Euch jedoch von der Astralebene zurückbringen, wenn ich von der materiellen Ebene ein Portal öffne.~
++ ~Ich bin also den ganzen Weg hierhergekommen, um Euch vor Eurer Befreiuung zu ermorden. Nun gut, ich hoffe für Euch, dass dieser Plan funktioniert.~ + 8
END

IF ~~ THEN BEGIN 8
SAY ~Sollte er nicht funktionieren, werde ich es nicht mehr erfahren. Und nun los, aber macht es bitte zügig, ich habe in den letzten Jahren fürwahr schon genug leiden müssen!~
IF ~~ THEN DO ~SetGlobal("AC#Mithbarak_Free","GLOBAL",1)~
   EXIT
END

/*******************************************************************************************************
Dialog AC#MAL88
*******************************************************************************************************/
BEGIN ~AC#MAL88~

IF ~Global("AC#MalphasDies","GLOBAL",1)~ THEN BEGIN hello_die
SAY  ~Verdammt sollt Ihr sein! Besiegt von einem niederen <PRO_RACE>?~ 
IF ~~ THEN DO ~SetGlobal("AC#MalphasDies","GLOBAL",10)
DestroyItem("MINHP1")
Kill(Myself)
AddexperienceParty(15000)~
   EXIT
END

/*******************************************************************************************************
Dialog AC#MAL02
*******************************************************************************************************/
BEGIN ~AC#MAL02~

IF ~Global("AC#TalkedMalphas","GLOBAL",0)~ THEN BEGIN 04
SAY  ~Ihr seid weit gekommen, <CHARNAME>!~ [AC#ILMAF]
++ ~In der Tat, wir haben einiges durchgemacht. Doch Ihr seht seit unserem letzten Treffen auch ziemlich ramponiert aus!~ + 05
END

IF ~~ THEN BEGIN 01
SAY ~Spottet nicht über mich, Zwerg, denn ich werde Euren Rettern hier endgültig einen schrecklichen Tod bereiten!~ [AC#ILMAG]
IF ~~ THEN EXTERN ~AC#MITH2~ 2
END

IF ~~ THEN BEGIN 02
SAY ~Wir unterscheiden uns gar nicht so sehr, "König"... Ihr tragt Ketten aus Fleisch. Ich trage Federn. Und indem ich Euch habe, werde ich bald wieder meine wahre Gestalt zurückerlangen, während Ihr vernichtet werdet!~
IF ~~ THEN EXTERN ~AC#MITH2~ 3
END

IF ~~ THEN BEGIN 03
SAY ~Wisst Ihr, Mithbarakaz, der Silberdrache: Dies ist das Problem mit Euch gutherzigen Kreaturen - Ihr denkt, Ihr könntet Euch in den Geist von uns Tyrannen hineinversetzen, aber Euch fehlt der Blick für all die Bösartigkeiten, zu welchen wir jedesmal aufs Neue fähig sind. Meine Version der Geschichte geht nämlich so: Ihr steckt hier in Eurem Käfig fest und müsst mit ansehen, wie diese schlecht geplante Befreiungsaktion ein klägliches Ende finden wird, währenddessen ich in meinem astralen Kraftfeld triumphieren werde!~
IF ~~ THEN DO ~ClearAllActions()
   StartCutSceneMode()
   StartCutScene("ac#ct88B")~
   EXIT
END

IF ~~ THEN BEGIN 05
SAY ~Ehrlich gesagt habe ich dieses lange Reden ohnehin satt. Bereitet Euch darauf vor, den Rest Eures Daseins in der Hölle zu verbringen!~ [AC#ILMAE]
IF ~~ THEN DO ~SetGlobal("AC#TalkedMalphas","GLOBAL",1)
Enemy()~
   EXIT
END

