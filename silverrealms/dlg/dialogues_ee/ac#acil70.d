
/*******************************************************************************************************
Dialog Lizard shaman
*******************************************************************************************************/
BEGIN ~AC#LIZS1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY  ~Diesss issst nicht Euer Platzzz! Kehrt um!~
++ ~Wer seid Ihr?~ + who_are_you
END

	IF ~~ THEN BEGIN who_are_you
	SAY ~Wir sssind die Sssuchenden, die den Ssschläfer erwecken werden!~
	++ ~Der Schläfer?~ + the_sssleeper
	END
	
		IF ~~ THEN BEGIN the_sssleeper
		SAY ~Jaaa... der Ssschläfer. Unssser Gott!~
		++ ~Hier ruht ein Gott?~ + the_sssleeper_02
		END
		
			IF ~~ THEN BEGIN the_sssleeper_02
			SAY ~Nicccht ein Gott! Unssser Gott!~
			++ ~Warum schläft er?~ + why_sssleeper
			END
			
				IF ~~ THEN BEGIN why_sssleeper
				SAY ~Wir wisssen esss nicccht! Wir sssehen ihn, doch können wir niccht mit ihm sssprechen...~
				++ ~Liegt Euer Gott zufällig in einer Art Drachentempel? Da müsste ich nämlich einmal kurz hinein.~ + dragontemple
				END
				
				IF ~~ THEN BEGIN dragontemple
				SAY ~Nein! Ihr dürft dorrrt nicccht hinein, niemand darrrf dort hinein - zzzu unssstet issst ssseine jetzzzige Form...~
				++ ~Ich fürchte, das bringt nichts. Sagt, würde Eure Haut vielleicht als Tasche taugen?~ + skin
				++ ~Ich muss dort wirklich hinein.~ + need_to_go_there
				END
				
					IF ~~ THEN BEGIN need_to_go_there
					SAY ~Wir sssind die Wächter. Kehrt um, und Euch wird nichtsss geschehen. Tretet einen Sschritt näher, und Ihr werdet unssseren Zzzorn erwecken.~
					++ ~Ich fürchte, das bringt nichts. Sagt, würde Eure Haut vielleicht als Tasche taugen?~ + skin
					++ ~Also gut, ich gehe.~ + i_am_gone
					END
				
					IF ~~ THEN BEGIN i_am_gone
					SAY ~Eine weissse Entssscheidung!~
					IF ~~ THEN DO ~~  EXIT
					END
					
					IF ~~ THEN BEGIN skin
					SAY ~Ihr werdet ein würdigesss Opfer für unssseren Meissster sssein! Zzzu mir, meine Ssschergen, reisssen wir dem <RACE> ssseine zzzarte Haut vom Körper!~
					IF ~~ THEN DO ~SetGlobal("Lizard_Attack","ACIL70",1)
					Enemy()~  EXIT
					END	

/*******************************************************************************************************
Dialog Zafroma
*******************************************************************************************************/

