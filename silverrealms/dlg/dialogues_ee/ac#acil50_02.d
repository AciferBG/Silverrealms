/***************************************************
Dialogue after destruction
***************************************************/

/*******************************************************************************************************
Dunnabar-Dialog
*******************************************************************************************************/
BEGIN ~AC#DUN03~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY  ~Bei den Göttern! Wir haben das Getöse im Ratssaal gehört und sind hierher geeilt. Was zum Teufel ist hier passiert? Seid Ihr wohlauf?~
++ ~Mir geht es gut. Wir haben das Portal verschlossen, indem wir die Halle zum Einsturz gebracht haben.~ + 2
END

IF ~~ THEN BEGIN 2
SAY ~Ihr habt was? Ihr habt unsere Schmieden zerstört?~
IF ~~ THEN EXTERN ~AC#SORN3~ 2
END

IF ~~ THEN BEGIN 3
   SAY ~Sorni? Ihr habt überlebt? Berronar sei Dank. Ich fürchtete schon, dass wir Euch unter den Trümmern Eurer Schmiede für immer verloren zu haben.~
IF ~GlobalLT("AC#BreskRescued","GLOBAL",20)~ THEN EXTERN ~AC#SORN3~ 3
 IF ~Global("AC#BreskRescued","GLOBAL",20)~ THEN EXTERN ~AC#SORN3~ bresk_save // this state starts when the pcs have rescued Bresk
END

	IF ~~ THEN BEGIN 14
	   SAY ~Nein, er ist nicht hier. Bresk war auch da unten? Gorm beschütze ihn! Das ... das sind ja schreckliche Nachrichten! Ich- ich muss sofort nach unten steigen und nach ihm suchen!~
	IF ~~ THEN EXTERN ~AC#SORN3~ 4
	END

	IF ~~ THEN BEGIN 4
	   SAY ~Aber- aber ich kann doch meinen geliebten Sohn nicht in diesem - diesem Grab wähnen und hier oben untätig herumstehen!~
	IF ~~ THEN REPLY ~Ihr habt auch noch eine Verantwortung für die Bewohner dieser Stadt, Dunnabar. Sie brauchen noch Eure Hilfe.~ EXTERN ~AC#SORN3~ 5
	END

	IF ~~ THEN BEGIN 5
	   SAY ~Ihr habt vermutlich Recht. Meine Pflicht liegt hier oben in der Stadt. Es ist gut, Euch hier an unserer Seite zu haben Anthan.~
	   IF ~~ EXTERN ~AC#ANT03~ 3
	END

	IF ~~ THEN BEGIN 15
	SAY  ~Ich werde eine Gruppe meiner besten Krieger in die Trümmer der Arnschädelhalle schicken und nach meinem Sohn suchen lassen.~ 
	IF ~~ THEN GOTO where_is_hathar
	END

IF ~~ THEN BEGIN where_is_hathar
SAY ~Wo ist mein Sohn Hathar? Er soll vorübergehend die Verteidigung der Stadt organisieren.~
IF ~Global("AC#HatharQuest","GLOBAL",1)~ THEN REPLY ~Das letzte Mal, als ich ihn sah, kämpfte er vor den Toren der Stadt gegen einige dieser Ausgeburten der Hölle.~ + 16
IF ~Global("AC#HatharQuest","GLOBAL",0)~ THEN REPLY ~Das letzte Mal, als ich ihn sah, kämpfte er vor den Toren der Stadt gegen einige dieser Ausgeburten der Hölle.~ + proud_hathar
END

IF ~~ THEN BEGIN proud_hathar
SAY ~Was für tapfere Söhne ich doch habe! Gorm wird heute auf uns herablächeln!~
IF ~~ THEN EXTERN AC#ANT03 chain_anthan_sorni
END

IF ~~ THEN BEGIN 16
   SAY ~Dann bete ich, dass ihm nichts passiert ist.~
   IF ~~ EXTERN ~AC#ANT03~ 5
END

IF ~~ THEN BEGIN 17
   SAY ~Also gut. Kehren wir vorerst zum Thronsaal zurück. <CHARNAME>, Ihr habt sicher viel zu berichten, doch ich Bitte Euch, zunächst nach meinem Sohn Hathar vor dem Ultoksamrin-Tor zu suchen. Stoßt dann im Thronsaal zu uns und berichtet uns alles, was sich in den Landen des Lichts zugetragen hat.~
   IF ~~ THEN DO ~SetGlobal("AC#HatharQuest","GLOBAL",2)
   SetGlobal("BreskPostMoves01","ACIL50",1)
   ActionOverride("AC#SORN3",EscapeArea())
   ActionOverride("AC#ANT03",EscapeArea())
   EscapeAreaObject("TrACIL63")~ EXIT
