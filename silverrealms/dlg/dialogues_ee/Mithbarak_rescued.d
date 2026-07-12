							
// ---------------------------------------------
// König Mith Barak
// ---------------------------------------------

BEGIN ~AC#GROM5~

BEGIN ~AC#MITH5~

IF ~Global("AC#Mithbarak_Rescued","GLOBAL",20)
Global("AC#IltkazarCelebration","GLOBAL",0)~ THEN BEGIN hello_throneroom
SAY ~Willkommen im Thronsaal von Iltkazar, <CHARNAME>! Zum ersten Mal begegnet Ihr hier nicht einer stummen Statue aus Mithril, sondern dem König selbst. Es ist eine Freude, Euch als Freund in diesen Hallen begrüßen zu dürfen.~
IF ~~ THEN REPLY ~Es freut mich, Euch wohlauf zu sehen.~ GOTO throne_room_02
IF ~~ THEN REPLY ~Ihr habt mir eine ganze Menge zu erklären.~ GOTO throne_room_explain
END

IF ~~ THEN BEGIN throne_room_explain
SAY ~Und das werde ich auch. Über Kalzareinad, über den Fluch und über all die Jahre meines Exils werden wir noch sprechen. Doch zuvor gibt es eine Pflicht, der ich mich nicht entziehen kann.~
IF ~~ THEN GOTO throne_room_02
END

