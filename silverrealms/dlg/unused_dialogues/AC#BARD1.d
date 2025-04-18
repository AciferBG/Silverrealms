BEGIN ~AC#BARD1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY ~Verdammte Banausen! Kein Verständnis für Kunst! Und was wollt Ihr von mir?~
++ ~Zufälligerweise suche ich nach einem Barden, der an einer Ballade arbeitet, und ich denke, auf Euch könnte die Beschreibung ganz gut passen.~ + 2
END

IF ~OR(2)
Global("AC#HeardLancaStory","GLOBAL",1)
Global("AC#HeardLancaBallad","GLOBAL",1)~ THEN BEGIN hello_again_02
SAY ~Schön, Euch wieder zu sehen! Wollt Ihr, dass ich Euch nochmal mit meiner Kunst unterhalte?~
++ ~Ich würde gerne die Geschichte hören.~ + story_again
++ ~Singt mir Eure Ballade.~ + ballad_again
END

IF ~True()~ THEN BEGIN hello_again
SAY ~Da seid Ihr ja wieder! Seid Ihr jetzt bereit für eine kleine Ballade?~
++ ~Ich interessiere mich weniger für das Lied, sondern vielmehr für die Geschichte, die dort dahintersteckt.~ + story_only
++ ~Das bin ich.~ + ballad_again
END

IF ~~ THEN BEGIN story_again
SAY ~Ihr wollt nur die Geschichte hören, die mich zu diesem Lied inspiriert hat? Nun, das ist zwar etwas enttäuschend, aber auch in Ordnung.~
IF ~~ THEN DO ~~ GOTO story_start_02
END

IF ~~ THEN BEGIN ballad_again
SAY ~Schön! Lauscht dem Klang meiner Stimme, Freunde!~
IF ~~ THEN DO ~~ GOTO ballad
END

IF ~~ THEN BEGIN 2
SAY ~Ihr habt von mir gehört? Was erzählen die Leute über mich?~
++ ~Ich hörte, Ihr schreibt ein Lied über die Abenteurergruppe aus Amn, die von ihrem letzten Abenteuer nie zurückgekehrt sind?~ + 4
END


IF ~~ THEN BEGIN 4
SAY ~Ihr kennt das Lied also auch schon?~
++ ~Nein, bisher kenne ich das Lied noch nicht, würde es aber gerne einmal hören.~ + 5
++ ~Ich interessiere mich weniger für das Lied, sondern vielmehr für die Geschichte, die dort dahintersteckt.~ + story_only
END

IF ~~ THEN BEGIN 5
SAY ~Ihr wollt, dass ich Euch mein Lied vorspiele? Wirklich?~
++ ~Ja, nun fangt schon an zu singen, bevor ich es mir wieder anders überlege.~ + money
++ ~Ich würde es gerne hören, aber später.~ + later
END

IF ~~ THEN BEGIN later
SAY ~Na gut. Da ich gerade aus einer der letzten Tavernen hier in Athkatla herausgeflogen bin, werde ich einfach hier ein wenig länger warten und mich im Selbstmitleid sonnen.~
IF ~~ THEN DO ~~ EXIT
END

IF ~~ THEN BEGIN story_only
SAY ~Ihr wollt nur die Geschichte hören, nicht mein Lied? Nun, das ist zwar etwas enttäuschend, aber...~
IF ~~ THEN DO ~~ GOTO story_money
END

IF ~~ THEN BEGIN story_money
SAY ~Für das Vortragen einer meiner Balladen verlange ich immer einen kleinen Obulus. Wenn Ihr nur die Geschichte dahinter hören wollt, müsst Ihr mir trotzdem was bezahlen. Ich verlange pro Kopf zehn Goldmünzen!~
IF ~~ THEN REPLY ~Keiner möchte Eure Ballade hören, und mir wollt Ihr auch noch Geld dafür abknöpfen?~ + story_money02
IF ~~ THEN REPLY ~Das ist gut angelegtes Geld, wenn ich dafür Euer Lied nicht anhören muss.~ + story_money03
++ ~Ich würde die Geschichte gerne hören, aber später.~ + later
++ ~Ich möchte die Geschichte doch nicht hören.~ + no_story_end_bye
IF ~~ THEN REPLY ~Soviel Geld habe ich nicht.~ + no_money_no_story
END

