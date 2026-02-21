
/*******************************************************************************************************
Dialog Vronia cre#5 und Elern cre#7in Iltkazar, Quest-Start: Help Ellhimar
*******************************************************************************************************/
BEGIN AC#ELER7
BEGIN AC#VRON5

IF ~Global("AC#Gromi_Cernd","ACIL52",10)~ THEN BEGIN hello_ellhimar_gone
SAY  ~So ist nun auch für mich hier alles getan. Ich wünsche Euch viel Erfolg, <CHARNAME>.~
IF ~~ THEN DO ~EscapeArea()~  EXIT
END

IF ~Global("AC#Gromi_Cernd","ACIL52",4)~ THEN BEGIN hello_cernd_gone
SAY  ~Was für eine schöne Wendung das Schicksal doch genommen hat! Nun ist auch für mich hier alles getan. Ich werde mich wieder um die Pflege meines kranken Mannes kümmern. Ich wünsche Euch viel Erfolg bei Eurer weiteren Suche und werde die Runen für Euer Schicksal gnädig stimmen.~
IF ~~ THEN DO ~EscapeArea()~  EXIT
END

// in Area ACIL50
IF ~NumTimesTalkedTo(0)
Global("AC#IL_NEW_Cernd","GLOBAL",2)~ THEN BEGIN 1
SAY  ~<CHARNAME>! Gut, dass Ihr kommt. Wir bräuchten weiter Eure Hilfe.~
++ ~Wenn Ihr wollt, dass ich von diesem Hirnlappen probiere: Vergesst es.~ EXTERN AC#ELER7 not_tasting_lobe
++ ~Habt Ihr eine Idee, wie wir in der Suche weiterkommen?~ + fate_of_the_king
++ ~Natürlich, was wollt Ihr?~ + fate_of_the_king
END

	CHAIN AC#ELER7 not_tasting_lobe
	~Das kann ich gut verstehen. Lasst es Vronia ein wenig ausführen.~
	END
	IF ~~ THEN EXTERN AC#VRON5 fate_of_the_king

	CHAIN AC#VRON5 fate_of_the_king
	~Ihr wisst, dass uns das Schicksal unseres Königs am Herzen liegt. Sein derzeitiger Zustand schmerzt uns. Deshalb möchten wir weiter alles daransetzen, ihn aus seinem Schlaf zu befreien.~
	== AC#ELER7 ~Nun, da sich der Regentschaftsrat aufgelöst hat, bleibt uns nur, auf eigene Faust nach einer Lösung zu suchen.~
	==AC#VRON5 ~Was ich ohnehin für eine bessere Lösung halte.~
	END
	IF ~~ THEN REPLY ~Was kann ich tun?~ EXTERN AC#VRON5 about_elderbrain_lobe

	CHAIN AC#VRON5 about_elderbrain_lobe
	~Ihr habt uns berichtet, dass sich Mith Barak mit diesem... diesem untoten Ältestenhirn ausgetauscht hat.~
	== AC#ELER7 ~Er muss ziemlich verzweifelt gewesen sein, dass er sich zu diesem Schritt hingerissen hat.~
	==AC#VRON5 ~Wir können seine wahren Absichten nicht ergründen. Aber es muss einen Grund geben, warum Mith Barak ausgerechnet dort nach Antworten gesucht und vielleicht Erinnerungen hinterlassen hat.~
	==AC#VRON5 ~Ihr habt gesehen, wie ich versucht habe, diese Erinnerungen zu aktivieren, indem ich mir einen Teil des Hirnlappens einverleibt habe.~
	END
	IF ~~ THEN REPLY ~Das hat uns aber auch nicht weitergebracht.~ EXTERN AC#VRON5 about_elderbrain_lobe_02
	
		CHAIN AC#VRON5 about_elderbrain_lobe_02
		~Das wusste ich. Ich bin zu alt, zu unbedeutend, zu... nun, sagen wir, ich war einfach nicht die richtige. Das war mir von vornherein klar.~
		== AC#ELER7 ~Warum habt Ihr es dennoch versucht?~
		==AC#VRON5 ~Ich wollte sicher sein, dass das Hirn den Kostenden nicht umbringt. Mein Tod durch diese Masse wäre ersetzbar gewesen, andere... vielleicht nicht.~
		==AC#VRON5 ~Ich will aufhören, die Esse weiter zu schüren, und es geradeheraus sagen: Jemand geeigneteres muss von diesem Hirnlappen kosten und versuchen, die Erinnerungen darin zu aktivieren.~
		END
		IF ~~ THEN REPLY ~Also doch.~ EXTERN AC#VRON5 taste_elderbrain_lobe
		
		CHAIN AC#VRON5 taste_elderbrain_lobe
		~Es müsst nicht unbedingt Ihr sein. Aber es könntet Ihr sein. Ich möchte nichts beschönigen: Dieses Ding zu konsumieren ist äußerst unangenehm, und es könnte bei Euch bleibende Schäden hinterlassen.~
		END
		IF ~~ THEN REPLY ~Das ist ein abscheulicher Gedanke.~ EXTERN AC#VRON5 taste_elderbrain_lobe_02
		IF ~~ THEN REPLY ~Gibt es keine andere Lösung?~ EXTERN AC#VRON5 taste_elderbrain_lobe_02
		IF ~~ THEN REPLY ~Warum ich?~ EXTERN AC#VRON5 taste_elderbrain_lobe_02
		IF ~~ THEN REPLY ~Bei Euch hat es nicht gewirkt. Warum sollte es bei mir anders sein?~ EXTERN AC#VRON5 taste_elderbrain_lobe_02
		
			CHAIN AC#VRON5 taste_elderbrain_lobe_02
			~Solltet Ihr Euch dagegen entscheiden, wären wir Euch nicht böse. Jedoch führt uns das zu der Frage, warum Ihr überhaupt hier seid.~
			== AC#ELER7 ~Beldas hatte Euch aufgesucht, weil Mith Barak von jemandem gehört hatte, der ihm an der Oberfläche helfen könnte. Vielleicht seid Ihr das.~
			==AC#VRON5 ~Auch wenn ich viele Dinge noch nicht verstehe, sehe ich es genauso. Allerdings kommt mir manches an Mith Baraks Ideen merkwürdig vor. Dazu gehört, dass er jemanden von der Oberfläche, den er nicht einmal kannte, auserkoren hat, seine Hilfe zu sein.~
			==AC#VRON5 ~Als Mith Barak in seinen letzten Schlaf fiel, wart Ihr wahrscheinlich noch nicht einmal geboren. Was ist so besonders an Euch?~
			END
			IF ~~ THEN REPLY ~Das wüsste ich manchmal auch gern.~ EXTERN AC#VRON5 taste_elderbrain_lobe_03
			
			CHAIN AC#VRON5 taste_elderbrain_lobe_03
			~Wie dem auch sei. Meine Hoffnung ist, dass Ihr mehr Erkenntnis aus diesem verfaulten Hirnlappen gewinnen könntet als wir anderen hier. Doch es gibt auch eine zweite Lösung, wenn Ihr Euch nicht imstande fühlt, diese Aufgabe zu übernehmen.~
			== AC#ELER7 ~Es gibt in der Stadt eine weitere Person, die sich hervorragend für diese Aufgabe eignen würde - vielleicht sogar besser als Ihr. Ohne Euch damit beleidigen zu wollen, versteht sich.~
			END
			IF ~~ THEN REPLY ~Wer soll das sein?~ EXTERN AC#VRON5 about_gromi_khaernd

		CHAIN AC#VRON5 about_gromi_khaernd
		~Ihr habt vielleicht mitbekommen, wie gereizt Gromi auf Gedankenschinder reagiert hat. Nach alldem, was seinem Sohn widerfahren ist, ist das nur allzu verständlich.~
		END
		IF ~~ THEN REPLY ~Was ist mit seinem Sohn passiert?~ EXTERN AC#VRON5 what_happened_to_cernd

				
			CHAIN AC#VRON5 what_happened_to_cernd
			~Gromis Sohn heißt Khaernd. Einst war er der fähigste Zardazil-Schmied Iltkazars und als ältester Sohn Clan Arnschädels dazu auserkoren, die legendäre Arnschädelhalle zu führen. Doch das Schicksal meinte es nicht gut mit dem armen Jungen.~
			END
			IF ~~ THEN REPLY ~Was ist ihm widerfahren?~ EXTERN AC#VRON5 what_happened_to_cernd_02

			
				CHAIN AC#VRON5 what_happened_to_cernd_02
				~Er führte eine Patrouille auf der Suche nach neuen Erzvorkommen an. Irgendwo im Osten wurde er von Gedankenschindern verschleppt.~
				END
				IF ~~ THEN EXTERN AC#VRON5 what_happened_to_cernd_05
				
							CHAIN AC#VRON5 what_happened_to_cernd_05
							~Die *caradhak* haben finstere Experimente an ihm durchgeführt. Offensichtlich wollten sie ihn in einen der Ihren umwandeln.~
							END
							IF ~~ THEN REPLY ~Sie wollten aus Gromis Sohn einen Gedankenschinder machen?~ EXTERN AC#VRON5 cernd_ceremorphosis
							
								CHAIN AC#VRON5 cernd_ceremorphosis
								~Ja. Allein seinem starken Willen war es zu verdanken, dass das Experiment fehlschlug. Aus irgendwelchen unerfindlichen Gründen schaffte es Khaernd, aus der Stadt der Gedankenschinder zu fliehen und tauchte eines Tages wieder vor den Toren Iltkazars auf. Obschon von den Qualen stark gezeichnet, war sein Geist klar. Allerdings war er nicht mehr wiederzuerkennen.~
								END
								IF ~~ THEN EXTERN AC#VRON5 cernd_ceremorphosis_02
								
									CHAIN AC#VRON5 cernd_ceremorphosis_02
									~Er war zwar äußerlich noch ein Zwerg, aber anstelle seines Mundes ragten ihm diese... scheußlichen Saugnäpfe eines Illithiden aus dem Gesicht! Ihr könnt Euch vorstellen, wie entsetzt Gromi bei dem Anblick seines geliebten Sohnes war, der offensichtlich als ein Mischwesen - halb Zwerg, halb Illithide, aus der Gefangenschaft der *caradhak* entflohen war.~
									END
									IF ~~ THEN REPLY ~Das ist ja scheußlich! Was habt Ihr danach mit ihm gemacht?~ EXTERN AC#VRON5 cernd_prison_01

									
										CHAIN AC#VRON5 cernd_prison_01
										~Wie Ihr Euch vorstellen könnt, gab es lange Diskussionen im Regentschaftsrat. Viele glaubten nicht an seine zufällig geglückte Flucht aus den Fängen der Gedankenschinder und hielten ihn für einen Spion. Gerade auch dadurch, weil Khaernd nicht nur äußerlich, sondern auch von seinen Fähigkeiten einem Gedankenschinder glich. Er hatte, als er zurückkehrte, psionische Fähigkeiten erlangt.~
										END
										IF ~~ THEN EXTERN AC#VRON5 cernd_prison_02

										
											CHAIN AC#VRON5 cernd_prison_02
											~Jedenfalls hat der Rat dann beschlossen, den armen Khaernd in der Halle der Runensteine, unserer großen Bibliothek, für den Rest seiner Tage in einen Käfig zu sperren. Dort sitzt er noch immer und wird bewacht.~
											END
											IF ~~ THEN REPLY ~Ihr wollt, dass ich ihn befreie?~ EXTERN AC#ELER7 free_cernd_01

											
												CHAIN AC#ELER7 free_cernd_01
												~Ich habe schon mit meinem Vater Bettargh gesprochen. Er ist mit uns einer Meinung, dass wir Khaernd nicht mehr eingesperrt lassen sollten. Zum Einen, weil es unzwergisch ist, zum Anderen, weil vielleicht nur er uns helfen kann, bei der Suche nach dem schlafenden König zu helfen.~
												END
												IF ~~ THEN REPLY ~Was sagt Gromi als Cernds Vater dazu?~ EXTERN AC#VRON5 gromi_cernd

												
													CHAIN AC#VRON5 gromi_cernd
													~Ganz einfach: Wir haben ihn nicht gefragt.~
													END
													IF ~~ THEN REPLY ~Ihr wollt, dass ich mich über einen Entschluss des Rates hinwegsetze?~ EXTERN AC#VRON5 act_against_rc_01

													
														CHAIN AC#VRON5 act_against_rc_01
														~Der Rat hatte die letzten drei Jahre Zeit zu zeigen, dass er imstande ist, unsere gegenwärtige Krise zu lösen. Wenn wir weiter darauf vertrauen, dass sich alles zum Guten wendet, indem wir einfach so weitermachen, werden wir keinen Erfolg haben. Wir müssen andere Wege gehen, am Rat vorbei. Uns läuft die Zeit davon. König Mith Barak hätte dies mit Sicherheit ebenfalls so gewollt. Warum sonst hättet Ihr in unsere Stadt kommen sollen? Nur, um den Willen des Rates umzusetzen? Das können die Zwerge hier auch ohne Euch. Nein, wir brauchen Euch, weil Ihr Dinge *anders* macht als die Zwerge Iltkazars!~
														END
														IF ~~ THEN REPLY ~Und was soll ich tun?~ EXTERN AC#ELER7 free_cernd_02

														
															CHAIN AC#ELER7 free_cernd_02
															~Geht in die Halle der Runensteine, der Bibliothek, welcher mein Vater vorsteht. Holt Euch von ihm die Erlaubnis ein, Khaernd in seiner Zelle im Westen der großen Bibliothek zu besuchen. Bittet ihn darum, einen Blick auf den Lappen des Ältestenhirns zu werfen.~ 
															== AC#VRON5 ~Dies wäre also die zweite Möglichkeit, an die Erinnerung in dem Ältestenhirnlappen zu gelangen: Khaernd soll die Erinnerung aktivieren.~
															== AC#VRON5 ~Oder wollt Ihr es selbst versuchen? Nun ist der Zeitpunkt gekommen, dass Ihr Euch entscheidet.~
															END
															IF ~~ THEN REPLY ~Khaernd soll den Hirnlappen konsumieren.~ EXTERN AC#VRON5 free_cernd_exit
															IF ~~ THEN REPLY ~Ich möchte es gern selbst versuchen.~ EXTERN AC#ELER7 taste_lobe_myself
															IF ~~ THEN REPLY ~Ich kann mich nicht entscheiden.~ EXTERN AC#VRON5 taste_lobe_cant_decide

																// Option #1: Player decides to free Khaernd
																CHAIN AC#VRON5 free_cernd_exit																
																~Eine gute Entscheidung. Khaernd ist dafür sicher mehr als geeignet. Und es ist ein guter Anlass, dem armen Kerl wieder mehr Sinn im Leben zu geben. Indem er wieder ein freier Zwerg wird. Und indem er den Hirnlappen kostet.~ 
																== AC#VRON5 ~Wir sollten diesen Schritt jedoch nicht hier in aller Öffentlichkeit gehen.~
																== AC#ELER7 ~Ich habe mit meiner Tante Isdlara gesprochen. Sie ist die Hohepriesterin Sharindlars, unserer Göttin des Lebens. In ihrem Tempel lässt sich die Einverleibung des Lappens sicher und diskret vollziehen.~
																== AC#VRON5 ~Ich warte auf Euch im Gnädigen Hof, dem Tempel Sharindlars in Haelas Hallen, bis Ihr Khaernd befreit habt. Trefft mich dort, um die Erinnerung des Lappens zu aktivieren.~
																== AC#ELER7 ~Ihr solltet zunächst in die Bibliothek gehen, um mit meinem Vater zu sprechen und Khaernd aus seinem Gefängnis zu entlassen.~
																== AC#VRON5 ~Ich werde derweil mit Isdlara im Tempel Sharindlars warten, bis Khaernd aus seinem Käfig befreit ist. Der Tempel Sharindlars liegt in der Zitadelle Haelas Hallen im Osten der Stadt, neben dem Tempel Dumathoins.~
																END
																IF ~~ THEN DO ~
																SetGlobal("AC#IL_CerndTasteLobe","GLOBAL",1)
																SetGlobal("AC#Ellhimar_Cernd","GLOBAL",3)
																SetGlobal("AC#IL_NEW_Cernd","GLOBAL",3)
																AddJournalEntry(@50700,QUEST)~  EXIT
																
																// Option #2: Player decides to consume the elderbrain lobe
																CHAIN AC#ELER7 taste_lobe_myself
																~Ein äußerst mutiger Schritt.~
																== AC#VRON5 ~Wir sollten diesen Schritt jedoch nicht hier in aller Öffentlichkeit gehen.~
																== AC#ELER7 ~Ich habe mit meiner Tante Isdlara gesprochen. Sie ist die Hohepriesterin Sharindlars, unserer Göttin des Lebens. In ihrem Tempel lässt sich die Einverleibung des Lappens sicher und diskret vollziehen.~
																== AC#VRON5 ~Ich warte solange auf Euch im Gnädigen Hof, dem Tempel Sharindlars in Haelas Hallen. Trefft mich dort, um die Erinnerung des Lappens zu aktivieren.~															
																END
																IF ~~ THEN DO ~
																SetGlobal("AC#IL_TasteLobeMyself","GLOBAL",1)
																SetGlobal("AC#IL_NEW_Cernd","GLOBAL",3)
																//AddJournalEntry(@,QUEST)																
																//AddJournalEntry(@50700,QUEST)
																~  EXIT
																
																// Option #3: Player can't decide yet
																CHAIN AC#VRON5 taste_lobe_cant_decide																
																~Das ist ein Stück weit verständlich. Nun gut, ich werde warten, bis Ihr eine Entscheidung getroffen habt. Ich werde aber nicht hier draußen warten.~ 
																== AC#ELER7 ~Ich habe mit meiner Tante Isdlara gesprochen. Sie ist die Hohepriesterin Sharindlars, unserer Göttin des Lebens. In ihrem Tempel lässt sich die Einverleibung des Lappens sicher und diskret vollziehen.~
																== AC#VRON5 ~Ich werde im Tempel Sharindlars auf Euch warten. Der Tempel Sharindlars liegt in der Zitadelle Haelas Hallen im Osten der Stadt, direkt neben dem Tempel Dumathoins.~
																END
																IF ~~ THEN DO ~
																SetGlobal("AC#IL_UndecideTasteLobe","GLOBAL",1)
																SetGlobal("AC#Ellhimar_Cernd","GLOBAL",3)
																SetGlobal("AC#IL_NEW_Cernd","GLOBAL",3)
																AddJournalEntry(@50700,QUEST)~  EXIT

