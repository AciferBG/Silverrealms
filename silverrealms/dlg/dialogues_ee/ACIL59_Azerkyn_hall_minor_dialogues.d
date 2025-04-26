// ---------------------------------------------
// Watermaster
// ---------------------------------------------

BEGIN ~AC#59DW2~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY ~Seid gegrüßt, <RACE>!~
++ ~Was macht Ihr hier?~ + i_am_the_watermaster
++ ~Ich muss weiter.~ + bye
END

	IF ~~ THEN BEGIN i_am_the_watermaster
	SAY ~Ich bin der Wassermeister. Meine Aufgabe ist es, den Wasserdruck hier in der Halle zu überwachen, damit nichts kaputtgeht.~
	++ ~Was ist das für eine große runde Tür hier?~ + plug
	++ ~Wie dem auch sei. Ich lasse Euch bei Eurer Aufgabe einmal wieder allein.~ + bye
	END
	
		IF ~~ THEN BEGIN plug
		SAY ~Das? Das ist die Wasserpforte. Wir haben hier einen Zugang zum Dhalnadar-Fluss gegraben, der oben durch die Stadt fließt. Damit speisen wir die vielen Rohre, die hier durch die Halle laufen und mit dem Wasserdruck die Öfen antreiben.~
		++ ~Ist solch ein... Stöpsel nicht gefährlich?~ + dangerous
		++ ~Eine gute Idee. Ich lasse Euch bei Eurer Aufgabe einmal wieder allein.~ + bye
		END
		
			IF ~~ THEN BEGIN dangerous
			SAY ~Nun ja, solange man ihn nicht ganz aufmacht eigentlich nicht.~
			++ ~Genau das ist in einer Mine, die ich kenne, aber passiert.~ + dumbass
			END
			
				IF ~~ THEN BEGIN dumbass
				SAY ~Was? Was für ein Idiot muss das denn gewesen sein, der den Stöpsel dort entfernt hat?~
				++ ~Wie dem auch sei. Ich lasse Euch bei Eurer Aufgabe einmal wieder allein.~ + bye
				END
				
					IF ~~ THEN BEGIN bye
					SAY ~Tut das.~
					IF ~~ THEN EXIT
					END
					
// ---------------------------------------------
// Dwarf#3, in front of the portal
// ---------------------------------------------

BEGIN ~AC#59DW3~

	IF ~~ THEN BEGIN wait
	SAY ~...und seit drei Jahren muss ich mir hier ständig dein Gejammer anhören, Handrig! Jetzt komm schon, wir haben Wichtigeres zu tun, als dem Klang dieses Tores zuzuhören!~
	IF ~~ THEN DO ~EscapeArea()
	ActionOverride("AC#59DW4",EscapeArea())~
	EXIT
	END
// ---------------------------------------------
// Dwarf#4, in front of the portal
// ---------------------------------------------

BEGIN ~AC#59DW4~


// Chain #1: two dwarves in front of the portal
CHAIN IF WEIGHT #-1 ~NumTimesTalkedTo(0)~ THEN AC#59DW4 chain_fear_portal
~Verdammt, hört Ihr das, Hughar? Da ist das Geräusch schon wieder!~
== AC#59DW3 ~Jetzt mach dir mal nicht gleich in den Bart, Handrig!~
== AC#59DW4 ~Ja, aber was, wenn auf der anderen Seite von dieser... Pforte etwas versucht, zu uns durchzubrechen? Kein Zwerg Iltkazars weiß, wohin dieses Tor überhaupt führt!~
== AC#59DW3 ~Die alten Azerkyn werden sich was dabei gedacht haben, als sie das Tor und die Runen dort angebracht haben, auch wenn ihr Clan schon lange verschwunden ist.~
== AC#59DW4 ~...aber sieh' doch selbst, die Runen werden von Jahr zu Jahr schwächer!~
== AC#59DW3 ~Tja...wir müssen eben auf den König warten, bis wir die Runen wieder erneuern können.~
== AC#59DW4 ~Seit drei Jahren warten wir schon, bis er wieder erwacht und sehen zu, wie die Schutzrunen weniger leuchten!~
END
IF ~~ THEN EXTERN ~AC#59DW3~ wait

CHAIN IF ~True()~ THEN AC#59DW4 hello_again
~Mit gefällt dieses Tor nicht. Aber wir brauchen es, verströmt es doch die Hitze, die wir brauchen, um die Öfen zu betreiben.~
EXIT