END

IF ~~ THEN BEGIN 18
   SAY ~Lasst uns hier nicht zu lange verweilen. Kehren wir zum Thronsaal zurück. <CHARNAME>, stoßt im Thronsaal zu uns und berichtet uns alles, was sich in den Landen des Lichts zugetragen hat.~
   IF ~~ THEN DO ~SetGlobal("BreskPostMoves01","ACIL50",1)
   ActionOverride("AC#SORN3",EscapeArea())
   ActionOverride("AC#ANT03",EscapeArea())
   EscapeAreaObject("TrACIL63")~ EXIT
END

IF ~~ THEN BEGIN dunnabar_bresk_01
SAY ~Mein Junge! Den Göttern sei Dank!~
IF ~~ THEN EXTERN ~AC#BRESK~ dunnabar_bresk_02
END

/*******************************************************************************************************
Sorni-Dialogue after destruction
*******************************************************************************************************/
BEGIN ~AC#SORN3~

IF ~~ THEN BEGIN 2
SAY ~Es war die einzige Möglichkeit, diese Invasion aus der Hölle zu stoppen, nachdem alle anderen Möglichkeiten ausgeschöpft waren, Dunnabar.~
IF ~~ THEN EXTERN ~AC#DUN03~ 3
END

IF ~~ THEN BEGIN 3
SAY ~Ich habe es gerade noch herausgeschafft, doch Euer Sohn, Bresk, befand sich ebenfalls in der Halle, bevor sie einstürzte. Ist er nicht hier?~
IF ~~ THEN EXTERN ~AC#DUN03~ 14
END

