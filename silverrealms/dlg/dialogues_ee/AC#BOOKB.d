

/*******************************************************************************************************
Dialogue Borthun's Book
*******************************************************************************************************/

BEGIN ~AC#BOOKB~


IF ~True()~ THEN BEGIN 1
SAY  ~Dies ist das Tagebuch von Borthun, dem Wanderer. Es enthält detaillierte Aufzeichnungen über jene Länder, die heute als Amn und Tethyr bekannt sind. Euch fällt auf, dass an einigen Stellen jemand anderes in einer eleganten Handschrift Anmerkungen darin gemacht hat. Nach einigem Lesen ist Euch klar, dass diese Anmerkungen von König Mith Barak stammen müssen.~
IF ~~ THEN REPLY ~Die Einleitung lesen.~ + book_prologue
IF ~~ THEN REPLY ~Den Eintrag über den Drachenfriedhof lesen.~ + stone_clans_parting
IF ~Global("AC#BettarghBookAstral","GLOBAL",10)~ THEN REPLY ~Die Niederschrift von Bettargh über die Astrale See lesen.~ + astral_sea
END

IF ~~ THEN BEGIN book_prologue
SAY ~"Für uns Zwerge aus dem Unterreich sind die Lande des Lichts eine seltsame Begegnung. Ohne schützende Höhlendecke über dem Kopf haben viele meiner Vettern Angst ob der unendlichen Weite des Himmels und der Gefahren, die dort lauern können. Mit diesem Buch möchte ich meinen *samman* die Angst vor der Oberfläche nehmen und ihnen die Schönheit dieses Ortes nahebringen. Wie eintönig ist doch das immergraue Leben unter der Erde, wenn man einmal den schönen Wechsel von der Nacht zum Tag miterlebt hat! Und Sorgen um ausreichend Nahrung muss man sich ebenfalls kaum machen, fällt doch in bestimmten Abständen reines Wasser sogar vom Himmel."~
IF ~~ THEN REPLY ~Den Eintrag über den Drachenfriedhof lesen.~ + stone_clans_parting
IF ~Global("AC#BettarghBookAstral","GLOBAL",10)~ THEN REPLY ~Die Niederschrift von Bettargh über die Astrale See lesen.~ + astral_sea
END

// NEW	
	IF ~~THEN BEGIN stone_clans_parting
	SAY ~Nach einigem Blättern findet Ihr tatsächlich Borthuns Eintrag zum Drachenfriedhof: "Der Drachenfriedhof liegt am Rande der Wolkengipfel an einer Gebirgskette, die nur als "der Grat" bezeichnet wird. Dieser Ort ist den Elfen heilig, denn dort erschlug Tethir, der erste Drachentöter, vor vielen Jahrtausenden zwei Rote Drachen."~
	IF ~~ THEN DO ~SetGlobal("AC#Clans_Parting","GLOBAL",4)
	EraseJournalEntry(@64103)
	AddJournalEntry(@64104,QUEST)
	RevealAreaOnMap("ACIL70")~ GOTO stone_clans_parting_02
	END
	
	
	IF ~~THEN BEGIN stone_clans_parting_02
	SAY ~Neben diesen Ausführungen ist auch eine Anmerkung von König Mith Barak zu erkennen: 
	"Dieser Ort könnte in der Nähe zu dem alten Drachentempel liegen, den ich so verzweifelt suche. Bei diesem muss immer noch das Standbild von Tethir, dem elfischen Drachentöter, zu finden sein. Wenn ich den Drachenfriedhof betrachte, könnte ich also Zugang zu der Stelle finden, an welcher der Elf Tethir die zwei roten Drachen erlegt hat, die den Eintritt in den Tempel bewachen sollten und damit meinem Ziel wieder ein wenig näher kommen. 
	-M.B."
	Es folgen noch weitere Ausführungen Mith Baraks, die die Geschichte der Elfen näher beleuchten. Wenn Ihr möchtet, könnt Ihr auch diese lesen.~
	++ ~Das Buch wieder zuschlagen.~ + close_book
	++ ~Mith Baraks weitere Ausführungen lesen.~ + mithbarak_clans_parting_02
	END
	
			IF ~~THEN BEGIN mithbarak_clans_parting_02
			SAY ~Ihr lest Mith Baraks Ausführungen weiter:
			"Die Geschichte zu dem Stein geht nach Borthuns Ausführungen noch weiter. Tethirs Standbild war einst der Ort des ersten Kampfes einer der niederen Rassen gegen die zu dieser Zeit die Welt dominierenden Drachen.~
			++ ~Das Buch wieder zuschlagen.~ + close_book
			END
				
		IF ~~THEN BEGIN close_book
		SAY ~Ihr schließt doch Buch wieder und verstaut es vorsichtig in Eurem Rucksack.~
		IF ~~ THEN DO ~
		~  EXIT
		END
		
		IF ~~THEN BEGIN astral_sea
		SAY ~Dies ist eine Zusammenfassung des Inhaltes von "Die Astrale See, ein Reisebericht in das Reich aus Silber von Maskyr dem Einäugigen".~
		IF ~~ THEN DO ~
		~  EXIT
		END
	