// Vronia #5 in area ACIL52

CHAIN IF ~Global("AC#IL_BrainVision","GLOBAL",2)~ THEN AC#VRON5 hello_it_worked
~Es hat funktioniert!~
END
IF ~GlobalGT("AC#IL_TasteLobeMyself","GLOBAL",3)~ THEN DO ~SetGlobal("AC#IL_BrainVision","GLOBAL",3)~ EXTERN AC#VRON5 worked_taste_lobe_pc
IF ~GlobalGT("AC#IL_CerndTasteLobe","GLOBAL",1)~ THEN DO ~SetGlobal("AC#IL_BrainVision","GLOBAL",3)~ EXTERN AC#VRON5 worked_taste_lobe_cernd

	CHAIN AC#VRON5 worked_taste_lobe_pc
	~Wenngleich es Euch einiges an Kraft abverlangt hat, dem bösen Einfluss des Hirnlappens zu widerstehen, scheint Ihr alles unbeschadet überstanden zu haben.~
	END
	IF ~~ THEN EXTERN AC#VRON5 worked_what_did_you_see_01
	
	CHAIN AC#VRON5 worked_taste_lobe_cernd
	~Wenngleich es Cernd einiges an Kraft abverlangt hat, dem bösen Einfluss des Hirnlappens zu widerstehen, scheint er alles unbeschadet überstanden zu haben.~
	END
	IF ~~ THEN EXTERN AC#VRON5 worked_what_did_you_see_01
	
	CHAIN AC#VRON5 worked_what_did_you_see_01
	~Was habt Ihr gesehen?~
	END
	IF ~~ THEN REPLY ~Ich weiß nicht recht... ziemlich vieles...~ EXTERN AC#VRON5 worked_what_did_you_see_02
	IF ~~ THEN REPLY ~Nichts bestimmtes. Dumme, nichtssagende Visionen, fürchte ich.~ EXTERN AC#VRON5 worked_what_did_you_see_02
	IF ~~ THEN REPLY ~Oh, eine ganze Menge.~ EXTERN AC#VRON5 worked_what_did_you_see_02
	
	CHAIN AC#VRON5 worked_what_did_you_see_02
	~Lasst uns diese Visionen prüfen wie rohes Erz – und sehen, was an reinem Metall darin verborgen liegt. Was habt Ihr zuerst gesehen?~
	END
	IF ~~ THEN REPLY ~Mith Barak im Thronsaal, vor seiner Krönung.~ EXTERN AC#VRON5 worked_what_did_you_see_throneroom
	
	CHAIN AC#VRON5 worked_what_did_you_see_throneroom
	~Wirklich? Die Erinnerungen scheinen weit zurückzureichen. Das ist nach der Zeitrechnung der Oberflächenbewohner... im Jahre 66 gewesen.~
	END
	IF ~~ THEN REPLY ~Dann ist König Mith Barak also über tausend Jahre alt?~ EXTERN AC#VRON5 worked_what_did_you_see_mithbarak_old
	IF ~~ THEN REPLY ~Dann kam die nächste Vision.~ EXTERN AC#VRON5 worked_what_did_you_see_03
	
			CHAIN AC#VRON5 worked_what_did_you_see_mithbarak_old
			~In diesen tausend Jahren hat er uns stets vorbildlich regiert. Doch Ihr habt Recht, selbst nach den Maßstäben der Zwerge ist dies eine unendlich lange Zeitspanne. Unser König gibt uns Rätsel um Rätsel auf.~
			END
			IF ~~ THEN EXTERN AC#VRON5 worked_what_did_you_see_03
	
	CHAIN AC#VRON5 worked_what_did_you_see_03
	~Was habt Ihr als nächstes gesehen?~
	END
	IF ~~ THEN REPLY ~König Mith Barak auf seinem Thron, zur Statue erstarrt.~ EXTERN AC#VRON5 worked_what_did_you_see_04

	CHAIN AC#VRON5 worked_what_did_you_see_04
	~Das muss für die Zwerge in der alten Zeit ein beunruhigender Anblick gewesen sein. Mittlerweile haben sich alle daran gewöhnt. Nun, bis jetzt; bis er nicht mehr erwachte.~
	END
	IF ~~ THEN EXTERN AC#VRON5 worked_what_did_you_see_dragoncem
	
	CHAIN AC#VRON5 worked_what_did_you_see_dragoncem
	~Wie ging die Vision weiter?~
	END
	IF ~~ THEN REPLY ~Mith Barak schien auf dem Weg zu einem alten Tempel der Drachen gewesen zu sein. Er sprach von einer Art Drachenfriedhof an der Oberfläche.~ EXTERN AC#VRON5 worked_what_did_you_see_dragoncem_02
	
	CHAIN AC#VRON5 worked_what_did_you_see_dragoncem_02
	~Ein Drachenfriedhof? Und Mith Barak war dort? Wie ungewöhnlich.~
	END
	IF ~~ THEN REPLY ~Er hoffte, dort seinen Fluch loswerden zu können.~ EXTERN AC#VRON5 worked_what_did_you_see_dragoncem_03
	
	CHAIN AC#VRON5 worked_what_did_you_see_dragoncem_03
	~Wenn er gehofft hat, dort seinen Fluch brechen zu können, scheint dies der Ort sein, den Ihr aufsuchen müsst, um ihm zu helfen. Zumindest hoffe ich das. Habt Ihr einen Anhalt, wo dieser Ort an der Oberfläche sein könnte?~
	END
	IF ~~ THEN REPLY ~Mith Barak erwähnte ein Buch. Ein Buch, das in Iltkazar ist. Aber nicht an dem Ort, an dem man es vermuten würde. "Das einzige Buch Iltkazars, das nicht in der Bibliothek liegen darf." So nannte er es.~ EXTERN AC#VRON5 worked_what_did_you_see_book

	CHAIN AC#VRON5 worked_what_did_you_see_book
	~Ein Buch? Nicht in der Bibliothek? Merkwürdig. Und dort soll der Ort vermerkt sein? Noch merkwürdiger.~
	END
	IF ~~ THEN REPLY ~Danach hatte ich noch eine Art Vision, bei welcher Drachen den König auf seinem Thron umkreist haben.~ EXTERN AC#VRON5 worked_what_did_you_see_movie

	CHAIN AC#VRON5 worked_what_did_you_see_movie
	~Noch mehr Drachen! Darauf kann ich mir keinen Reim machen. Habt Ihr sonst noch etwas gesehen?~
	END
	IF ~~ THEN REPLY ~Nein, das war dann wirklich alles.~ EXTERN AC#VRON5 worked_what_did_you_see_final
