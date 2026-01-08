

/*******************************************************************************************************
Dialog Sorni in Iltkazar, Quest-Start
*******************************************************************************************************/
BEGIN ~AC#59DW1~

BEGIN ~AC#SORN1~

IF ~Global("AC#BoatTest","ACIL59",1)~THEN BEGIN hello_step_on_boat_that_one
SAY ~Nun macht schon, stellt Euch endlich auf das Boot mit den leeren Kipploren direkt gegenüber von mir! Ich warte!~
IF ~~ THEN EXIT
END

IF ~Global("AC#RC_Sorni_Fourth","GLOBAL",1)
Global("AC#BoatTest","ACIL59",2)~THEN BEGIN boat_that_works
	SAY ~Ja, das wird funktionieren. Wir haben entsprechende Materialien sogar da. Wo soll ich den Kahn hinbringen?~
	IF ~~ THEN REPLY ~Auf diesen Platz in Iltkazar.~ + place_of_bhaerynden
	END
	
	IF ~~THEN BEGIN place_of_bhaerynden
	SAY ~Auf den Platz von Bhaerynden? In Ordnung. Es wird nicht lange dauern, in Metallverarbeitung kenne ich mich aus!~
	IF ~~ THEN DO ~EraseJournalEntry(@62040)
	AddJournalEntry(@62041,QUEST)
	SetGlobal("AC#RC_Sorni_Fourth","GLOBAL",2)
	~  EXIT
	END
	
IF ~Global("AC#RC_Sorni_Fourth","GLOBAL",1)
Global("AC#BoatTest","ACIL59",0)~THEN BEGIN you_again
	SAY ~Ihr schon wieder? Ihr scheint Euch ja hier unten richtig heimisch zu fühlen. Also, bald biete ich Euch einen Platz als Gießer an einem der Hochöfen an, <CHARNAME>!~
	IF ~Global("AC#HizagkuurQuest","GLOBAL",1)~ THEN REPLY ~Ich bräuchte etwas Hizagkuur-Erz.~ + need_hizagkuur_01
	IF ~PartyHasItem("AC#HIZA1")
	GlobalGT("AC#HizagkuurQuest","GLOBAL",1)~ THEN REPLY ~Ich habe hier etwas Hizagkuur-Erz.~ + here_is_hizagkuur
	IF ~~ THEN REPLY ~Wir bräuchten eines Eurer Boote.~ + need_one_of_boats
	END
	
	IF ~~THEN BEGIN need_one_of_boats
	SAY ~Was? Warum das denn?~
	++ ~Wir müssen damit den See im Osten Iltkazars überqueren.~ + boats_not_suited
	END
	
		IF ~~THEN BEGIN boats_not_suited
		SAY ~Dafür sind diese Boote aber nicht gemacht. Sie bestehen aus Eisen. Ihr würdet untergehen wie ein Stein im Wasser.~
		++ ~Könntet Ihr sie nicht ein wenig leichter machen?~ + why_cross_lake
		++ ~Ich muss aber über diesen See. Für Eure Stadt.~ + why_cross_lake
		END
		
			IF ~~THEN BEGIN why_cross_lake
			SAY ~Warum wollt Ihr den See denn überhaupt überqueren?~
			++ ~Wir wollen nach Barakuir reisen.~ + barakuir_boat
			END
			
				IF ~~THEN BEGIN barakuir_boat
				SAY ~Barakuir? Also entweder seid Ihr verrückt oder... Nun ja. Hmm, lasst mich einmal kurz überlegen.~
				++ ~Könnte man nicht einfach Holz nehmen?~ + barakuir_boat_use_wood_instead
				++ ~Lasst Euch durch mich dabei nicht stören.~ + have_idea
				END
				
					IF ~~THEN BEGIN barakuir_boat_use_wood_instead
					SAY ~Holz ist der seltenste Rohstoff im ganzen Unterreich, insbesondere jetzt, da die Verbindungen zur Oberfläche gekappt sind. Nein, wir müssen uns etwas anderes einfallen lassen.~
					  IF ~~ THEN + have_idea
					END
					
						IF ~~THEN BEGIN have_idea
						SAY ~Wir könnten das Metall so dünn wie möglich gestalten. In der jetzigen Form schützt es vor der Hitze der Lava, aber das ist im Wasser ja nicht nötig.~
						IF ~~ THEN + make_boat
						END
						
							IF ~~THEN BEGIN make_boat
							SAY ~Ja, ich denke, das könnte klappen. Könntet Ihr Euch bitte einmal auf dieses Boot da stellen?~
							++ ~Ihr meint auf das, das da Mitten in der Lava schwimmt?~ + step_on_boat
							++ ~Welches Boot?~ + step_on_boat_that_one
							END
							
							IF ~~THEN BEGIN step_on_boat
							SAY ~Ja, genau!~
							IF ~~ THEN GOTO step_on_boat_that_one
							END

							IF ~~THEN BEGIN step_on_boat_that_one
							SAY ~Das mit den leeren Kipploren darauf. Dann sehe ich, wie wir das austarieren müssen.~
							IF ~~ THEN DO ~SetGlobal("AC#BoatTest","ACIL59",1)
							TriggerActivation("AC#59TR1",TRUE)
							~  EXIT
							END
	
