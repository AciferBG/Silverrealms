
/*******************************************************************************************************
Dialogue Dracolich
*******************************************************************************************************/

/*
BEGIN ~AC#71DRL~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
SAY  ~Uuuuhh.... tausend Jahre tot... und jetzt wieder... Leben?~
   IF ~~ THEN DO ~SetGlobal("AC#_DragonSummon","GLOBAL",14)
   SetGlobal("AC#_TransformDracolich","GLOBAL",1)
   Enemy()~  EXIT
END
*/

/*******************************************************************************************************
Dialogue Dragonwraith
*******************************************************************************************************/

/*
BEGIN ~AC#DRAGR~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
SAY  ~Wer wagt es, die alte Beschwörung Kalzareinads zu vollziehen? Ein <PRO_RACE>? Nur Drachen sind würdig, den Hüter alter Wunder anzurufen. Ich bin sein Wächter. Für diesen Frevel werde ich Euch vernichten!~
   IF ~~ THEN DO ~SetGlobal("AC#_DragonSummon","GLOBAL",14)
   SetGlobal("AC#_TransformDracolich","GLOBAL",1)
   Enemy()~  EXIT
END
*/

/*******************************************************************************************************
Dialog Drachenstatue
*******************************************************************************************************/

BEGIN ~AC#MALD1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
SAY  ~Ihr habt dem Hüter des verborgenen Wissens ein würdiges Opfer gebracht, Sterbliche... Die alten Regeln besagen, dass Ihr eine Frage stellen dürft. Wenn Sie Kalzareinad gefällt, antwortet er. Wenn er sie missbilligt, werdet Ihr vernichtet. Welche Frage hat Euch an diesen Ort gebracht?~
	IF ~~ THEN REPLY ~Ich suche einen Zwerg namens Mith Barak. Er muss Euch vor längerer Zeit aufgesucht haben.~ + seek_dwarf_long_time
	IF ~~ THEN REPLY ~Ich komme aus Iltkazar und suche nach der Ursache für dessen schlafenden König.~ + seek_iltkazar_sleeping_king
	IF ~!IsValidForPartyDialog("Minsc")~ THEN REPLY ~Was war zuerst da- der Drache oder das Ei?~ + egg
	IF ~IsValidForPartyDialog("Minsc")~ THEN REPLY ~Was war zuerst da- der Drache oder das Ei?~ EXTERN ~MINSCJ~ minsc_egg
END

	IF ~~THEN BEGIN egg
	SAY ~Es ist immer wieder erstaunlich, welche großen Mühen Sterbliche auf sich nehmen, um dann an einer Belanglosigkeit zu scheitern. Dieser Frage ist Kalzareinads nicht würdig. Ihr werdet vernichtet.~
	++ ~Wartet- eigentlich wollte ich es ganz anderes Fragen. Ich suche nach Mith Barak, dem Zwerg.~ + 33
	END
	
IF ~~THEN BEGIN seek_dwarf_long_time
SAY ~Vor längerer Zeit sagt Ihr... doch im Zeitalter der Drachen nicht länger als ein Atemzug... Mithbarakaz war hier, doch ein Zwerg ist er nie gewesen.~
IF ~~ THEN GOTO no_dwarf
END

IF ~~THEN BEGIN seek_iltkazar_sleeping_king
SAY ~Iltkazar, die Zwergenstadt... Ja, Mithbarakaz war hier, doch als Zwerg ist er nicht erschienen.~
IF ~~ THEN GOTO no_dwarf
END

	IF ~~THEN BEGIN no_dwarf
	SAY ~Ihr kennt Mithbarakaz nur in seiner Zwergenform. Jetzt verstehe ich...~
	IF ~~ THEN GOTO penetrant
	END