/*	
	CHAIN AC#VRON5 worked_what_did_you_see_02
	~~
	END
	IF ~~ THEN REPLY ~~ EXTERN AC#VRON5 worked_what_did_you_see_final
*/	
		CHAIN AC#VRON5 worked_what_did_you_see_final
		~Das alles sind wichtige Erkenntnisse. Lasst uns nun dieses ganze Mysterium Schicht um Schicht abtragen, wie man einen Gang im Fels freilegt oder Schlacke von Eisen trennt.~ 
		END
		IF ~~ THEN EXTERN AC#VRON5 about_book
		
		CHAIN AC#VRON5 about_book
		~Ich denke, nun kommt das Buch ins Spiel. Auch wenn es nicht in der Bibliothek zu liegen schient, solltet Ihr Bettargh in der Bibliothek aufsuchen und ihn um Rat fragen. Wenn jemand weiß, wo Bücher zu finden sind, dann er.~
		END		
		IF ~~ THEN EXTERN AC#VRON5 use_book_for_worldmap
				
		CHAIN AC#VRON5 use_book_for_worldmap
		~Ich bin mir sicher, dass Ihr in diesem Buch einen Anhalt finden werdet, wo sich dieser Ort, den Ihr in der Vision gesehen habt, befinden könnte. Nutzt das Wissen, um unserem König zu helfen. Unsere Aufgabe hier ist nun getan.~
		END
		IF ~~ THEN DO ~SetGlobal("AC#IL_NEW_Borthun","GLOBAL",1)
		SetGlobal("AC#IL_BrainVision","GLOBAL",10)~ EXIT

