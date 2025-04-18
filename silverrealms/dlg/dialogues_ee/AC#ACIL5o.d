// ---------------------------------------------
// Neeritha Runescribe
// ---------------------------------------------

BEGIN ~AC#5ONEE~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
  SAY ~Seid gegrüßt, <PRO_RACE> von der Oberwelt! Es ist schön, hier unten auch jemand anderen als missmutige Zwerge zu Gesicht zu bekommen!~
  ++ ~Ein Mensch hier in der Stadt der Zwerge?~ + a_human
  ++ ~Gibt es Dienste, die Ihr hier in Eurem Tempel anbietet?~ + what_service
  IF ~Global("AC#Vronia_Quest","GLOBAL",5)~ THEN REPLY ~Vronia schickt mich mit einer Frage zu Euch.~ + vronia_quest_01
END

IF ~True()~ THEN BEGIN hello_again
  SAY ~Schön, Euch wiederzusehen! Was kann ich für Euch tun?~
	++ ~Ihr seid ein seltener Anblick inmitten der ganzen Zwerge.~ + a_human
	++ ~Zeigt mir, was Ihr anzubieten habt.~ + shop
	++ ~Im Moment nichts.~ + bye
  IF ~Global("AC#Vronia_Quest","GLOBAL",5)~ THEN REPLY ~Vronia schickt mich mit einer Frage zu Euch.~ + vronia_quest_01