IF ~~ THEN BEGIN bresk_save
SAY ~Ich habe es gerade noch herausgeschafft. <CHARNAME> hat in einem heldenhaften Einsatz unseren Kriegsmeister Bresk gerettet. Ist er nicht hier?~
IF ~~ THEN DO ~StartCutSceneMode()
CreateCreature("AC#BRESK",[532.529],12)
ActionOverride("AC#BRESK",StartDialogueNoSet([PC])~ EXIT
END

IF ~~ THEN BEGIN 4
SAY ~Tut das nicht! Ihr würdet es niemals bis nach unten schaffen, Dunnabar.~
IF ~~ THEN EXTERN ~AC#DUN03~ 4
END

IF ~~ THEN BEGIN 5
SAY ~So schrecklich es auch klingen mag, <CHARNAME> hat Recht. Wir müssen hier nach dem Rechten sehen und die Überlebenden um uns scharen. Wie ist die Lage?~
IF ~~ THEN EXTERN ~AC#ANT03~ 2
END

IF ~~ THEN BEGIN 6
SAY ~Es wäre mir eine Ehre, Sornlinnor.~
IF ~~ THEN EXTERN ~AC#ANT03~ 4
END

/*******************************************************************************************************
Bresk-Dialogue after destruction if the PCs saved his life
*******************************************************************************************************/
BEGIN ~AC#BRESK~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_i_am_well
SAY ~Ich bin wohlauf.~
IF ~~ THEN EXTERN ~AC#DUN03~ dunnabar_bresk_01 
END

	IF ~GlobalGT("AC#Mithbarak_Rescued","GLOBAL",18)~ THEN BEGIN hello_mith_rescued
	SAY ~Ihr habt den König gerettet! Für diese Tat wird Iltkazar immer in Eurer Schuld stehen.~
	IF ~~ THEN EXIT
	END
	
	IF ~True()~ THEN BEGIN hello_again
	SAY ~Ich kann es immer noch nicht glauben, dass Ihr mich gerettet habt, <CHARNAME>. Dafür gebührt Euch mein tiefster Dank!~
	IF ~~ THEN EXIT
	END

IF ~~ THEN BEGIN dunnabar_bresk_02
SAY ~Dankt lieber diesem dürren <PRO_RACE> hier. Ohne <PRO_HISHER>e Hilfe wäre ich nicht am Leben!~
=
~Und nennt mich nicht ständig Junge, Vater. Ich bin der Kriegsmeister von Iltkazar! Und wir haben immer noch eine Schlacht zu schlagen.~
IF ~~ THEN EXTERN ~AC#DUN03~ where_is_hathar 
END

/*******************************************************************************************************
Sorni-Dialogue before departure to Torglor
*******************************************************************************************************/
BEGIN ~AC#SORN5~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_before_torglor_sorni
SAY ~<CHARNAME>, Ihr werdet bald nach Torglor aufbrechen. Ich wollte mich noch einmal für Eure Hilfe in der Arnschädelhalle bedanken.~
IF ~~ THEN REPLY ~Das habe ich sehr gerne getan.~ + 1
END

	IF ~~ THEN BEGIN 1
	SAY ~Es ist alles andere als selbstverständlich, dass Ihr solch große Taten für unsere Gemeinschaft tut.~
	IF ~~ THEN + 2
	END
	
		IF ~~ THEN BEGIN 2
		SAY ~Ich bin keine Zwergin der großen Worte. Hier, ich habe Euch etwas geschmiedet. Einen Plattenpanzer.~
		IF ~~ THEN DO ~GiveItemCreate("AC#PLAAD",Player1,0,0,0)~ + 3 
		END
		
			IF ~~ THEN BEGIN 3
			SAY ~Er ist aus einem besonderen Material geschmiedet, aus Adamant.~
			IF ~~ THEN REPLY ~Ist das nicht auch das Metall, aus dem die Drow Ihre Rüstungen herstellen?~ + drow_armor
			END
			
				IF ~~ THEN BEGIN drow_armor
				SAY ~Nein, was Ihr meint ist Adamantit, eine Legierung aus Adamant und anderen Metallen. Dieser Panzer hier besteht aus reinem Adamant. Es lässt sich sehr schwer verarbeiten, weil es sehr spröde ist. Der Schutz, den diese Rüstung bietet, ist auch nicht gerade überragend, doch das Material hat einen Vorteil: Es ist sehr leicht und extrem hitzebeständig.~
				IF ~~ THEN REPLY ~Ihr meint, es beschützt mich von Feuer?~ + prot_from_fire
				END
				
					IF ~~ THEN BEGIN prot_from_fire
					SAY ~Genau. Bei all den Gefahren, die auf Euch lauern, könnten feuerspeiende Wesen die weitaus Größte sein. Ich dachte mir, ich schmiede Euch eine Rüstung, die leicht zu tragen ist und Euch zuverlässig vor diesem Element beschützt.~
					IF ~~ THEN REPLY ~Das ist sehr großzügig von Euch, Danke!~ + thanks
					END
					
						IF ~~ THEN BEGIN thanks
						SAY ~Ach, wisst Ihr, ich möchte einfach, dass Ihr wieder gut zurückkommt. Und jetzt gehe ich lieber wieder in meine Schmiede, bevor ich noch sentimental werde. Passt auf Euch, <CHARNAME>!~
						IF ~~ THEN DO ~EscapeAreaObject("TrACIL51")~ EXIT
						END

/*******************************************************************************************************
Anthan-Dialogue after destruction of Arnskull Hall
*******************************************************************************************************/
BEGIN ~AC#ANT03~

IF ~~ THEN BEGIN 2
SAY ~Die Scheusale haben sich zurückgezogen. Die Verteidiger der Speichenbrunnenzitadellen haben ihren Angriffen standgehalten. Der Ratssaal ist teilweise zerstört, doch der König ist wohlauf - soweit man dies von seinem jetzigen Zustand behaupten kann.~
IF ~~ THEN EXTERN ~AC#DUN03~ 5
END

IF ~~ THEN BEGIN 3
SAY ~Jetzt bleibt auch keine Zeit für Zwistigkeiten. Lasst uns die Schäden begutachten und die weiteren Schritte planen. Sorni, Eure Schmiede könnte in den heiligen Hallen Moradins vorübergehend wieder aufgebaut werden, bis wir Euch eine neue Halle erbaut haben.~
IF ~~ THEN EXTERN ~AC#SORN3~ 6
END

IF ~~ THEN BEGIN 4
SAY ~Die Götter haben uns in den letzten Stunden gelehrt, dass wir nur überleben, wenn wir stärker zusammenhalten.~
=
~Und auch Fremde bei uns willkommen heißen, denn sie könnten uns einmal das Leben retten. <CHARNAME>, auch von mir gebührt Euch mein aufrichtigster Dank. Ich war Anfangs nicht sehr gerecht zu Euch, und dafür entschuldige ich mich.~
++ ~Ich habe getan, was ich konnte. Doch wie geht es nun weiter?~ EXTERN ~AC#DUN03~ 15
END

IF ~~ THEN BEGIN 5
SAY ~Wir können es uns nicht leisten, dass wir uns hier in langen Diskussionen verlieren, *samman*!~
IF ~~ THEN EXTERN ~AC#DUN03~ 17
END

/*******************************************************************************************************
Anthan-Dialogue before departure to Charvekannathor's lair
*******************************************************************************************************/
BEGIN ~AC#ANT50~
IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_before_charvekannathor
SAY ~<CHARNAME>, gut dass Ihr kommt. Ich hatte Euch den Siegelstein gegeben, um zu dem Drachen zu gelangen. Doch ich möchte Euch noch etwas anderes auf diese gefährliche Mission mitgeben.~
IF ~~ THEN GOTO forged_weapon
END

					IF ~~ THEN BEGIN forged_weapon
					SAY ~Hier, ich habe eine Waffe geschmiedet, die dieser Bestie das Fürchten lehren sollte. Ich habe all mein Wissen, all meine lebenslange Erfahrung in die Erschaffung dieser Waffe gelegt, und ich denke, sie gehört zu den besten Stücken, die ich jemals geschmiedet habe.~
					IF ~~ THEN + 7
					END	
				
						IF ~~ THEN BEGIN 7
						SAY ~Es ist ein Hammer, die all den Zorn eines Vaters über seinen verlorenen Sohn in seinem Schaft trägt. Dies ist mein Geschenk an Euch. Tragt ihn mit Würde, <CHARNAME>, und möge er Euch in dem bevorstehenden Kampf ein treuer Gefährte sein.~
						IF ~~ THEN REPLY ~Das ist sehr großzügig von Euch, Anthan. Habt dank. Es ist mir eine Ehre, diese Waffe in Eurem namen zu führen.~ + 9
						IF ~~ THEN REPLY ~Ein Hammer? Mit dem kann ich aber nicht viel anfangen.~ + 8
						END

							IF ~~ THEN BEGIN 8
							SAY ~Ich bin sicher, dass Ihr eine Verwendung dafür finden werdet. Seht ihn als meinen Dank für Euren Einsatz an. Er gehört jetzt Euch - Ihr könnt über ihn verfügen, wie Ihr möchtet.~
							IF ~~ THEN + 9
							END	

									IF ~~ THEN BEGIN 9
								   SAY ~So. Das war der Grund, weshalb ich hier auf Euch gewartet habe. Nun möchte ich Euch nicht länger hinhalten. Auf Euch warten wichtige Schritte hinaus ins Ungewisse. Ich erwarte nicht, dass Ihr dem Drachen sofort gegenübertretet. Doch wenn Ihr auf die Bestie trefft, tötet sie im Namen meines Sohnes!~
								   IF ~~ THEN DO ~GiveItemCreate("AC#HAMAN",Player1,0,0,0) 								   								   
									ForceSpell(Myself,POOF_GONE)
									DestroySelf()~ EXIT
									END							
									
CHAIN IF ~~ THEN AC#ANT03 chain_anthan_sorni
~Das, was jetzt zählt: Die Scheusale haben sich zurückgezogen. Die Verteidiger der Speichenbrunnenzitadellen haben den Angriffen standgehalten. Der Ratssaal wurde teilweise zerstört, doch der König ist wohlauf - soweit man dies von seinem jetzigen Zustand behaupten kann.~
== AC#SORN3 ~Anthan? Ihr seid hier? Es tut gut, Euch als Priester Moradins jetzt an unserer Seite zu wissen.~
== AC#ANT03 ~Es ist keine Zeit mehr für alte Zwistigkeiten. Lasst uns die Schäden begutachten und die weiteren Schritte planen. Sorni, Eure Schmiede könnte in den heiligen Hallen Moradins vorübergehend wieder aufgebaut werden, bis wir Euch eine neue Halle erbaut haben.~
== AC#SORN3 ~Was für ein überraschender Vorschlag! Es wäre mir eine Ehre, Sornlinnor. Woher dieser plötzliche Sinneswandel?~
== AC#ANT03 ~Die Götter haben uns in den letzten Stunden gelehrt, dass wir nur überleben, wenn wir stärker zusammenhalten.~
== AC#ANT03 ~Und auch Fremde bei uns willkommen heißen, denn sie könnten uns einmal das Leben retten! <CHARNAME>, auch von mir gebührt Euch mein aufrichtigster Dank. Ich war Anfangs nicht sehr gerecht zu Euch, und dafür entschuldige ich mich.~
END 
IF ~~ THEN REPLY ~Das wurde aber auch Zeit.~ EXTERN ~AC#DUN03~ 18									
IF ~~ THEN REPLY ~Entschuldigung angenommen.~ EXTERN ~AC#DUN03~ 18									
IF ~~ THEN REPLY ~Jetzt, nachdem alles in Trümmern liegt und ich die Stadt gerettet habe kommt Ihr mir damit?~ EXTERN ~AC#DUN03~ 18									