// ---------------------------------------------
// Dwarf#5, oremaster
// ---------------------------------------------

BEGIN ~AC#59DW5~

IF ~Global("OreJob","ACIL59",10)~ THEN BEGIN hello_again_02
SAY ~Jetzt ist hier wieder alles schön sauber und geordnet.~
IF ~~ THEN EXIT
END

IF ~NumTimesTalkedToGT(0)~ THEN BEGIN hello_again
SAY ~So eine Sauerei mit diesem ganzen Erz!~
++ ~Ich lasse Euch mit diesem Problem lieber alleine.~ + leave_you_alone_bye
IF ~Global("OreJob","ACIL59",0)~ THEN REPLY ~Was ist passiert?~ + what_happened
IF ~Global("OreJob","ACIL59",1)~ THEN REPLY ~Wegen des Erzes...~ + finished
END

	IF ~~ THEN BEGIN finished
	SAY ~Ja, was ist damit?~
	++ ~Ach, nichts.~ + leave_you_alone_bye
	++ ~Was soll ich mit dem Erz noch einmal tun?~ + about_ore_once_more
	++ ~Ich glaube, ich habe alles sortiert.~ + done_it
	END
	
		IF ~~ THEN BEGIN about_ore_once_more
		SAY ~Ihr sollt das Adamant aus den Mithrilhaufen und das Mithril aus den Adamanthaufen aussortieren. Dann sollt Ihr in jeden Mithrilhaufen ein Stückchen Mithril einsortieren, und in jeden Adamanthaufen ein Stückchen Adamant.~
		++ ~Nun gut. Bis später.~ + leave_you_alone_bye
		++ ~Ich glaube, ich habe alles sortiert.~ + done_it
		END
	
		IF ~~ THEN BEGIN done_it
		SAY ~Lasst mal sehen...~
		IF ~!PartyHasItem("AC#S#ORE")
		Global("PlacedOre","ACIL59",0)~ THEN + failure
		IF ~!PartyHasItem("AC#S#ORE")
		Global("PlacedOre","ACIL59",1)~ THEN + fulfilled
		IF ~PartyHasItem("AC#S#ORE")
		Global("ZardazilJob","ACIL59",0)~ THEN DO ~SetGlobal("ZardazilJob","ACIL59",1)~ + take_zardazil
		END
		
		IF ~~ THEN BEGIN take_zardazil
		SAY ~Also, das Zardazil nehme ich Euch gleich einmal ab.~
		IF ~~ THEN DO ~TakePartyItem("AC#S#ORE")~ + lets_see_02
		END
		
		IF ~~ THEN BEGIN lets_see_02
		SAY ~So. Jetzt zum Erz.~
		IF ~~ THEN + done_it
		END
		
			IF ~~ THEN BEGIN failure
			SAY ~Da ist ja noch alles durcheinander! Ihr sollt das Adamant zum Adamant und das Mithril zum Mithril tun, ist das so schwer? Kommt wieder, wenn Ihr es sortiert habt!~
			IF ~~ THEN EXIT
			END
			
			IF ~~ THEN BEGIN fulfilled
			SAY ~Das sieht ganz gut aus. Naja, war ja auch nicht allzu schwer. Aber trotzdem nicht schlecht für einen <RACE> von der Oberfläche! Werd' den anderen erzählen, dass mir einer von Euch beim Erzsortieren geholfen hat.~
			IF ~~ THEN DO ~IncrementGlobal("AC_Iltkazar_Reputation","GLOBAL",1)
			SetGlobal("OreJob","ACIL59",10)
			EraseJournalEntry(@59200)
			AddJournalEntry(@59201,QUEST_DONE)
			AddexperienceParty(500)
			DisplayStringNoName(Player1,@1021)~EXIT
			END
	
IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY ~Herrje, jetzt haben die von oben wieder zuviel Erz nach unten geschüttet und jetzt ist erneut alles durcheinander!~
++ ~Ich lasse Euch mit diesem Problem lieber alleine.~ + leave_you_alone_bye
++ ~Was ist passiert?~ + what_happened
END

	IF ~~ THEN BEGIN what_happened
	SAY ~Na, wir haben hier auf dieser Seite eigentlich nur zwei verschiedene Erzsorten. Das schwarze Zeug ist Adamant und das Silberne ist Mithril. Das füllen wir in unsere Schmelzöfen und machen schöne Legierungen daraus, indem wir genau festgelegte weitere Bestandteile hinzufügen. Nur nicht alles durcheinander! Und jetzt liegen zwischen dem Mithrilerz lauter schwarze Adamantbrocken und umgekehrt. Und da hinten, da sehe ich es rötlich funkeln! Da hat wohl einer von oben aus lauter Unachtsamkeit Zardazil dazugekippt! Und ich stehe hier und muss den ganzen Kram wieder trennen. Nur, weil die drüben in der Erzgrube gestern wieder zu tief in den Humpen geschaut haben!~
	++ ~Was ist daran so schwer, das verschiedene Erz wieder zu sortieren?~ + grade_ore
	++ ~Ich lasse Euch mit diesem Problem lieber alleine.~ + leave_you_alone_bye
	END
	
		IF ~~ THEN BEGIN grade_ore
		SAY ~Also wenn Ihr so schlau seid könnt Ihr das gerne mal versuchen!~
		++ ~In Ordnung. Was muss ich machen?~ + what_to_do
		++ ~Ich lasse Euch mit diesem Problem lieber alleine.~ + leave_you_alone_bye
		END
		
			IF ~~ THEN BEGIN what_to_do
			SAY ~Das Mithril muss aus dem Haufen Adamant aussortiert werden, und das Adamant aus dem Mithrilhaufen. Und wenn Ihr irgendwo Zardazil entdeckt, lasst es ganz draußen, das hat hier auf meiner Seite gar nichts zu suchen. Zardazil sollt Ihr mir bringen.~
			=
			~Im nächsten Schritt sollt Ihr in jeden Mithrilhaufen ein Stückchen Mithril einsortieren, und in jeden Adamanthaufen ein Stückchen Adamant.~
			++ ~Wie kann ich die verschiedenen Erze unterscheiden?~ + distinct
			++ ~Das klingt einfach. Ich werde es machen.~ + lets_do_it
			++ ~Ich lasse Euch mit diesem Problem lieber alleine.~ + leave_you_alone_bye
			END
			
			IF ~~ THEN BEGIN distinct
			SAY ~Was für eine Frage! Das lernt bei uns schon jedes Kind, bevor es richtig seinen Löffel halten kann! Mithril ist silbrig, Adamant schwarz, und Zardazil ist rotbraun. Wir Zwerge hier könnten die Erze mit verbundenen Augen unterscheiden, aber wenn Ihr genau hinguckt, werdet selbst Ihr den Unterschied entdecken.~
			++ ~Das klingt einfach. Ich werde es machen.~ + lets_do_it
			++ ~Ich lasse Euch mit diesem Problem lieber alleine.~ + leave_you_alone_bye
			END
			
				IF ~~ THEN BEGIN lets_do_it
				SAY ~Da bin ich aber mal gespannt! Also bewegt Euch, ich warte hier.~
				IF ~~ THEN DO ~SetGlobal("OreJob","ACIL59",1)
				AddJournalEntry(@59200,QUEST)~
				EXIT
				END

	IF ~~ THEN BEGIN leave_you_alone_bye
	SAY ~Hab' Euch auch gar nicht um Hilfe gebeten! Bringt mir jetzt nicht noch zusätzlich was in Unordnung!~
	IF ~~ THEN EXIT
	END

// ---------------------------------------------
// Dwarf#6, fire elemental watcher
// ---------------------------------------------

BEGIN ~AC#59DW6~

IF ~Global("Fire_elemental","ACIL59",10)~ THEN BEGIN hello_quest_finished
SAY ~Noch einmal Danke, dass Ihr den *buhr-norogh* erledigt habt!~
IF ~~ THEN EXIT
END

IF ~Dead("AC#59FEL")~ THEN BEGIN thanks
SAY ~Danke, <RACE>! Ein *buhr-norogh* ist kein leichter Gegner. Die Kreaturen springen hier manchmal aus der Lava, aber so plötzlich habe ich das noch nie erlebt!~
IF ~~ THEN DO ~SetGlobal("Fire_elemental","ACIL59",10)
IncrementGlobal("AC_Iltkazar_Reputation","GLOBAL",1)
DisplayStringNoName(Player1,@1021)~
EXIT
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY ~*Marn*! Ein *buhr-norogh*!~
IF ~~ THEN DO ~SetGlobal("Fire_elemental","ACIL59",1)
CreateCreature("AC#59FEL",[1717.1647],0)
Attack("AC#59FEL")~
EXIT
END

IF ~True()~ THEN BEGIN hello_true
SAY ~Die Arbeit hier an den Lavaströmen ist ganz schön schweißtreibend!~
IF ~~ THEN EXIT
END