CHAIN IF ~Global("AC#IL_NEW_Cernd","GLOBAL",4)~ THEN AC#VRON5 hello_sharindlar
~Seid gegrüßt, <CHARNAME>. Schön, dass Ihr mich hier in Sharindlars Tempel aufsucht!~
END
IF ~Global("AC#IL_TasteLobeMyself","GLOBAL",1)~ THEN EXTERN AC#VRON5 taste_lobe_pc
IF ~Global("AC#IL_CerndTasteLobe","GLOBAL",1)~ THEN EXTERN AC#VRON5 taste_lobe_cernd_01
IF ~Global("AC#IL_UndecideTasteLobe","GLOBAL",1)~ THEN EXTERN AC#VRON5 taste_lobe_who_will_it_be

	CHAIN AC#VRON5 taste_lobe_who_will_it_be
	~Habt Ihr Euch entschieden, wer den Lappen des Ältestenhirnes konsumieren soll?~
	END
	IF ~~ THEN REPLY ~Ich werde es selbst machen.~ DO ~SetGlobal("AC#IL_TasteLobeMyself","GLOBAL",1)~ EXTERN AC#VRON5 taste_lobe_pc_02
	IF ~~ THEN REPLY ~Khaernd soll es machen machen.~ DO ~SetGlobal("AC#IL_CerndTasteLobe","GLOBAL",1)~ EXTERN AC#VRON5 taste_lobe_cernd_01
	IF ~~ THEN REPLY ~Ich bin noch nicht bereit.~ EXTERN AC#VRON5 wait_taste_lobe_pc
	
	CHAIN AC#VRON5 taste_lobe_pc
	~Seid Ihr bereit, den Lappen des Ältestenhirns zu kosten, um mehr über die Suche zu erfahren?~
	END
	IF ~~ THEN REPLY ~Ja, ich bin bereit.~ EXTERN AC#VRON5 taste_lobe_pc_02
	IF ~~ THEN REPLY ~Ich bin noch nicht bereit.~ EXTERN AC#VRON5 wait_taste_lobe_pc

	CHAIN AC#VRON5 taste_lobe_pc_02
	~Sehr gut. Hier ist der Lappen. Gebt acht, es könnte unerwartete Auswirkungen haben. Eine andere Wahl haben wir jedoch nicht.~
	END
	IF ~~ THEN DO ~SetGlobal("AC#IL_NEW_Cernd","GLOBAL",5)
	SetGlobal("AC#IL_TasteLobeMyself","GLOBAL",2)
	StartCutSceneMode() 
	StartCutScene("AC#23CT0")~ EXIT		
	
	CHAIN AC#VRON5 taste_lobe_cernd_01
	~Khaernd wird also den Lappen des Ältestenhirns kosten.~
	END
	IF ~Global("CerndSpawn","ACIL52",0)~ THEN EXTERN AC#VRON5 taste_lobe_cernd_not_appeared
	IF ~GlobalGT("CerndSpawn","ACIL52",0)~ THEN EXTERN AC#VRON5 taste_lobe_cernd_02
	
		CHAIN AC#VRON5 taste_lobe_cernd_not_appeared
		~Allerdings ist er bisher noch nicht aufgetaucht. Habt Ihr ihn schon aus seiner Kammer in der Bibliothek befreien können?~
		END
		IF ~~ THEN REPLY ~Nein, noch nicht.~ EXTERN AC#VRON5 go_on_free_cernd
		
		CHAIN AC#VRON5 go_on_free_cernd
		~Dann solltet Ihr dies jetzt tun.~
		EXIT
	
	CHAIN AC#VRON5 taste_lobe_cernd_02
	~Seid Ihr bereit dafür, Khaernd?~
	== AC#CERN1 ~(Khaernd nickt zögerlich.)~
	== AC#VRON5 ~Seid auch Ihr bereit, <CHARNAME>, dass Khaernd die Erinnerung des Hirnes mit Euch teilt?~
	END
	IF ~~ THEN REPLY ~Ja, ich bin soweit.~ EXTERN AC#VRON5 taste_lobe_cernd_03
	IF ~~ THEN REPLY ~Nein, ich bin noch nicht soweit.~ EXTERN AC#VRON5 wait_taste_lobe_pc

	CHAIN AC#VRON5 taste_lobe_cernd_03
	~Gut. Khaernd wird seine Eindrücke sogleich telepathisch mit Euch teilen. Haltet Euch bereit, <CHARNAME>.~
	== AC#VRON5 ~Khaernd, hier ist der Hirnlappen...~
	END
	IF ~~ THEN DO ~SetGlobal("AC#IL_NEW_Cernd","GLOBAL",5)
	SetGlobal("AC#IL_CerndTasteLobe","GLOBAL",2)
	StartCutSceneMode() 
	StartCutScene("AC#23CTC")~ EXIT	
	
	CHAIN AC#VRON5 wait_taste_lobe_pc
	~Dann werde ich hier warten, bis Ihr bereit seid.~
	EXIT