IF ~~ THEN BEGIN throne_room_02
SAY ~Mein Volk hat lange auf diesen Tag gewartet. Zu lange! Viele von ihnen glaubten nicht, ihren König jemals wiederzusehen. Und noch weniger hätten geglaubt, dass ein Fremder von der Oberfläche derjenige sein würde, der Iltkazar rettet.~
= 
~Nein, <CHARNAME>. Heute soll es nicht um mich gehen. Heute soll Iltkazar erfahren, wem es seine Rettung verdankt.~
= 
~Lasst die Hörner erklingen! Ruft die Bürger in den Thronsaal! Heute ehren wir den Retter Iltkazars!~
IF ~~ THEN DO ~SetGlobal("AC#IltkazarCelebration","GLOBAL",1)							   
~ EXIT
END	

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
SAY ~Ihr habt es geschafft! Ich war mir nicht sicher, wie lange ich das Portal noch hätte offenhalten können.~
IF ~Global("AC#MithbarakazCurse","GLOBAL",1)~ THEN  + mith_dragon_01
IF ~Global("AC#MithbarakazCurse","GLOBAL",0)~ THEN  + mith_dwarf_01
END

	IF ~~ THEN BEGIN mith_dragon_01
	SAY  ~Und wie es scheint, habt Ihr auch den Fluch, der seit tausend Jahren auf mir lastete, von mir genommen.~
	IF ~~ THEN REPLY ~Das sehe ich, ja. Ihr seid Mithbarakaz, der Silberdrache.~ + silverdragon
	IF ~~ THEN REPLY ~Ein Silberdrache auf dem Thron von Iltkazar. Das dürfte einige Anwesende ziemlich sprachlos machen!~ GOTO silverdragon
	IF ~~ THEN REPLY ~Tausend Jahre Fluch, und jetzt seid Ihr frei. Die Götter verschwenden ihre Strafen wirklich an die Falschen.~ GOTO silverdragon
	IF ~~ THEN REPLY ~Ich werde nie wieder einem Zwerg begegnen können, ohne mich zu fragen, ob er heimlich ein Drache ist.~ GOTO silverdragon
	END
	
		IF ~~ THEN BEGIN silverdragon
		SAY ~Auch wenn die Zwerge Iltkazars in mir nur Mith Barak, den Clanlosen, sahen, schlug doch stets das Herz eines Drachen in meiner Brust.~
		IF ~~ THEN + you_rescued_me
		END

	IF ~~ THEN BEGIN mith_dwarf_01
	SAY  ~Ich habe meinen Thron zurückerlangt und stehe wieder als König Mith Barak vor Euch. Doch meine wahre Gestalt bleibt mir weiterhin verwehrt. Der Fluch lastet noch immer auf meiner Drachenseele.~
	IF ~~ THEN REPLY ~Es war mir nicht möglich, den Fluch von Euch zu nehmen.~ + not_remove_curse
	IF ~~ THEN REPLY ~Ich habe alles getan, was in meiner Macht stand.~ GOTO not_remove_curse
	IF ~~ THEN REPLY ~Nach allem, was geschehen ist, erwartet Ihr noch mehr vom Schicksal?~ GOTO not_remove_curse
	IF ~~ THEN REPLY ~Ihr seid frei und habt Euer Königreich zurück. Das muss fürs Erste genügen.~ GOTO not_remove_curse
	IF ~~ THEN REPLY ~Es gibt wahrlich schlimmere Schicksale, als König einer großen Zwergenstadt zu sein.~ GOTO not_remove_curse
	IF ~~ THEN REPLY ~Immerhin müsst Ihr Euch nun nicht ständig den Kopf an Türstürzen stoßen.~ GOTO not_remove_curse
	END
	
		IF ~~ THEN BEGIN not_remove_curse
		SAY  ~Das spielt jetzt keine Rolle.~
		IF ~~ THEN DO ~~ + you_rescued_me
		END

			IF ~~ THEN BEGIN you_rescued_me
			SAY  ~Das Einzige, das zählt, ist jedoch, dass Ihr mich aus der Gefangenschaft der Anhänger Tiamats befreit habt und ich wieder hier, in meiner Stadt, bin!~
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
				IF ~~ THEN REPLY ~Dann hoffe ich, dieser Eindruck hält eine Weile an.~ GOTO rescue_questions
				IF ~~ THEN REPLY ~Ach, das ist doch nicht der Rede wert.~ GOTO rescue_questions
				IF ~~ THEN REPLY ~Der Ruhm gebührt allen, die an meiner Seite gekämpft haben.~ GOTO rescue_questions
				IF ~~ THEN REPLY ~Ihr habt Recht. Solche Taten sieht man nicht alle Tage.~ GOTO rescue_questions	
				IF ~~ THEN REPLY ~Gut. Dann hat sich das Ganze wenigstens gelohnt.~ GOTO rescue_questions	
				IF ~~ THEN REPLY ~Und das war noch einer meiner schlechteren Tage.~ GOTO rescue_questions	
				IF ~~ THEN REPLY ~Vergesst niemals, wem Ihr Euer Leben verdankt.~ GOTO rescue_questions
				IF ~~ THEN REPLY ~Weil es kein anderer tun wollte, habe ich es eben selbst gemacht.~ GOTO rescue_questions				
				END
				
					IF ~~ THEN BEGIN rescue_questions
					SAY ~Jedenfalls sind Euch der Dank Iltkazars und die Achtung des gesamten Zwergenvolkes gewiss – ebenso meine eigene und die aller guten Drachen. Ich weiß, dass Ihr viele Fragen habt, <CHARNAME>, und glaubt mir: Auch mein Volk verlangt nach Antworten. Doch dies ist weder die Zeit noch der Ort dafür. Lasst uns zunächst in den Thronsaal gehen und gemeinsam die Rettung Iltkazars feiern. Danach will ich Euch Rede und Antwort stehen, denn auch für mich hat die Heimkehr nach so langer Zeit vieles verändert.~
					=
					~Nun muss ich mich in den Thronsaal begeben. Zu lange war ich fort, und ein König hat Pflichten gegenüber seinem Volk. Kommt, Freunde! Lasst uns diesen Tag nicht mit Sorgen, sondern mit Freude beschließen. Heute feiern wir die Rettung Iltkazars. Und Ihr, <CHARNAME>, seid dort als Ehrengast willkommen. Wenn die Feierlichkeiten vorüber sind, werden wir Gelegenheit haben, über alles zu sprechen, was geschehen ist.~
					IF ~~ THEN DO ~SetGlobal("AC#Mithbarak_Rescued","GLOBAL",19)
					AddJournalEntry(@99000,QUEST_DONE)								   
					EscapeArea()~ EXIT
					END	

//~Ich werde mich nun in den Ratssaal begeben müssen. Ich bin lange fort gewesen! Es gibt sicher viel zu regeln. Euch anderen danke ich für den herzlichen Empfang, Ihr habt einem alten Drachen eine große Freude bereitet. So kehren wir denn zu unserem Tagesgeschäft zurück. Und Euch, <CHARNAME>, noch einmal alles Gute.~					
				
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
	