IF ~~THEN BEGIN 33
SAY ~Ihr habt Eure Frage bereits gestellt. Ihr dürft keine weiteren Fragen mehr stellen.~
++ ~Ich bin nicht den ganzen Weg hierhergekommen, um mit solch einer Antwort abgespeist zu werden! Ich verlange Antworten, und Ihr werdet sie mir geben!~ + 34
++ ~Bitte, ich muss es wissen. Das Schicksal von Mith Barak hängt von Eurer Hilfe ab!~ + penetrant
END

	IF ~~THEN BEGIN penetrant
	SAY ~Ihr scheint von Eurer Sache sehr überzeugt. Wie lautet Euer Name?~
	++ ~Ich bin <CHARNAME>.~ + 35_gentle
	++ ~Den sage ich Euch nicht.~ + not_telling_name
	END
	
		IF ~~THEN BEGIN not_telling_name
		SAY ~Ihr wollt Wissen von mir, ohne Eure Identität preiszugeben? Dann werde ich Euch nicht helfen.~
		++ ~Also gut, Ich bin <CHARNAME>.~ + 35_gentle
		END
	
	IF ~~THEN BEGIN 34
	SAY ~Ihr droht mir, <RACE>lein? Wie ist Euer Name?~
	++ ~Mein Name ist <CHARNAME>. Und wenn ich die Antwort aus dieser Statue herausprügeln muss, Ihr werdet mir jetzt sagen, was Ihr über Mithbarak wisst!~ + 35
	END

		IF ~~THEN BEGIN 35_gentle
		SAY ~Ich spüre eine Aura in Euch, die nichts Sterbliches an sich hat. Woher stammt Ihr, <CHARNAME>, der <PRO_RACE>?~
		++ ~Aus Kerzenburg.~ + 36
		++ ~Das geht Euch nichts an.~ + streitlustig
		END
		
		IF ~~THEN BEGIN 35
		SAY ~Ihr seid... starrköpfig... und ich spüre eine Aura in Euch, die nichts Sterbliches an sich hat. Woher stammt Ihr, <CHARNAME>, der <PRO_RACE>?~
		++ ~Aus Kerzenburg.~ + 36
		++ ~Das geht Euch nichts an.~ + streitlustig
		END

			IF ~~THEN BEGIN 36
			SAY ~Kerzenburg! Der Hort des Wissens...~
			IF ~~ THEN GOTO bhaalspawn
			END
			
			IF ~~THEN BEGIN streitlustig
			SAY ~Ihr seid streitlustig, kleiner <PRO_RACE>. Euer Blut scheint leicht in Wallung zu geraten...~
			IF ~~ THEN GOTO bhaalspawn
			END

		// OLD:
		/*
			IF ~~THEN BEGIN bhaalspawn
			SAY ~Ihr müsst das Kind des Menschengottes Bhaal sein. Ich spüre seine Aura an Euch. Interessant, welche Wendung das Schicksal nun nimmt! Ihr werdet mir nützen. Rührt Euch nicht! Ich werde Euch genauer in Augenschein nehmen.~
			   IF ~~ THEN DO ~SetGlobal("AC#Maldraedior","ACIL71",1)~  EXIT
			END
		*/

			// NEW:
			IF ~~THEN BEGIN bhaalspawn
			SAY ~Ihr müsst das Kind des Menschengottes Bhaal sein. Ich spüre seine Aura an Euch. Interessant, welche Wendung das Schicksal nun nimmt! Ihr werdet mir nützen. Ich werde Euch genauer in Augenschein nehmen müssen. Hört zu.~
			=
			~Ich werde im Osten dieser Kammer ein Portal öffnen, durch welches Ihr hindurchschreiten müsst. Aber nur Ihr und Ihr allein, <CHARNAME>! Dieses Gespräch ist nur für Eure Ohren bestimmt. Ich öffne jetzt das Portal. Wir sehen uns auf der anderen Seite!~
			   IF ~~ THEN DO ~SetGlobal("AC#Maldraedior","ACIL71",1)~  EXIT
			END

/*******************************************************************************************************
Dialog Maldraedior
*******************************************************************************************************/

BEGIN ~AC#MALD3~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
SAY  ~Ihr seid also gekommen. Seid gegrüßt, <CHARNAME>. Ich bin Maldraedior, mächtigster und ältester aller Drachen.~
   IF ~~ THEN REPLY ~Ein Drache? Sprecht schnell, bevor ich meine Waffen sprechen lasse!~ + 1
   IF ~~ THEN REPLY ~Nett, Euch kennenzulernen.~ + nice_to_meet_you
END

IF ~~THEN BEGIN 1
SAY ~Oh, glaubt mir, ich bin aus anderem Holz geschnitzt als die Schwächlinge, die Ihr bisher getötet habt.~
++ ~Ein Drache? Ich dachte, ich beschwöre die Gottheit Kalzareinad. Was geht hier vor sich?~ + 2
END

