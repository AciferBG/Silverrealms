
/*******************************************************************************************************
Dialogue Guards
*******************************************************************************************************/

BEGIN ~AC#44DW1~

IF ~True()~ THEN BEGIN 1
SAY  ~Viel Glück da draußen, <CHARNAME>. Passt auf, denn es könnten sich immer noch umherstreunende Trupps von Duergar in diesem Gebiet aufhalten.~
IF ~~ THEN   EXIT
END	

/*******************************************************************************************************
Dialogue Dying Duergar
*******************************************************************************************************/

BEGIN ~AC#44DU1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY  ~Verflucht sollt Ihr sein, dass Ihr mich in diesem Zustand findet, <RACE>! Los, zeigt einen Akt der Güte und bereitet mir einen schnellen Tod, bevor die verdammten Aaskriecher mich erwischen!~
IF ~~ THEN REPLY ~Eurem Wunsch werde ich gerne entsprechen, Duergar! Haltet bitte schön still, dann wird es nur ein kleines Bisschen wehtun...~ + kill_duergar
IF ~~ THEN REPLY ~Nein. Ihr sollt hier jämmerlich verrecken, dafür, dass Ihr diese Stadt in den Abgrund treiben wolltet. Ihr lasse Euch genau so hier liegen, wie Ihr seid.~ + let_die_duergar
IF ~~ THEN REPLY ~Wollt Ihr denn nicht lieber geheilt werden?~ + wanna_heal_duergar
IF ~~ THEN REPLY ~Haltet still. Wir werden Euch heilen.~ + wanna_heal_duergar
END

IF ~True()~ THEN BEGIN 2
SAY  ~Da seid Ihr ja wieder! Gefällt es Euch so sehr, mir beim Verrecken zuzusehen?~
IF ~~ THEN REPLY ~Eurem Wunsch werde ich gerne entsprechen, Duergar! Haltet bitte schön still, dann wird es nur ein kleines Bisschen wehtun...~ + kill_duergar
IF ~~ THEN REPLY ~Nein. Ihr sollt hier jämmerlich verrecken, dafür, dass Ihr diese Stadt in den Abgrund treiben wolltet. Ihr lasse Euch genau so hier liegen, wie Ihr seid.~ + let_die_duergar
IF ~~ THEN REPLY ~Wollt Ihr denn nicht lieber geheilt werden?~ + wanna_heal_duergar
IF ~~ THEN REPLY ~Haltet still. Wir werden Euch heilen.~ + wanna_heal_duergar
END		

	IF ~~ THEN BEGIN kill_duergar
	SAY  ~Redet nicht lange herum und tötet mich, bei Laduguer!~
	IF ~~ THEN EXIT
	END
	
	IF ~~ THEN BEGIN let_die_duergar
	SAY  ~So... sterbe ich denn den Tod eines Feiglings...~
	IF ~~ THEN EXIT
	END	
	
	IF ~~ THEN BEGIN wanna_heal_duergar
	SAY  ~Pah! Ich verachte Eure Weichherzigkeit! Lasst mich lieber in Ruhe sterben!~
	IF ~~ THEN EXIT
	END

/*******************************************************************************************************
Dialogue Duergar after healing
*******************************************************************************************************/

BEGIN ~AC#44DU2~	

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY  ~Ihr habt mich tatsächlich geheilt? Was für eine schwache Rasse Ihr doch seid, <RACE>! Ich werde mich den anderen anschließen und Euch bei der nächstbesten Gelegenheit einen Bolzen in den Rücken schießen!~	
IF ~~ THEN REPLY ~Eigentlich habe ich Euch nur geheilt, weil ich ungleiche Kämpfe verabscheue. Jetzt brauche ich kein schlechtes Gewissen mehr zu haben, wenn ich Euch niedergestreckt habe!~ + kill_duergar_02
IF ~~ THEN REPLY ~Dies habe ich nicht für Euch, sondern für mich getan. Der Mut wächst mit dem Herzen, und das Herz mit jeder guten Tat.~ + good_deed
END

	IF ~~ THEN BEGIN good_deed
	SAY  ~Hä? Was? Ach, fahrt zur Hölle!~
	IF ~~ THEN DO ~AddexperienceParty(500)
	EscapeAreaObject("ToDrakkalor")~ EXIT
	END
	
	IF ~~ THEN BEGIN kill_duergar_02
	SAY  ~W-was? Wie grausam seid Ihr denn?~
	IF ~~ THEN REPLY ~Endlich zeigt Ihr einmal ein bisschen Demut. Los, verschwindet, bevor ich es mir anders überlege und Euch doch den Aaskriechern vorwerfe!~ + goodbye
	IF ~~ THEN REPLY ~Seid Ihr wirklich so feige, wie es scheint? Los greift mich an, und zeigt mir, ob wenigstens noch ein Funke mUt in Eurem Herzen zu finden ist!~ + attack_me
	END
	
		IF ~~ THEN BEGIN goodbye
		SAY  ~J-ja, <RACE>.~
		IF ~~ THEN DO ~AddexperienceParty(1000)
		EscapeAreaObject("ToDrakkalor")~ EXIT
		END
		
		IF ~~ THEN BEGIN attack_me
		SAY  ~Ihr Bastard! Kein Wunder ist Eure Rasse bei der meinen so verhasst!~
		IF ~~ THEN DO ~Enemy()
		Attack([PC])~ EXIT
		END
