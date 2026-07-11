							
// ---------------------------------------------
// König Mith Barak
// ---------------------------------------------

BEGIN ~AC#GROM5~

BEGIN ~AC#MITH5~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
SAY ~Ihr habt es geschafft! Ich war mir nicht sicher, wie lange ich das Portal noch hätte offenhalten können.~
IF ~Global("AC#MithbarakazCurse","GLOBAL",1)~ THEN  + mith_dragon_01
IF ~Global("AC#MithbarakazCurse","GLOBAL",0)~ THEN  + mith_dwarf_01
END

	IF ~~ THEN BEGIN mith_dragon_01
	SAY  ~Und wie es scheint, habt Ihr auch den Fluch, der seit tausend Jahren auf mir lastete, von mir genommen.~
	IF ~~ THEN REPLY ~Das sehe ich, ja. Ihr seid Mithbarakaz, der Silberdrache.~ + silverdragon
	END
	
		IF ~~ THEN BEGIN silverdragon
		SAY  ~Das bin ich, ja. Auch wenn mich die Zwerge Iltkazars mich nur als Mith Barak den Clanlosen kannten, war ich doch immer ein Drache gewesen.~
		IF ~~ THEN DO ~~ + you_rescued_me
		END

	IF ~~ THEN BEGIN mith_dwarf_01
	SAY  ~Hier stehe ich also vor Euch als König Mith Barak, der Zwergenkönig. Eigentlich ein Silberdrache, scheint der Fluch immer noch auf meinen Schultern zu lasten.~
	IF ~~ THEN REPLY ~Es war mir nicht möglich, den Fluch von Euch zu nehmen.~ + not_remove_curse
	END
	
		IF ~~ THEN BEGIN not_remove_curse
		SAY  ~Das spielt jetzt keine Rolle.~
		IF ~~ THEN DO ~~ + you_rescued_me
		END

			IF ~~ THEN BEGIN you_rescued_me
			SAY  ~Das Einzige, das zählt, ist, dass Ihr mich aus der Gefangenschaft der Anhänger Tiamats befreit habt und ich wieder hier, in meiner Stadt, bin.~
			IF ~Global("AC#MithbarakazCurse","GLOBAL",1)~ THEN  + chain_mith_dragon_02
			IF ~Global("AC#MithbarakazCurse","GLOBAL",0)~ THEN  + chain_mith_dwarf_02
			END
			
				IF ~~ THEN BEGIN nice_to_be_back
				SAY  ~Es ist so schön, Euch alle wiederzusehen!~
				IF ~Global("AC#BreskRescued","GLOBAL",0)~ THEN + bresk_dead_where_is_bresk
				IF ~Global("AC#BreskRescued","GLOBAL",20)~ THEN + chain_many_victims				
				END
				
					IF ~~ THEN BEGIN bresk_dead_where_is_bresk
					SAY  ~Doch ich sehe unseren Kriegsmeister nirgendwo unter Euch. Wo ist Bresk?~
					IF ~~ THEN REPLY ~Er starb, als er die Stadt gegen eine Horde Teufel verteidigte.~ + bresk_dead_where_is_bresk_02
					END
					
						IF ~~ THEN BEGIN bresk_dead_where_is_bresk_02
						SAY  ~Er ist tot? Das sind traurige Nachrichten...~
						IF ~~ THEN + dunnabar_gone_01
						END
						
							IF ~~ THEN BEGIN dunnabar_gone_01
							SAY  ~Dies erklärt dann auch, weshalb Dunnabar nicht zugegen ist.~
							IF ~~ THEN + chain_many_victims
							END
			
				IF ~~ THEN BEGIN dwarves_impressed
				SAY  ~Dem kann ich mich mich nur anschließen. Ihr habt ja hier ordentlich Eindruck gemacht, <CHARNAME>!~
				IF ~~ THEN GOTO rescue_bye			
				END
				
					IF ~~ THEN BEGIN rescue_bye
					SAY ~Jedenfalls ist Euch der Dank des ganzen Zwergenvolkes gewiss - und auch derjenige der guten Drachen! Ich werde mich nun in den Ratssaal begeben müssen. Ich bin lange fort gewesen! Es gibt sicher viel zu regeln. Euch anderen danke ich für den herzlichen Empfang, Ihr habt einem alten Drachen eine große Freude bereitet. So kehren wir denn zu unserem Tagesgeschäft zurück. Und Euch, <CHARNAME>, noch einmal alles Gute.~
					IF ~~ THEN DO ~SetGlobal("AC#Mithbarak_Rescued","GLOBAL",19)
					AddJournalEntry(@99000,QUEST_DONE)								   
					EscapeArea()~ EXIT
					END		
				
