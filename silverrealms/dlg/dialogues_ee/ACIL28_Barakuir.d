
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
	IF ~~ THEN DO ~AddJournalEntry(@62045,QUEST)
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

// Githyanki

BEGIN AC#28GI1

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#28GI1 hello_0
~Die Illithiden sind fort. Das erleichtert einiges.~
END
IF ~!Dead("AC#ULIT2")~ THEN EXTERN AC#28GI1 illithid_NOT_dead
IF ~Dead("AC#ULIT2")~ THEN EXTERN AC#28GI1 illithid_YES_dead

	CHAIN AC#28GI1 illithid_NOT_dead
	~Die Schinder sind in ihre Stadt zurückgekehrt - feige, wie es ihre Art ist. Wir hätten es bevorzugt, wenn Ihr sie getötet hättet. Das hätte uns weitere Arbeit erspart.~
	END
	IF ~~ THEN REPLY ~Was wollt Ihr?~ EXTERN AC#28GI1 what_do_you_want
	IF ~~ THEN REPLY ~Ich habe nicht vor, Eure persönlichen Rechnungen mit den Gedankenschindern zu begleichen.~ EXTERN AC#28GI1 what_do_you_want
	IF ~~ THEN REPLY ~Das klingt jetzt nach Eurem Problem, nicht nach meinem.~ EXTERN AC#28GI1 what_do_you_want
	
	CHAIN AC#28GI1 illithid_YES_dead
	~Und Ihr habt sogar ihren Anführer, diesen Ulitharid, getötet! Das erspart uns reichlich Arbeit.~
	END
	IF ~~ THEN REPLY ~Was wollt Ihr?~ EXTERN AC#28GI1 what_do_you_want
	IF ~~ THEN REPLY ~Sagt mir, warum Ihr hier seid.~ EXTERN AC#28GI1 what_do_you_want
	IF ~~ THEN REPLY ~Ich habe die Illithiden nicht für Euch getötet.~ EXTERN AC#28GI1 what_do_you_want
	IF ~~ THEN REPLY ~Kommt zur Sache.~ EXTERN AC#28GI1 what_do_you_want

	CHAIN AC#28GI1 what_do_you_want
	~Euer Einsatz war heldenhaft, doch nutzlos. Bedauerlich, dass Ihr nun hier, am äußersten Rand des Unterreiches, Eure Reise nicht weiter fortsetzen könnt.~
	END	
	IF ~~ THEN REPLY ~Wie meint Ihr das?~ EXTERN AC#28GI1 iltkazar_traitor
	IF ~~ THEN REPLY ~Ich fahre einfach mit den Booten zurück nach Iltkazar.~ EXTERN AC#28GI1 iltkazar_traitor
	IF ~~ THEN REPLY ~Droht Ihr mir?~ EXTERN AC#28GI1 iltkazar_traitor
		
		CHAIN AC#28GI1 iltkazar_traitor
		~Ihr sitzt hier fest. Es gibt keinen Weg zurück. Die Boote, mit denen Ihr hierher gebracht wurdet, sind verschwunden. Die Zwerge, denen Ihr so blind vertraut habt, haben Euch zurückgelassen!~
		END
		IF ~~ THEN REPLY ~Sie werden schon wieder zurückkommen.~ EXTERN AC#28GI1 crew_is_gone
		IF ~~ THEN REPLY ~Ihr habt sie getötet!~ EXTERN AC#28GI1 iltkazar_treason_02
		IF ~~ THEN REPLY ~Vermutlich weil Ihr sie dazu gezwungen habt!~ EXTERN AC#28GI1 iltkazar_treason_02		
		IF ~~ THEN REPLY ~Na und?~ EXTERN AC#28GI1 crew_is_gone

	
		CHAIN AC#28GI1 iltkazar_treason_02 
		~Das hätten wir tun können, doch viel unterhaltsamer ist es doch, wenn sich die niederen Rassen gegenseitig zerfleischen.~
		END		
		IF ~~ THEN EXTERN AC#28GI1 crew_is_gone 
		
		CHAIN AC#28GI1 crew_is_gone
		~Die Bootsbesatzung ist aus freien Stücken zurückgerudert. Die Zwerge haben Euch hier in der Einöde ganz bewusst Eurem Schicksal überlassen, weil sie Euch loswerden wollten.~
		END
		IF ~~ THEN REPLY ~Das kann nicht sein.~ EXTERN AC#28GI1 iltkazar_treason_03
		IF ~~ THEN REPLY ~Vielleicht haben sie mich betrogen. Das macht mir aber nichts aus.~ EXTERN AC#28GI1 maybe_treason
		
		CHAIN AC#28GI1 iltkazar_treason_03
			~Seid Ihr Euch da sicher? Sie haben doch außer einem tränenreichen Abschied nichts weiter für Euch getan. Vielleicht ist der einzige Grund, weshalb Ihr für Sie diese Aufträge lösen solltet, der, dass sie Euch schnellstmöglich loswerden wollten.~
			END
			IF ~~ THEN REPLY ~Redet so viel Ihr wollt. Mich könnt Ihr nicht überzeugen.~ EXTERN AC#28GI1 maybe_treason
			IF ~~ THEN REPLY ~Vielleicht haben sie mich betrogen, ja. Das macht mir aber nichts mehr aus.~ EXTERN AC#28GI1 maybe_treason
						
			CHAIN AC#28GI1 maybe_treason
			~Hier endet jedenfalls Euer Weg, <PRO_RACE>.~ 
			END
			IF ~~ THEN REPLY ~Ich werde schon einen Weg zurück finden!~ EXTERN AC#28GI1 illithid_patrol
			IF ~~ THEN REPLY ~Davon lasse ich mich nicht aufhalten.~ EXTERN AC#28GI1 illithid_patrol
	
	CHAIN AC#28GI1 illithid_patrol
	~Eure Einmischung in unsere Angelegenheiten ist damit auch vorüber. Wir haben Iltkazar lange aus unserem Stützpunkt vor der Stadt beobachtet und wurden mehrere Male unangenehm gestört.~ 
	= ~Die Gedankenschinder waren uns damals auf die Schliche gekommen. Natürlich haben wir sie getötet. Auch die Zwergenpatrouille vor Iltkazar, die so töricht war, unser Versteck zu betreten, fand durch unsere Klingen ihren Tod.~
	END
	IF ~~ THEN EXTERN AC#28GI1 what_do_you_do
	
	CHAIN AC#28GI1 what_do_you_do
	~Denn es zieht Krieg auf. Ein großer Krieg! In ihm sind selbst wir nur Söldner. Wir kämpfen darin auf der richtigen Seite – nicht aus Ehre, sondern aus Pflichtgefühl. Und Ihr dürft kein Teil dieses Krieges werden. Deshalb müsst Ihr jetzt sterben!~	
	DO ~SetGlobal("AC#Ruvan_Treason","GLOBAL",1)
	SetGlobal("GithFight","ACIL28",2)
	AddJournalEntry(@62046,QUEST)
	Enemy() ~EXIT
	
	
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
~Ihr habt den Neothelid vernichtet! Dafür gebührt Euch mein aufrichtiger Dank.~
END
IF ~~ THEN REPLY ~Wer seid Ihr?~ EXTERN AC#IL28E who_are_you
IF ~~ THEN REPLY ~Mit Euch hatte ich jetzt nicht gerechnet.~ EXTERN AC#IL28E who_are_you
IF ~~ THEN REPLY ~Ich habe es nicht für Euch getan.~ EXTERN AC#IL28E who_are_you
IF ~~ THEN REPLY ~Nennt mir einen Grund, warum ich mit Euch nicht dasselbe machen sollte!~ EXTERN AC#IL28E who_are_you

	CHAIN AC#IL28E who_are_you
	~Einst war ich das Ältestenhirn dieser Siedlung und vereinte tausende Gehirne in einem einzigen Geist. Ich war ein Nexus aus Wissen, Macht und Kontrolle. Nun bin ich... seht mich an.~
	END
	IF ~~ THEN REPLY ~Was ist geschehen?~ EXTERN AC#IL28E what_happened
	IF ~~ THEN REPLY ~Ein verfaulter Haufen Gehirnmasse.~ EXTERN AC#IL28E what_happened
	IF ~~ THEN REPLY ~Eure besten Jahre liegen eindeutig hinter Euch.~ EXTERN AC#IL28E what_happened

		CHAIN AC#IL28E what_happened
		~Die Siedlung zerfiel, als die Duergar rebellierten. Der Zustrom an Nahrung versiegte. Ordnung fiel Hunger anheim.~
		=
		~Illithiden wandten sich gegeneinander. Kannibalismus. Ich verlor die Kontrolle. Larven fraßen Larven, bis nur eine verblieb – und zu jenem Ding heranwuchs, das Ihr gerade vernichtet habt und vor dem ich mich verstecken musste: Ein Neothelid.~
		END
		IF ~~ THEN REPLY ~Dieses Monstrum von vorhin war einmal eine kleine Larve? Widerlich.~ EXTERN AC#IL28E neothelid
		IF ~~ THEN REPLY ~Eine Larve frisst ihre Artgenossen und wächst zu so etwas heran; selbst für Illithiden ist das abstoßend.~ EXTERN AC#IL28E neothelid
		IF ~~ THEN REPLY ~Ihr musstet Euch also vor Eurer eigenen Larve verstecken.~ EXTERN AC#IL28E neothelid
		IF ~~ THEN REPLY ~Das muss bitter sein. Einst habt Ihr ganze Illithiden gelenkt, und am Ende jagte Euch eine Larve aus Eurem eigenen Becken.~ EXTERN AC#IL28E neothelid

			CHAIN AC#IL28E neothelid
			~Für Euch widerlich. Für mich drohte der Untergang. Ein Neothelid begehrt Bewusstsein, kennt keine Fessel. Er verzehrt alles, was Intellekt besitzt. Und in meinem schutzlosen Zustand hätte er auch mich vernichtet.~
			=
			~Um mich zu bewahren, löste ich meinen Geist von meinem Leib und wechselte die Ebene. Mein Becken vertrocknete. Das materielle Gewebe starb. Doch meine Gedanken blieben! So wurde ich zu der untoten Masse, die Ihr nun seht und hört.~
			END
			IF ~~ THEN REPLY ~Ihr seid also eine Art Zombie-Gehirn?~ EXTERN AC#IL28E astral_plane
			IF ~~ THEN REPLY ~Übel.~ EXTERN AC#IL28E astral_plane

				CHAIN AC#IL28E astral_plane
				~Nennt es, wie Ihr wollt. Mir bleibt nur dieser untote Körper, denn Untergebene gibt es keine mehr. Ich bin, was von einem großen Geist übrig blieb. Einst herrschte ich über viele Gedanken, nun hüte ich nur noch Erinnerung.~
				=
				~Durch mein untotes Dasein würde mich jeder Gedankenschinder vernichten, sobald er mich entdeckt. Meine Existenz ist ihnen ein Frevel. Darum lebe ich die meiste Zeit versteckt vor ihrem Bewusstsein, in ständiger Angst, eines Tages vollständig vernichtet zu werden.~
				=
				~Es ist daher angenehm, wieder mit einem einfachen denkenden Wesen wie Euch kommunizieren zu dürfen. Zu Lebzeiten hätte ich Euer Gehirn gerne konsumiert und Euer Bewusstsein in mich aufgenommen. Doch die Zeiten werden anders, schwieriger. Ihr habt mir geholfen.~
				END
				IF ~~ THEN REPLY ~Dann helft Ihr mir jetzt.~ EXTERN AC#IL28E now_help_me
				IF ~~ THEN REPLY ~Das habe ich nicht ohne Grund getan. Ich brauche etwas von Euch.~ EXTERN AC#IL28E now_help_me
				
					CHAIN AC#IL28E now_help_me
					~Oh, gerne. Wenngleich mir... das Denken zunehmend schwer fällt. Die Erinnerungen... sie verblassen. Was wollt Ihr von mir?~
					END
					IF ~~ THEN REPLY ~Der Zwergenkönig Mith Barak erwähnte diesen Ort. Sagt Euch sein Name etwas?~ EXTERN AC#IL28E how_help
					//IF ~~ THEN REPLY ~König Mith Barak aus Iltkazar scheint etwas mit diesem Ort verbunden zu haben. Könnt Ihr mir sagen, was?~ EXTERN AC#IL28E how_help
					IF ~~ THEN REPLY ~Ich brauche Informationen über Mith Barak. Vielleicht findet Ihr noch etwas über ihn in Euren Erinnerungen.~ EXTERN AC#IL28E how_help
					IF ~~ THEN REPLY ~Kennt Ihr den Namen Mith Barak? Ich vermute, dass er Euch einst aufgesucht hat.~ EXTERN AC#IL28E how_help

					CHAIN AC#IL28E how_help
					~Mith Barak? Mith Barak.... ja, ganz dunkel erinnere mich an den Namen. Oder doch nicht? Es ist vage, sehr vage. Hmm... Ich kenne diesen Namen. Ich... kann nur nicht mehr sagen, woher.~
					END
					IF ~~ THEN REPLY ~Seid Ihr ihm einmal begegnet?~ EXTERN AC#IL28E met_mith_01
					IF ~~ THEN REPLY ~Erinnert Euch noch ein wenig mehr.~ EXTERN AC#IL28E met_mith_01
					IF ~~ THEN REPLY ~Sucht tiefer in Euren Erinnerungen! Was verbindet Ihr mit Mith Barak?~ EXTERN AC#IL28E met_mith_01

						CHAIN AC#IL28E met_mith_01
						~Ich weiß, von wem Ihr sprecht! Ja, ich weiß es ganz genau! Wie hieß er noch gleich? Ich... ich glaube... ich kenne diesen... wie war noch gleich sein Name?~
									END
									IF ~~ THEN REPLY ~Mith Barak.~ EXTERN AC#IL28E mith_curse
									IF ~~ THEN REPLY ~M-I-T-H-B-A-R-A-K!~ EXTERN AC#IL28E mith_curse
									
										CHAIN AC#IL28E mith_curse
										~Ja, der Name kommt mir tatsächlich bekannt vor. In den tiefsten Windungen meines Gehirns regt sich etwas...~
										END
										IF ~~ THEN EXTERN AC#IL28E mith_forgot_again
										
											CHAIN AC#IL28E mith_forgot_again
											~...und jetzt ist es wieder weg. Vergessen! So etwas aber auch. Das geschieht in letzter Zeit häufiger. Ich hatte beinahe den Eindruck, es wäre wichtig gewesen. Können wir uns nicht über etwas anderes unterhalten?~
											== JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN ~Von allen Ältestenhirnen dieser Welt haben wir uns ausgerechnet eines mit Gedächtnisschwund ausgesucht.~
											== BEDWIN IF ~InParty("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN ~Das ist Zeitverschwendung, <CHARNAME>. Dieses Ding ist zu stark verwest, um sich mit ihm abzugeben.~
											END
											IF ~~ THEN REPLY ~Mith Barak meinte, dass in Barakuir eine Lösung für seinen Fluch liegen könnte.~ EXTERN AC#IL28E barakuir_forgotten
											IF ~~ THEN REPLY ~Der König von Iltkazar hat diesen ganzen Weg nach Barakuir auf sich genommen, um mit Euch zu sprechen.~ EXTERN AC#IL28E barakuir_forgotten
											
											CHAIN AC#IL28E barakuir_forgotten
											~Barakuir? Was ist das?~
											END
											IF ~~ THEN REPLY ~Der Ort, an dem Ihr gerade vor Euch hinfault.~ EXTERN AC#IL28E barakuir_forgotten_02
											IF ~~ THEN REPLY ~Dies hier ist Barakuir.~ EXTERN AC#IL28E barakuir_forgotten_02
											
											CHAIN AC#IL28E barakuir_forgotten_02
											~Oh! Barakuir. Interessant. Das wusste ich nicht mehr. Es tut gut, sich mit Euch zu unterhalten! Ich lerne viele neue Dinge hinzu, nun, da die alten Gedanken verschwunden sind.~
											END
											IF ~~ THEN REPLY ~Ihr müsst versuchen, Euch an die alten Gedanken zu erinnern!~ EXTERN AC#IL28E try_remember_old_thoughts
											//IF ~~ THEN REPLY ~Dann helft mir, Eure Gedanken wiederzufinden. Mith Baraks Schicksal könnte davon abhängen.~ EXTERN AC#IL28E try_remember_old_thoughts	
											IF ~~ THEN REPLY ~Wenn noch etwas von Eurem alten Wissen übrig ist, dann brauchen wir es jetzt.~ EXTERN AC#IL28E try_remember_old_thoughts	
											IF ~~ THEN REPLY ~Genießt Eure neuen Erkenntnisse später. Im Augenblick seid Ihr nur nützlich, wenn Ihr Euch an die alten erinnert.~ EXTERN AC#IL28E try_remember_old_thoughts											
											
												CHAIN AC#IL28E try_remember_old_thoughts
												~Ach, es ist so anstrengend. Doch die Erinnerung an die alte Zeit tut auch gut. Macht, Stärke, Gedanken... Barakuir. Ja. Wartet! Da kommt etwas zurück: Stimmen. Gedanken. Mith Barak...~ 
												=
												~Wer war Mith Barak noch gleich?~
												END
												IF ~~ THEN REPLY ~Der Zwergenkönig.~ EXTERN AC#IL28E mith_remember
												IF ~~ THEN REPLY ~Mith Barak, der Zwergenkönig. Versucht bitte, wenigstens diesen Teil zu behalten.~ EXTERN AC#IL28E mith_remember	
												IF ~~ THEN REPLY ~Mith Barak: König von Iltkazar. Ich beginne, mich zu wiederholen.~ EXTERN AC#IL28E mith_remember												
												
												CHAIN AC#IL28E mith_remember
												~Der Zwergenkönig Mith Barak. Ja. Er war hier! Er sprach mit mir. Teilte einige seiner Erinnerungen mit mir! Im Austausch für etwas...~
												END
												IF ~~ THEN REPLY ~Versucht Euch bitte auch noch an den wichtigen Teil zu erinnern: Was wollte er?~ EXTERN AC#IL28E mith_remember_book_or_dragon_cem
												IF ~~ THEN REPLY ~Für was? Was wollte er?~ EXTERN AC#IL28E mith_remember_book_or_dragon_cem
												
												CHAIN AC#IL28E mith_remember_book_or_dragon_cem
												~Er wollte... er wollte... oh, ist das schwierig... er wollte...~
												END												
												IF ~~ THEN REPLY ~Geht in Euch! Ihr seid fast dort. Was wollte Mith Barak?~ EXTERN AC#IL28E mith_remember_book_or_dragon_cem_02
												IF ~~ THEN REPLY ~Wir sind so nah dran. Bitte macht es jetzt nicht wieder kaputt.~ EXTERN AC#IL28E mith_remember_book_or_dragon_cem_02
												IF ~~ THEN REPLY ~Falls Ihr vorhabt, mich mit Spannung zu ärgern: Es funktioniert. Weiter!~ EXTERN AC#IL28E mith_remember_book_or_dragon_cem_02
												
												CHAIN AC#IL28E mith_remember_book_or_dragon_cem_02
												~Er wollte seinen merkwürdigen Schlaf loswerden. Ja! Das war es! Er war auf der Suche nach einem Ort an der Oberfläche. Doch er wusste nicht, wie er den Fluch brechen könnte. Jetzt fällt es mir wieder ein!~
												END												
												IF ~~ THEN REPLY ~Erzählt mir alles, woran Ihr Euch noch erinnern erinnern könnt!~ EXTERN AC#IL28E mith_remember_continue
												IF ~~ THEN REPLY ~Endlich kommen wir voran! Was fällt Euch noch ein?~ EXTERN AC#IL28E mith_remember_continue
												IF ~~ THEN REPLY ~Ihr habt also doch noch etwas Brauchbares in diesem Becken. Weiter.~ EXTERN AC#IL28E mith_remember_continue
												IF ~~ THEN REPLY ~Ausgezeichnet. Jetzt nur nicht wieder alles vergessen.~ EXTERN AC#IL28E mith_remember_continue
												
													
												CHAIN AC#IL28E mith_remember_continue
												~Ich... ich... habe viel mit Mith Barak gesprochen. Und er hat mir im Austausch dafür einige seiner Erinnerungen geschenkt.~
												END
												IF ~~ THEN REPLY ~Ihr habt seine Erinnerungen?~ EXTERN AC#IL28E	mith_remember_02
												IF ~~ THEN REPLY ~Dann befinden sich Teile seiner Erinnerung noch immer in Euren verfaulten Gehirn?~ EXTERN AC#IL28E mith_remember_02												

												CHAIN AC#IL28E mith_remember_02
												~Ja. Seine Erinnerungen. Sie sind irgendwo hier. Zwischen meinen. Oder unter ihnen. Gedanken lassen sich so schlecht sortieren! Wo sind sie denn nun? Hoffentlich nicht in einem Teil von mir, der schon abgefallen ist...~
												=
												~Irgendwo hier müssten sie doch noch sein...~
												=
												~Ich weiß es nicht mehr. Meine Hirnmasse ist wohl schon zu arg verfault. Wenn ich sie doch nur erneut konsumieren könnte...~
												END
												IF ~~ THEN REPLY ~Was soll ich tun?~ EXTERN AC#IL28E tell_me_more
												IF ~~ THEN REPLY ~Wenn ich Euch dafür Teile Eures eigenen Gehirns verfüttern muss, dann gerne!~ EXTERN AC#IL28E tell_me_more
												IF ~~ THEN REPLY ~Ich hoffe, Ihr meint das nicht wörtlich.~ EXTERN AC#IL28E tell_me_more
												
												CHAIN AC#IL28E tell_me_more
												~Hm...~												
												END
												IF ~~ THEN REPLY ~Was?~ EXTERN AC#IL28E tell_me_more_02
												
													CHAIN AC#IL28E tell_me_more_02
													~Oh! Seid gegrüßt. Es tut gut, ein denkendes Geschöpf zu sehen! Haben wir uns schon einmal gesehen? Was wollt Ihr hier?~												
													END
													IF ~~ THEN REPLY ~Ihr wolltet mir helfen.~ EXTERN AC#IL28E tell_me_more_03
													IF ~~ THEN REPLY ~Das führt doch zu nichts.~ EXTERN AC#IL28E tell_me_more_03
													IF ~~ THEN REPLY ~Ich werde wohl anderswo nach Antworten suchen.~ EXTERN AC#IL28E tell_me_more_03
													
													CHAIN AC#IL28E tell_me_more_03
													~Moment! Geht nicht fort! In Euch ist eine Spur von etwas, das lange Zeit tot war. Etwas, das nicht Euch alleine gehört! Ich spüre seine Gedanken... Alt. Sehr alt. Ein Gott? Ich spüre... Blut. Blut! Irgendjemand wollte etwas mit Eurem Blut. Der Zwergenkönig! Um seinen Fluch zu brechen. Obwohl er Euch gar nicht kannte? Kann das sein? Ich... weiß es nicht mehr.~
													=
													~Mith Barak wollte jemanden wiedererwecken. Wegen seines Fluchs. Dafür brauchte er Blut... besonderes Blut. Eures? Nein... doch. Vielleicht. Ich weiß es nicht mehr. Das Denken daran ist ausgesprochen anstrengend...~												
													END
													IF ~~ THEN REPLY ~Was hat Mith Barak über mein Blut gesagt?~ EXTERN AC#IL28E illithid_are_coming
													IF ~~ THEN REPLY ~Woher sollte Mith Barak von mir gewusst haben?~ EXTERN AC#IL28E illithid_are_coming
													IF ~~ THEN REPLY ~Mein Blut? Was hat das mit Mith Baraks Fluch zu tun?~ EXTERN AC#IL28E illithid_are_coming

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
	~Ihr habt die Degeneration beseitigt. Das, was hier verblieb, war kein Teil des Kollektivs mehr. Nur Fäulnis ohne Nutzen. Ihr habt diesen alten Tempel unserer Rasse von der Geißel, die ihn über Jahrhunderte besessen hat, befreit. Der Tempel ist nun frei von abartiger Persistenz.~
	END
	IF ~~ THEN EXTERN AC#ULIT2 illithid_talk_03 
	
	CHAIN AC#ULIT2 illithid_talk_03
	~Ihr handeltet nicht für uns. Ihr handelt aus Unwissen. Ein Antrieb, den wir respektieren – und kontrollieren wollen. Ihr sucht Antworten. Dieses Ziel teilen wir mit Euch.~
	END
	IF ~~ THEN REPLY ~Warum sollte ich überhaupt mit Euch reden?~ EXTERN AC#ULIT2 illithid_talk_04
	IF ~~ THEN REPLY ~Was für Antworten?~ EXTERN AC#ULIT2 illithid_talk_04
	
	CHAIN AC#ULIT2 illithid_talk_04
	~Wir haben den gleichen Feind. Wir beobachten Iltkazar schon lange, so wie wir alles um uns herum beobachten. Die Stadt der Zwerge übt wegen des dort gehorteten Wissens einen großen Reiz auf uns aus.~
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
	~Unser Feind ist nicht frei von Fehlern. Die getötete Zwergenpatrouille vor den Toren derart offensichtlich zurückzulassen war einer davon.~ 
	END
	IF ~~ THEN REPLY ~Ihr wisst von der Patrouille?~ EXTERN AC#ULIT2 dwarf_patrol
	
	CHAIN AC#ULIT2 dwarf_patrol
	~Ihr habt die Köpfe meiner Artgenossen in dieser Kammer gesehen. Eine unnötige Zurschaustellung. Ein solches Signal verrät Präsenz. Präsenz erzeugt Aufmerksamkeit. Aufmerksamkeit führt zu Vergeltung.~
	END
	IF ~~ THEN REPLY ~Stimmt, dort waren ja diese Illithiden-Köpfe.~ EXTERN AC#ULIT2 what_mistakes_02
	IF ~~ THEN REPLY ~Bisher sagt Ihr mir noch nichts Neues.~ EXTERN AC#ULIT2 what_mistakes_02
	
	CHAIN AC#ULIT2 what_mistakes_02
	~Etwas stößt aus den Schatten vor und verschwindet wieder. Habt Ihr das erloschene Portal vor Iltkazar bemerkt?~
	END
	IF ~~ THEN REPLY ~Ich konnte durch das Portal hindurchsehen und sah ein rabengesichtiges Scheusal.~ EXTERN AC#ULIT2 raven_fiend
	IF ~~ THEN REPLY ~Das werde ich jemandem wie Euch bestimmt nicht sagen!~ EXTERN AC#ULIT2 raven_fiend_not_telling
	
	CHAIN AC#ULIT2 raven_fiend
	~Ein rabengesichtiges Scheusal? Interessant. Es gibt wenige solcher Kreaturen. Doch eine käme dafür in Frage. Malphas. Ein Teufel aus der Unterwelt.~
	END
	IF ~~ THEN REPLY ~Was könnte er hier zu schaffen haben?~ EXTERN AC#ULIT2 malphas_01
	IF ~~ THEN REPLY ~Ein Teufel?~ EXTERN AC#ULIT2 malphas_01
	
	CHAIN AC#ULIT2 raven_fiend_not_telling
	~Ihr blicktet hindurch und saht wahrscheinlich das rabengesichtige Antlitz von Malphas, dem Teufel.~
	END
	IF ~~ THEN REPLY ~Was könnte er hier zu schaffen haben?~ EXTERN AC#ULIT2 malphas_01
	IF ~~ THEN REPLY ~Ein Teufel?~ EXTERN AC#ULIT2 malphas_01
	
		CHAIN AC#ULIT2 malphas_01
		~So langsam ergibt die Geschichte durchaus einen Sinn. Ja, das tut sie. Und ich denke, ich weiß jetzt, wer uns Illithiden jagt. Und wer vielleicht für den Schlaf des Königs verantwortlich ist.~
		END
		IF ~~ THEN REPLY ~Wer ist es?~ EXTERN AC#ULIT2 what_benefit
	
		CHAIN AC#ULIT2 what_benefit
		~Das werde ich Euch nicht sagen. Ihr habt mächtige Gegner vor Euch, wenn Ihr das Rätsel des schlafenden Königs lösen wollt. Dabei nützt Ihr uns. So lange dies der Fall ist, werden wir Euch nicht behelligen. Als Zeichen unseres guten Willens lassen wir Euch Eure Suche fortsetzen.~
		END
		IF ~~ THEN EXTERN AC#ULIT2 khaernd_mention
		
		CHAIN AC#ULIT2 khaernd_mention
		~Und übermittelt unserem entflohenen Sklaven in Iltkazar, dass wir seine Spur nicht verloren haben.~
		END
		IF ~~ THEN REPLY ~Wer soll das sein?~ EXTERN AC#ULIT2 khaernd_mention_02
		IF ~~ THEN REPLY ~Ein entflohener Sklave in Iltkazar?~ EXTERN AC#ULIT2 khaernd_mention_02
		IF ~~ THEN REPLY ~Wer immer es ist - dann ist er klüger als seine ehemaligen Herren.~ EXTERN AC#ULIT2 khaernd_mention_02
		
		CHAIN AC#ULIT2 khaernd_mention_02
		~Die Zwerge wissen, wenn wir meinen. Irgendwann versklaven wir sie alle. Doch nun genug der Worte.~
		END
		IF ~~ THEN EXTERN AC#ULIT2 wish_success
								
				CHAIN AC#ULIT2 wish_success
				~Verfolgt weiterhin Euren Feind. Unsere Interessen überschneiden sich vorerst. Ruft Eure schwachen Götter der Oberfläche an, dass sich unsere Wege nicht erneut kreuzen. Wir kehren nun in unsere Stadt zurück.~			
				END
				IF ~~ THEN REPLY ~Das werdet Ihr nicht. Jedenfalls nicht lebendig!~ EXTERN AC#ULIT2 fight_01
				IF ~~ THEN REPLY ~Nun gut. ich werde meine Suche fortsetzen.~ EXTERN AC#ULIT2 bye_teleport_away
				
				CHAIN AC#ULIT2 fight_01
				~Was sagt Ihr da? Ich habe mich wohl in Euren Gedanken verirrt.~
				END
				IF ~~ THEN REPLY ~Ihr habt richtig vernommen. Zeit zu sterben, Monster!~ EXTERN AC#ULIT2 fight_bye
				IF ~~ THEN REPLY ~Geht schon. ich werde meine Suche fortsetzen.~ EXTERN AC#ULIT2 bye_teleport_away
				
				CHAIN AC#ULIT2 fight_bye
				~Was für ein dummer Narr Ihr doch seid, Euch mit uns anzulegen!~
				END
				IF ~~ THEN DO ~Shout(89)
				SetGlobal("IllithidFight","ACIL28",1)												
				Enemy()~ EXIT
				
				CHAIN AC#ULIT2 bye_teleport_away
				~Ihr seid ein braver Diener. Los, Freunde und Sklave, wir gehen.~
				END
				IF ~~ THEN DO ~SetGlobal("IllithidTeleport","ACIL28",1)
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

// -------------------------------------------------
// elder brain #2
//--------------------------------------------------

BEGIN ~AC#IL28G~

// encounter with illithids
CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#IL28G hello_00
~Nein, <PRO_RACE>, helft mir! Rettet mich vor den Illithiden!~
== AC#ULIT2 ~Endlich offenbart Ihr Euch! Eure untote Existenz ist eine Schande für alles, was wir sind!~
== AC#IL28G ~<PRO_RACE>, tötet die Gedankenschinder! Lasst sie meinem Becken nicht näher kommen!~
== AC#ULIT2 ~Hört nicht auf dieses verfaulte Echo. Es ist kein Ältestenhirn mehr, sondern nur noch eine Leiche, die sich an alte Gedanken klammert. Tretet beiseite, <CHARNAME>! Lasst uns dies hier beenden.~
END
IF ~~ THEN REPLY ~Nein. Ich werde nicht zulassen, dass Ihr dem Wesen etwas antut.~ EXTERN AC#ULIT2 dont_hurt_brain
IF ~~ THEN REPLY ~Mir ist es gleich. Tötet es, wenn Ihr müsst.~ EXTERN AC#IL28G i_dont_mind_kill_brain

CHAIN AC#ULIT2 dont_hurt_brain
~Was? Ihr seid nicht ganz bei Trost, Euch gegen uns zu stellen!~
END
IF ~~ THEN REPLY ~Ich meine es ernst.~ EXTERN AC#ULIT2 dont_hurt_brain_02
IF ~~ THEN REPLY ~Ihr habt recht. Tötet es.~ EXTERN AC#IL28G i_dont_mind_kill_brain

	CHAIN AC#ULIT2 dont_hurt_brain_02
	~Ihr wollt Euch wirklich auf die Seite dieses untoten Wesens stellen?~
	=
	~Bedenkt dies: Wir haben in dieser Sache den gleichen Feind, <CHARNAME>. Ihr habt die toten Illithiden bei der Zwergenpatrouille gesehen! Wir wissen von dem schlafenden König.~
	END
	IF ~~ THEN REPLY ~Nein. Ich bleibe dabei.~ EXTERN AC#ULIT2 dont_hurt_brain_fight
	IF ~~ THEN REPLY ~Ihr habt Recht. Also gut, tötet dieses untote Ding.~ EXTERN AC#IL28G i_dont_mind_kill_brain

	CHAIN AC#ULIT2 dont_hurt_brain_fight
	~Ihr habt Euch für die falsche Seite entschieden! Es wird uns großes Vergnügen bereiten, Euch als Sklaven in unsere Stadt zu bringen, wo Ihr den Rest Eures armseligen Lebens unter unserer Herrschaft verbringen werdet!~
	DO ~SetGlobal("ElderBrainAid","ACIL28",1)
	Shout(89)
	Enemy()~EXIT	
	
	CHAIN AC#IL28G i_dont_mind_kill_brain
	~Nein! Ich werde das nicht zulassen!~
	DO ~StartCutSceneMode()
	StartCutScene("AC#28CT5")~EXIT	
	

// after killing ulitharid
CHAIN IF ~GlobalLT("ElderBrainAid","ACIL28",2)~ THEN AC#IL28G hello_02
~Ihr habt mein Fortbestehen gesichert! Ich existiere noch. Das ist bereits mehr, als ich vor wenigen Augenblicken erwartet hatte. Dafür bin ich Euch dankbar.~
END
IF ~~ THEN REPLY ~Ich hoffe, das bringt mir auch etwas.~ DO ~SetGlobal("ElderBrainAid","ACIL28",2)~ EXTERN AC#IL28G saved_me_01
IF ~~ THEN REPLY ~Gern geschehen. Nun schuldet Ihr mir allerdings eine Antwort.~ DO ~SetGlobal("ElderBrainAid","ACIL28",2)~ EXTERN AC#IL28G saved_me_01
IF ~~ THEN REPLY ~Dann versucht, Euch diesen Gefallen etwas länger als unsere letzten Gespräche zu merken.~ DO ~SetGlobal("ElderBrainAid","ACIL28",2)~ EXTERN AC#IL28G saved_me_01


	CHAIN AC#IL28G saved_me_01
	~Wer wart Ihr noch gleich?~
	END
	IF ~~ THEN REPLY ~Ich suche nach Hilfe für den schlafenden König Mith Barak in Iltkazar.~ EXTERN AC#IL28G saved_me_02
	IF ~~ THEN REPLY ~Mith Barak. Iltkazar. Schlafender König. Schreibt Euch wenigstens diese drei Dinge hinter die... was auch immer.~ EXTERN AC#IL28G saved_me_02
	IF ~~ THEN REPLY ~Ich bin derjenige, der Euch gerade das Leben gerettet hat. Und ich brauche Hilfe für König Mith Barak!~ EXTERN AC#IL28G saved_me_02

	CHAIN AC#IL28G saved_me_02
	~Oh! Mith Barak! Diesen Namen habe schon einmal gehört.~
	END
	IF ~~ THEN REPLY ~Ja. Und kurz bevor wir unterbrochen wurden, habt Ihr etwas über mein Blut gesagt.~ EXTERN AC#IL28G saved_me_03
	IF ~~ THEN REPLY ~Mith Barak. Mein Blut. Ein Fluch. Versucht Euch an diese Dinge zu erinnern.~ EXTERN AC#IL28G saved_me_03
	//IF ~~ THEN REPLY ~Ihr sagtet, Mith Barak habe etwas mit meinem Blut vorgehabt. Was genau?~ EXTERN AC#IL28G saved_me_03
	IF ~~ THEN REPLY ~Wir waren gerade dabei herauszufinden, warum Mith Barak jemanden mit besonderem Blut brauchte.~ EXTERN AC#IL28G saved_me_03
	IF ~~ THEN REPLY ~Haltet diesen Gedanken fest: Mith Barak kannte etwas über mein Blut, obwohl er mich nicht kannte. Warum?~ EXTERN AC#IL28G saved_me_03

	
	/*
	CHAIN AC#IL28G saved_me_02
	~Oh! Mith Barak! Diesen Namen habe schon einmal gehört.~
	END
	IF ~~ THEN REPLY ~Ihr sagtet, er habe Euch etwas anvertraut.~ EXTERN AC#IL28G saved_me_03
	IF ~~ THEN REPLY ~Wir machen Fortschritte. Mith Barak vertraute Euch etwas an. Was war es?~ EXTERN AC#IL28G saved_me_03
	IF ~~ THEN REPLY ~Haltet diesen Namen fest: Mith Barak. Erinnerungen. Was genau hat er Euch gegeben?~ EXTERN AC#IL28G saved_me_03
	*/

	CHAIN AC#IL28G saved_me_03
	~Hmmm... er hatte mir etwas darüber erzählt, ja. Und etwas gegeben... was war es noch gleich?~
	END
	//IF ~~ THEN REPLY ~Das, woran es Euch gerade fehlt: Erinnerungen.~ EXTERN AC#IL28G saved_me_04
	//IF ~~ THEN REPLY ~Erinnerungen. Offenbar nicht gerade Eure größte Stärke.~ EXTERN AC#IL28G saved_me_04
	IF ~~ THEN REPLY ~Von allen Kreaturen musste er Euch ausgerechnet seine Geheimnisse anvertrauen.~ EXTERN AC#IL28G saved_me_04
	IF ~~ THEN REPLY ~Wenn das etwas mit mir zu tun hatte, wäre jetzt ein guter Zeitpunkt, Euch daran zu erinnern.~ EXTERN AC#IL28G saved_me_04

	CHAIN AC#IL28G saved_me_04
	~Erinnerungen! Das war es. Er gab mir seine Erinnerung. Doch welche?~
	=
	~Ich fürchte, es ist mir entfallen. Mein Zugriff auf ältere Gedanken scheint zu eingeschränkt, weil ich... nun ja, ein wenig auseinanderfalle.~
	END
	IF ~~ THEN EXTERN AC#IL28G idea_lobe
	
	CHAIN AC#IL28G idea_lobe
	~Wartet, mir kommt ein Einfall!~
	END
	IF ~~ THEN REPLY ~Zur Abwechslung einmal ein Nützlicher?~ EXTERN AC#IL28G idea_lobe_02
	IF ~~ THEN REPLY ~Bitte sagt mir, dass dieser Einfall etwas mit Mith Barak zu tun hat.~ EXTERN AC#IL28G idea_lobe_02
	IF ~~ THEN REPLY ~Dann heraus damit, bevor er wieder verschwindet!~ EXTERN AC#IL28G idea_lobe_02
	
	CHAIN AC#IL28G idea_lobe_02
	~Ich kann nicht mehr auf meine Erinnerungen zurückgreifen, Ihr aber vielleicht schon! Hier, nehmt diesen Teil meines Gehirn. Mit etwas Glück enthält dieser die Erinnerung, die Ihr sucht.~
	END
	IF ~~ THEN REPLY ~Und wie soll ich darauf zurückgreifen?~ EXTERN AC#IL28G idea_lobe_03
	IF ~~ THEN REPLY ~Was genau soll ich mit einem Stück Eures Gehirns anfangen?~ EXTERN AC#IL28G idea_lobe_03
	IF ~~ THEN REPLY ~Wenn die Erinnerung darin steckt, brauche ich also nur noch zu wissen, wie ich sie dort herausbekomme!~ EXTERN AC#IL28G idea_lobe_03
	IF ~~ THEN REPLY ~Das ist vermutlich der widerlichste Hinweis, den ich je erhalten habe.~ EXTERN AC#IL28G idea_lobe_03	
	
	CHAIN AC#IL28G idea_lobe_03
	~Ich fürchte, mein Einfall endet an dieser Stelle. Wie Ihr aus meinem Hirnteil eine Erinnerung daraus hervorholt, müsst Ihr selbst herausfinden. Wenn ich das wüsste, hätte ich es vermutlich selbst getan. Vielleicht können Euch die Zwerge helfen.~
	END
	IF ~~ THEN REPLY ~Gut. Gebt mir Euren, ähm, Hirnlappen.~ EXTERN AC#IL28G give_lobe
	IF ~~ THEN REPLY ~Dann her mit diesem Hirnteil.~ EXTERN AC#IL28G give_lobe
	IF ~~ THEN REPLY ~Na schön. Ein Stück Ältestenhirn für unterwegs. Warum auch nicht.~ EXTERN AC#IL28G give_lobe
	
	CHAIN AC#IL28G give_lobe
	~Hier ist er.~
	END
	IF ~~ THEN DO ~GiveItem("AC#ILEBL",Player1)~ EXTERN AC#IL28G give_lobe_bye
	
	CHAIN AC#IL28G give_lobe_bye
	~Es war eine Freude, mich mit Euch zu unterhalten, wenngleich Ihr mir nicht sagen konntet, was Ihr hier sucht. Nun denn. Ich bin müde und werde mich wieder zurückziehen. Gehabt Euch wohl.~
	DO ~SetGlobal("ElderBrainAid","ACIL28",10)
	StartCutSceneMode()	
	CreateVisualEffect("ICPRAYI",[2196.1589])
	ReallyForceSpell(Myself,FLASHY_2)
	Wait(1)
	DestroySelf()
	EndCutSceneMode()
	~EXIT
	