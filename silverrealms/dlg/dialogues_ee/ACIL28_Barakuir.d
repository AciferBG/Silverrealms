
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
  IF ~~ THEN REPLY ~Wie geht es jetzt weiter?~ GOTO edge_barakuir
END

	IF ~~ THEN BEGIN edge_barakuir
	SAY ~Dies sind die Ausläufer Barakuirs. Wir werden keinen weiteren Schritt auf dieses verfluchte Land setzen. Erfüllt Eure Aufgabe und kehrt hierher zurück. Wir warten bei den Booten auf Euch und werden Euch dann sicher wieder zurück nach Iltkazar bringen.~
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

// Iron Golem

BEGIN ~AC#GOLIR~

IF ~Global("Activated","LOCALS",0)~ THEN BEGIN 0 
  SAY ~Dieser Eisengolem steht untätig in einer Ecke. Er wartet offensichtlich darauf, aktiviert zu werden.~
  IF ~~ THEN REPLY ~Den Golem in Ruhe lassen.~ GOTO 2
  IF ~PartyHasItem("AC#MSC4A")~ THEN REPLY ~Ich frage mich, ob dieser Aktivierungsstein passen könnte...~ GOTO 1
END

IF ~~ THEN BEGIN 1 
  SAY ~Der Aktivierungsstein rastet mit einem hörbaren Klicken in der Brust des metallenen Geschöpfes ein. Kurze Zeit später erwacht der Golem zum Leben...~
  IF ~~ THEN DO ~SetGlobal("Activated","LOCALS",1)
  TakePartyItem("AC#MSC4A")
  DestroyItem("AC#MSC4A")
~ EXIT
END

IF ~~ THEN BEGIN 2
  SAY ~Ihr wendet Euch wieder vom Golem ab.~
  IF ~~ THEN EXIT
END


// Undead Elder brain

//first encounter
BEGIN ~AC#IL28F~

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#IL28F hello_00
~(Ein Wesen mit Bewusstsein in diesen Hallen? Das hat es seit vielen Jahren nicht gegeben. Tretet ein, Denkender, und bezwingt den Wächter. Dann werde ich mich Euch offenbaren.)~
END
IF ~~ THEN REPLY ~Wer seid Ihr?~ EXTERN AC#IL28F who_are_you_bye
IF ~~ THEN REPLY ~Wer spricht da?~ EXTERN AC#IL28F who_are_you_bye

	CHAIN AC#IL28F who_are_you_bye
	~(Niemand antwortet.)~
	DO ~DestroySelf() ~EXIT


// after the neothelid is defeated

BEGIN ~AC#IL28E~

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#IL28E hello_killed_neothelid
~Ihr habt die Geißel dieser Stätte ausgelöscht. Ein wenig Frieden, nach all den Jahren. Tretet näher und sprecht mit mir, Denkender, wenn Ihr Euch traut.~
END
IF ~~ THEN DO ~SetGlobal("TalkToElderBrain","ACIL28",1)
MoveViewObject(Player1,INSTANT)~ EXIT