IF ~~ THEN BEGIN no_money_no_story
SAY ~Was, Ihr seid ärmer als ich? Ach, auch egal. Gebt mir einfach einfach einen kleinen Obulus, und gut ist's.~
IF ~~ THEN DO ~~ GOTO story_start
END

IF ~~ THEN BEGIN no_story
SAY ~Oh! Na, das ist schnell erzählt. Ich weiß es nicht. Wollt wohl auch ein Abenteuer erleben, von dem Ihr nicht mehr zurückkehrt, was?~
++ ~Wer könnte denn wissen, wo sich dieser Ort befindet?~ + no_story_end
END

IF ~~ THEN BEGIN no_story_end
SAY ~Das kann ich Euch leider auch nicht sagen. Soweit ich weiß, besucht die Witwe einer der verschollenen Abenteurer häufiger das Friedhofsviertel, und irgendwie hängt auch der Tempel Oghmas mit der Geschichte zusammen. mehr weiß ich nicht.~
++ ~Danke für den Hinweis. Ich werde sehen, was ich dort in Erfahrung bringen kann.~ + no_story_end_bye
END

IF ~~ THEN BEGIN no_story_end_bye
SAY ~He, falls Ihr es Euch anders überlegt und doch einmal der Ballade lauschen wollt, wisst Ihr, wo ich zu finden bin.~
IF ~~ THEN DO ~~ EXIT
END

IF ~~ THEN BEGIN story_money02
SAY ~Ich habe auch ein Ehrgefühl! Kein Geld, keine Vorstellung!~
++ ~Ja, nun erzählt mir schon die Geschichte, bevor ich es mir wieder anders überlege!~ + story_start
END

IF ~~ THEN BEGIN story_money03
SAY ~Eure Spitzen Bemerkungen solltet Ihr Euch verkneifen, <RACE>!~
=
~Also gut, her mit dem Geld, dann erzähle ich Euch, was ich weiß.~
IF ~~ THEN DO ~~ GOTO story_start
END

IF ~~ THEN BEGIN story_start
  SAY ~Danke. Im Gegenzug erzähle ich Euch, was mich zu meiner Ballade inspiriert hat. Sie trägt den Namen "Lancameths letzte Expedition"...~
  IF ~	NumInParty(1)~ THEN DO ~SetGlobal("AC#HeardLancaStory","GLOBAL",1)
TakePartyGold(10)~ GOTO ballad
  IF ~	NumInParty(2)~ THEN DO ~SetGlobal("AC#HeardLancaStory","GLOBAL",1)
TakePartyGold(20)~ GOTO ballad
  IF ~	NumInParty(3)~ THEN DO ~SetGlobal("AC#HeardLancaStory","GLOBAL",1)
TakePartyGold(30)~ GOTO ballad
  IF ~	NumInParty(4)~ THEN DO ~SetGlobal("AC#HeardLancaStory","GLOBAL",1)
TakePartyGold(40)~ GOTO ballad
  IF ~	NumInParty(5)~ THEN DO ~SetGlobal("AC#HeardLancaStory","GLOBAL",1)
TakePartyGold(50)~ GOTO ballad
  IF ~	NumInParty(6)~ THEN DO ~SetGlobal("AC#HeardLancaStory","GLOBAL",1)
TakePartyGold(60)~ GOTO story_start_02
END

IF ~~ THEN BEGIN story_start_02
SAY ~Vor vielen Jahren lebte hier in Amn ein Hauptmann der amnischen Armee, der sich auch als Abenteurer einen Namen gemacht hatte. Sein Name war Bryam Lancameth, und er war wegen seines Mutes und seiner ehrhaften Art in der Bevölkerung und gleichwohl bei seinen Soldaten sehr beliebt.~
=
~Als das Ende seiner Dienstzeit näher rückte, beschloss er, noch ein letztes großes Abenteuer zu erleben. Er wollte den Ort, den man in der Bevölkerung den "Klagenden Zwerg" nennt, von den Monstern befreien, die dort zu jener Zeit hausten.~
IF ~~ THEN REPLY ~Der Klagende Zwerg?~ GOTO story_wailing_dwarf
++ ~Fahrt fort.~ + story_continue
END