END

	IF ~~ THEN BEGIN vronia_quest_01
	SAY ~Ein Mitglied des Regentschaftsrates lässt sich herab, einen *hurm* um seine Meinung zu fragen? Dann muss es wahrlich etwas Wichtiges sein.~
	++ ~Kennt Ihr Ellhimar, den Magier?~ + ellhimar_01
	END
	
		IF ~~ THEN BEGIN ellhimar_01
		SAY ~Natürlich. Als er vor einigen Jahren hier nach Iltkazar kam, war er sehr freundlich zu mir. Ich war so froh, endlich einen Gleichgesinnten in dieser Stadt gefunden zu haben! Aber seit einiger Zeit ist er wie verändert.~
		++ ~Wie meint Ihr das?~ + ellhimar_02
		END
	
			IF ~~ THEN BEGIN ellhimar_02
			SAY ~Er scheint sein Interesse an mir und meinen Büchern vollständig verloren zu haben. Während er mir vorher mindestens einmal wöchentlich einen Besuch abstattete, lässt er sich jetzt gar nicht mehr blicken. Richtig arrogant ist er geworden!~
			++ ~Woran könnte sein Verhalten liegen?~ + ellhimar_03
			END
			
				IF ~~ THEN BEGIN ellhimar_03
				SAY ~Das weiß ich nicht. Alles fing damit an, dass er nach einem Weg suchte, König Mith Barak zu erwecken.~
				++ ~Ellhimar wollte Mith Barak heilen?~ + ellhimar_search_02
				END
					
						IF ~~ THEN BEGIN ellhimar_search_02
						SAY ~Ja. Er ist ein mächtiger Magier und ein guter Mann. Ich glaube, er dachte, er würde ein paar Zaubersprüche wirken und alles wäre wieder gut. Aber so einfach war es nicht.~
						=
						~Er hat herausgefunden, dass Mith Barak selbst schon nach Wegen gesucht hatte, den Schlaf zu umgehen. Irgendeinen Hinweis schien er in den Spinnenschächten zu vermuten.~
							++ ~Die Spinnenschächte?~ + spiderstalkings
							++ ~Was könnte Ellhimar dort gesucht haben?~ + ellhimar_search_03
						END
						
							IF ~~ THEN BEGIN spiderstalkings
							SAY ~Die Spinnenschächte sind eine verlassene Zwergenmine nordwestlich von Iltkazar. Einst war es wohl so etwas wie ein Außenposten der Stadt, aber er wurde schon seit der Zeit der Nachtkriege aufgegeben.~
							++ ~Was waren die Nachtkriege?~ + nightwars
							END
							
								IF ~~ THEN BEGIN nightwars
								SAY ~Irgendein Krieg, den die Zwerge Shanatars in einem vergangenen Zeitalter gegen die Dunkelelfen ausgefochten haben. Mehr weiß ich auch nicht. Darüber solltet Ihr mit Bettargh Abgrundlied in der Halle der Runensteine, der großen Bibliothek Dugmarens im Nordosten der Stadt, reden.~
								++ ~Was könnte Ellhimar in den Spinnenschächten gesucht haben?~ + ellhimar_search_03
								END
								
									IF ~~ THEN BEGIN ellhimar_search_03
									SAY ~Das kann ich Euch nicht sagen. Er kam jedoch missmutig von seiner Unternehmung zurück. Anfangs führte ich dies auf seine erfolglose Suche zurück. Aber ich habe den Eindruck, dass er seine Suche seither gar nicht mehr fortgesetzt hat. Als hätte er das Interesse verloren, unserer Stadt zu helfen.~
									++ ~Habt Ihr noch irgendetwas anderes bei dem Magier bemerkt?~ + ellhimar_anything_else
									END
									
										IF ~~ THEN BEGIN ellhimar_anything_else
										SAY ~Leider nein. Er hilft den Zwergen immer noch bei einigen Verzauberungen, aber ansonsten hat er sich aus dem Leben der Gemeinschaft vollständig zurückgezogen. Die Zwerge scheint es nicht zu stören, schließlich ist er ja eh' nur ein *hurm*, ein Mensch.~
											IF ~~ THEN 
											REPLY ~Ich danke Euch für diese Information.~ 
											DO ~SetGlobal("AC#Vronia_Quest","GLOBAL",6)
											EraseJournalEntry(@50603)
											AddJournalEntry(@50604,QUEST)~ 
											GOTO ellhimar_thank_you
										END
										
										IF ~~ THEN BEGIN ellhimar_thank_you
										SAY ~Sehr gerne! Gibt es sonst noch etwas, das ich für Euch tun kann?~
										 ++ ~Gibt es Dienste, die Ihr hier in Eurem Tempel anbietet?~ + what_service
										 ++ ~Im Moment nichts.~ + bye
										END
		
	IF ~~ THEN BEGIN a_human
	SAY ~Ja, das ist wahrlich ein seltener Anblick. Meine Familie hat sich bereits vor Jahrhunderten in dieser Stadt niedergelassen. Leider gelten die Verdienste, die meine Familie für die Stadt bisher getan hat, unter den Zwergen nicht viel, weshalb ich ein Dasein am Rande des allgemeinen Lebens und der Stadt hier in meinem kleinen Tempel friste. Umso mehr freue ich mich, dass Ihr mich hier besucht! Ich habe schon viel über die Oberfläche gehört.~
	++ ~Ihr wart noch nie an der Oberfläche?~ + surface
	END

			IF ~~ THEN BEGIN surface
			  SAY ~Nein. Ich bin in Iltkazar geboren. Mein größter Traum wäre jedoch, die Lande unter der Sonne zu bereisen. Aber dazu müsste unser König hier erst einmal wieder aus seinem Schlaf erwachen. Das soll aber nicht Eure Sorge sein. ~
			  IF ~~ THEN GOTO what_can_i_do
			END

				IF ~~ THEN BEGIN what_can_i_do
				  SAY ~Was kann ich denn für Euch tun?~
				  ++ ~Gibt es Dienste, die Ihr hier in Eurem Tempel anbietet?~ + what_service
				  ++ ~Im Moment nichts.~ + bye
				  IF ~Global("AC#Vronia_Quest","GLOBAL",5)~ THEN REPLY ~Vronia schickt mich mit einer Frage zu Euch.~ + vronia_quest_01
				END

					IF ~~ THEN BEGIN what_service
					  SAY ~Ja, selbstverständlich! Für Heilung und Tränke sind die Tempel der Zwerge verantwortlich. Ich habe hier aber eine große Auswahl an Schriftrollen, die ich Euch anbieten könnte, wenn Ihr Interesse habt.~
						++ ~Zeigt mir, was Ihr anzubieten habt.~ + shop
					END

IF ~~ THEN BEGIN shop
  SAY ~Gerne! Seht Euch ruhig alles an.~
  IF ~~ THEN DO ~StartStore("ac#5oOGM",LastTalkedToBy(Myself))
~ EXIT
END

IF ~~ THEN BEGIN bye
	SAY ~Gut. Wenn Ihr etwas braucht, wisst Ihr, wo ich zu finden bin!~
	IF ~~ THEN DO ~~ EXIT
	END