IF ~Global("AC#Vronia_Quest","GLOBAL",7)~THEN BEGIN all_idiots
	SAY ~*Seufz* Warum hat mich der Allvater mit solchen Idioten bestraft? Na, was wollt Ihr denn von mir?~
	IF ~~ THEN REPLY ~Vronia schickt mich mit einer ungewöhnlichen Bitte zu Euch.~ + lure_ellhimar
	IF ~Global("AC#HizagkuurQuest","GLOBAL",1)~ THEN REPLY ~Ich bräuchte etwas Hizagkuur-Erz.~ + need_hizagkuur_01
	IF ~PartyHasItem("AC#HIZA1")
	GlobalGT("AC#HizagkuurQuest","GLOBAL",1)~ THEN REPLY ~Ich habe hier etwas Hizagkuur-Erz.~ + here_is_hizagkuur
	++ ~Wer seid Ihr?~ + who_are_you
	END
	
IF ~True()~ THEN BEGIN 0
SAY  ~Hallo. Braucht Ihr was?~
IF ~Global("AC#Vronia_Quest","GLOBAL",7)~ THEN REPLY ~Vronia schickt mich mit einer ungewöhnlichen Bitte zu Euch.~ + lure_ellhimar
IF ~Global("AC#HizagkuurQuest","GLOBAL",1)~ THEN REPLY ~Ich bräuchte etwas Hizagkuur-Erz.~ + need_hizagkuur_01
IF ~PartyHasItem("AC#HIZA1")
GlobalGT("AC#HizagkuurQuest","GLOBAL",1)~ THEN REPLY ~Ich habe hier etwas Hizagkuur-Erz.~ + here_is_hizagkuur
IF ~PartyHasItem("AC#HIZA1")
Global("AC#HizagkuurQuest","GLOBAL",0)~ THEN REPLY ~Ich habe ein seltsames Metall gefunden. Könnt Ihr mir sagen, was ich damit mache?~ + what_is_hizagkuur
++ ~Wer seid Ihr?~ + who_are_you
++ ~Nein.~ + bye
END

	IF ~~THEN BEGIN what_is_hizagkuur
	SAY ~Seltsames Metall gibt es nicht. Lasst mal sehen...~
	=
	~Oh! Da habt Ihr aber ein wirklich seltenes Exemplar aufgetrieben. Das ist Hizagkuur-Erz. Das Zeug ist von Natur aus elektrisch geladen. Hat Euch wahrscheinlich ganz schön durchgeschüttelt, als Ihr es geschürft habt.~
	++ ~Was mache ich mit so etwas?~ + what_is_hizagkuur_02
	END
	
		IF ~~THEN BEGIN what_is_hizagkuur_02
		SAY ~Wir verwenden es, um Beschläge für Türen, Truhen und dergleichen damit zu verkleiden. Einen besseren Schutz gegen Eindringlinge gibt es nicht! Aber jetzt, wo ich es bei Euch sehe - in der Halle der Runensteine, unserer Bibliothek, arbeitet ein Gnom an einem merkwürdigen Konstrukt und belästigt mich schon seit Längerem, weil er Hizagkuur benötigt. Ihm könntet Ihr es bringen - er würde sich bestimmt freuen und ich hätte meine Ruhe.~
		IF ~~ THEN REPLY ~Gut, ich werde ihn dort einmal aufsuchen.~ DO ~AddJournalEntry(@53236,QUEST)
		EraseJournalEntry(@53235)~ + deepgnome_construct
		++ ~Könnt Ihr es nicht verwenden?~ + do_you_need_hizagkuur
		END
		
				IF ~~THEN BEGIN do_you_need_hizagkuur
				SAY ~Natürlich, ja. Aber da *Ihr* es gefunden habt, würde ich Euch raten, selbst nach einer Verwendung zu suchen.~
				IF ~~ THEN REPLY ~Gut, ich werde den Tiefengnom in der Bibliothek einmal aufsuchen.~ DO ~AddJournalEntry(@53236,QUEST)
				EraseJournalEntry(@53235)~ + deepgnome_construct
				IF ~~ THEN REPLY ~Ich kann ja einmal sehen, was ich damit machen kann.~ DO ~AddJournalEntry(@53236,QUEST)
				EraseJournalEntry(@53235)~ + deepgnome_construct
				END
	
					IF ~~THEN BEGIN deepgnome_construct
					SAY ~Tut das. Ich sollte Euch das Erz nur noch vergüten, sonst fällt es in ein paar Tagen auseinander. Ich gebe Euch etwas von unserem Bestand. Moment...~
					IF ~~ THEN DO ~TakePartyItem("AC#HIZA1")
					DestroyItem("AC#HIZA1")
					GiveItemCreate("AC#HIZA2",LastTalkedToBy,0,0,0)~ + hizagkuur_received
					END
					
					IF ~~THEN BEGIN hizagkuur_received
					SAY ~...hier. So ist es besser haltbar. Macht damit, was Ihr wollt.~
					IF ~GlobalGT("Plug","ACIL59",0)~ THEN + exit_01
					IF ~Global("Plug","ACIL59",0)~ THEN + job_plug
					END
						
						IF ~~THEN BEGIN job_plug
						SAY ~He, wenn ich es mir recht überlege, könntet Ihr mir kurz behilflich sein. Im Norden dieser Halle an dem großen Metalltor steht der Wassermeister, der die Wassereinlässe zum Dhalnadar-Fluss regelt. Sagt ihm, er soll den Wasserdruck etwas erhöhen, aber vorsichtig, sonst wird die ganze Halle überflutet.~
						IF ~~ THEN REPLY ~Ihr habt hier unten eine Verbindung zu einem Fluss?~ DO ~SetGlobal("Plug","ACIL59",1)~ + job_plug_02
						END
						
							IF ~~THEN BEGIN job_plug_02
							SAY ~Ja, natürlich. Die ganzen Räder hier drinnen laufen mit Wasserantrieb, das aus dem großen Fluss oberhalb in der Stadt gespeist wird. Warum fragt Ihr?~
							IF ~~ THEN REPLY ~Nun ja, ich hatte in der Vergangenheit nicht so gute Erfahrungen mit Minen in Flussnähe gemacht.~ + plug_cloakwood
							END
							
								IF ~~THEN BEGIN plug_cloakwood
								SAY ~Oh. Was wollt Ihr damit sagen?~
								IF ~~ THEN REPLY ~Der unterirdische Fluss hatte die gesamte Mine überflutet.~ + cloakwood_mine_flooded
								END
								
									IF ~~THEN BEGIN cloakwood_mine_flooded
									SAY ~Das ist schlecht. Hmm, könnte uns theoretisch hier auch passieren. Allerdings würde die Anlage nicht absaufen, sondern uns in einem großen Knall um die Ohren fliegen. Habt Ihr schonmal erlebt, was passiert, wenn Wasser mit heißem Eisen oder Lava in Berührung kommt?~
									IF ~~ THEN REPLY ~Glücklicherweise bisher noch nicht.~ + steam_explosion
									IF ~~ THEN REPLY ~Ihr werdet es mir bestimmt gleich sagen.~ + steam_explosion
									END
									
										IF ~~THEN BEGIN steam_explosion
										SAY ~Es gibt eine riesige Wasserdampf-Explosion. Hier unten würde es sicher die gesamte Halle zum Einsturz bringen.~
										IF ~~ THEN + job_exit
										END
										
											IF ~~THEN BEGIN job_exit
											SAY ~Wisst Ihr was? Vergesst die Aufgabe. Wir lassen den Wasserdruck lieber so, wie er ist.~
											IF ~~ THEN + exit_01
											END
						
						IF ~~THEN BEGIN exit_01
						SAY ~Und jetzt entschuldigt mich. Ich muss einmal nach meinen Arbeitern sehen, bevor hier irgendetwas in die Luft fliegt.~
						IF ~~ THEN EXIT
						END
	
	IF ~~THEN BEGIN need_hizagkuur_01
	SAY ~Dass ich nicht lache! Das ist das seltenste Metall im gesamten Unterreich, und Ihr wollt es mir einfach so abschwatzen?~
	++ ~Ein Tiefengnom braucht es, um einen Metagolem zu erschaffen.~ + need_hizagkuur_immediatly
	END
	
		IF ~~THEN BEGIN need_hizagkuur_immediatly
		SAY ~Und wir brauchen es, um unsere Tore damit zu verstärken, damit unsere allgegenwärtigen Feinde nicht durch unsere Straßen spazieren. Vergesst es. Ich kann Euch von dem wenigen Hizagkuur, welches ich besitze, nichts abgeben.~
		++ ~Gibt es keine Möglichkeit, Neues zu schürfen?~ + need_hizagkuur_immediatly_02
		END


			IF ~~THEN BEGIN need_hizagkuur_immediatly_02
			SAY ~Also wenn Ihr Euch nützlich machen wollt, nur zu! Die Hizagkuur-Mine war bis vor Kurzem noch geöffnet. Sie ist gleich vor den Toren der Stadt, im Nordwesten. Doch seit sich da allerhand Gesindel herumtreibt, hat der Rat beschlossen, die Mine bis auf weiteres nicht mehr zu bewirtschaften.~
			=
			~Wenn Ihr es bis da herunter schafft, werdet Ihr, wenn Ihr Glück habt, noch etwas rohes Hizagkuur-Erz finden. Bringt es mir, und ich bringe es Euch in eine haltbare Form. Doch passt auf: Das Zeug ist elektrisch geladen, und jeder, der es ungeschützt anfasst, fängt sich eine.~
			++ ~Gut, ich werde danach suchen.~ + seek_hizagkuur
			END
			
				IF ~~THEN BEGIN seek_hizagkuur
				SAY ~Wenn Ihr welches habt, bringt es mir zügig vorbei! Das Zeug zerrinnt schneller unter Euren Fingern als ein Glas Met im Blutigen Bollwerk...~
				IF ~~ THEN DO ~EraseJournalEntry(@53230)
				AddJournalEntry(@59100,QUEST)
				SetGlobal("AC#HizagkuurQuest","GLOBAL",2)
				~  EXIT
				END
	
	IF ~~THEN BEGIN here_is_hizagkuur
	SAY ~Ach! Damit hatte ich nicht gerechnet. Lasst mal sehen, aber vorsichtig, dass wir keinen Schlag bekommen...~
	IF ~~ THEN DO ~TakePartyItem("AC#HIZA1")
	DestroyItem("AC#HIZA1")~ + change_hizagkuur
	END
	
		IF ~~THEN BEGIN change_hizagkuur
		SAY ~Nicht schlecht für einen <PRO_RACE> von der Oberfläche! Da könnten sich meine Erzschürfer hier mal ein Beispiel nehmen.~
		=
		~HABT IHR DAS GEHÖRT, MÄNNER? DIESER <PRO_RACE> HIER SCHÜRFT BESSER HIZAGKUUR ALS EINER VON EUCH!~
		++ ~Ach, nicht der Rede wert.~ + not_worth_mention
		++ ~Ihr wolltet mir das Hizagkuur noch verändern, um es für die Verwendung im Golem brauchbar zu machen.~ + wheres_my_hizagkuur
		END
		
			IF ~~THEN BEGIN wheres_my_hizagkuur
			SAY ~Glaubt Ihr etwa, das hätte ich vergessen?~
			IF ~~ THEN  + not_worth_mention
			END
	
				IF ~~THEN BEGIN not_worth_mention
				SAY ~Hier, ich habe Euer Hizagkuur-Erz schon vorbereitet. Jetzt, da ich neues habe, überlasse ich Euch diese Kugel. Damit sollte es dem Gnom möglich sein, seine... Maschine in Gang zu bringen. Auch wenn ich dabei einen Schritt zurücktreten würde.~
				IF ~~ THEN DO ~EraseJournalEntry(@59100)
				AddJournalEntry(@59101,QUEST)
				SetGlobal("AC#HizagkuurQuest","GLOBAL",3)
				GiveItemCreate("AC#HIZA2",LastTalkedToBy,0,0,0)
				~  + hizagkuur_received_02
				END
				
					IF ~~THEN BEGIN hizagkuur_received_02
					SAY ~Und noch was: Wenn was nicht richtig funktioniert, liegt es nicht am Erz! Es wäre nicht das erste Mal, dass sich eine tolle Idee der Svirfnebli in Schall und Rauch auflöst.~
					IF ~GlobalGT("Plug","ACIL59",0)~ THEN + exit_01
					IF ~Global("Plug","ACIL59",0)~ THEN + job_plug
					END

	/*
	IF ~~THEN BEGIN all_idiots
	SAY ~*Seufz* Warum hat mich der Allvater mit solchen Idioten bestraft? Na, was wollt Ihr denn von mir?~
	IF ~Global("AC#Vronia_Quest","GLOBAL",7)~ THEN REPLY ~Vronia schickt mich mit einer ungewöhnlichen Bitte zu Euch.~ + lure_ellhimar
	++ ~Wer seid Ihr?~ + who_are_you
	END
	*/

		IF ~~THEN BEGIN who_are_you
		SAY ~Ich bin Sorni, Herrin der Schmiede. Und meine Laune kocht gleich mehr über als dieser Lavastrom vor Euch. Sonst noch was?~
		IF ~Global("AC#Vronia_Quest","GLOBAL",7)~ THEN REPLY ~Vronia schickt mich mit einer ungewöhnlichen Bitte zu Euch.~ + lure_ellhimar
		//++ ~Nein, das war alles.~ + bye
		IF ~GlobalGT("Plug","ACIL59",0)
		!Global("AC#Vronia_Quest","GLOBAL",7)~ THEN REPLY ~Nein, das war alles.~ + bye
		IF ~Global("Plug","ACIL59",0)
		!Global("AC#Vronia_Quest","GLOBAL",7)~ THEN REPLY ~Nein, das war alles.~ + job_plug
		END

	IF ~~THEN BEGIN lure_ellhimar
	SAY ~Ach ja? Was möchte Clan Eisenbieger denn von mir?~
	++ ~Ihr arbeitet doch gelegentlich mit dem Menschenmagier Ellhimar zusammen, richtig?~ + work_with_Ellhimar
	END
	
		IF ~~THEN BEGIN work_with_Ellhimar
		SAY ~Ja. Will mir das der Rat jetzt etwa auch verbieten?~
		++ ~Nein, Vronia würde Euch darum bitten, dass Ihr Ellhimar einmal zu Euch herzitiert.~ + call_for_Ellhimar
		END
		
			IF ~~THEN BEGIN call_for_Ellhimar
			SAY ~Na, die kommt ja auf Ideen! Ich frage Euch besser gar nicht, was das denn jetzt soll. Aber eigentlich ist mir das sogar Recht!~
			++ ~Ach wirklich?~ + recht_01
			END
			
				IF ~~THEN BEGIN recht_01
				SAY ~Er hatte mir versprochen, bei ein paar Zaubersprüchen für uns Schmiede da zu sein. Und er sollte nach dem großen Tor da drüben sehen, weil das in der letzten Zeit so merkwürdig glüht. Hat mich ganz schön hängenlassen, dieser *hurm*.~
				++ ~Er hat sich nicht mehr blicken lassen?~ + unreliable
				END
				
					IF ~~THEN BEGIN unreliable
					SAY ~Mir ist's ja eigentlich egal, aber Unzuverlässigkeit kann ich nicht ausstehen. Ihr könnt ihm also gerne ausrichten, dass ich ihn unverzüglich sehen will, sonst bekommt er das Zardazil-Erz nicht, das er bei uns geordert hat!~
					++ ~Gut, ich werde ihm die Nachricht überbringen. Habt Dank für Eure Hilfe.~ + arrange
					++ ~Wozu braucht er das Zardazil-Erz?~ + zardazil
					END
					
							IF ~~THEN BEGIN zardazil
							SAY ~Dazu habe ich jetzt wirklich keine Zeit. Da könnt Ihr auch meine Schmiede fragen. Geht zu Ellhimar und richtet ihm mein Anliegen aus. Ich muss mal wieder nach meinen Jungs hier sehen, die bestimmt wieder irgendwelchen *tindul* machen...~
							IF ~GlobalGT("Plug","ACIL59",0)~ THEN DO ~SetGlobal("AC#Vronia_Quest","GLOBAL",8)
							EraseJournalEntry(@50607)
							AddJournalEntry(@50608,QUEST)~  EXIT
							IF ~Global("Plug","ACIL59",0)~ THEN DO ~SetGlobal("AC#Vronia_Quest","GLOBAL",8)
							EraseJournalEntry(@50607)
							AddJournalEntry(@50608,QUEST)~  + job_plug
							END
					
						IF ~~THEN BEGIN arrange
						SAY ~Gerne. Ihr seid gar nicht so verkehrt für einen Oberflächen-<PRO_RACE>. Und jetzt muss ich mal wieder nach meinen Jungs hier sehen, die bestimmt wieder irgendwelchen *tindul* machen...~
							IF ~GlobalGT("Plug","ACIL59",0)~ THEN DO ~
							SetGlobal("AC#Vronia_Quest","GLOBAL",8)EraseJournalEntry(@50607)
							AddJournalEntry(@50608,QUEST)
							~  EXIT
							IF ~Global("Plug","ACIL59",0)~ THEN DO ~SetGlobal("AC#Vronia_Quest","GLOBAL",8)
							EraseJournalEntry(@50607)
							AddJournalEntry(@50608,QUEST)
							~  + job_plug
							END
	
