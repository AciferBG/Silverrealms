
// ---------------------------------------------
// Ruvan's Houseguard
// ---------------------------------------------
BEGIN ~AC#28DW3~

IF ~NumTimesTalkedToGT(0)~ THEN BEGIN hello_wait_here
  SAY ~Erwartet keine weitere Hilfe von uns. Unsere Aufgabe ist es, die Boote zu bewachen. Wir warten hier, bis Ihr Euren Auftrag erfüllt habt. ~
  IF ~~ THEN EXIT
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN here_we_are_in_barakuir
  SAY ~So, da wären wir, <PRO_RACE>.~
  IF ~~ THEN REPLY ~Dies ist die ehemalige Stadt der Duergar?~ GOTO edge_barakuir
END

	IF ~~ THEN BEGIN edge_barakuir
	SAY ~Dies sind die Ausläufer Barakuirs, ja. Wir werden keinen weiteren Schritt auf dieses verfluchte Land setzen. Erfüllt Eure Aufgabe und kehrt hierher zurück. Wir warten bei den Booten auf Euch und werden Euch dann sicher wieder zurück nach Iltkazar bringen.~
	IF ~~ THEN DO ~EraseJournalEntry(@62044)
	AddJournalEntry(@62045,QUEST)
	SetGlobal("AC#RC_Sorni_Fourth","GLOBAL",13)~ EXIT
	END
	
// Guard #4 & 5

BEGIN ~AC#28DW4~

IF ~True()~ THEN BEGIN hello_wait_here
  SAY ~Erwartet keine weitere Hilfe von uns. Unsere Aufgabe ist es, die Boote zu bewachen. Wir warten hier, bis Ihr Euren Auftrag erfüllt habt. ~
  IF ~~ THEN EXIT
END

// -------------------------------------------------
// Ellhimar (mad)
//--------------------------------------------------

BEGIN ~AC#ILEL8~

IF ~Global("AC#Ruvan_Treason","GLOBAL",1)~ THEN BEGIN hello_madman 
  SAY ~(wirres Lachen)~
  IF ~~ THEN REPLY ~Was mache ich jetzt nur mit Euch?~ + what_do_i_do_with_you
END

	IF ~~ THEN BEGIN what_do_i_do_with_you 
	SAY ~(...)~
	IF ~~ THEN REPLY ~Ich nehme Euch besser mit nach Iltkazar. Vielleicht kann Euch dort jemand helfen.~ + i_take_you_with_me
	END
	
	IF ~~ THEN BEGIN i_take_you_with_me 
	SAY ~(...)~
	IF ~~ THEN DO ~GiveItemCreate("AC#28ELL",Player1,1,0,0)
		DestroySelf()~  EXIT
		END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0 
  SAY ~uuuh... Stimmen in meinem Kopf...~
  IF ~~ THEN REPLY ~Wer seid Ihr?~ + 1
  IF ~~ THEN REPLY ~Wer ist das?~ + 1