// PLayer tastes lobe
CHAIN IF ~Global("AC#IL_TasteLobeMyself","GLOBAL",2)
AreaCheck("ACIL52")~ THEN PLAYER1 taste_lobe_pc_03
		~Ihr führt den kalten, schwammigen Lappen an Eure Lippen. Ein bitterer Geschmack erfüllt Euren Mund – dann bricht die Welt um Euch auseinander. Ihr spürt, wie sich fremde Gedanken in Euer Bewusstsein drängen – uralte, kalte Intelligenz. Bilder flackern auf, unzusammenhängend, grell wie Blitze in absoluter Dunkelheit. Etwas in Euch begreift mehr… und verliert zugleich etwas anderes.~
		END
		IF ~~ THEN EXTERN PLAYER1 taste_lobe_pc_04
		
			CHAIN PLAYER1 taste_lobe_pc_04
			~Ein brennender Schmerz durchfährt Euren Geist. Fremde Visionen überfluten Euch. Dann wird alles schwarz.~
			END
			IF ~~ THEN DO ~SetGlobal("AC#IL_TasteLobeMyself","GLOBAL",3)			
			StartCutSceneMode()
			PlayDead(45)
			StartCutScene("AC#23CT1")~ EXIT

				
// ---------------------------------------------
// Gromi Arnskull 
// ---------------------------------------------					
BEGIN ~AC#GROM6~
BEGIN ~AC#CERN1~

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#GROM6 hello_01
~Was geht hier vor, Vronia?~
== AC#GROM6 ~Mein Sohn?~
== AC#GROM6 ~Khaernd? Khaernd! Was hat das zu bedeuten? Wer hat Khaernd freigelassen?~
END
IF ~~ THEN REPLY ~Ich war das.~ EXTERN AC#VRON5 gromi_vronia_cernd_01
IF ~~ THEN REPLY ~Das war Vronias Idee.~ EXTERN AC#VRON5 gromi_vronia_cernd_01
	
	CHAIN AC#VRON5 gromi_vronia_cernd_01
	~Khaernd wurde auf meine Anweisung und mit Bettarghs Einverständnis freigelassen. Wir brauchten seine Hilfe bei der Suche nach Antworten auf unseren schlafenden Monarchen. Jetzt, da der Rat nicht mehr tagt, gilt es, auch unbequeme Entscheidungen zu akzeptieren.~
	== AC#GROM6 ~Ihr... Ihr habt was? Ihr habt Euch über die Entscheidung des Rates hinweggesetzt und diesen... diesen... freigelassen?~
	END
	IF ~~ THEN REPLY ~So redet man nicht von seinem eigenen Sohn, Gromi.~ EXTERN AC#CERN1 cernd_gromi_son_02
	IF ~~ THEN REPLY ~Ich fand es auch unangenehm, aber mir blieb keine andere Wahl.~ EXTERN AC#CERN1 cernd_gromi_son_02
	
	
	CHAIN AC#CERN1 cernd_gromi_son_02
	~(Cernds Blicke werden unruhig und seine Augen gehen nervös hin- und her.)~
	END
	IF ~~ THEN REPLY ~Los, Gromi, heißt Euren Sohn in Iltkazar willkommen!~ EXTERN ~AC#VRON5~ vronia_cernd_gromi_son_03
	IF ~~ THEN REPLY ~Das müsst Ihr untereinander klären.~ EXTERN ~AC#VRON5~ vronia_cernd_gromi_son_03

	CHAIN AC#VRON5 vronia_cernd_gromi_son_03
	~Gebt Euch einen Ruck, Gromi. So könnt Ihr Euren Sohn doch nicht bis ans Ende Eurer Tage leben lassen!~
	== AC#GROM6 ~Ich... ich...~
	== AC#GROM6 ~*Seufzt*. Ihr habt Recht. So kann es nicht ewig weitergehen.~
	== AC#GROM6 ~Khaernd, mein Sohn! Es... es tut mir leid. Ich - nein, die ganze Stadt! - hat Euch unrecht getan. Ihr habt bewiesen, dass Ihr nicht das... das Monster seid, für das wir Euch nach Eurer Rückkehr aus Oryndoll gehalten haben.~
	== AC#GROM6 ~Ich werde mich bei dem Rat einsetzen, dass Ihr Euch frei in der Stadt bewegen dürft. Und... ich würde mich freuen, wenn Ihr wieder bei uns, in unserem *faern*, leben würdet. Mit uns zusammen!~
	END
	IF ~~ THEN EXTERN AC#CERN1 happy_family
	
		
	CHAIN  AC#CERN1 happy_family
	~(Khaernd zieht seine Tentakel nach oben. Ihr könnt Euch vorstellen, dass seine Art sein könnte, ein Lächeln auszudrücken.)~
	END
	IF ~~ THEN REPLY ~Es freut mich, dass Khaernd wieder im Kreise der Familie aufgenommen ist. Allerdings müssen wir immer noch den König retten.~ EXTERN ~AC#GROM6~ gromi_still_need_help


	CHAIN AC#GROM6 gromi_still_need_help
	~Das ist richtig. Wenn Ihr die Hilfe meines Sohnes benötigt...~
	== AC#VRON5 ~Er hat schon genug Gutes für uns getan. Nehmt ihn mit nach Hause, Gromi.~
	END
	IF ~~ THEN EXTERN ~AC#GROM6~ gromi_take_son_home

	
	CHAIN AC#GROM6 gromi_take_son_home
	~Kommt mit, Khaernd, mein Sohn! Eure Mutter wird Augen machen. Lasst uns durch die Stadt gehen und jedem zeigen, dass Khaernd Arnschädel, Gromis Sohn, in die Zitadelle seines Clans zurückgekehrt ist!~
	END
	IF ~~ THEN DO ~SetGlobal("AC#Gromi_Cernd","ACIL52",3)
	ActionOverride("AC#CERN1",EscapeArea())
	EscapeArea()~  EXIT
						
