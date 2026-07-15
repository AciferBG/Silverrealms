							
// ---------------------------------------------
// König Mith Barak
// ---------------------------------------------

BEGIN ~AC#GROM5~

BEGIN AC#TURBB 
BEGIN AC#GROMB 
BEGIN AC#BETTB 
BEGIN AC#ILFNB 

BEGIN ~AC#MITH5~


IF ~Global("AC#IltkazarCelebration","GLOBAL",3)~ THEN BEGIN hello_throne_final
  SAY ~<CHARNAME>. Die Ansprache an mein Volk ist vorüber. Nun endlich haben wir Gelegenheit, in Ruhe miteinander zu sprechen. Ihr habt Iltkazar mehr gegeben, als ich jemals zurückzahlen könnte. Wenn Ihr Fragen habt, werde ich sie beantworten, so gut ich kann.~
  IF ~~ THEN REPLY ~Erzählt mir von Euch. Wer ist Mithbarakaz wirklich?~ GOTO who_are_you
  IF ~~ THEN REPLY ~Wie seid Ihr überhaupt König von Iltkazar geworden?~ GOTO king_of_iltkazar
  IF ~~ THEN REPLY ~Wie lange lastete der Fluch bereits auf Euch?~ GOTO curse
  IF ~~ THEN REPLY ~Wie konntet Ihr all die Jahre als Zwerg leben?~ GOTO life_as_dwarf
  IF ~~ THEN REPLY ~Was wird nun aus Iltkazar werden?~ GOTO future
  IF ~~ THEN REPLY ~Was wird aus dem Regentschaftsrat?~ GOTO regency
  IF ~~ THEN REPLY ~Wusste irgendjemand, dass Ihr ein Drache seid?~ GOTO secret
  IF ~~ THEN REPLY ~Was bedeutet Iltkazar Euch persönlich?~ GOTO meaning
  IF ~~ THEN REPLY ~Ich denke, es ist Zeit für meinen Abschied.~ GOTO farewell
END

	IF ~~ THEN BEGIN throne_final_hub
	  SAY ~Habt Ihr weitere Fragen?~
	  IF ~~ THEN REPLY ~Erzählt mir von Euch. Wer ist Mithbarakaz wirklich?~ GOTO who_are_you
	  IF ~~ THEN REPLY ~Wie seid Ihr überhaupt König von Iltkazar geworden?~ GOTO king_of_iltkazar
	  IF ~~ THEN REPLY ~Wie lange lastete der Fluch bereits auf Euch?~ GOTO curse
	  IF ~~ THEN REPLY ~Wie konntet Ihr all die Jahre als Zwerg leben?~ GOTO life_as_dwarf
	  IF ~~ THEN REPLY ~Was wird nun aus Iltkazar werden?~ GOTO future
	  IF ~~ THEN REPLY ~Was wird aus dem Regentschaftsrat?~ GOTO regency
	  IF ~~ THEN REPLY ~Wusste irgendjemand, dass Ihr ein Drache seid?~ GOTO secret
	  IF ~~ THEN REPLY ~Was bedeutet Iltkazar Euch persönlich?~ GOTO meaning
	  IF ~~ THEN REPLY ~Ich denke, es ist Zeit für meinen Abschied.~ GOTO farewell
	END

IF ~~ THEN BEGIN who_are_you
  SAY ~Ich wurde vor vielen Jahrhunderten geboren, lange bevor die meisten Reiche der Menschen überhaupt existierten. Wie viele Silberdrachen zog es mich einst hinaus in die Welt der Sterblichen. Während andere meinesgleichen ferne Gipfel oder einsame Täler bevorzugten, fand ich Gefallen an den Hallen der Zwerge. Ihre Beharrlichkeit, ihre Treue und ihre Kunstfertigkeit beeindruckten mich. Mit den Jahren wurde aus Bewunderung Zuneigung und schließlich Verantwortung.~
  IF ~~ THEN GOTO throne_final_hub
END

IF ~~ THEN BEGIN king_of_iltkazar
  SAY ~Ein König wird nicht allein durch Blut oder einen Thron zum Herrscher. Die Zwerge Iltkazars baten mich einst, über sie zu wachen. Zunächst als Freund, später als Berater und schließlich als König. Es war nie die Krone, die mir wichtig war. Es waren die Menschen – oder besser gesagt die Zwerge – die hinter ihr standen.~
  IF ~~ THEN GOTO throne_final_hub
END

IF ~~ THEN BEGIN curse
  SAY ~Länger, als manche Königreiche bestanden haben. Jahrhunderte vergingen, während ich in dieser Gestalt gefangen war. Anfangs zählte ich die Jahre. Später die Generationen. Schließlich hörte ich auf zu zählen.~
  IF ~~ THEN GOTO throne_final_hub