IF ~~ THEN BEGIN story_wailing_dwarf
SAY ~So nennt man hier in Amn ein berühmtes Bauwerk in den Trollbergen, das von Zwergenhand erbaut wurde. Es ist ein riesiges Monument, das einen Zwerg mit geöffnetem Mund darstellt, der gen Osten schaut. Seinen Namen hat es dem Umstand zu verdanken, dass das ganze Tal, in dem es steht, mit einem ununterbrochenen Heulen des Windes erfüllt ist, das wie das Wehklagen vieler Geister klingt. Viele Leute behaupten, dass genau das auch die Ursache des Heulens ist, während andere meinen, dass die Zwerge nur durch geschickte Baukunst den Wind in dem Tal derart gestalten, dass er wie ein Klagen aus dem offen stehenden Mund der Statue entweicht.~
IF ~~ THEN DO ~~ GOTO story_continue
END

IF ~~ THEN BEGIN story_continue
SAY ~Bryam Lancameth ließ sich von den Geschichten, die sich um das alte Zwergenbauwerk rankten, nicht beunruhigen. Er war wild entschlossen, diesem Ort einen Besuch abzustatten und begann, Nachforschungen über den Zwergenclan, der in der Festung unter dem Monument gelebt haben sollte, anzustellen. Viele hielten seinen Ehrgeiz für Wahnsinn, denn bisher war es noch keiner Gruppe gelungen, lebend wieder aus dem Bauwerk herauszukommen.~
=
~Manche erzählen auch, dass Lancameth einen Auftraggeber hatte, der ihn mit der Aussicht auf unermesslichen Reichtum und weiteren Versprechen dazu brachte, über seine sonstige Zurückhaltung hinwegzusehen. Gerüchte erzählen, dass in der alten Festung uraltes Wissen und mächtige Artefakte der Zwerge verschüttet sein sollen, und wo derlei Dinge verborgen sind, gibt es immer jemanden, der auf diese Sachen ein gieriges Auge geworfen hat.~
IF ~~ THEN REPLY ~Wer könnte sich für die "Dinge", wie Ihr es nennt, interessieren, und um was könnte es sich dabei handeln?~ GOTO story_things
++ ~Fahrt fort.~ + story_continue02
END

IF ~~ THEN BEGIN story_things
SAY ~Das ist eine gute Frage.~
=
~In solchen Zwergenruinen könnte alles Mögliche herumliegen. Edelsteine, mächtige Waffen, ein schlafender Drache? Ich weiß es nicht. Doch die Geschichte dieser Region ist eng mit der Geschichte der Zwerge verknüpft, auch wenn diese Dinge schon längst in Vergessenheit geraten sind.~
++ ~Fahrt fort.~ + story_continue02
END

IF ~~ THEN BEGIN story_continue02
SAY ~Naja, jedenfalls schenkte Lancameth den Warnungen keinen Glauben. Er war überzeugt, dieses letzte große Abenteuer um des Abenteuers Willen bestehen zu müssen. Er scharte einige der besten Abenteurer um sich, die er bekommen konnte. Auch diese ließen sich von der Aussicht auf Schätze und Heldentum auf das Wagnis ein.~
IF ~~ THEN REPLY ~Wer waren die anderen Abenteurer?~ GOTO story_continue03
++ ~Fahrt fort.~ + story_continue03
END