IF ~~THEN BEGIN nice_to_meet_you
SAY ~Ich bin mir sicher, Ihr seid nicht gekommen, um Gefälligkeiten auszutauschen. Ihr habt wohl eher mit einem Gott gerechnet, als nun einem weiteren Drachen gegenüberzustehen.~
++ ~Ein Drache? Ich dachte, ich beschwöre die Gottheit Kalzareinad. Was geht hier vor sich?~ + 2
END

	IF ~~THEN BEGIN 2
	SAY ~Ihr sucht Kalzareinad, den mächtigen Drachengott des Wissens und der verbotenen Dinge. Ich bin sein treuester Diener.~
	++ ~Dann habe ich gerade nicht mit Kalzareinad selbst gesprochen?~ + not_talked_to_kalzareinad
	END
	
	IF ~~THEN BEGIN not_talked_to_kalzareinad
	SAY ~Nein, das war ich. Mein Dienst ist, die Fragen seiner Anbeter zu beantworten... auch wenn mittlerweile selten welche gestellt werden.~
	IF ~~ THEN GOTO promise
	END

		IF ~~THEN BEGIN promise
		SAY ~Bevor ich weiterspreche, muss ich Euch ein Versprechen abringen. Wir können einander helfen, <CHARNAME>. Ihr helft mir bei einer Angelegenheit, und ich werde Euch im Austausch alle Antworten geben, derer zu finden Ihr gekommen seid.~
		++ ~Gut, ich werde Euch unterstützen.~ + 4
		++ ~Ich kooperiere nicht mit bösen Wesen wie Euch!~ + dont_cooperate
		++ ~Ihr seid nicht vertrauenserweckend.~ + dont_know_if_cooperate
		END
		
			IF ~~THEN BEGIN dont_cooperate
			SAY ~Wie überaus ehrenhaft! Wenn Ihr jetzt hoch erhobenen Hauptes von dannen schreitet, seid Ihr völlig umsonst hergekommen. Wenn Ihr versucht, mich zu töten ebenfalls.~
			IF ~~ THEN GOTO dont_know_if_cooperate
			END
			
			IF ~~THEN BEGIN dont_know_if_cooperate
			SAY ~Ich sehe es so: Euch bleibt keine andere Wahl, mich zu unterstützen, wenn Ihr in Eurer eigenen, kleinen Sache ebenfalls weiterkommen wollt. Also hört gut zu.~
			IF ~~ THEN GOTO maldraedior_talks_01
			END

		IF ~~THEN BEGIN 4
		SAY ~Schön.~
		IF ~~ THEN GOTO maldraedior_talks_01
		END
		
		IF ~~THEN BEGIN maldraedior_talks_01
		SAY ~Zu der Aufgabe, die Ihr für mich erledigen sollt, komme ich später. Ich muss ein wenig ausholen, damit Ihr die Zusammenhänge versteht. Keine Angst, ich bin nicht so übellaunig wie andere meiner Art. Und nun lauscht, was Maldraedior Euch zu sagen hat.~
		IF ~~ THEN GOTO 6
		END

		IF ~~THEN BEGIN 6
		SAY ~Kalzareinad ist der Drachengott der Magie. Einst war ich sein oberster Priester. Ich tat alles in meiner Macht stehende, um seine Gunst zu erlangen. Ich sammelte altes, verborgenes Wissen. Ich erschuf mächtige, dunkle Magie. Dies gefiel meinem Gott. Er belohnte mich mit Macht und Zaubern, um unsere Gegner zu vernichten.~
		IF ~~ THEN GOTO who_is_mithbarak
		//IF ~~ THEN REPLY ~Ich wusste gar nicht, dass Drachen so viele eigene Götter haben.~ GOTO dragon_gods_question_01
		END
		
		/*
		
			IF ~~THEN BEGIN dragon_gods_question_01
			SAY ~Das ist eine berechtige Frage. Ihr werdet die Antwort gleich erhalten.~
			IF ~~ THEN GOTO who_is_mithbarak
			END
			*/

IF ~~THEN BEGIN who_is_mithbarak
SAY ~Nun zu meinem Teil des Handels. Ich werde Euch alles, was ich über Mith Barak weiß, berichten.~
IF ~~ THEN GOTO 13
END

IF ~~THEN BEGIN 13
SAY ~Zunächst solltet Ihr einmal wissen, wer Mith Barak in Wahrheit ist.~ 
=
~Mithbarakaz, wie sein voller Name eigentlich ist, ist ein ehrwürdiger alter Silberdrache.~
++ ~Der Zwergenkönig ist in Wirklichkeit ein Drache?~ + 15
++ ~Ach!~ + 15
++ ~Das habe ich mir schon irgendwie gedacht.~ + 14
++ ~Bisher berichtet Ihr mir nicht viel Neues.~ + 14
END

IF ~~THEN BEGIN 14
SAY ~Auf diese Idee sind bis jetzt noch nicht viele gekommen, insbesondere nicht seine Zwerge, die er die letzten Jahrhunderte so lieb gewonnen hat.~
IF ~~ THEN GOTO 15
END