END

IF ~~ THEN BEGIN life_as_dwarf
  SAY ~Schlechter, als Ihr vielleicht denkt. Besser, als Ihr vielleicht erwartet. Anfangs empfand ich jede Einschränkung als Demütigung. Doch mit der Zeit lernte ich, die Welt durch die Augen jener zu sehen, die ich beschützen wollte. Vielleicht machte mich der Fluch zu einem besseren König, als ich es jemals als Drache gewesen wäre.~
  IF ~~ THEN GOTO throne_final_hub
END

IF ~~ THEN BEGIN future
  SAY ~Der schwierigste Teil beginnt erst jetzt. Eine Stadt zu retten ist leichter, als sie wieder aufzubauen. Unsere Hallen müssen repariert, Handelswege gesichert und alte Bündnisse erneuert werden. Doch zum ersten Mal seit langer Zeit blicke ich mit Zuversicht in die Zukunft.~
  IF ~~ THEN GOTO throne_final_hub
END

IF ~~ THEN BEGIN regency
  SAY ~Der Regentschaftsrat hat Iltkazar durch schwere Zeiten geführt. Manche Entscheidungen hätte ich anders getroffen, andere nicht. Doch sie hielten die Stadt zusammen, als viele längst jede Hoffnung aufgegeben hatten. Dafür schulde ich ihnen Dank.~
  IF ~~ THEN GOTO throne_final_hub
END

IF ~~ THEN BEGIN secret
  SAY ~Einige ahnten es. Wenige wussten es mit Gewissheit. Die meisten hielten die Wahrheit für eine Legende. Das war mir stets recht. Ein König sollte nach seinen Taten beurteilt werden, nicht nach der Gestalt, die er annimmt.~
  IF ~~ THEN GOTO throne_final_hub
END

IF ~~ THEN BEGIN meaning
  SAY ~Iltkazar ist mein Zuhause. Nicht meine Höhle. Nicht mein Hort. Mein Zuhause. Ich habe hier Freunde gefunden, Verbündete verloren, Siege gefeiert und Niederlagen ertragen. Die Stadt hat mich ebenso geprägt, wie ich sie geprägt habe.~
  IF ~~ THEN GOTO throne_final_hub
END

IF ~~ THEN BEGIN farewell
  SAY ~Dann bleibt mir nur noch eines zu sagen. Ihr seid jederzeit in Iltkazar willkommen! Nicht nur als Gast. Auch nicht nur als Verbündeter. Sondern als Freund!~
  IF ~~ THEN REPLY ~Vielleicht sehen wir uns eines Tages wieder.~ GOTO bye
  IF ~~ THEN REPLY ~Passt gut auf Eure Stadt auf.~ GOTO bye
  IF ~~ THEN REPLY ~Lebt wohl, Mith Barak.~ GOTO bye
END

IF ~~ THEN BEGIN bye
  SAY ~Lebt wohl, <CHARNAME>. Mögen Dumathoin und Bahamut über Euch wachen und Eure Wege stets sicher sein. Die Tore Iltkazars werden Euch immer offenstehen.~
  IF ~~ THEN EXIT
END


IF ~Global("AC#Mithbarak_Rescued","GLOBAL",20)
Global("AC#IltkazarCelebration","GLOBAL",0)~ THEN BEGIN hello_throneroom
SAY ~Willkommen im Thronsaal von Iltkazar, <CHARNAME>! Zum ersten Mal begegnet Ihr hier nicht einer stummen Statue aus Mithril, sondern dem König selbst. Es ist eine Freude, Euch als Freund in diesen Hallen begrüßen zu dürfen.~
IF ~~ THEN REPLY ~Es freut mich, Euch wohlauf zu sehen.~ GOTO throne_room_02
IF ~~ THEN REPLY ~Ihr habt mir eine ganze Menge zu erklären.~ GOTO throne_room_explain
END

IF ~~ THEN BEGIN throne_room_explain
SAY ~Und das werde ich auch. Über Kalzareinad, den Fluch und all die Jahre meines Exils werden wir noch sprechen. Doch zuvor gibt es eine Pflicht, der ich mich nicht entziehen kann.~
IF ~~ THEN GOTO throne_room_02
END