IF ~~ THEN BEGIN story_continue03
SAY ~Neben Lancameth gingen noch vier weitere Helden mit ihm zum "Klagenden Zwerg": Nhair Ebendar, ein Halblingsdieb hier aus Athkatla, Maid Sternendorn, eine elfische Bogenschützin, die Priesterin Iremar, und ein seltsamer Magier, dessen Gesicht man nie sehen konnte, weil er es ständig hinter seinem langen Magierrock verbarg.~
IF ~~ THEN REPLY ~Erzählt mir von dem Halblingsdieb.~ GOTO story_nhair
IF ~~ THEN REPLY ~Erzählt mir von der Elfin.~ GOTO story_starthorn
IF ~~ THEN REPLY ~Erzählt mir von der Priesterin.~ GOTO story_iremar
IF ~~ THEN REPLY ~Erzählt mir von dem Magier.~ GOTO story_dogwizard
IF ~~ THEN REPLY ~Woher wisst Ihr das alles?~ GOTO story_source
IF ~~ THEN REPLY ~Interessant. Fahrt mit der Geschichte fort.~ GOTO story_continue04
END

IF ~~ THEN BEGIN story_nhair
SAY ~Der Halblingsdieb war ein bekanntes Gesicht in Athkatla. Hatte ständig Ärger mit der Stadtwache und den Schattendieben. Erwischen konnte ihn keiner von beiden, weil ihm die hier ansässigen Halblinge immer sicheren Unterschlupf gewährten. Man erzählt sich unter ihnen, dass er kurzzeitig versucht hatte, in Calimhafen Fuß zu fassen, die Stadt aber wieder Hals über Kopf verlassen musste, weil er einem Pascha irgendetwas gestohlen haben sollte. Scheint wohl häufiger vorzukommen, dass sich die Halblinge dort mit den Paschas anlegen, und gut ausgegangen ist's noch nie. Deshalb war er schnell wieder hier zurück und sah das Abenteuer mit Bryam Lancameth als willkommene Gelegenheit, Gras über die Sache wachsen zu lassen.~
IF ~~ THEN GOTO story_whatelse01
END

IF ~~ THEN BEGIN story_starthorn
SAY ~Oh, die Elfin war eine schöne Frau. Hatte aber eine genauso spitze Zunge wie ihre Pfeile, die sie bei sich trug. Wenn Ihr jemand krumm wurde, hat sie ihm schonmal eine Salve hinterhergeschickt.~
IF ~~ THEN GOTO story_whatelse01
END

IF ~~ THEN BEGIN story_iremar
SAY ~Die Priesterin kam hier aus dem Tempel Oghmas im Hafenviertel. Viel mehr war über sie nicht bekannt. Ihr könnt ja dort die Priester einmal fragen, ob sie noch etwas wissen.~
IF ~~ THEN DO ~~ GOTO story_whatelse01
END

IF ~~ THEN BEGIN story_dogwizard
SAY ~Ein komischer Kauz. Klein, verschlagen, geheimnisvoll. Keiner hat ihn je Sterbenswörtchen sagen hören. Man munkelt, dass er unter der Kapuze sein wahres Antlitz verbergen wollte. Ein Tiefling soll er gewesen sein, aber das glaube ich nicht. Für so eine Höllenbrut war er viel zu schmächtig.~
IF ~~ THEN GOTO story_whatelse01
END

IF ~~ THEN BEGIN story_whatelse01
SAY ~Wollt Ihr sonst noch etwas wissen?~
IF ~~ THEN REPLY ~Erzählt mir von dem Halblingsdieb.~ GOTO story_nhair
IF ~~ THEN REPLY ~Erzählt mir von der Elfin.~ GOTO story_starthorn
IF ~~ THEN REPLY ~Erzählt mir von der Priesterin.~ GOTO story_iremar
IF ~~ THEN REPLY ~Erzählt mir von dem Magier.~ GOTO story_dogwizard
IF ~~ THEN REPLY ~Woher wisst Ihr das alles?~ GOTO story_source
IF ~~ THEN REPLY ~Das wäre alles. Fahrt mit der Geschichte fort.~ GOTO story_continue04
END

IF ~~ THEN BEGIN story_source
SAY ~He, das bleibt aber unser kleines Geheimnis, ja? Lancameth hatte mich vor seinem Aufbruch gebeten, über ich sein Abenteuer eine Ballade zu verfassen. Wir kannten uns aus diversen Tavernen.~
IF ~~ THEN GOTO story_whatelse01
END

