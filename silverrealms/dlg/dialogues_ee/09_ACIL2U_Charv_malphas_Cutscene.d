/*******************************************************************************************************
Dialogue in sewers
*******************************************************************************************************/

// Tiamat
BEGIN ~AC#2UCHA~

//Malphas
BEGIN ~AC#2UMAL~

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#2UCHA hello_charv
						~Argh... verfluchter <PRO_RACE>! Schon lange haben Wunden nicht mehr so geschmerzt wie von dieser Begegnung...~
						= ~Halt! Wer da? Wer wagt es, sich in den Hort des ehrwürdigen Charvekannathor hineinzuschleichen?~						
						END
						IF ~~ THEN DO ~StartCutSceneMode()
						Face(SW)
						CreateCreature("AC#2UMAL",[917.762],NW)
						ActionOverride("AC#2UMAL",StartDialogueNoSet("AC#2UCHA"))~ EXIT


CHAIN IF ~True()~ THEN AC#2UMAL hello_Malphas
						~Seid gegrüßt, Roter. Wie ich sehe, leckt Ihr noch immer Eure Wunden. Hat der Kampf gegen drei Zwerge Euch derart mitgenommen?~ [AC#ILMAA]
						== AC#2UCHA ~Malphas, durchdrungener Teufel! Wagt es nicht, Euch über mich lustig zu machen!~ 
						== AC#2UMAL ~Ich möchte nur mein Bedauern über Euren mühsam errungenen Sieg zum Ausdruck bringen. Und Euch mitteilen, dass unsere Herrin sehr genau Euren Fortschritt beobachtet, das Zwergenreich von jeglicher Hilfe abzuschotten.~
						== AC#2UCHA ~Solange *Eure* Herrin in ihrem elenden Gefängnis weilt, diene ich lediglich freiwillig, Malphas. Vergesst das nicht.~
						== AC#2UMAL ~Wir arbeiten an ihrer Befreiung, seid Euch dessen gewiss. Unser Plan benötigt nur noch etwas Zeit. Doch sagt, wie konnten drei Zwerge Euch derart demütigen?~
						== AC#2UCHA ~Die Zwerge hatten sich der Hilfe eines Oberflächenbewohners versichert. Ein <PRO_RACE> aus Kerzenburg.~
						== AC#2UMAL ~Aus Kerzenburg? Das ist schlecht. Womöglich findet die Zwergenstadt doch noch eine Möglichkeit, ihren verfluchten König zu retten! Wie hieß dieser <PRO_RACE>?~
						== AC#2UCHA ~<CHARNAME>.~
						== AC#2UMAL ~<CHARNAME>? Gut. Ich werde unsere Verbündeten anweisen, die Umgebung der Zwergenstadt nach diesem <PRO_RACE> auszukundschaften. Wisst Ihr, welchen Weg sie in die Stadt genommen haben könnten?~
						== AC#2UCHA ~Nein. Meines Wissens gibt es keinen Weg in die Zwergenstadt - außer dem Weg, den ich hier bewache!~
						== AC#2UMAL ~Tut das auch weiterhin. Nur mit ein wenig mehr Erfolg! Ich werde zur Herrin zurückkehren und über unseren Fortschritt berichten.~
						== AC#2UMAL ~Soll ich Euch einige Kleriker ihres Glaubens schicken, um Eure Wunden zu heilen?~
						== AC#2UCHA ~Ganz gewiss nicht! Erspart mir diese Demütigung, Rabengesicht. Und jetzt verschwindet aus meinem Hort!~
						END
						IF ~~ THEN DO ~StartCutSceneMode()
						StartCutScene("AC#2UCT3")~ EXIT
						
						