CHAIN IF ~Global("TalkToElderBrain","ACIL28",1)~ THEN AC#IL28E hello_again
~Ihr habt den Neothelid vernichtet. Dafür gebührt Euch mein Dank.~
END
IF ~~ THEN REPLY ~Wer seid Ihr?~ EXTERN AC#IL28E who_are_you
IF ~~ THEN REPLY ~Ich habe es nicht für Euch getan.~ EXTERN AC#IL28E who_are_you
IF ~~ THEN REPLY ~Nennt mir einen Grund, warum ich mit Euch nicht dasselbe machen sollte.~ EXTERN AC#IL28E who_are_you

	CHAIN AC#IL28E who_are_you
	~Einst war ich das Ältestenhirn dieser Siedlung. Ein Nexus aus Wissen, Macht und Kontrolle. Nun bin ich... seht mich an.~
	END
	IF ~~ THEN REPLY ~Was ist geschehen?~ EXTERN AC#IL28E what_happened
	IF ~~ THEN REPLY ~Ein verfaulter Haufen Gehirnmasse.~ EXTERN AC#IL28E what_happened
	IF ~~ THEN REPLY ~Eure besten Jahre liegen eindeutig hinter Euch.~ EXTERN AC#IL28E what_happened

		CHAIN AC#IL28E what_happened
		~Die Siedlung zerfiel, als die Duergar rebellierten. Der Zustrom an Nahrung versiegte. Ordnung fiel Hunger anheim.~
		=
		~Illithiden wandten sich gegeneinander. Kannibalismus. Ich verlor die Kontrolle. Larven fraßen Larven, bis nur eine verblieb – und zu jenem Ding heranwuchs, das Ihr gerade vernichtet habt und vor dem ich mich verstecken musste.~
		END
		IF ~~ THEN REPLY ~Dieses Monstrum war einmal eine kleine Larve? Widerlich.~ EXTERN AC#IL28E neothelid
		IF ~~ THEN REPLY ~Der Neothelid sollte zu einem Gedankenschinder werden?~ EXTERN AC#IL28E neothelid

			CHAIN AC#IL28E neothelid
			~Für Euch widerlich. Für mich... drohender Untergang. Ein Neothelid begehrt Bewusstsein, kennt keine Fessel. Er hätte auch mich vernichtet.~
			=
			~Um mich zu bewahren, löste ich meinen Geist von meinem Leib. Mein Becken vertrocknete. Das Gewebe starb. Die Gedanken blieben. So wurde ich zu der untoten Masse, die Ihr nun hört und seht.~
			END
			IF ~~ THEN REPLY ~Ihr seid also eine Art Zombie-Gehirn?~ EXTERN AC#IL28E astral_plane
			IF ~~ THEN REPLY ~Übel.~ EXTERN AC#IL28E astral_plane

				CHAIN AC#IL28E astral_plane
				~Nennt es, wie Ihr wollt. Mir bleibt nur dieser untote Körper, keine Untergebenen mehr. Ich bin, was von einem großen Geist übrig blieb. Einst herrschte ich über viele Gedanken, nun hüte ich nur noch Erinnerung.~
				=
				~Jeder Gedankenschinder würde mich vernichten, sobald er mich entdeckt. Mein Dasein ist ihnen ein Frevel. Darum lebe ich die meiste Zeit versteckt vor ihrem Bewusstsein, in ständiger Angst, vollständig vernichtet zu werden.~
				=
				~Es ist daher angenehm, wieder mit einem denkenden Wesen zu kommunizieren. Zu Lebzeiten hätte ich Euer Gehirn gerne konsumiert und Euer Bewusstsein in mich aufgenommen. Doch die Zeiten werden anders, schwieriger. Ihr habt mir geholfen.~
				END
				IF ~~ THEN REPLY ~Dann helft Ihr mir jetzt.~ EXTERN AC#IL28E now_help_me
				
					CHAIN AC#IL28E now_help_me
					~Oh, gerne. Wenngleich mir... das Denken zunehmend schwer fällt. Die Erinnerungen... sie verblassen..~
					END
					IF ~~ THEN REPLY ~Der Zwergenkönig Mith Barak erwähnte diesen Ort. Sagt Euch sein Name etwas?~ EXTERN AC#IL28E how_help

					CHAIN AC#IL28E how_help
					~Mith Barak? Mith Barak.... ja, ganz dunkel erinnere mich an den Namen. Oder doch nicht? Es ist vage, sehr vage.~
					END
					IF ~~ THEN REPLY ~Seid Ihr ihm begegnet?~ EXTERN AC#IL28E met_mith_01
					IF ~~ THEN REPLY ~Erinnert Euch noch ein wenig mehr.~ EXTERN AC#IL28E met_mith_01

						CHAIN AC#IL28E met_mith_01
						~Ich... ich glaube... ich kenne diesen... wie war noch gleich sein Name?~
									END
									IF ~~ THEN REPLY ~Mith Barak.~ EXTERN AC#IL28E mith_curse
									IF ~~ THEN REPLY ~M-I-T-H-B-A-R-A-K!~ EXTERN AC#IL28E mith_curse
									
										CHAIN AC#IL28E mith_curse
										~Ja, der Name kommt mir tatsächlich bekannt vor. In den tiefsten Windungen meines Gehirns regt sich etwas...~
										END
										IF ~~ THEN EXTERN AC#IL28E mith_forgot_again
										
											CHAIN AC#IL28E mith_forgot_again
											~...und jetzt ist es wieder weg. Vergessen! So etwas aber auch. Können wir uns nicht über etwas anderes unterhalten? Wo sagtet Ihr kommt Ihr noch gleich her?~
											== JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN ~Von allen Ältestenhirnen dieser Welt haben wir uns ausgerechnet eines mit Gedächtnisschwund ausgesucht.~
											== BEDWIN IF ~InParty("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN ~Das ist Zeitverschwendung, <CHARNAME>. Dieses Ding ist zu stark verwest, um sich mit ihm abzugeben.~
											END
											IF ~~ THEN REPLY ~Mith Barak meinte, dass in Barakuir eine Lösung für seinen Fluch liegen könnte.~ EXTERN AC#IL28E barakuir_forgotten
											
											CHAIN AC#IL28E barakuir_forgotten
											~Barakuir? Was ist das?~
											END
											IF ~~ THEN REPLY ~Der Ort, an dem Ihr gerade vor Euch hinfault.~ EXTERN AC#IL28E barakuir_forgotten_02
											IF ~~ THEN REPLY ~Dies hier ist Barakuir.~ EXTERN AC#IL28E barakuir_forgotten_02
											
											CHAIN AC#IL28E barakuir_forgotten_02
											~Oh! Barakuir. Interessant. Das wusste ich nicht mehr. Es tut gut, sich mit Euch zu unterhalten! Ich lerne viele neue Dinge hinzu, nun, da die alten Gedanken verschwunden sind.~
											END
											IF ~~ THEN REPLY ~Ihr müsst versuchen, Euch an die alten Gedanken zu erinnern!~ EXTERN AC#IL28E try_remember_old_thoughts
											
												CHAIN AC#IL28E try_remember_old_thoughts
												~Ach, es ist so anstrengend. Doch die Erinnerung an die alte Zeit tut auch gut. Macht, Stärke, Gedanken... Barakuir. Mith Barak. Ja.~ 
												=
												~Mith Barak? Wer war Mith Barak noch gleich?~
												END
												IF ~~ THEN REPLY ~Der Zwergenkönig.~ EXTERN AC#IL28E mith_remember												
												
												CHAIN AC#IL28E mith_remember
												~Der Zwergenkönig Mith Barak. Ja. Er war hier! Er sprach mit mir. Teilte einige seiner Erinnerungen mit mir! Im Austausch für etwas.~
												END
												IF ~~ THEN REPLY ~Für was? Was wollte er?~ EXTERN AC#IL28E mith_remember_02

												CHAIN AC#IL28E mith_remember_02
												~Er wollte... wollte...~
												=
												~Ich weiß es nicht mehr. Meine Hirnmasse ist wohl schon zu arg verfallen. Wenn ich sie irgendwie konsumieren und reaktivieren könnte...~
												END
												IF ~~ THEN REPLY ~Ich helfe Euch gerne. Was soll ich tun?~ EXTERN AC#IL28E tell_me_more
												
												CHAIN AC#IL28E tell_me_more
												~Hm...~												
												END
												IF ~~ THEN REPLY ~Was?~ EXTERN AC#IL28E tell_me_more_02
												
													CHAIN AC#IL28E tell_me_more_02
													~Oh! Seid gegrüßt. Haben wir uns schon einmal gesehen? Es tut gut, ein denkendes Geschöpf zu sehen! Was wollt Ihr hier?~												
													END
													IF ~~ THEN REPLY ~Ihr wolltet mir helfen.~ EXTERN AC#IL28E illithid_are_coming
													IF ~~ THEN REPLY ~Das führt doch zu nichts.~ EXTERN AC#IL28E illithid_are_coming

												CHAIN AC#IL28E illithid_are_coming
												~Wartet! Ich spüre eine neue Präsenz... Die Gedankenschinder kommen! Ihr Wille nähert sich. Oh nein! Wenn sie mich hier entdecken ist dies mein Ende. Ich ziehe mein Bewusstsein zurück.~ 
												=
												~Versucht sie abzuschütteln! Verratet mich nicht.~
												DO ~SetGlobal("AC#IL_UndeadElderBrain","GLOBAL",1)
												StartCutSceneMode()
												AddJournalEntry(@99508,QUEST) // sleeping king questline
												CreateVisualEffect("ICPRAYI",[2196.1589])
												ReallyForceSpell(Myself,FLASHY_2)
												Wait(1)
												SetGlobal("MindflayersAppear","ACIL28",1)
												DestroySelf()
												//Deactivate(Myself)
												EndCutSceneMode()
												~EXIT
												
// -------------------------------------------------
// Ulitharid
//--------------------------------------------------

BEGIN ~AC#ULIT2~

CHAIN IF ~Global("AC#IL_KilledElderBrain","GLOBAL",1)~ THEN AC#ULIT2 hello_elderbrain_dead
~Damit ist diese Störung der Ordnung ausgelöscht. Und nun zu Euch.~
END
  IF ~~ THEN EXTERN AC#ULIT2 illithid_talk_02 
  
	CHAIN AC#ULIT2 illithid_talk_02
	~Wir möchten Euch zunächst unser Lob aussprechen. Ihr habt getan, was wir nicht besser hätten tun können, nämlich diesen alten Tempel unserer Rasse von der Geißel, die ihn über Jahrhunderte besessen hat, zu befreien. Ihr habt den Tod und die Verwesung beseitigt.~
	END
	IF ~~ THEN EXTERN AC#ULIT2 illithid_talk_03 
	
	CHAIN AC#ULIT2 illithid_talk_03
	~Wir wissen, dass Ihr dies nicht für uns getan habt, sondern, weil Ihr Antworten sucht. Genau wie wir.~
	END
	IF ~~ THEN REPLY ~Warum sollte ich dann überhaupt mit Euch reden?~ EXTERN AC#ULIT2 illithid_talk_04
	IF ~~ THEN REPLY ~Was für Antworten?~ EXTERN AC#ULIT2 illithid_talk_04
	
	CHAIN AC#ULIT2 illithid_talk_04
	~Wir haben den gleichen Feind. Wir beobachten Iltkazar schon lange, so wie wir alles um uns herum beobachten. Die Stadt der Zwerge übt wegen des dort gehorteten Wissens einen... gewissen Reiz auf uns aus.~
	END
	IF ~~ THEN EXTERN AC#ULIT2 illithid_talk_05
	
	CHAIN AC#ULIT2 illithid_talk_05
	~Wir wissen, dass der König der Zwerge in einem mysteriösen Schlaf liegt. Dies würde uns zum Vorteil gereichen, wenn nicht irgendeine fremde Macht versuchen würde, die Kontrolle in diesem - unseren - Teil des Unterreiches an sich zu reißen und unser Volk tötet.~
	END
	IF ~~ THEN REPLY ~Etwas tötet auch Eure Leute?~ EXTERN AC#ULIT2 illithid_talk_06
	
	CHAIN AC#ULIT2 illithid_talk_06
	~Viele Illithiden wurden in jüngerer Zeit hinterrücks gemeuchelt. So sehr wir unsere Gedankenenergie auch darauf fokussieren mögen- wir können nicht erkennen, wer aus den Schatten heraus derart geschickt gegen uns vorgeht.~
	END
	IF ~~ THEN EXTERN AC#ULIT2 illithid_talk_07
	
	CHAIN AC#ULIT2 illithid_talk_07
	~Unserer Feinde gibt es viele - Duergar, Kuo-Toa und andere Rassen des Unterreichs. Wir denken jedoch, dass der Feind, der Iltkazar und auch uns im Griff hält, nicht aus dem Unterreich stammt.~
	END
	IF ~~ THEN REPLY ~Wie kommt Ihr darauf?~ EXTERN AC#ULIT2 what_mistakes
	IF ~~ THEN REPLY ~Das ist ja einmal eine gute Nachricht.~ EXTERN AC#ULIT2 what_mistakes
	
	CHAIN AC#ULIT2 what_mistakes
	~Unser Feind macht Fehler. Die getötete Zwergenpatrouille vor den Toren derart offensichtlich zurückzulassen war einer davon. Sicher erinnert Ihr Euch an die Köpfe der Vertreter meiner Rasse. Abscheulich. Schändlich. Dumm. Ein Fehler. Wir Illithiden haben noch weitere bemerkt, die wir Euch jedoch nicht mitteilen werden.~
	END
	IF ~~ THEN REPLY ~Stimmt, dort waren ja diese Illithiden-Köpfe.~ EXTERN AC#ULIT2 what_mistakes_02
	IF ~~ THEN REPLY ~Bisher sagt Ihr mir noch nichts Neues.~ EXTERN AC#ULIT2 what_mistakes_02
	
	CHAIN AC#ULIT2 what_mistakes_02
	~Etwas stößt aus den Schatten vor und verschwindet wieder. Als würde es eine Art Portal nutzen.~
	END
	IF ~~ THEN REPLY ~Ich konnte durch ein Portal hindurchsehen und sah ein rabengesichtiges Scheusal.~ EXTERN AC#ULIT2 raven_fiend
	
	CHAIN AC#ULIT2 raven_fiend
	~Ein rabengesichtiges Scheusal? Interessant. Es gibt wenige solcher Kreaturen. Doch eine käme dabei schon in Frage. Malphas. Ein Teufel aus der Unterwelt.~
	END
	IF ~~ THEN REPLY ~Was könnte er hier zu schaffen haben?~ EXTERN AC#ULIT2 malphas_01
	
		CHAIN AC#ULIT2 malphas_01
		~So langsam ergibt die Geschichte durchaus einen Sinn. Ja, das tut sie. Und ich denke, ich weiß jetzt, wer uns Illithiden jagt. Und wer vielleicht für den Schlaf des Königs verantwortlich ist.~
		END
		IF ~~ THEN REPLY ~Wer? Wer ist es?~ EXTERN AC#ULIT2 what_benefit
	
		CHAIN AC#ULIT2 what_benefit
		~Das werde ich Euch nicht sagen. Ihr habt mächtige Gegner vor Euch, wenn Ihr das Rätsel des schlafenden Königs lösen wollt. Dabei nützt Ihr uns. So lange dies der Fall ist, werden wir Euch nicht behelligen. Als Zeichen unseres guten Willens lassen wir Euch Eure Suche fortsetzen. Wenngleich Euer Weg zurück schwierig werden könnte.~
		END
		IF ~~ THEN REPLY ~Warum? Ich fahre mit den Booten einfach wieder zurück.~ EXTERN AC#ULIT2 iltkazar_traitor
		
		CHAIN AC#ULIT2 iltkazar_traitor
		~Da wäre ich mir nicht so sicher. Die Boote, mit denen Ihr hergekommen seid, sind jedenfalls verschwunden. Die Zwerge haben Euch hier zurückgelassen.~
		END
		IF ~~ THEN REPLY ~Wie bitte? Habt Ihr sie getötet?~ EXTERN AC#ULIT2 iltkazar_treason_02
		IF ~~ THEN REPLY ~Vermutlich weil Ihr sie mit Euren bösartigen Fähigkeiten dazu gezwungen habt!~ EXTERN AC#ULIT2 iltkazar_treason_02
		IF ~~ THEN REPLY ~Sie werden schon wieder zurückkommen.~ EXTERN AC#ULIT2 crew_is_gone
		IF ~~ THEN REPLY ~Na und?~ EXTERN AC#ULIT2 crew_is_gone

	
		CHAIN AC#ULIT2 iltkazar_treason_02 
		~Das hätten wir tun können, doch viel unterhaltsamer ist es doch, wenn sich die niederen Rassen gegenseitig zerfleischen.~
		END		
		IF ~~ THEN EXTERN AC#ULIT2 crew_is_gone 
		
		CHAIN AC#ULIT2 crew_is_gone
		~Die Bootsbesatzung ist aus freien Stücken zurückgerudert, <CHARNAME>. Die Zwerge haben Euch hier in der Einöde Eurem Schicksal überlassen.~
		END
		IF ~~ THEN REPLY ~Das kann nicht sein.~ EXTERN AC#ULIT2 iltkazar_treason_03
		IF ~~ THEN REPLY ~Vielleicht haben sie mich betrogen, ja. Das macht mir aber nichts mehr aus.~ EXTERN AC#ULIT2 maybe_treason

		
			CHAIN AC#ULIT2 iltkazar_treason_03
			~(Die Tentakel des Illithiden zucken hin und her, und das Wesen gibt ein glucksendes Geräusch von sich. Ihr seid Euch nicht sicher, ob dies eine seltsame Form des Lachens sein könnte.)~ [MINDF01] 
			=
			~Seid Ihr Euch da sicher? Sie haben doch außer einem tränenreichen Abschied nichts weiter für Euch getan. Vielleicht ist der einzige Grund, weshalb Ihr für Sie diese Aufträge lösen solltet, der, dass sie Euch schnellstmöglich loswerden wollten.~
			END
			IF ~~ THEN REPLY ~Ich glaube Euch das alles nicht!~ EXTERN AC#ULIT2 iltkazar_treason_04
			IF ~~ THEN REPLY ~Redet so viel Ihr wollt. Mich könnt Ihr nicht überzeugen.~ EXTERN AC#ULIT2 iltkazar_treason_04
			IF ~~ THEN REPLY ~Vielleicht haben sie mich betrogen, ja. Das macht mir aber nichts mehr aus.~ EXTERN AC#ULIT2 maybe_treason

			
			CHAIN AC#ULIT2 iltkazar_treason_04
			~Dann geht selbst an das Ufer und sucht nach den Booten.~ 			
			END
			IF ~~ THEN EXTERN AC#ULIT2 maybe_treason
			
			
			CHAIN AC#ULIT2 maybe_treason
			~Ihr sitzt hier fest, <PRO_RACE>.~ 
			END
			IF ~~ THEN EXTERN AC#ULIT2 good_bye
			
			
				CHAIN AC#ULIT2 good_bye
				~Wir wünschen Euch viel Erfolg bei der Suche nach unserem gemeinsamen Feind. Betet zu Euren Göttern von der Oberfläche, dass Ihr niemals wieder einen unserer Rasse zu Gesicht bekommen werdet. Wir werden jetzt in unsere Stadt zurückkehren.~			
				END
				IF ~~ THEN REPLY ~Das werdet Ihr nicht. Jedenfalls nicht lebendig!~ EXTERN AC#ULIT2 fight_01
				IF ~~ THEN REPLY ~Nun gut. ich werde meine Suche fortsetzen.~ EXTERN AC#ULIT2 bye_teleport_away
				
				CHAIN AC#ULIT2 fight_01
				~Wie bitte? Ich habe mich wohl in Euren Gedanken verirrt.~
				END
				IF ~~ THEN REPLY ~Zeit zu sterben, Monster!~ EXTERN AC#ULIT2 fight_bye
				IF ~~ THEN REPLY ~Geht schon. ich werde meine Suche fortsetzen.~ EXTERN AC#ULIT2 bye_teleport_away
				
				CHAIN AC#ULIT2 fight_bye
				~Was für ein dummer Narr Ihr doch seid, Euch mit uns anzulegen!~
				END
				IF ~~ THEN DO ~Shout(89)
				SetGlobal("IllithidFight","ACIL28",1)
				SetGlobal("AC#Ruvan_Treason","GLOBAL",1)				
				AddJournalEntry(@62046,QUEST) // Barakuir Quest: boats are gone
				Enemy()~ EXIT
				
				CHAIN AC#ULIT2 bye_teleport_away
				~Ihr seid ein braver Diener. Los, Freunde und Sklave, wir gehen.~
				END
				IF ~~ THEN DO ~SetGlobal("AC#Ruvan_Treason","GLOBAL",1)
				SetGlobal("IllithidTeleport","ACIL28",1)
				AddJournalEntry(@62046,QUEST) // Barakuir Quest: boats are gone
				CreateVisualEffectObject("SPDIMNDR",Myself) 
				Wait(1)				
				DestroySelf()~ EXIT
											


CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#ULIT2 hello_01
~Seid gegrüßt, <CHARNAME>. Eine Überraschung, Euch hier wiederzusehen. Erinnert Ihr Euch an mich? Das letzte Mal standen wir uns im Spiegel gegenüber. Ich würde Eurer Erinnerung gerne noch weiter auf die Sprünge helfen, doch... nein... Eure Erinnerung wird später für etwas anderes gut sein.~
END
  IF ~~ THEN REPLY ~Ihr wart der Illithide, den ich in Ellhimars Spiegel gesehen habe!~ EXTERN AC#ULIT2 ellhimars_mirror 
  IF ~~ THEN REPLY ~Kennen wir uns etwa?~ EXTERN AC#ULIT2 do_we_know 

	CHAIN AC#ULIT2 do_we_know
	~Mit Eurer Auffassungsgabe taugt Ihr höchstens als Sklave. Armselig.~
	END
	IF ~~ THEN EXTERN AC#ULIT2 kill_elder_brain
	
	CHAIN AC#ULIT2 ellhimars_mirror
	~Wie aufgeweckt! Da seid Ihr mir doch noch zu etwas nütze.~
	END
	IF ~~ THEN EXTERN AC#ULIT2 kill_elder_brain 
	
	CHAIN AC#ULIT2 kill_elder_brain
	~Doch zunächst müssen wir uns um diese... Aberration hier kümmern. Was für ein jämmerlicher Anblick dieses einstige Ältestenhirn doch ist! Eine Schande für unsere großartige Rasse. Wo ist der Sklave?~
	END
	IF ~~ THEN DO ~StartCutSceneMode()
	StartCutScene("AC#28CT4")~ EXIT



												
// -------------------------------------------------
// Drow Mage Slave
//--------------------------------------------------

BEGIN ~AC#28DRS~

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#28DRS yes_master
~Ja, Meister?~
== AC#ULIT2 ~Vernichtet dieses untote Ding dort.~
== AC#28DRS ~Jawohl, Meister. Ein Zauber und seine Existenz ist vorbei. Ich werde es mit meinen Flammen vernichten.~
END
IF ~~ THEN DO ~SetGlobal("FireballBrain","ACIL28",1)
~ EXIT 

// encounter with illithids
BEGIN ~AC#IL28G~

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#IL28G hello_00
~<PRO_RACE>, helft mir! Rettet mich vor den Illithiden!~
== AC#ULIT2 ~Klammert Euch nicht an diese niedere Kreatur, untote Irrung! Für Euer Dasein habt Ihr nichts als den Tod verdient! Tretet beiseite, <CHARNAME>, und lasst uns dies hier beenden.~
END
IF ~~ THEN REPLY ~Nein. Ich werde nicht zulassen, dass Ihr dem Wesen etwas antut.~ EXTERN AC#ULIT2 dont_hurt_brain
IF ~~ THEN REPLY ~Mir ist es gleich. Tötet es, wenn Ihr müsst.~ EXTERN AC#IL28G i_dont_mind_kill_brain

CHAIN AC#ULIT2 dont_hurt_brain
~Was? Ihr seid nicht ganz bei Trost, Euch gegen uns zu stellen!~
END
IF ~~ THEN REPLY ~Ich meine es ernst.~ EXTERN AC#ULIT2 dont_hurt_brain_02
IF ~~ THEN REPLY ~Natürlich.~ EXTERN AC#IL28G i_dont_mind_kill_brain

	CHAIN AC#ULIT2 dont_hurt_brain_02
	~Ihr wollt Euch wirklich auf die Seite dieses Wesens stellen?~
	=
	~Wir haben den gleichen Feind, <CHARNAME>. Ihr habt die toten Illithiden bei der Zwergenpatrouille gesehen! Wir wissen von dem schlafenden König.~
	END
	IF ~~ THEN REPLY ~Nein. Ich bleibe dabei.~ EXTERN AC#ULIT2 dont_hurt_brain_fight
	IF ~~ THEN REPLY ~Ihr habt Recht. Also gut, tötet dieses untote Ding.~ EXTERN AC#IL28G i_dont_mind_kill_brain

	CHAIN AC#ULIT2 dont_hurt_brain_fight
	~So sei es! Es wird uns großes Vergnügen bereiten, Euch als Sklaven in unsere Stadt zu bringen, wo Ihr den Rest Eures armseligen Lebens unter unserer Herrschaft verbringen werdet!~
	DO ~Shout(89)
	Enemy()~EXIT	
	
	CHAIN AC#IL28G i_dont_mind_kill_brain
	~Nein! Ich werde das nicht zulassen!~
	DO ~StartCutSceneMode()
	StartCutScene("AC#28CT5")~EXIT	
/*												
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

*/