// ---------------------------------------------
// Khaernd Shattermind 
// ---------------------------------------------

// Khaernd in Area ACIL52 and Khaernd in Area ACIL5U

	CHAIN IF ~Global("Cernd_Free","ACIL5U",2)~ THEN AC#CERN1 hello_free
	~(Der Zwerg sieht Euch fragend an.)~
	END
	IF ~~ THEN REPLY ~Ihr hättet die ganze Zeit schon diese Tür öffnen können? Warum seid Ihr in dem Käfig geblieben?~ DO ~SetGlobal("Cernd_Free","ACIL5U",3)~ EXTERN AC#CERN1 why_didnt_you_leave


	CHAIN AC#CERN1 why_didnt_you_leave
	~(Khaernd zuckt mit den Schultern und sieht nach links und rechts zu den Wachen.)~
	END
	IF ~~ THEN GOTO cernd_lets_go

	
		CHAIN AC#CERN1 cernd_lets_go
		~(Dann streckt er seine Arme durch, malt mit seinen Fingern ein komplexes Zeichen in die Luft und ist verschwunden.)~
		END
		IF ~~ THEN DO ~ClearAllActions()
		StartCutSceneMode()
		AddJournalEntry(@50701,QUEST)
		SetGlobal("AC#Ellhimar_Cernd","GLOBAL",4)
		CreateVisualEffectObject("SPDIMNDR",Myself) 
		Wait(1)	
		EndCutSceneMode()		
		DestroySelf()~ EXIT

	CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#CERN1 0
	~(Vor Euch steht der sonderlichste Zwerg, der Euch je begegnet ist. Seine Haut ist grün, und anstelle eines Mundes ragen vier lange, sich stetig windende Tentakel aus seinem Gesicht heraus. Das Wesen schaut Euch aus seinen trüben Augen heraus traurig und resigniert an.)~
	END
	IF ~~ THEN REPLY ~Seid Ihr Khaernd?~ GOTO are_you_cernd


	CHAIN AC#CERN1 are_you_cernd
	~(Der Zwerg nickt langsam.)~
	END
	IF ~~ THEN REPLY ~Ich heiße <CHARNAME>. Vronia schickt mich, um Euch hier abzuholen. Wir brauchen bei der Wiederherstellung einer Erinnerung Eure Hilfe.~ GOTO cernd_help_ellhimar
	IF ~~ THEN REPLY ~Lust, etwas Ältestenhirn zu kosten? Vronia hat etwas übrig.~ GOTO cernd_help_ellhimar
	IF ~~ THEN REPLY ~Ihr habt da was im Gesicht.~ GOTO cernd_help_ellhimar
	
		CHAIN AC#CERN1 cernd_help_ellhimar
		~(Die Augen des Zwerges verengen sich zu Schlitzen.)~
		END
		IF ~~ THEN REPLY ~Könnt Ihr nicht sprechen?~ GOTO cernd_can_speak

		
			CHAIN AC#CERN1 cernd_can_speak
			~(Khaernd schüttelt heftig den Kopf, wobei seine Tentakel wie ein Bart hin- und herschwingen.)~
			END
			IF ~~ THEN GOTO cernd_open_door
			
				CHAIN AC#CERN1 cernd_open_door
				~(Plötzlich macht er eine Bewegung, und die Käfigtür springt mit einem lauten Geräusch auf.)~
				END
				IF ~~ THEN DO ~SetGlobal("Cernd_Free","ACIL5U",1)~ EXIT