IF ~~ THEN BEGIN throne_room_02
SAY ~Mein Volk hat lange auf diesen Tag gewartet. Viel zu lange! Heute soll Iltkazar erfahren, wem es seine Rettung verdankt.~
IF ~Global("AC#MithbarakazCurse","GLOBAL",1)~ THEN  + throneroom_mith_dragon_cutscene
IF ~Global("AC#MithbarakazCurse","GLOBAL",0)~ THEN  + throneroom_mith_dwarf_cutscene
END

	IF ~~ THEN BEGIN throneroom_mith_dragon_cutscene
	SAY ~Viele von ihnen glaubten nicht, ihren König jemals wiederzusehen. Nun werden Sie sehen, was er wirklich ist. Und dass er auch in seiner wahren Gestalt zu dem - seinem! - Zwergenvolk steht.~
	=
	~Lasst die Hörner erklingen! Ruft die Bürger in den Thronsaal!~
	IF ~~ THEN DO ~StartCutSceneMode()
	StartCutScene("AC#IL89A")
	SetGlobal("AC#IltkazarCelebration","GLOBAL",1)							   
	~ EXIT
	END

	IF ~~ THEN BEGIN throneroom_mith_dwarf_cutscene
	SAY ~Viele von ihnen glaubten nicht, ihren König in seiner gewohnten Gestalt wiederzusehen.~
	=
	~Lasst die Hörner erklingen! Ruft die Bürger in den Thronsaal!~
	IF ~~ THEN DO ~StartCutSceneMode()
	StartCutScene("AC#IL89B")
	SetGlobal("AC#IltkazarCelebration","GLOBAL",1)							   
	~ EXIT
	END	

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
SAY ~Ihr habt es geschafft! Ich war mir nicht sicher, wie lange ich das Portal noch hätte offenhalten können.~ [AC#ILMIZ]
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

CHAIN IF ~Global("AC#IltkazarCelebration","GLOBAL",2)~ THEN AC#MITH5 chain_mith_celebration_01
~Bürger von Iltkazar! Freunde! Kinder Shanatars!~
= ~Zu lange lag ein Schatten über unserer Stadt. Zu lange hattet Ihr Sorge, dass Euer König niemals aus seinem Schlaf wieder erwachen würde.~
= ~Doch heute stehen wir alle hier. Frei. Ungebrochen. Vereint.~
= ~Diesen Tag verdanken wir einem Bewohner der Oberfläche, der unsere Not zu seiner eigenen machte. Der für uns kämpfte, als andere uns längst vergessen hatten. Der durch Flammen, Dunkelheit und Verrat ging und dennoch nicht von <PRO_HISHER>em Weg abwich.~
= ~<CHARNAME>! Im Namen Iltkazars, im Namen des Zwergenvolkes und im Namen aller guten Drachen danke ich Euch.~
= ~Mögen die Barden der Oberfläche Eure Taten besingen. Mögen die Schmiede des Unterreichs Euren Namen in Stahl schlagen. Mögen unsere Nachfahren sich an Euer Werk erinnern, wenn wir selbst längst zu Staub zerfallen sind.~
= ~Ein Hoch auf <CHARNAME>, den Retter Iltkazars!~
== AC#TURBB ~Hoch lebe <CHARNAME>!~
== AC#GROMB ~Hoch!~
== AC#BETTB ~Hoch!~
== AC#ILFNB ~Hoch!~ [AC#ILFNB]
== AC#MITH5~Ruhe, meine Freunde! Ruhe!~
= ~Es erfreut mein Herz mehr, als Worte es ausdrücken können, Euch alle heute hier versammelt zu sehen. Lange habe ich von diesem Augenblick geträumt. Sehr lange. Doch Königreiche regieren sich nicht von selbst.~
= ~Iltkazar muss wieder aufgebaut werden. Unsere Verluste müssen gezählt, unsere Bündnisse erneuert und unsere Wunden geheilt werden. Viel Arbeit liegt vor uns.~
= ~Für heute jedoch sollen die Schmieden schweigen, die Gelehrten ihre Bücher schließen und die Krieger ihre Waffen niederlegen. Heute wird gefeiert!~
== AC#ILFNB ~Hurra!~ [AC#ILFNB]
== AC#MITH5 ~Heute beginnt die Zukunft Iltkazars.~
= ~Geht in die Tavernen und leert Euren Met bis zum letzten Fass. Zu Ehren unserer Stadt! Ich werde mich hier im Thronsaal an die Arbeit machen, die letzten hundert Jahre nachzuarbeiten. Euer König hat nach seiner Abwesenheit einen Berg von Angelegenheiten zu regeln.~
== AC#ILFNB ~Wir trinken auf unseren König! Heute soll der Met niemals versiegen.~ [AC#ILFNB]
== AC#MITH5 ~Zieht aus in die Stadt und feiert!~
== AC#MITH5 ~<CHARNAME>, wenn Ihr noch Zeit habt, würde ich nun, da das Volk zufrieden und glücklich ist, unter uns alleine einige vertrauliche Worte wechseln. Es gibt vieles zu erzählen!~
END
IF ~~ THEN DO ~StartCutSceneMode()
	StartCutScene("AC#IL89C")
	SetGlobal("AC#IltkazarCelebration","GLOBAL",3)							   
	~ EXIT	

	