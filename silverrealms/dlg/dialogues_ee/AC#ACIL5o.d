// ---------------------------------------------
// Neeritha Runescribe
// ---------------------------------------------

BEGIN ~AC#5ONEE~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
  SAY ~Seid gegrüßt, <PRO_RACE> von der Oberwelt! Es ist schön, hier unten auch jemand anderen als missmutige Zwerge, die ihre missmutigen Götter anbeten, zu Gesicht zu bekommen!~
  ++ ~Ihr verehrt hier unten einen Gott von der Oberfläche?~ + a_human_god
  ++ ~Gibt es Dienste, die Ihr hier in Eurem Tempel anbietet?~ + what_service
  IF ~Global("AC#Vronia_Quest","GLOBAL",5)~ THEN REPLY ~Vronia schickt mich mit einer Frage zu Euch.~ + vronia_quest_01
END

IF ~True()~ THEN BEGIN hello_again
  SAY ~Schön, Euch wiederzusehen! Was kann ich für Euch tun?~
	++ ~Ihr verehrt hier unten einen Gott von der Oberfläche?~ + a_human_god
	++ ~Zeigt mir, was Ihr anzubieten habt.~ + shop
	++ ~Im Moment nichts.~ + bye
  IF ~Global("AC#Vronia_Quest","GLOBAL",5)~ THEN REPLY ~Vronia schickt mich mit einer Frage zu Euch.~ + vronia_quest_01
  IF ~PartyHasItem("AC#ILBOG")~ THEN REPLY ~Ich habe das Buch von der Oberfläche für Euch besorgt.~ + have_oghma_book
