// ---------------------------------------------
// Dream-Dialoge: Elderbrain 1+2
// ---------------------------------------------


// Vision in ACILD3 : Mith Barak talking to elder brain

BEGIN ~AC#ILD3E~
BEGIN ~AC#DREA3~

	CHAIN IF ~NumTimesTalkedTo(1)~ THEN AC#ILD3E hello_2
	~Interessant! Und Ihr habt nie versucht, an der Oberfläche nach einer Möglichkeit zu suchen, um Euren bedauernswerten Zustand zu beenden?~ 
	== AC#DREA3 ~Doch, das habe ich.~ 
	== AC#ILD3E ~Welchen Weg habt Ihr an die Oberfläche gewählt?~ 
	== AC#DREA3 ~Den Weg über Ravimors Höhle. Ich habe dort einen Federfalltrank bereitgelegt, sollte ich den Rückweg ebenfalls über die Höhle antreten.~
	== AC#ILD3E ~Ravimors Höhle. Ein fast vergessener Ort. Und an welchem Ort an der Oberfläche wolltet Ihr um Rücknahme Eures Fluches bitten.~ 	
	== AC#DREA3 ~Am alten Drachenfriedhof.~
	== AC#ILD3E ~Oh! Zeigt ihn mir.~	
	== AC#DREA3 ~Dies ist aber die letzte Erinnerung, die ich mit Euch teilen werde. Dann werdet Ihr mir antworten liefern müssen!~
	END
	IF ~~ THEN DO ~StartCutSceneMode()
	StartCutScene("AC#23CT3")~ EXIT
	
	CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#ILD3E hello
	~Sieh an, sieh an. Der verfluchte König Iltkazars schickt sich an, mich lebloses Hirn um Rat zu fragen.~ 
	== AC#DREA3 ~Das tue ich.~ 
	== AC#ILD3E ~Nichts im Leben gibt es umsonst. Das müsstet Ihr bestens wissen.~ 
	== AC#DREA3 ~Was verlangt Ihr?~
	== AC#ILD3E ~Mich dürstet nach Erinnerung.~	
	== AC#DREA3 ~Gut, Ihr sollt sie haben.~
	END
	IF ~~ THEN DO ~StartCutSceneMode()
	StartCutScene("AC#23CT6")~ EXIT

// ---------------------------------------------
// Dream-Dialoge: Thronsaal
// ---------------------------------------------
	
BEGIN AC#DREA2  // Ratgeber
IF ~NumTimesTalkedTo(1)~ THEN BEGIN 0
SAY ~Mein Herr! König Mith Barak! So antwortet doch! Was ist mit Euch geschehen?~
IF ~~ THEN DO ~/*SetGlobal("AC#ACIL23CutScene1","GLOBAL",5)*/
SetGlobal("AC#ACIL23CutScene1","GLOBAL",6)
ClearAllActions()
StartCutSceneMode()
StartCutScene("AC#23CTA")~ EXIT
END

BEGIN AC#DREA1  // Mithbarak

CHAIN IF WEIGHT #-1 ~NumTimesTalkedTo(0)~ THEN AC#DREA2 1
~Mith Barak, der Mithralschild, ist in der Halle der Herrscher Iltkazars eingetroffen. Und das in Zeiten großer Not, denn unser geliebter König liegt im Sterben, und schon bald wird er den Ruf Moradins vernehmen und in die Seelenschmiede aufbrechen. Seid gegrüßt, Mith Barak, der Clanlose, Wächter der Bücher, seid Ihr bereit, die Bürde, die Euch auferlegt wurde, anzunehmen?~
== AC#DREA1 ~Deshalb bin ich hier, Zwerge von Iltkazar, denn den Schwur, den ich Eurem Volke vor langer Zeit gegeben habe, werde ich nun einlösen.~
== AC#DREA2 ~So sei es denn beschlossen. Mith Barak der Clanlose wird der neue König von Iltkazar sein!~
END
IF ~~ THEN DO ~/*SetGlobal("AC#ACIL23CutScene1","GLOBAL",3)*/
SetGlobal("AC#ACIL23CutScene1","GLOBAL",4)
ClearAllActions()
StartCutSceneMode()
StartCutScene("AC#23CT2")~ EXIT

// ---------------------------------------------
// Dream-Dialoge: ACIL70
// ---------------------------------------------

BEGIN AC#DREA8  // König Mithbarak

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
SAY ~Ich bin meinem Ziel sehr nah. Hier liegt Xaxathart, der Vergüter. Er war der erste seiner Art, der vor Äonen von Tethir, dem Drachentöter erschlagen wurde.~
IF ~~ THEN DO ~SetGlobal("AC#ACIL23CutScene1","GLOBAL",7)
StartCutSceneMode()
StartCutScene("AC#23CT4")
~ EXIT
END

CHAIN IF WEIGHT #-1 ~NumTimesTalkedTo(1)~ THEN AC#DREA8 1
~Nun muss ich also diesen Weg beschreiten. Und wenn ich wieder nach Iltkazar zurückkehre, werde ich bald in meinen Schlaf fallen. Hoffentlich bringt mich die Suche hier an diesem Tempel an der Oberfläche weiter.~
== AC#DREA8 ~Zwischen den Knochen der Drachen liegt mein Schicksal. Und vielleicht… meine Erlösung. An diesem heiligen Ort der Elfen finde ich vielleicht die Macht, meinen Fluch zu brechen… oder ihm endgültig zu verfallen. Der Ort war glücklicherweise in dem einzigen Buch Iltkazars, das nicht in der Bibliothek liegen darf, vermerkt. Sollte ich scheitern, so möge einst jemand dieses Buch zur Hand nehmen und ihm zu diesem Ort folgen.~
END
IF ~~ THEN DO ~SetGlobal("AC#ACIL23CutScene1","GLOBAL",8)
StartCutSceneMode()
StartCutScene("AC#23CT5")~ EXIT