IF ~~ THEN BEGIN story_continue04
SAY ~Naja, alles Weitere ist schnell erzählt. Die fünf Helden sind eines Tages also zum "Klagenden Zwerg" aufgebrochen und nie mehr zurückgekehrt. Keiner hat jemals mehr etwas von ihnen gehört oder gesehen.~
IF ~~ THEN REPLY ~Woher wisst Ihr das alles?~ GOTO story_source_02
IF ~~ THEN REPLY ~Und Ihr habt die Ballade über sie geschrieben.~ GOTO story_ballad
IF ~~ THEN REPLY ~Danke, dass Ihr mir das alles erzählt habt.~ GOTO story_end_01
END

IF ~~ THEN BEGIN story_ballad
SAY ~So ist es. Ich wusste, dass die Leute tragische Heldengeschichten mögen. Nur irgendwann wurde es eine Art Selbstläufer, und jeder hat seine eigene Version der Geschichte zum Besten gegeben.~
IF ~~ THEN REPLY ~Woher wisst Ihr das alles?~ GOTO story_source_02
IF ~~ THEN REPLY ~Danke, dass Ihr mir das alles erzählt habt.~ GOTO story_end_01
END

IF ~~ THEN BEGIN story_source_02
SAY ~He, das bleibt aber unser kleines Geheimnis, ja? Lancameth hatte mich vor seinem Aufbruch gebeten, über ich sein Abenteuer eine Ballade zu verfassen. Wir kannten uns aus diversen Tavernen.~
IF ~~ THEN REPLY ~Danke, dass Ihr mir das alles erzählt habt.~ GOTO story_end_01
IF ~~ THEN REPLY ~Und Ihr habt die Ballade über ihn geschrieben.~ GOTO story_ballad
END

IF ~~ THEN BEGIN story_end_01
SAY ~Nun kennt Ihr die Geschichte von "Lancameths letzter Expedition".~
++ ~Wer könnte denn wissen, wo sich dieser Ort befindet, zu dem die Expedition aufgebrochen ist?~ + story_location
END

IF ~~ THEN BEGIN story_location
SAY ~Wo sich der Ort befindet, weiß ich nicht. Irgendwo in den Trollbergen, soviel ist sicher. Schon komisch, dass ein so riesiges Bauwerk wie der "Klagende Zwerg" derart schlecht zu erreichen ist, nicht wahr? Ich weiß auch nicht, wo sich der Ort befinden könnte, der offensichtlich Lancameths letzte Ruhestätte geworden ist. Soweit ich weiß, besucht seine Witwe häufiger das Friedhofsviertel, und irgendwie hängt auch der Tempel Oghmas mit der Geschichte zusammen. Vielleicht solltet Ihr dort einmal um Rat fragen.~
IF ~~ THEN REPLY ~Danke für den Hinweis. Ich werde sehen, was ich dort in Erfahrung bringen kann.~ DO ~SetGlobal("AC#IremarPlot","GLOBAL",1)
SetGlobal("AC#_Lancameths_Widow","GLOBAL",1)~ GOTO story_end_02
END

IF ~~ THEN BEGIN story_end_02
SAY ~Nun kennt Ihr die Geschichte von "Lancameths letzter Expedition". Wenn Ihr sie noch einmal hören wollt, wisst Ihr, wo ich zu finden bin!~
IF ~~ THEN DO ~~ EXIT
END

// alter Teil: Geld für Ballade
/*
IF ~~ THEN BEGIN money
SAY ~He, aber meine Darbietung ist nicht umsonst, versteht Ihr? Ich verlange pro Kopf zehn Goldmünzen!~
IF ~!IsValidForPartyDialog("Korgan")~ THEN REPLY ~Keiner möchte Eure Geschichte noch hören, und mir wollt Ihr auch noch Geld dafür abknöpfen?~ + nomoney
IF ~!IsValidForPartyDialog("Korgan")~ THEN REPLY ~Das dürfte kein Problem sein.~ + money02
IF ~!IsValidForPartyDialog("Korgan")~ THEN REPLY ~Soviel Geld habe ich nicht.~ + no_money_no_ballad
IF ~IsValidForPartyDialog("Korgan")~ THEN EXTERN ~KORGANJ~ Korgan_Comment_money
END
*/