BEGIN ~AC#70ST1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY  ~Uuh... ich... ich...wo bin ich?~
=
~Wer seid Ihr?~
++ ~Ich bin Euer Retter.~ + i_am_your_savior
++ ~Das ist nicht so wichtig. Geht es Euch denn gut?~ + i_am_your_savior
END

	IF ~~ THEN BEGIN i_am_your_savior
	SAY ~Was... was ist mit mir geschehen?~
	++ ~Ihr wart versteinert.~ + turned_to_stone
	END

		IF ~~ THEN BEGIN turned_to_stone
		   SAY ~Versteinert? Ich?~		   
		   =
		   ~Ja, jetzt erinnere ich mich. Wir waren hier auf der Suche... und dann diese Kreatur mit ihren starren Augen... den schönen Augen...~
		++ ~Was habt Ihr hier gesucht?~ + what_were_you_looking_for
		IF ~Dead("AC#DRLI1")~ THEN REPLY ~Das war ein Drakolisk. Er hat Euch mit seinem Blick versteinert. Ich habe ihn erschlagen.~ GOTO dracolisc
		END
		
		IF ~~ THEN BEGIN dracolisc
		   SAY ~Ein Drakolisk...eine Kreuzung zwischen einem schwarzen Drachen und einem Basilisken... ich hätte wissen müssen, dass an diesem unheilvollen Ort derartige Monster zu finden sind.~		   
			++ ~Was habt Ihr hier gesucht?~ + what_were_you_looking_for
		END
		
			IF ~~ THEN BEGIN what_were_you_looking_for
			SAY ~Wir suchten den Tempel... und das Grabmal Tethirs...~
			IF ~~ THEN + companions
			END

			IF ~~ THEN BEGIN companions
			SAY ~Bei den Göttern! Was ist mit meinen Gefährten geschehen?~
			++ ~Für sie kommt jede Rettung zu spät.~ + can_do_nothing
			END	

				IF ~~ THEN BEGIN can_do_nothing
				SAY ~Oh... nein... Amon und Raichal sind auch... was für eine furchtbare Erkenntnis. Wir waren aber auch Narren, uns derart unvorbereitet auf eine solche Suche einzulassen.~
				IF ~PartyHasItem("AC#70NO2")~ THEN REPLY ~Ich fürchte, ich habe noch weitere schlechte Nachrichten für Euch.~ GOTO more_bad_news
				++ ~Ihr sagtet, Ihr suchtet nach einem Tempel.~ + temple
				++ ~Ihr erwähntet ein Grabmal?~ + tomb
				++ ~Mehr kann ich nicht für Euch tun. Ich muss mich auf den Weg machen.~ + go_away
				END
				
					IF ~~ THEN BEGIN more_bad_news
					SAY ~Warum? Was ist?~
					++ ~Ich fand diesen Brief hier bei einer Leiche weiter nördlich von hier.~ + letter
					END	
					
						IF ~~ THEN BEGIN letter
						SAY ~"Meine geliebte Zafroma! Gleich bin ich bei Euch, um Euch von Eurem Fluch zu befreien. Euer Euch immer liebender Ernelis." Ernelis? Oh nein! Mein Geliebter ist bei dem Versuch, mich zu befreien, ebenfalls zu Tode gekommen!~
						IF ~~ THEN DO ~TakePartyItem("AC#70NO2")~ + what_should_i_do
						END
						
							IF ~~ THEN BEGIN what_should_i_do
							SAY ~So bin ich also nur aus diesem fürchterlichen Zustand erwacht, um zu erfahren, dass alle anderen unwiderruflich verloren sind.~
							++ ~Ihr sagtet, Ihr suchtet nach einem Tempel.~ + temple
							++ ~Ihr erwähntet ein Grabmal?~ + tomb
							++ ~Mehr kann ich nicht für Euch tun. Ich muss mich auf den Weg machen.~ + go_away
							END

					IF ~~ THEN BEGIN temple
					SAY ~Der Tempel, ja. Er liegt im Westen. Wir haben ihn nicht erreichen können, und ich verspüre keine Lust, dort jemals wieder hinzugehen!~
					IF ~~ THEN REPLY ~Was ist das für ein Tempel?~ + temple_02
					++ ~Ihr erwähntet ein Grabmal?~ + tomb
					++ ~Mehr kann ich nicht für Euch tun. Ich muss mich auf den Weg machen.~ + go_away
					END	
					
						IF ~~ THEN BEGIN temple_02
						SAY ~Ein uralter Tempel, der einem vergessenen Drachengott geweiht war. Der Gott hieß "Kalzareinad". Nach allem, was ich weiß, soll er der Gott geheimer Drachenmagie gewesen sein. Wir erhofften uns, im Tempel verborgenes Wissen und magische Schätze zu finden. Doch das Einzige, das wir fanden, war der Tod - noch bevor wir den Tempel überhaupt erreichten.~
						++ ~Ihr erwähntet ein Grabmal?~ + tomb
						++ ~Mehr kann ich nicht für Euch tun. Ich muss mich auf den Weg machen.~ + go_away
						END

					IF ~~ THEN BEGIN tomb
					SAY ~Irgendwo hier in der Gegend soll der Elfenheld Tethir begraben liegen. Einst war er ein mächtiger Drachentöter, doch mittlerweile sind seine Taten längst vergessen.~
					++ ~Ihr sagtet, Ihr suchtet nach einem Tempel.~ + temple
					++ ~Mehr kann ich nicht für Euch tun. Ich muss mich auf den Weg machen.~ + go_away
					END						
		
			IF ~~ THEN BEGIN go_away
			SAY ~Es war sehr gütig von Euch, mich aus meinem steinernen Zustand gerettet zu haben. Dies werde ich Euch nie vergessen! Ich werde mich jetzt besser auf den Weg machen und Euch in meinem guten Andenken bewahren!~
			IF ~~ THEN DO ~ReputationInc(1)
			EscapeArea()~  EXIT
			END	
			