IF ~~THEN BEGIN 15
SAY ~Mithbarakaz war einer der stolzesten und mächtigsten Silberdrachen seiner Art. Wissbegierig, gutherzig, alles das, was seine Art an edlen Gewohnheiten eben so hat. Irgendwann missfiel er damit meinem Herrn, dem Hüter dunkler Wunder, Kalzareinad.~
IF ~~ THEN GOTO 16
END

	IF ~~THEN BEGIN 16
	SAY ~Aus für meinen Herrn triftigen Gründen wurde Mithbarakaz der Silberne von Kalzareinad mit einem Fluch belegt.~ 
	=
	~Kalzareinad hütete das Wissen um dunkle Drachenmagie und hatte eine Möglichkeit erforscht, das Leben von Drachen zu verlängern. Altersschwache, sterbende Drachen suchten in den letzten Stunden vor ihrem Tod diesen Ort auf in der Hoffnung, wieder zu alter Kraft zurückzufinden.~
	IF ~~ THEN GOTO dracolich_failed
	END
	
		IF ~~THEN BEGIN dracolich_failed
		SAY ~Eigentlich sollte die Magie an diesem Ort sterbenden Drachen ewiges Leben schenken. Stattdessen wurden diese untoten, seelenlosen Dinger erschaffen wie jenes, welches ihr vorhin erschlagen habt. Dies haben wir allein Mithbarakaz und anderen seiner Art zu verdanken.~
		IF ~~ THEN GOTO curse
		END
		
		IF ~~THEN BEGIN curse
		SAY ~Dafür traf ihn der Fluch meines erzürnten Gottes.~
		IF ~~ THEN GOTO dragon_to_dwarf
		END

IF ~~THEN BEGIN dragon_to_dwarf
SAY ~Silberdrachen lieben den Flug und die Freiheit, und so traf es ihn besonders hart, dass ihn Kalzareinad in einen Zwergenkörper zwängte.~
++ ~Also hat Kalzareinad Mith Barak in einen Zwerg verwandelt!~ + 17
++ ~Interessantes Schicksal.~ + 17
END

IF ~~THEN BEGIN 17
SAY ~Tausend Jahre sollte der Silberne auf dieser Welt nur in Zwergengestalt durch Höhlen und finstere Gänge kriechen - unfähig, seine mächtigen Flügel zu entfalten oder seine bebende Stimme erklingen zu lassen. Alle fünfundzwanzig Jahre sei es ihm möglich, für fünfundsiebzig Jahre als Drache in seiner wahren Gestalt zu verweilen - aber nur auf der Astralebene.~
++ ~Das erklärt die langen Phasen seines Schlafes.~ + sleep_why
++ ~Deshalb hatte Mith Barak soviel Interesse an der Astralebene!~ + pre_astralplane
END

	IF ~~THEN BEGIN sleep_why
	SAY ~Völlig richtig.~
	IF ~~ THEN GOTO 18
	END
	
	IF ~~THEN BEGIN pre_astralplane
	SAY ~Deshalb, und wegen anderer Dinge auch, welche ich Euch später erläutern werde.~
	IF ~~ THEN GOTO 18
	END

IF ~~THEN BEGIN 18
SAY ~Aber Mithbarak hat das Beste aus seiner misslichen Lage gemacht. Er sammelte Wissen und wurde von den Göttern des Zwergenpantheons gesegnet. So kam er nach Iltkazar.~
   IF ~~ THEN GOTO remove_curse
END

IF ~~THEN BEGIN remove_curse
SAY ~Dennoch trachtete er jeden Tag seines Zwergenlebens danach, diesen Fluch zu brechen. Er hoffte immerfort, Kalzareinad werde den Fluch zurücknehmen, wenn die Zeit dafür gekommen wäre. Doch es kam alles anders.~
   IF ~~ THEN GOTO 7
END

IF ~~THEN BEGIN 7
SAY ~Eines Tages verstummte mein Gebieter, und meine Gebete blieben unbeantwortet. Die Drachen, die ihn einst verehrt hatten, wandten sich von ihm ab, so wie sich viele Drachen von ihren Göttern abwandten, weil sie zu selbstsüchtigen und ehrlosen Kreaturen wurden. Wer braucht schon Götter, wenn er sich für unbesiegbar hält? So wie vielen Drachengottheiten erging es auch meinem Herrn. Er schwand langsam dahin, weil niemand außer mir mehr an ihn glaubte.~
IF ~~ THEN GOTO 8
END