IF ~~ THEN BEGIN money
SAY ~Also dann, hört gut zu. Wenn Euch die Darstellung gefällt, würde ich mich übrigens über etwas Applaus freuen.~
IF ~~ THEN + money02
END

IF ~~ THEN BEGIN no_money_no_ballad
SAY ~Was, Ihr seid ärmer als ich? Ach, auch egal. Gebt mir einfach einfach einen kleinen Beitrag, und gut ist's.~
IF ~~ THEN DO ~~ GOTO money02
END

IF ~~ THEN BEGIN nomoney
SAY ~Ich habe auch ein Ehrgefühl! Kein Geld, keine Vorstellung!~
++ ~Ja, nun fangt schon an zu singen, bevor ich es mir wieder anders überlege.~ + money02
IF ~~ THEN REPLY ~Soviel Geld habe ich nicht.~ + no_money_no_ballad
END

	IF ~~ THEN BEGIN money02
	  SAY ~So, und nun steht still vor Ehrfurcht und lauscht meiner Ballade mit dem Namen "Lancameths letzte Expedition", die auf einer wahren Begebenheit beruht...~
	  IF ~~ THEN GOTO ballad
	END

IF ~~ THEN BEGIN ballad
SAY ~"Die Ballade von Lancameths letzter Expedition"~
=
~...von Petipal aus Myratma.~
=
~*Räusper*~
IF ~~ THEN DO ~~ GOTO ballad02
END

IF ~~ THEN BEGIN ballad02
SAY ~Es lebte einst ein Krieger,
der war ein tapf'rer Mann
wollt' gegen Böses kämpfen, 
schloss sich der Wache an.~
=
~Er wollte noch mehr erreichen
auf mehr Ruhme ward' er aus,
in die Trollberge wollt' er reisen
verließ dafür Frau und Haus.~
=
~Eine Festung der alten Zwerge
hatte es ihm angetan
mit ihm zogen weitere Helden
aus Amn und Calimshan.~
=
~Doch das Böse, das war schlauer
durch viel Fallen, Gier und List
und durch alte Zwergenmauern
half ihm kein Alchimist.~
IF ~~ THEN REPLY ~So, das reicht. Könntet Ihr jetzt Bitte zum Ende kommen?~ GOTO ballad_interrupt_01
IF ~~ THEN REPLY ~Wer hat sich denn diese Reime ausgedacht?~ GOTO ballad_interrupt_01
IF ~~ THEN REPLY ~(Weiter zuhören)~ GOTO ballad_03
END

	IF ~~ THEN BEGIN ballad_interrupt_01
	SAY ~He! Unterbrecht mich nicht und hört Euch das Lied bis Ende an!~
	IF ~~ THEN DO ~~ GOTO ballad_03
	END
	