END

		IF ~~ THEN BEGIN have_oghma_book
		SAY ~Wie schön! Großartig! Lasst einmal sehen...~
		IF ~~ THEN DO ~TakePartyItem("AC#ILBOG") DestroyItem("AC#ILBOG")~ GOTO have_oghma_book_02 
		END
		
			IF ~~ THEN BEGIN have_oghma_book_02
			SAY ~Einfach wunderbar! Vielen Dank! Ihr habt eine Gelehrte in ihren Hallen sehr glücklich gemacht.~
			=
			~Hier, ich gebe Euch zwei Schriftrollen, die wir in unserem Tempel aufbewahrt haben. Auch wenn ich manchmal ziemlich vergesslich bin denke ich, dass sie Euch auf Euren Abenteuern mehr von Nutzen sein könnten!~
			IF ~~ THEN DO ~SetGlobal("AC#ACIL5O_OghmaBook","GLOBAL",10)
			AddJournalEntry(@57110,QUEST_DONE)
			GiveItemCreate("AC#SC611",LastTalkedToBy,2,1,1)~ EXIT 
			END

	IF ~~ THEN BEGIN vronia_quest_01
	SAY ~Ein Mitglied des Regentschaftsrates lässt sich herab, einen *hurm* um seine Meinung zu fragen? Dann muss es wahrlich etwas Wichtiges sein.~
	++ ~Kennt Ihr Ellhimar, den Magier?~ + ellhimar_01
	END
	
		IF ~~ THEN BEGIN ellhimar_01
		SAY ~Natürlich. Als er vor einigen Jahren hier nach Iltkazar kam, war er sehr freundlich zu mir. Ich war so froh, endlich einen Gleichgesinnten in dieser Stadt gefunden zu haben! Er brachte mir einiges über die Verehrung Oghmas an der Oberfläche und der Welt der Menschen bei. Aber seit einiger Zeit ist er wie verändert.~
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
								SAY ~Irgendein Krieg, den die Zwerge Shanatars in einem vergangenen Zeitalter gegen die Dunkelelfen ausgefochten haben. Mehr weiß ich auch nicht.~
								++ ~Was könnte Ellhimar in den Spinnenschächten gesucht haben?~ + ellhimar_search_03
								END
								
									IF ~~ THEN BEGIN ellhimar_search_03
									SAY ~Das kann ich Euch nicht sagen. Er kam jedoch missmutig von seiner Unternehmung zurück. Anfangs führte ich dies auf seine erfolglose Suche zurück. Aber ich habe den Eindruck, dass er seine Suche seither gar nicht mehr fortgesetzt hat. Als hätte er das Interesse verloren, unserer Stadt zu helfen.~
									++ ~Habt Ihr noch irgendetwas anderes bei dem Magier bemerkt?~ + ellhimar_anything_else
									END
									
										IF ~~ THEN BEGIN ellhimar_anything_else
										SAY ~Leider nein. Er hilft uns Zwergen immer noch bei einigen Verzauberungen, aber ansonsten hat er sich aus dem Leben der Gemeinschaft vollständig zurückgezogen. Die Zwerge scheint es nicht zu stören, schließlich ist er ja eh' nur ein *hurm*, ein Mensch.~
											IF ~~ THEN 
											REPLY ~Ich danke Euch für diese Information.~ 
											DO ~SetGlobal("AC#Vronia_Quest","GLOBAL",6)
											AddJournalEntry(@50604,QUEST)~ GOTO ellhimar_thank_you
										END
										
										IF ~~ THEN BEGIN ellhimar_thank_you
										SAY ~Sehr gerne! Gibt es sonst noch etwas, das ich für Euch tun kann?~
										 ++ ~Gibt es Dienste, die Ihr hier in Eurem Tempel anbietet?~ + what_service
										 ++ ~Im Moment nichts.~ + bye
										END
		
	IF ~~ THEN BEGIN a_human_god
	SAY ~Ja, das ist wahrlich eine seltene Angelegenheit. Meine Familie hat bereits vor Jahrhunderten den Glauben an Oghma angenommen. Leider gelten die Verdienste, die meine Vorfahren für die Stadt bisher getan haben, unter uns Zwergen nicht besonders viel, weshalb ich ein Dasein am Rande des allgemeinen Lebens und der Stadt hier in meinem kleinen Tempel friste. Umso mehr freue ich mich, dass Ihr mich hier besucht! Ich habe schon viel über die Oberfläche gehört.~
	++ ~Ihr wart noch nie an der Oberfläche?~ + surface
	IF ~Global("AC#ACIL5O_Scrolls","GLOBAL",0)~ THEN REPLY ~Ich stamme aus Kerzenburg. Habt Ihr schon davon gehört?~ + hail_candlekeep
	++ ~Ich gehe dann wieder.~ + bye
	END

			IF ~~ THEN BEGIN surface
			  SAY ~Nein. Ich bin in Iltkazar geboren. Leider sehen die Zwerge meinen Glauben als eine lächerliche Abweichung von ihrer Norm an. Das soll aber nicht Eure Sorge sein. ~
			  ++ ~Gibt es Dienste, die Ihr hier in Eurem Tempel anbietet?~ + what_service
			  IF ~Global("AC#ACIL5O_Scrolls","GLOBAL",0)~ THEN REPLY ~Ich stamme aus Kerzenburg. Habt Ihr schon davon gehört?~ + hail_candlekeep
			  ++ ~Ich gehe dann wieder.~ + bye
			END
			
			IF ~~ THEN BEGIN hail_candlekeep
			  SAY ~Kerzenburg! Ein Name, der selbst in unseren tiefsten Hallen wie ein munteres Lied der Weisheit klingt. Solche Stätten, wo das Wissen gehütet wird wie ein kostbarer Schatz, nähren die Hoffnung, dass Verstand und Wort auch in dieser wandelbaren Welt Bestand haben. Möge Oghmas Hand stets über solchen Orten wachen!~
			  IF ~~ THEN GOTO hail_candlekeep_02
			END
			
				IF ~~ THEN BEGIN hail_candlekeep_02
				  SAY ~Danke, dass Ihr mir das erzählt habt! Hier, <BROTHERSISTER> des Wissens, ich gebe Euch einige Schriftrollen als Willkommensgeschenk.~
				  IF ~~ THEN DO ~SetGlobal("AC#ACIL5O_Scrolls","GLOBAL",1)
				  GiveItemCreate("SCRL75",LastTalkedToBy,5,1,1)~ GOTO oghma_job
				END
				
					IF ~~ THEN BEGIN oghma_job
					SAY ~Da fällt mir ein... Dürfte ich Euch um einen Gefallen bitten, solltet Ihr jemals wieder an der Oberfläche einen Tempel Oghmas betreten?~
					IF ~~ THEN REPLY ~Gerne, was kann ich in solch einem Tempel für Euch tun?~ GOTO oghma_job_02
					IF ~~ THEN REPLY ~Nein, für so etwas habe ich keine Zeit.~ + oghma_job_no		
					END
					
						IF ~~ THEN BEGIN oghma_job_02
						SAY ~Es heißt, an der Oberfläche gäbe es ein Buch, das in den Tempeln Oghmas so häufig ist wie Pilze in den feuchten Höhlen der Tiefe – ein Schatz an Weisheit, den jeder dort kennt. Hier jedoch, in den stillen Schatten des Unterreichs, ist solch ein Werk seltener als ein Stern am Höhlenhimmel. Wenn Ihr es finden könntet, wäre es ein Segen für unsere Hallen des Wissens.~
						IF ~~ THEN GOTO oghma_job_03
						END
						
							IF ~~ THEN BEGIN oghma_job_03
							SAY ~Das Buch trägt den ehrwürdigen Namen 'Die leisen Stimmen der Wahrheit', eine Sammlung alter Lehrsprüche, wie sie Oghma selbst in goldenen Zeiten geschenkt haben soll.~
							IF ~~ THEN REPLY ~In Ordnung, ich werde meine Augen nach diesem Buch offenhalten.~ GOTO oghma_job_yes
							IF ~~ THEN REPLY ~Nein, für so etwas habe ich keine Zeit.~ + oghma_job_no
							END
							
								IF ~~ THEN BEGIN oghma_job_yes
								SAY ~Ihr seid toll! Ich freue mich schon auf den Moment, das Buch meiner Sammlung hinzufügen zu können.~
								IF ~~ THEN DO ~SetGlobal("AC#ACIL5O_OghmaBook","GLOBAL",1)
								AddJournalEntry(@57100,QUEST)~ EXIT
								END
					
						IF ~~ THEN BEGIN oghma_job_no
						SAY ~Ganz wie Ihr wollt! ES war nur eine Frage.~
						IF ~~ THEN GOTO bye
						END

				IF ~~ THEN BEGIN what_can_i_do
				  SAY ~Was kann ich denn für Euch in meinem bescheidenen Tempel tun?~
				  ++ ~Gibt es Dienste, die Ihr hier in Eurem Tempel anbietet?~ + what_service
				  ++ ~Im Moment nichts.~ + bye
				  IF ~Global("AC#Vronia_Quest","GLOBAL",5)~ THEN REPLY ~Vronia schickt mich mit einer Frage zu Euch.~ + vronia_quest_01
				END

					IF ~~ THEN BEGIN what_service
					  SAY ~Ja, selbstverständlich! Für Heilung und Tränke sind die Tempel der Zwergengötter verantwortlich. Ich habe hier aber eine große Auswahl an Schriftrollen, die ich Euch anbieten könnte, wenn Ihr Interesse habt.~
						++ ~Zeigt mir, was Ihr anzubieten habt.~ + shop
					END

IF ~~ THEN BEGIN shop
  SAY ~Gerne! Seht Euch ruhig alles an.~
  IF ~~ THEN DO ~StartStore("ac#5oOGM",LastTalkedToBy(Myself))
~ EXIT
END

IF ~~ THEN BEGIN bye
	SAY ~Wenn Ihr etwas braucht, wisst Ihr, wo ich zu finden bin!~
	IF ~~ THEN DO ~~ EXIT
	END