IF ~~THEN BEGIN 8
SAY ~In einer Zeit, die Euch als <RACE> als die Zeit der Sorgen bekannt ist, ist sein göttlicher Funke letztendlich vollständig erloschen.~
=
~Für mich bedeutete dies, keinen Gott mehr zu haben. Für Mithbarakaz bedeutet es, dass es keine Möglichkeit mehr gibt, seinen Fluch zu bannen. Er steckt auf ewig in seiner verfluchten Zwergengestalt fest.~
IF ~~ THEN GOTO 9
END

IF ~~THEN BEGIN 9
SAY ~Ich bin der letzte treue Diener Kalzareinads. Zwei verfallene Tempel des einst mächtigen Hüters Dunkler Wunder sind geblieben, einer an der Schwertküste am Grabmal Tethirs, und der andere weit weg in Unther im Osten. Dort befindet Ihr Euch gerade dank des Portals, welches ich geöffnet habe.~
=
~Meine Pflicht ist es, diese beiden heiligen Stätten im Namen meines Gottes zu beschützen und an seiner statt zu führen.~
++ ~Ihr sagtet, Euer Gott sei gestorben. Worum tut Ihr so, als würde ein Gott noch leben und beantwortet in seinem Namen die Fragen?~ + 10
++ ~Ein sinnloses Unterfangen.~ + 10
END

IF ~~THEN BEGIN 10
SAY ~Der Tod ist relativ. Wenn es möglich ist, eine der niederen Rassen von den Toten zurückzuholen, so könnte es auch möglich sein, eine verschwundene Gottheit aus ihrem ewigen Schlaf wiederzuerwecken. Meine Aufgabe ist, den Glauben an den Hüter dunkler Wunder aufrechtzuerhalten, damit er nicht in Vergessenheit gerät. Und Mithbarakaz war dabei mein Faustpfand. Er hatte ebensoviel Interesse daran, Kalzareinads Macht zurückzubringen wie ich!~
=
~Wenn die Anbeter zu ihrem alten Glauben zurückfänden, würde der göttliche Lebensfunke meines Herrn aufs Neue zu leuchten beginnen. Man muss den Funken nur zum Glühen bringen, indem man ihm wieder etwas göttlichen Atem einhaucht.~
=
~Und hier kommt Ihr nun ins Spiel, <CHARNAME>, Kind des Bhaal.~
IF ~~ THEN GOTO child_of_bhaal
END

IF ~~THEN BEGIN child_of_bhaal
SAY ~Ich kenne die Prophezeiungen des Alaundo. Ich habe sie viele Jahrhunderte studiert. Die Bhaalbrut erschien mir der ideale Funken, der das göttliche Feuer meines Herrn aufs Neue entfachen könnte. Mith Barak, der Zwergenkönig, suchte mich auf, und ich riet ihm, seinen Fokus auf Kerzenburg zu richten. Ich war es, der ihm nahelegte, nach einem damals noch ungeborenen Bhaalkind Ausschau zu halten.~
IF ~~ THEN GOTO 11
END

