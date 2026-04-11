
/*******************************************************************************************************
Dialog Lizard king
*******************************************************************************************************/
BEGIN ~AC#LIKI1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY ~Ihr wandelt auf vergessenen Schuppen. Tief unten... ruht er noch. Der Verzehrer der Häute... Kalzareinad! Er mag es nicht, gestört zu werden. Vor allem nicht von einem Wesen mit warmem Blut!~
  IF ~~ THEN REPLY ~Ihr redet wirres Zeug, Kreatur.~ GOTO hostile
  IF ~~ THEN REPLY ~Kalzareinad? Was verbirgt sich hier unten?~ GOTO hostile
  IF ~~ THEN REPLY ~Tretet beiseite, oder ich werde Euch erschlagen.~ GOTO hostile
END

IF ~~ THEN BEGIN hostile
  SAY ~Sein Zorn kriecht bereits durch euer Fleisch. Sterbt und nährt Ihn weiter!~
  IF ~~ THEN DO ~Enemy()~ EXIT
END


/*******************************************************************************************************
Dialog Nuzam
*******************************************************************************************************/

BEGIN ~AC#NUZAM~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY  ~B-bitte t-t-tut mir n-nichts, F-fremde!~
++ ~Wer seid Ihr?~ + who_are_you
END

	IF ~~ THEN BEGIN who_are_you
	SAY ~I-ich b-b-bin Nuzam... Ich habe mit hier v-vor d-d-diesen f-fürchterlichen E-echsen versteckt, die mich geschnappt haben. Aber ich k-konnte m-mich befreien.~
	++ ~Ihr seid aber wohl in die falsche Richtung davongelaufen, oder gibt es hier unten einen Ausgang?~ + 3
	IF ~~ THEN REPLY ~Warum seid Ihr dann noch hier?~ + 3
	END

		IF ~~ THEN BEGIN 3
		   SAY ~D-d-das war mein Problem. Ich stecke hier in diesem scheußlichen Tempel fest. S-sagt, Fremde, ist es sicher dort droben? K-kann ich jetzt gehen? L-lasst Ihr m-mich laufen?~
		++ ~Erzählt mir erst etwas über diesen Tempel hier.~ + tell_me_about_temple
		++ ~Mit welchen Gefahren muss ich hier noch rechnen?~ + what_dangers
		++ ~Ja, Ihr könnt gehen. Passt aber auf, dass Ihr Euch nicht wieder einfangen lasst!~ + go_away
		END
		
			IF ~~ THEN BEGIN tell_me_about_temple
			SAY ~Dies ist ein alter Drachentempel. Er ist einem uralten Drachengott geweiht, den ich nicht kenne. Dieser riesige Schacht unweit von hier scheint zu einer alten Beschwörungskammer zu führen. Ich hörte, wie die Echsenmenschen die ganze Zeit versuchten, ihre fürchterliche Gottheit anzurufen! Sie riefen immer diesen Namen - Kalzareinad. Glücklicherweise hat niemand geantwortet. Nach allem, was ich mitbekommen habe, war dieser Gott ein Hüter finsterer Magie. Der König der Echsenmenschen sprach immer davon, ewiges Leben zu erlangen, sollte ihm dieser Kalzareinad gewogen sein.~
			IF ~~ THEN + what_else
			END
			
			IF ~~ THEN BEGIN what_dangers
			SAY ~Hier unten ist es relativ sicher. Auch in der Kammer darunter ist kein Echsenvolk mehr, da sie alle ausgeschwärmt sind, um irgendwelche merkwürdigen Kristalle zu suchen.~
			IF ~~ THEN + what_else
			END

			IF ~~ THEN BEGIN what_else
			SAY ~Wollt Ihr sonst noch etwas wissen? D-darf ich j-jetzt gehen?~
			++ ~Erzählt mir erst etwas über diesen Tempel hier.~ + tell_me_about_temple
			++ ~Mit welchen Gefahren muss ich hier noch rechnen?~ + what_dangers
			++ ~Ja, Ihr könnt gehen. Passt aber auf, dass Ihr Euch nicht wieder einfangen lasst!~ + go_away
			END			
		
			IF ~~ THEN BEGIN go_away
			SAY ~Oh, Danke! Dies werde ich Euch nie vergessen! Ach - bevor ich es vergesse - ich hatte einen der seltsamen Kristalle, den die Echsenmenschen suchten, an mich genommen.  Vielleicht ist er Euch noch zu etwas nütze. Tymora lächelt heute auf mich herab, möge Lathander Euch dafür segnen, Fremde!~
			IF ~~ THEN DO ~GiveItemCreate("AC#P01",LastTalkedToBy,1,0,0)
			EscapeArea()~  EXIT
			END	
			