CHAIN IF ~True()~ THEN AC#CERN1 hello
~(Der Zwerg scheint Euch nicht zu beachten.)~
END
IF ~~ THEN EXIT	

// Vision in ACILD3 : Mith Barak talking to elder brain

BEGIN ~AC#ILD3E~
BEGIN ~AC#DREA3~

	CHAIN IF ~NumTimesTalkedTo(1)~ THEN AC#ILD3E hello_2
	~Interessant! Und Ihr habt nie versucht, den alten Tempel aufzusuchen, um Euren... bedauernswerten Zustand zu beenden?~ 
	== AC#DREA3 ~Doch, das habe ich.~ 
	== AC#ILD3E ~An welchem Tempel habt Ihr es versucht?~ 
	== AC#DREA3 ~Am alten Drachenfriedhof.~
	== AC#ILD3E ~Oh! Zeigt ihn mir.~	
	== AC#DREA3 ~Dies ist aber die letzte Erinnerung, die ich mit Euch teilen werde. Dann werdet Ihr mir antworten liefern müssen!~
	END
	IF ~~ THEN DO ~StartCutSceneMode()
	StartCutScene("AC#23CT3")~ EXIT
	
	CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#ILD3E hello
	~Sieh an, sieh an. Der verfluchte König Iltkazars schickt sich an, mich lebloses Hirn um Rat zu fragen.~ 
	== AC#DREA3 ~Das tue ich.~ 
	== AC#ILD3E ~Nichts im Leben gibt es umsonst. Das müsstet Ihr bestens wissen.~ 
	== AC#DREA3 ~Was verlangt Ihr?~
	== AC#ILD3E ~Mich dürstet nach Erinnerung.~	
	== AC#DREA3 ~Gut, Ihr sollt sie haben.~
	END
	IF ~~ THEN DO ~StartCutSceneMode()
	StartCutScene("AC#23CT6")~ EXIT