CHAIN IF ~~ THEN AC#MITH5 chain_mith_dragon_02
~Und wie ich sehe, haben sich meine treuen Zwerge auch ohne meine Hilfe wacker geschlagen.~
== AC#ELERN ~Ich seid ja wirklich ein Drache!~
== AC#GROM5 ~Ein Hoch auf die Rückkehr unseres Königs!~
== AC#VRONI ~Seid gegrüßt, Mithbarakaz. Es ist schön, Euch in Eurer richtigen Gestalt kennenzulernen.~
== AC#ANT64 ~Auch wenn Ihr mir als Zwerg besser gefallen habt, freue ich mich über Eure Rückkehr, König Mithralschild!~
== AC#TURBA ~Ich wurdet vor Jahrhunderten, als Ihr unsere Stadt zum ersten Mal betreten habt, von Dumathoin persönlich gesegnet. Ob Zwerg oder nicht - Ihr seid der rechtmäßige Herrscher unserer Stadt!~
== AC#SORNI ~Wir bräuchten aber ganz schön viel Adamantit, um Euch in dieser Form eine passende Rüstung zu schmieden!~
== AC#BETTA ~Willkommen zurück, weiser Mithbarakaz!~
== AC#FENYL ~Habt Ihr überhaupt Platz in unserem Thronsaal?~
== AC#STURV ~Was für ein erhebender Anblick! Ein Drache als unser König!~
END
IF ~~ THEN + nice_to_be_back

CHAIN IF ~~ THEN AC#MITH5 chain_mith_dwarf_02
~Und wie ich sehe, haben sich meine treuen Zwerge auch ohne meine Hilfe wacker geschlagen.~
== AC#ELERN ~Es ist schön, dass Ihr wieder zurück seid!~
== AC#GROM5 ~Ein Hoch auf die Rückkehr unseres Königs!~
== AC#VRONI ~Auch, wenn der Fluch immer noch auf Euch lastet, tut es gut, Euch wieder zu sehen.~
== AC#ANT64 ~Ihr gefallt mir als Zwerg ohnehin besser denn als Drache, König Mithralschild!~
== AC#TURBA ~Ich wurdet vor Jahrhunderten, als Ihr unsere Stadt zum ersten Mal betreten habt, von Dumathoin persönlich gesegnet. Ob Drache oder nicht - Ihr seid der rechtmäßige Herrscher unserer Stadt!~
== AC#SORNI ~Ich werde Euch eine Rüstung schmieden, die eines Zwerges und eines Drachen würdig ist!~
== AC#BETTA ~Willkommen zurück, weiser König Mith Barak!~
== AC#FENYL ~Ihr habt Euch zum Glück gar nicht verändert.~
== AC#STURV ~Ein Hoch auf unseren König!~
END
IF ~~ THEN + nice_to_be_back

CHAIN IF ~~ THEN AC#MITH5 chain_many_victims
~Ihr musstet viele Opfer bringen, meine Zwerge! Und alles wegen mir und meiner Fehde, über die Ihr nichts wusstet und für die Ihr nichts konntet. Bitte vergebt mir, dass ich Euch nie die Wahrheit über mich sagen konnte.~
== AC#GROM5 ~Ihr habt Eure Gründe gehabt, König.~
== AC#VRONI ~Doch ohne <CHARNAME> hätten wir Euch nie retten können!~
== AC#ANT64 ~Ja, <PRO_HIMHER> gebührt der Dank der ganzen Stadt!~
== AC#GROM5 ~Ein Hoch auf <CHARNAME>!~
== AC#TURBA ~Ein Hoch auf <CHARNAME>!~
== AC#SORNI ~Ein Hoch auf <CHARNAME>!~
== AC#BETTA ~Ein Hoch auf <CHARNAME>!~
== AC#FENYL ~Ein Hoch auf <CHARNAME>!~
== AC#STURV ~Ein Hoch auf <CHARNAME>!~
== AC#ELERN ~Ein Hoch auf <CHARNAME>!~
END
IF ~~ THEN + dwarves_impressed
	