IF ~~ THEN BEGIN ballad_03
SAY ~Die Recken kämpften tapfer
sich hinein unter den Berg
doch sie fanden nicht das Erhoffte
weder Gold, noch Ruhm, noch Zwerg.~
=
~Die Festung blieb sein Grabmal
kam niemals mehr 'draus hervor,
seiner Witwe blieb nur das Trauern
am Standbild von Kelemvor.~
IF ~~ THEN DO ~SetGlobal("AC#HeardLancaBallad","GLOBAL",1)~ GOTO ballad_end
END

	IF ~~ THEN BEGIN ballad_end
	SAY ~Das ist das Ende der Ballade über "Lancameths letzte Expedition".~ 
	IF ~~ THEN REPLY ~Eine traurige Geschichte. Woher wisst Ihr das alles?~ + know_lancameth
	END
	
		IF ~~ THEN BEGIN know_lancameth
		SAY ~Ich kannte Lancameth. Er hatte mich vor seinem Aufbruch gebeten, über sein Abenteuer eine Ballade zu verfassen, wenn er wieder zurückkommt.~
		IF ~~ THEN REPLY ~Wisst Ihr, wohin er gegangen ist?~ GOTO where_did_he_go_to
		END
		
			IF ~~ THEN BEGIN where_did_he_go_to
			SAY ~Wo sich der genaue Ort befindet, weiß ich nicht. Irgendwo in den Trollbergen, soviel ist sicher. Schon komisch, dass ein so riesiges Bauwerk wie der "Klagende Zwerg" derart schlecht zu erreichen ist, nicht wahr? Irgendwie hängt auch der Tempel Oghmas mit der Geschichte zusammen. Vielleicht solltet Ihr dort einmal um Rat fragen.~
			IF ~~ THEN REPLY ~Danke für den Hinweis. Ich werde sehen, was ich dort in Erfahrung bringen kann.Und jetzt muss ich weiter.~ DO ~SetGlobal("AC#IremarPlot","GLOBAL",1)~ GOTO exit_new_01
			IF ~~ THEN REPLY ~Könnt Ihr mir noch einmal die Fakten erzählen, die Euch zu dieser Geschichte inspiriert haben?~ DO ~SetGlobal("AC#IremarPlot","GLOBAL",1)~ + story_start_02
			END
			
				IF ~~ THEN BEGIN exit_new_01
				SAY ~He, Danke, dass Ihr mir zugehört habt! Durch Euch habe ich wieder etwas Selbstbewusstsein beim Vortragen meiner Lieder erlangt. Mal sehen, ob ich einer anderen Taverne mehr Glück habe als in dieser Spelunke gerade eben.~
				IF ~~ THEN DO ~EscapeArea()~ EXIT
				END

// alt hat gut gefallen
/*
IF ~~ THEN BEGIN ballad_end
SAY ~Das ist das Ende der Ballade über "Lancameths letzte Expedition".~ 
IF ~~ THEN + give_no_gold_ballad
END
IF ~~ THEN BEGIN ballad_end
SAY~Wie hat sie Euch gefallen?~
IF ~PartyGoldGT(9)~ THEN REPLY ~Das war eine wirklich tolle Geschichte. Hier habt Ihr zehn Goldmünzen.~ GOTO give_10_gold_ballad
IF ~PartyGoldGT(99)~ THEN REPLY ~Das war eine wirklich tolle Geschichte. Hier habt Ihr hundert Goldmünzen.~ GOTO give_lot_gold_ballad
IF ~~ THEN REPLY ~Tolle Geschichte, aber leider kein Gold wert.~ GOTO give_no_gold_ballad
IF ~~ THEN REPLY ~Die Ballade war gut. leider habe ich kein Gold, das ich Euch geben könnte.~ GOTO have_no_gold_ballad
IF ~~ THEN REPLY ~Das war alles? Ihr müsstet Euren Zuhörern noch Geld bieten, damit sie sich das antan.~ GOTO give_no_gold_ballad
IF ~~ THEN DO ~~ EXIT
END

IF ~~ THEN BEGIN give_10_gold_ballad
SAY ~Ich danke Euch.~
IF ~~ THEN DO ~TakePartyGold(10)~ + give_no_gold_ballad
END

IF ~~ THEN BEGIN give_lot_gold_ballad
SAY ~Oh! So gut hat es Euch gefallen?~
IF ~~ THEN DO ~TakePartyGold(100)~ + give_no_gold_ballad
END

IF ~~ THEN BEGIN have_no_gold_ballad
SAY ~Ihr seid wie alle anderen auch. Hört Euch die Sachen an, aber viel Wert ist es Euch am Ende nicht. Naja, damit muss ich als Künstler wohl leben.~
IF ~~ THEN + give_no_gold_ballad
END

IF ~~ THEN BEGIN give_no_gold_ballad
SAY ~Na Danke.~
IF ~~ THEN DO ~~ EXIT
END
*/

/**************************************************************
NPC-Dialoge
***************************************************************/

APPEND ~KORGANJ~
IF ~~ THEN BEGIN Korgan_Comment_money
   SAY ~Mich braucht Ihr gar nicht erst mitzuzählen, ich hör' eh' nicht zu.~
   IF ~~ THEN EXTERN ~AC#BARD1~ nomoney
END
END