END

	IF ~~ THEN BEGIN 1 
	  SAY ~(wirres Lachen)~ [AC#ELLHC]
	  IF ~~ THEN EXTERN ~AC#ULIT2~ thats_ellhimar
		END
		
		IF ~~ THEN BEGIN mad_laughter 
	  SAY ~(wirres Lachen)~ [AC#ELLHC]
	  IF ~~ THEN REPLY ~Er ist ja nicht Herr seiner Sinne! Wie soll mir denn eine solche Kreatur antworten liefern?~ EXTERN ~AC#ULIT2~ thats_your_problem
		END
// -------------------------------------------------
// Ulitharid
//--------------------------------------------------

BEGIN ~AC#ULIT2~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0 
  SAY ~(Eine seltsame Stimme erklingt in Eurem Kopf) 
Seid gegrüßt, <CHARNAME>! Haltet Eure Waffen still, denn wir kommen in guten Absichten!~
  IF ~~ THEN REPLY ~Was wollt Ihr, Gedankenschinder? Nennt mir einen Grund, warum ich Euch nicht auch wie die anderen Illithiden hier sofort töten sollte!~ + 1
  IF ~~ THEN REPLY ~Ihr wart der Illithide, den ich in Ellhimars Spiegel gesehen habe!~ + ellhimars_mirror
END

	IF ~~ THEN BEGIN ellhimars_mirror
	SAY ~Vielleicht.~
	IF ~~ THEN REPLY ~Nennt mir einen Grund, warum ich Euch nicht auch wie die anderen Illithiden hier sofort töten sollte!~ GOTO 1
	END

	IF ~~ THEN BEGIN 1 
	  SAY ~Diese hier waren nicht wie wir. Deshalb möchten wir Euch zunächst unseren Dank aussprechen. Ihr habt getan, was wir nicht besser hätten tun können, nämlich diesen alten Tempel unserer Rasse von der Geißel, die ihn über Jahrhunderte besessen hat, zu befreien.~ 
	  IF ~~ THEN REPLY ~Gern geschehen.~ + 2
	  IF ~~ THEN REPLY ~Von was für einer Geißel redet Ihr?~ + what_kinda_scourge
		END

		IF ~~ THEN BEGIN what_kinda_scourge 
		  SAY ~Einst war dieser Ort ein Hort des Wissens, Wohlstandes und Wachstums für unsere Rasse. Durch den Aufstand der Grauzwerge mussten unsere Ahnen den Tempel hastig verlassen. Übrig blieben nur noch Tod und Verwesung, wie diese vertrocknete Hülle, die einmal ein Ältestenhirn gewesen ist.~
		  IF ~~ THEN REPLY ~Diese verschrumpelte Kreatur in dem Becken war ein Ältestenhirn?~ + dead_elderbrain
		  IF ~~ THEN REPLY ~Was wollt Ihr von mir?~ + 2
			END
		
			IF ~~ THEN BEGIN dead_elderbrain 
			  SAY ~Ja. Doch ohne die Ernährung und Fürsorge unserer Vorfahren blieb ihm letztlich nur den Verfall. Dies zog die abscheulichsten Ausgeburten unserer Rasse, untote Illithiden an, die wir bisher nicht beseitigen konnten. Doch nun habt Ihr sie für uns getötet.~
			  IF ~~ THEN REPLY ~Was wollt Ihr von mir?~ + 2
			  IF ~~ THEN REPLY ~Gern geschehen.~ + 2
				END

	IF ~~ THEN BEGIN 2 
	  SAY ~Wir wissen, dass Ihr dies nicht für uns getan habt, sondern, weil Ihr Antworten sucht. Antworten, die auch wir Euch leider nicht geben können.~ 
	  IF ~~ THEN REPLY ~Warum sollte ich dann überhaupt mit Euch verhandeln?~ GOTO 3
		END

		IF ~~ THEN BEGIN 3 
		  SAY ~Weil wir den gleichen Feind zu haben scheinen. Wir beobachten Iltkazar schon lange, so wie wir alles um uns herum beobachten. Die Stadt der Zwerge übt wegen des dort gehorteten Wissens einen... gewissen Reiz auf uns aus.~ 
		  IF ~~ THEN REPLY ~Das war doch klar, dass auch Ihr in der Zwergenstadt herumspioniert!~  GOTO 4
		  IF ~~ THEN REPLY ~Deshalb kam Euch Ellhimars Spiegel gerade Recht.~ + 4
			END

			IF ~~ THEN BEGIN 4 
			  SAY ~Glaubt mir, wir sehen nur aus vorsichtigem Interesse zu, denn von Iltkazar drohte uns bisher keine Gefahr. Die Gefahr lauert woanders.~ 
			  IF ~~ THEN GOTO 5
				END

				IF ~~ THEN BEGIN 5 
				  SAY ~Wir wissen, dass der König der Zwerge in einem mysteriösen Schlaf liegt. Dies würde uns zum Vorteil gereichen, wenn nicht irgendeine fremde Macht versuchen würde, die Kontrolle in diesem - unseren - Teil des Unterreiches an sich zu reißen und unser Volk tötet.~ 
				  IF ~~ THEN REPLY ~Ihr denkt, dass die gleiche Macht, die den König in seiner Traumwelt gefangen hält, für den Tod Eurer Leute verantwortlich ist?~ GOTO 6
					END

					IF ~~ THEN BEGIN 6 
					  SAY ~Vieles spricht dafür. Doch so sehr wir unsere Gedankenenergie auch darauf fokussieren mögen- wir können nicht erkennen, wer aus den Schatten heraus derart geschickt gegen uns vorgeht.~ 
					  IF ~~ THEN REPLY ~Habt Ihr irgendwelche Vermutungen?~  GOTO 7
						END

						IF ~~ THEN BEGIN 7 
						  SAY ~Unserer Feinde gibt es viele - Duergar, Kuo-Toa und andere Rassen des Unterreichs. Wir denken jedoch, dass der Feind, der Iltkazar und auch uns im Griff hält, nicht aus dem Unterreich stammt.~ 
						  IF ~~ THEN REPLY ~Wie kommt Ihr darauf?~  GOTO what_mistakes
							END
							
							IF ~~ THEN BEGIN what_mistakes 
							SAY ~Unser Feind macht Fehler. Die getötete Patrouille derart offensichtlich zurückzulassen war einer davon. Wir Illithiden haben noch weitere bemerkt, die wir Euch jedoch nicht mitteilen werden.~ 
							IF ~~ THEN REPLY ~Was nützt Ihr mir denn dann überhaupt?~  GOTO what_benefit
							END
							
								IF ~~ THEN BEGIN what_benefit 
								SAY ~Es geht nicht darum, wie wir Euch nützen, sondern ob Ihr uns nützt. So lange dies der Fall ist, werden wir Euch nicht behelligen. Als Zeichen unseres guten Willens geben wir Euch etwas, das sich bei Eurer Suche als nützlich erweisen könnte.~ 
								IF ~~ THEN REPLY ~Ihr gebt mir etwas ohne Gegenleistung?~  GOTO a_gift
								END
								
									IF ~~ THEN BEGIN a_gift 
									SAY ~Genau genommen haben wir es uns vor einiger Zeit von den Zwergen genommen und geben es jetzt zurück. Seht her...~ 
									IF ~~ THEN DO ~
									SetGlobal("AC#Ellhimar_Illithid","GLOBAL",1)~ EXIT
									END

	IF ~~ THEN BEGIN thats_ellhimar 
	SAY ~Dies ist der Magier, nach dem Ihr so händeringend gesucht habt, <PRO_RACE>.~ 
	IF ~~ THEN REPLY ~Dies soll Ellhimar sein? Das kann nicht sein, ich habe ihn doch erschlagen!~ + ellhimar_not_a_drow
	END
	
		IF ~~ THEN BEGIN ellhimar_not_a_drow 
		SAY ~Ihr habt einen Drow erschlagen, <PRO_RACE>. Dies ist der echte menschliche Magier Ellhimar. Wir erhofften uns von ihm... Antworten... doch er hat sich zunächst geweigert und uns dann enttäuscht. Er ist uns nicht länger von Nutzen.~ 
		IF ~~ THEN REPLY ~Ihr Monster! Was habt Ihr ihm angetan?~ + what_did_you_do_to_ellhimar
		END
		
			IF ~~ THEN BEGIN what_did_you_do_to_ellhimar 
			SAY ~Nichts anderes als wir Euch antun würden, wenn Ihr uns unter anderen Umständen begegnen wäret.~ 
			IF ~~ THEN EXTERN ~AC#ILEL8~ mad_laughter
			END
			
			IF ~~ THEN BEGIN thats_your_problem 
			SAY ~Dies ist nicht unser Problem. Aber da Ihr einen Drow erschlagen habt, wäret Ihr vielleicht gut beraten, zu überlegen, wo dieser Drow herkam. Und jetzt werde ich Euch verlassen. Dieses Gespräch ermüdet meine Psyche.~ 
			IF ~~ THEN REPLY ~Dafür wird die ganze Zwergenstadt Rache an Eurem Volk nehmen!~ + iltkazar_traitor
			END
			
// Iltkazars Treason
IF ~~ THEN BEGIN iltkazar_traitor 
SAY ~Da wäre ich mir nicht so sicher. Bisher war ihnen der Magier nicht viel Wert. Und nun haben sie ja sogar Euch hier im Stich gelassen.~ 
IF ~~ THEN REPLY ~Wie meint Ihr das?~ + iltkazar_treason_01
IF ~~ THEN REPLY ~Das haben sie nicht.~ + iltkazar_treason_01
END

	IF ~~ THEN BEGIN iltkazar_treason_01 
	SAY ~Die Boote, mit denen Ihr hergekommen seid, sind jedenfalls verschwunden. Sie haben Euch zurückgelassen.~ 
	IF ~~ THEN REPLY ~Wie bitte? Habt Ihr sie getötet?~ + iltkazar_treason_02
	IF ~~ THEN REPLY ~Vermutlich weil Ihr sie mit Euren bösartigen Fähigkeiten dazu gezwungen habt!~ + iltkazar_treason_02
	IF ~~ THEN REPLY ~Sie werden schon wieder zurückkommen.~ + crew_is_gone
	IF ~~ THEN REPLY ~Na und?~ + crew_is_gone
	END
	
		IF ~~ THEN BEGIN iltkazar_treason_02 
		SAY ~Das hätten wir tun können, doch viel unterhaltsamer ist es doch, wenn sich die niederen Rassen gegenseitig zerfleischen.~		
		IF ~~ THEN GOTO crew_is_gone 
		END
		
		IF ~~ THEN BEGIN crew_is_gone
		SAY ~Die Bootsbesatzung ist aus freien Stücken zurückgerudert, <CHARNAME>. Die Zwerge haben Euch hier in der Einöde Eurem Schicksal überlassen.~
		IF ~~ THEN REPLY ~Das kann nicht sein.~ + iltkazar_treason_03
		IF ~~ THEN REPLY ~Vielleicht haben sie mich betrogen, ja. Das macht mir aber nichts mehr aus.~ + maybe_treason
		END
		
			IF ~~ THEN BEGIN iltkazar_treason_03
			SAY ~(Die Tentakel des Illithiden zucken hin und her, und das Wesen gibt ein glucksendes Geräusch von sich. Ihr seid Euch nicht sicher, ob dies eine seltsame Form des Lachens sein könnte.)~ [MINDF01] 
			=
			~Seid Ihr Euch da sicher? Sie haben doch außer einem tränenreichen Abschied nichts weiter für Euch getan. Vielleicht ist der einzige Grund, weshalb Ihr für Sie diese Aufträge lösen solltet, der, dass sie Euch schnellstmöglich loswerden wollten.~
			IF ~~ THEN REPLY ~Ich glaube Euch das alles nicht!~ + iltkazar_treason_04
			IF ~~ THEN REPLY ~Redet so viel Ihr wollt. Mich könnt Ihr nicht überzeugen.~ + iltkazar_treason_04
			IF ~~ THEN REPLY ~Vielleicht haben sie mich betrogen, ja. Das macht mir aber nichts mehr aus.~ + maybe_treason
			END
			
			IF ~~ THEN BEGIN iltkazar_treason_04
			SAY ~Dann geht selbst an das Ufer und sucht nach den Booten.~ 			
			IF ~~ THEN GOTO maybe_treason
			END
			
			IF ~~ THEN BEGIN maybe_treason
			SAY	~Ihr sitzt hier fest, <PRO_RACE>. Aber wenigstens habt Ihr nun mit Ellhimar, dem Magier, einen guten Gesprächspartner.~ 
			IF ~~ THEN + good_bye
			END
			
				IF ~~ THEN BEGIN good_bye
				SAY ~Ich werde jetzt in meine Stadt zurückkehren, <CHARNAME>. Ich wünsche Euch viel Erfolg bei der Suche nach unserem gemeinsamen Feind. Betet dennoch zu Euren Göttern von der Oberfläche, dass Ihr niemals wieder einen meiner Rasse zu Gesicht bekommen werdet.~
				IF ~~ THEN DO ~EraseJournalEntry(@62045)
				AddJournalEntry(@62050,QUEST)
				AddJournalEntry(@62046,QUEST)
				SetGlobal("AC#Ruvan_Treason","GLOBAL",1)
				CreateVisualEffectObject("SPDIMNDR",Myself) 
				Wait(1)				
				DestroySelf()~ EXIT
				END