IF ~~THEN BEGIN 11
SAY ~Ihr werdet mir helfen, meinen Herrn aus dem ewigen Schlaf zu erwecken, und ich werde Euch helfen, Mithbarakaz zu finden. Wenn ich es mir recht überlege, habt Ihr gar keine andere Möglichkeit, als diesen Vorschlag anzunehmen, wenn Ihr denn in Eurem Vorhaben weiterkommen wollt.~
++ ~Ihr wollt, dass ich Euren toten Gott wieder zum Leben erwecke? Wie?~ + 12
++ ~Schon wieder jemand, der an meinem göttlichen Erbe teilhaben will.~ + 12
END

	IF ~~THEN BEGIN 12
	SAY ~Spendet Kalzareinad ein wenig Eurer eigenen göttlichen Essenz. Tretet vor ihn und haucht ihm wieder göttliche Macht ein.~
	++ ~Dazu müsste ich ihm ja erst einmal gegenübertreten.~ + go_to_kalzareinad
	++ ~Ich soll einen Drachengott wiederbeleben?~ + go_to_kalzareinad
	++ ~Niemals werde ich so etwas törichtes machen!~ + kalzareinad_never_ever
	END
	
		IF ~~THEN BEGIN kalzareinad_never_ever
		SAY ~Euch bleibt keine andere Möglichkeit.~
		IF ~~ THEN GOTO go_to_kalzareinad_02
		END
	
		IF ~~THEN BEGIN go_to_kalzareinad
		SAY ~Was Ihr ohnehin tun müsst. Denn genau aus diesem Grunde war Mithbarakaz hier bei mir.~
		IF ~~ THEN GOTO go_to_kalzareinad_02
		END
		
			IF ~~THEN BEGIN go_to_kalzareinad_02
			SAY ~Ironischerweise treibt Kalzareinads Körper genau auf der gleichen Ebene, auf der auch Mith Barak in seiner Drachengestalt gefangen ist - der Astralebene. Im Nachhinein betrachtet bin ich mir nicht sicher, ob das Schicksal dies nicht aus einem bestimmten Grunde so eingefädelt hat.~
			++ ~Ich soll also in die Astralebene und zu Kalzareinads Leichnam reisen?~ + travel_to_astralplane
			END
			
				IF ~~THEN BEGIN travel_to_astralplane
				SAY ~Genau dies hatte auch Mithbarakaz vor. Er wusste nur nicht, wo sich Kalzareinads Körper befindet. Dies kann ich Euch sagen. Es ist wahrscheinlich, dass sich Mithbarakaz vor seinem Verschwinden dort aufgehalten hat. Denn über eines haben wir noch nicht gesprochen - warum er nicht mehr wie sonst aus seinem Schlaf in Iltkazar wieder erwacht ist.~
				IF ~~ THEN GOTO why_mith_didnot_came_back
				END
				
					IF ~~THEN BEGIN why_mith_didnot_came_back
					SAY ~Andere Mächte zeigten ebenfalls Interesse an Mithbarakaz' Schicksal - oder an seinem Wissen über meinen Herrn Kalzareinad. Und sie sind mehr als bereit, es sich mit Gewalt zu nehmen.~
					=
					~Viele andere Götter meiner Art suchen nach Macht und Einfluss: Task, der Herr des Geizes, oder Null, der Gott der toten Drachen. Ein jeder von ihnen trachtet nach Wissen, das Mithbarakaz zu bewahren sucht. Doch es gibt eine Göttin, deren Sucht nach Größe unübertroffen ist und welcher sich Mithbarakaz ebenfalls in den Weg stellte: Tiamat, die dunkle Dame.~
					IF ~~ THEN GOTO tiamat_01
					END
				
						IF ~~THEN BEGIN tiamat_01
						SAY ~Ich bin mir sicher, dass Tiamat hinter Mith Baraks endlosem Schlaf steckt. Die selbst ernannte Königin der Drachen trachtete schon lange danach, die Herrschaft über alle Drachen für sich zu beanspruchen. Bisher ist es ihr nicht gelungen. Sie steckt vielmehr eingekerkert in den Neun Höllen fest. Ob hierbei auch Mithbarakaz seine Fänge im Spiel hatte? Ich weiß es nicht.~
						=
						~Jedenfalls sucht Tiamat nach einer Möglichkeit, sich aus ihrer Gefangenschaft zu befreien. Da kommt ihr ein alter Silberdrache wie gerufen. Ihre Anhänger müssen Mithbarakaz auf der Astralebene unter ihre Kontrolle gebracht haben, was seinen Körper zu einer Mithrilsäule erstarrt auf dem Throne der Zwergenstadt verharren lässt.~
						IF ~~ THEN GOTO tiamat_02
						END
						
						IF ~~THEN BEGIN tiamat_02
						SAY ~Wahrscheinlich seid Ihr schon einigen von Tiamats Schergen begegnet. Sie schickt gerne ihre Horden von Abishai aus den unteren Ebenen, wenn es eine ehrlose Schlacht zu schlagen gilt! Angeführt werden sie meist von einer Kreatur, deren Aussehen erbärmlicher nicht sein könnte: Malphas, das rabengesichtige Scheusal.~
						IF ~~ THEN REPLY ~Malphas! Diesem Wesen bin ich schon einmal begegnet!~ + malphas_01
						END
									
										IF ~~ THEN BEGIN malphas_01
										SAY ~Dann solltet Ihr Euch also auf eine Begegnung mit diesem rabengesichtigen Scheusal gefasst machen. Das Schöne an diesen ganzen Teufeln ist, dass sie es einem immer leicht machen, sie zu erkennen. Sie zu besiegen ist aber eine ganz andere Sache. Denn die Anhänger Tiamats haben viele Verbündete.~
										IF ~~ THEN GOTO githyanki_tiamat 
										END
									
								IF ~~THEN BEGIN githyanki_tiamat
								SAY ~Tiamat hat vor Jahrhunderten mit den Githyanki ein Abkommen getroffen. Sie bietet ihnen als Reittiere junge rote Drachen im Austausch für Dienste, die bisher unbekannt geblieben sind.~
								=
								~Und da die Githyanki ihre Heimat in der Astralebene haben, schließt sich hier der Kreis. Es könnte sein, dass Mithbarakaz von Githyanki in der Astralebene ergriffen wurde und dort nun von Tiamats Schergen gefangen gehalten wird.~
								++ ~Wie geht es jetzt weiter?~ + no_time_to_talk
								END
								
									
									IF ~~THEN BEGIN no_time_to_talk
									SAY ~Wir haben das gleiche Ziel. Ihr müsst in die Astralebene zu Kalzareinads Körper reisen. Dort findet Ihr einen Anhaltspunkt, wo in der unendlichen Astralen See sich Mithbarakaz aufhält - beziehungsweise, wo er gefangengehalten wird. Mein Gott treibt in der Astralebene in einem Gebiet, welches "Silberwolke" genannt wird. Dort müsst hinreisen.~ 
									IF ~~ THEN GOTO your_part_of_deal_01
									END
									
									IF ~~THEN BEGIN your_part_of_deal_01
									SAY ~Nun kommen wir zu der Aufgabe, die Ihr für mich erledigen müsst.~ 
									IF ~~ THEN GOTO your_part_of_deal_02
									END
									
									IF ~~THEN BEGIN your_part_of_deal_02
									SAY ~Euer Teil der Abmachung ist, Kalzareinad neues Leben einzuhauchen und meinem Gott mitzuteilen, dass der Glaube an ihn noch nicht ganz erloschen ist und ich ihn immer noch verehre. Wenn Ihr besonders gutherzig sein wollt, könntet Ihr meinen Gott im Austausch für seine Wiederbelebung bitten, den Fluch, den er auf Mithbarakaz gelegt hat, von ihm zu nehmen. Dies bleibt aber Euch überlassen. Danach zieht Ihr jedenfalls weiter in der astralen See und rettet Mithbarakaz aus seinem elenden Gefängnis.~
									IF ~~ THEN DO ~AddJournalEntry(@79600,QUEST)~ GOTO do_we_have_a_deal
									END
									
									IF ~~THEN BEGIN do_we_have_a_deal
									SAY ~Also was ist: Haben wir eine Abmachung, kleiner <PRO_RACE>?~
									++ ~Was, wenn ich meinen Teil der Abmachung nicht einhalte?~ + not_my_part_of_deal
									++ ~Warum reist Ihr nicht selbst in die Astraleben und sagt es Eurem Gott?~ + why_not_travel_astral_yourself
									++ ~Abgemacht. Ich werde zu Kalzareinad reisen.~ + ok_send_me_to_astral
									END
				
										IF ~~THEN BEGIN not_my_part_of_deal
										SAY ~Eure Kaltschnäuzigkeit gegenüber einer höheren Rasse ist bemerkenswert, <CHARNAME>. Zum einen *müsst* Ihr Kalzareinad aus seinem Dämmerschlaf erwecken, um etwas über Mithbarakaz zu erfahren. Zum anderen habe ich nicht deshalb 4000 Jahre in der Zählweise eines Menschen überlebt, weil ich für meine Gutmütigkeit bekannt bin. Fordert niemals den Rachedurst eines Drachen heraus, <PRO_RACE>lein!~
										IF ~~ THEN GOTO do_we_have_a_deal
										END
										
										IF ~~THEN BEGIN why_not_travel_astral_yourself
										SAY ~Da kennt Ihr das Wesen eines Drachen schlecht. Uns zieht es nicht in andere Ebenen. Bis auf die jüngeren Drachen, die eine Zeit lang vor dem Erwachsenwerden den Githyanki dienen, ist unsere Rasse nicht dafür geeignet, die Ebenen zu bereisen.~
										IF ~~ THEN GOTO do_we_have_a_deal
										END
										
											IF ~~THEN BEGIN ok_send_me_to_astral
											SAY ~Sehr gut! Wir haben einen Pakt, <CHARNAME>. Vergesst ihn nicht. Allerdings kann ich Euch nicht helfen, auf die Astralebene zu reisen.~
											++ ~Gibt es keinen Zauber, der mich dorthin schicken wird?~ + how_to_get_to_astral
											++ ~Aber Ihr habt bestimmt eine Idee, wie ich mich dorthin teleportieren kann.~ + how_to_get_to_astral
											END
											
											IF ~~THEN BEGIN how_to_get_to_astral
											SAY ~Habt Ihr nicht zugehört? Ihr braucht Euer göttliches Blut, um Kalzareinad zu erwecken. Wenn Ihr durch einen Zauber dorthin reisen würdet, würde Eure körperliche Hülle hier zurückbleiben und Ihr wäret nutzlos.~
											=
											~Ihr benötigt ein Portal, um die Astralebene betreten zu können.~
											++ ~Und wo könnte sich ein solches Portal befinden?~ + how_to_get_to_astral_02
											++ ~Danach hat auch Mith Barak gesucht, bisher erfolglos.~ + how_to_get_to_astral_02
											END
											
												IF ~~THEN BEGIN how_to_get_to_astral_02
												SAY ~Wo ein Portal in die Astralebene zu finden ist weiß ich nicht. Ich habe viele Jahre gesucht. Es gibt viele Wege, die aus der Astralebene hier zu uns führen, aber nur sehr wenige in die umgekehrte Richtung.~
												=
												~Allerdings hattet Ihr die Githyanki erwähnt. Sie müssen durch ein solches Portal gekommen sein. Wenn Ihr ihren Unterschlupf finden würdet, würdet Ihr sicher auch ein Portal in ihre Heimatebene finden.~
												++ ~Ich glaube, Mith Barak hat nach genau so einer Möglichkeit gesucht.~ + mithbarak_astral_portal
												END
												
													IF ~~THEN BEGIN mithbarak_astral_portal
													SAY ~Nun, vielleicht war Mithbarakaz nicht ganz so selbstlos, sich nur aus reiner Zwergenliebe zum König von Iltkazar krönen zu lassen. Ich vermute, der Silberne war nahe daran, ein solches Portal im Unterreich zu entdecken. Andererseits könnten die Githyanki aus einem ähnlichen Grunde nahe an Iltkazar mit ihrem Stützpunkt herangerückt sein und schon in der Vergangenheit unerkannt in Erscheinung getreten sein, vieleicht auch im Kampf gegen die Gedankenschinder, die sie so sehr hassen.~
													IF ~~ THEN GOTO gith_patrol_dwarves_illithids
													END
													
													IF ~~THEN BEGIN gith_patrol_dwarves_illithids
													SAY ~Ich würde an Eurer Stelle nach Iltkazar zurückkehren und mit der Suche nach den Githyanki beginnen. Dies führt Euch in ihre Heimat, die Astralebene, und zu dem wahren Drahtzieher Tiamats, der, wenn Ihr Pech habt, dieser Malphas mit seiner Höllenbrut sein könnte.~
													++ ~Das klingt nach einem guten Plan.~ + good_idea
													END
													
														IF ~~THEN BEGIN good_idea
														SAY ~Finde ich auch. Ist ja schließlich von mir.~
														IF ~~ THEN GOTO finito_01
														END
														
															IF ~~THEN BEGIN finito_01
															SAY ~So, jetzt wird es aber Zeit, dass Ihr geht. Mir fällt es auch langsam schwer, diese Erscheinung vor Euch aufrecht zu erhalten.~ 
															++ ~Erscheinung?~ + projection
															IF ~~ THEN REPLY ~So lebt denn wohl, Drache.~ + finito_02
															END
															
															IF ~~THEN BEGIN projection
															SAY ~Glaubt Ihr wirklich, ich wäre so einfältig, mich Euch in meiner wahren Gestalt zu präsentieren? Nein, Ihr redet zwar mit mir, doch ich bleibe lieber sicher in meinem schönen Tempel in Unther.~ 
															IF ~~ THEN GOTO finito_02
															END
														
														IF ~~ THEN BEGIN finito_02
														SAY ~Ich muss zugeben, dass ich schon jahrhundertelang nicht mehr solch ein anregendes Gespräch geführt habe, <CHARNAME>. Lebt wohl, und viel Glück bei Eurer Aufgabe. Wenn Ihr scheitert, werden wir uns nie wiedersehen. Wenn Ihr mich hintergeht, schon, und dann würdet Ihr Euch wünschen, gescheitert zu sein!~
														IF ~~ THEN DO ~SetGlobal("AC#Talked_to_Maldraedior","GLOBAL",1)
														AddJournalEntry(@71010,QUEST_DONE)
														AddJournalEntry(@71100,QUEST)
														AddJournalEntry(@79690,QUEST)
														CreateVisualEffectObject("SPDIMNDR",Myself) 
														Wait(2)				
														DestroySelf()~ EXIT
														END
				
//----------------------------------------
// NPCs
// ---------------------------------------				
// Minsc
APPEND ~MINSCJ~
IF ~~ THEN BEGIN minsc_egg
   SAY ~Ooh! Ihr stellt aber schwierige Fragen, <CHARNAME>!~
   IF ~~ THEN EXTERN ~AC#MALD1~ egg
END
END