IF ~~THEN BEGIN bye
SAY ~Gut. Ihr wisst, wo ich zu finden bin, falls Ihr mal etwas *Wichtiges* besprechen wollt.~
   IF ~~ THEN DO ~~  EXIT
END

IF ~~THEN BEGIN throw_yourself_into_lava
SAY ~Ach, haut ab. Und passt auf, dass Ihr Euch nicht aus Versehen selbst zur Schlacke schmeißt.~
   IF ~~ THEN DO ~ActionOverride("AC#59DW1",EscapeArea())~  EXIT
END

CHAIN IF WEIGHT #-1 ~NumTimesTalkedTo(0)~ THEN AC#SORN1 1
~Bei den Morndinsamman! Moradin hat wohl seinen Hammer falsch herum gehalten, als er Euch in der Seelenschmiede erschaffen hat, Clamri!~ [AC#ILSOA]
== AC#59DW1 ~V-v-verzeiht, Herrin Sorni. D-Die Schlacke war einfach zu heiß.~
== AC#SORN1 ~Zu heiß? Denkt Ihr ernsthaft, dass mir diese dumme Ausrede genügt?~
== AC#59DW1 ~N-natürlich n-nicht, Herrin.~
== AC#SORN1 ~Passt in Zukunft besser auf, sonst halte ich persönlich Euren Hintern über den Schmelzofen, bis er gar ist, verstanden?~[AC#ILSOB]
== AC#59DW1 ~J-ja, Herrin.~
END
IF ~~ THEN EXTERN ~AC#SORN1~ throw_yourself_into_lava
/* alte Sache
IF ~~ THEN EXTERN ~AC#SORN1~ all_idiots*/

