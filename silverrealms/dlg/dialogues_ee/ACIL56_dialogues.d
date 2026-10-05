// ---------------------------------------------
// Priester des Gaerdal Schnotlell Samrynarr
// ---------------------------------------------

BEGIN ~AC#SVI01~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_firsttime
  SAY ~Seid gegrüßt, <RACE>. Ich bin Schnotlell Samrynarr, ein treuer Diener Gaerdal Eisenhands. Ich kann Euch die Hilfe des Schilds des goldenen Hügels anbieten, wenn Ihr sie benötigt.~
  IF ~~ THEN REPLY #32297 /* ~Das tue ich.~ */ DO ~StartStore("AC#SVI01",LastTalkedToBy())~ EXIT
  IF ~~ THEN REPLY ~Ist die Statue hinter Euch nicht etwas zu groß geraten für solch eine kleine Rasse wie die Eure?~ GOTO small
  IF ~~ THEN REPLY ~Ich würde Euch gerne einige Fragen stellen.~ GOTO question
  IF ~~ THEN REPLY #32298 /* ~Zur Zeit nicht.~ */ GOTO 1
  IF ~Global("AC#KuoToaStone","GLOBAL",1)~ THEN REPLY ~Bresk Steinschulter meinte, Ihr könntet mir bei der Befreiung von der Kuo-Toa-Plage in den östlichen Tunneln helfen.~ GOTO kuo_toa_problem_01
END

IF ~True()~ THEN BEGIN hello_again
  SAY ~Seid gegrüßt, <RACE>. Benötigt Ihr wieder die Hilfe des Schilds des goldenen Hügels?~
  IF ~~ THEN REPLY #32297 /* ~Das tue ich.~ */ DO ~StartStore("AC#SVI01",LastTalkedToBy())~ EXIT
  IF ~~ THEN REPLY ~Ich würde Euch gerne einige Fragen stellen.~ GOTO question
  IF ~~ THEN REPLY #32298 /* ~Zur Zeit nicht.~ */ GOTO 1
  IF ~Global("AC#KuoToaStone","GLOBAL",1)
  Global("AC#StoneMelter","ACIL56",0)~ THEN REPLY ~Bresk Steinschulter meinte, Ihr könntet mir bei der Befreiung von der Kuo-Toa-Plage in den östlichen Tunneln helfen.~ GOTO kuo_toa_problem_01
END

IF ~~ THEN BEGIN 1 // from: 0.1
  SAY ~Der Ernste möge Euch bei jedem Eurer Schritte im Unterreich beschützen. Und denkt daran: Die beste Verteidigung ist schnurgerade Wachsamkeit.~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN question
  SAY ~Nun gut. Was liegt Euch auf dem Herzen?~
  IF ~~ THEN REPLY ~Ich benötige die Hilfe Eures Tempels und würde gerne Eure Dienste in Anspruch nehmen.~ GOTO shop
  IF ~~ THEN REPLY ~Erzählt mir über Gaeral Eisenhand.~ GOTO gaerdal_1
  IF ~~ THEN REPLY ~Vielleicht ein andermal. Lebt wohl.~ GOTO 1
   IF ~Global("AC#KuoToaStone","GLOBAL",1)
   Global("AC#StoneMelter","ACIL56",0)~ THEN REPLY ~Bresk Steinschulter meinte, Ihr könntet mir bei der Befreiung von der Kuo-Toa-Plage in den östlichen Tunneln helfen.~ GOTO kuo_toa_problem_01
END


IF ~~ THEN BEGIN kuo_toa_problem_01
  SAY ~Oh! Haben sie endlich beschlossen, sich der Sache anzunehmen? Gut. Wenn die Kuo-Toa tatsächlich ein verborgenes Lager besitzen, erreichen sie es sicher durch überflutete Gänge. Und der alte Steinkreis könnte erklären, wie sie die anwesenden Wasserelementare kontrollieren. Hmm...~
  IF ~~ THEN GOTO rock_to_mud_01
END

IF ~~ THEN BEGIN rock_to_mud_01
  SAY ~Ha! Tauchen müsst Ihr nicht. Denn jeder Fels lässt sich verformen! Und ich besitze einen Stab, mit dem Ihr eine Felswand zu Schlamm verwandeln könnt. Sucht in den Kuo-Toa-Tunneln nach Stellen, aus denen ihr strenger Geruch dringt. Dahinter dürfte ihr Versteck liegen. Lasst den Stab den Fels auflösen und den Weg in ihr stinkendes Lager preisgeben.~
  IF ~~ THEN REPLY ~Ich werde es gerne versuchen.~ DO ~GiveItemCreate("AC#WAND7",LastTalkedToBy(),1,0,0)~ GOTO gogondy
  IF ~~ THEN REPLY ~Na schön. Gebt mir das Ding. Was kann schon schiefgehen?~ DO ~GiveItemCreate("AC#WAND7",LastTalkedToBy(),1,0,0)~ GOTO gogondy
  IF ~~ THEN REPLY ~Wenn schon Drecksarbeit, dann wenigstens mit Magie.~ DO ~GiveItemCreate("AC#WAND7",LastTalkedToBy(),1,0,0)~ GOTO gogondy
  IF ~~ THEN REPLY ~Klingt brauchbar. Her mit dem Stab.~ DO ~GiveItemCreate("AC#WAND7",LastTalkedToBy(),1,0,0)~ GOTO gogondy
END

IF ~~ THEN BEGIN gogondy
  SAY ~Wartet. Wenn Ihr in ihr Heiligtum eingedrungen seid, könnt Ihr Euch noch eine ihrer Schwächen zunutze machen. Kuo-Toa schrammen ständig am Rande des Wahnsinns entlang.~
  IF ~~ THEN REPLY ~Was habt Ihr vor?~ GOTO gogondy_02
  IF ~~ THEN REPLY ~Das bedeutet?~ GOTO gogondy_02
END

IF ~~ THEN BEGIN gogondy_02
  SAY ~Wir helfen ihnen dabei ein bisschen nach. Mit Gogondy. Dem Wein der Svirfnebli. Bei uns sorgt er für Visionen, bei anderen Völkern für Halluzinationen. Wenn Ihr ihn an ihrem Ort der Anbetung verdampfen lasst, könnte das unter den Kuo-Toa ziemliches Chaos auslösen.~
  IF ~~ THEN REPLY ~Es ist einen Versuch wert. Gebt mir den Wein.~ GOTO gogondy_yes
  IF ~~ THEN REPLY ~Nein. Den Stab nehme ich, aber auf den Wein verzichte ich.~ GOTO gogondy_no
END
											
												
														IF ~~ THEN BEGIN gogondy_yes
														SAY ~Hier ist eine Flasche. Ihr solltet schauen, dass Ihr den Wein möglichst nahe an ihrem Heiligtum zum Verdunsten bringt. Und trinkt ihn nicht vorher aus! Das würde Euch nicht gut bekommen.~
														IF ~~ THEN DO ~GiveItemCreate("AC#GOGON",LastTalkedToBy(),1,0,0)
														AddJournalEntry(@56200,QUEST)~ GOTO summary_01
														END
														
														IF ~~ THEN BEGIN gogondy_no
														SAY ~Wir Ihr meint.~
														IF ~~ THEN GOTO summary_01
														END
													
													IF ~~ THEN BEGIN summary_01
													SAY ~Benutzt den Stab, um Zugang zu dem Kuo-Toa Tempel zu erlangen. Der Wächter des goldenen Hügels möge Euch dabei beistehen!~
													IF ~~ THEN REPLY ~Habt Dank. Ich werde mein Bestes geben.~ DO ~AddJournalEntry(@56101,QUEST)
													SetGlobal("AC#StoneMelter","ACIL56",20)~ GOTO exit
													END
													
													IF ~~ THEN BEGIN exit
													SAY ~Gehabt Euch wohl, <RACE>.~
													IF ~~ THEN EXIT
													END

IF ~~ THEN BEGIN shop
  SAY ~Gaerdal ist stets wachsam und ehrt diejenigen, die es ebenso sind. Seht her, welche Dienste ich Euch als Ernstschild anbieten kann.~
  IF ~~ THEN DO ~StartStore("AC#SVI01",LastTalkedToBy())~ EXIT
END

IF ~~ THEN BEGIN gaerdal_1
  SAY ~Gaeral Eisenhand ist der entschlossene Verteidiger des vergessenes Volkes. Er beschützt uns vor den Gefahren, die aus allen Richtungen - von Oben und Unten - unsere Rasse bedrohen.~
  IF ~~ THEN REPLY ~Interessant. Ich habe noch eine weitere Frage.~ GOTO question
END

IF ~~ THEN BEGIN small
  SAY ~Ich verstehe nicht. Was wollt Ihr damit sagen?~
  IF ~~ THEN REPLY ~Ich möchte damit sagen, dass Ihr mit solch großen Bauwerken irgendetwas kompensieren müsst.~ GOTO compensate
  IF ~~ THEN REPLY ~Ach, vergesst es. Ich werde Euch jetzt verlassen.~ GOTO 1
  IF ~~ THEN REPLY ~Nichts Wichtiges. Dürfte ich Euch stattdessen ein paar Fragen stellen?~ GOTO question
END

IF ~~ THEN BEGIN compensate
  SAY ~Mit dieser Statue drücken wir unsere große Bewunderung für unseren Gott aus. Wenn Euch der Anblick nicht gefällt, steht es frei, zu gehen, <RACE>.~
  IF ~~ THEN REPLY ~Nun gut. Dürfte ich Euch einige Fragen stellen?~ GOTO question
  IF ~~ THEN REPLY ~Ach, vergesst es. Ich werde Euch jetzt verlassen.~ GOTO 1
END

// ---------------------------------------------
// Barakor, Diener des Gorm
// ---------------------------------------------

BEGIN ~AC#DWGO1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_firsttime
  SAY ~(Dieser Zwerg sieht mit eiserner Miene geradeaus und würdigt Euch keines Blickes.)~
  IF ~~ THEN REPLY ~Hallo?~ GOTO no_reaction_1
  IF ~~ THEN REPLY ~Ich verstehe schon. Ihr wollt nicht mit mir reden. Ich gehe jetzt und lasse Euch allein...~ DO ~NoAction()~ EXIT
END

IF ~True()~ THEN BEGIN hello_again
  SAY ~(Der Zwerg sieht immer noch wie durch Euch hindurch und zeigt keine Gefühlsregung.)~
  IF ~~ THEN REPLY ~Habt wohl Eure Sprache immer noch nicht wiedergefunden, was? Dann lasse ich Euch bei Eurer scheinbar wichtigen Aufgabe wieder in Ruhe.~ DO ~NoAction()~ EXIT
END

IF ~~ THEN BEGIN no_reaction_1
  SAY ~(Falls Euch der Zwerg gehört hat, lässt er sich das nicht anmerken.)~
  IF ~~ THEN REPLY ~Könnt Ihr mich hören?~ GOTO no_reaction_2
  IF ~~ THEN REPLY ~(Fuchtelt mit Euren Händen vor seinem Gesicht herum)~ GOTO hands_1
END

IF ~~ THEN BEGIN hands_1
  SAY ~(Der Zwerg blinzelt noch nicht einmal mit den Augen, als Ihr Eure Hand vor sein Gesicht bewegt.)~
  IF ~~ THEN REPLY ~Könnt Ihr mich hören?~ GOTO no_reaction_2
  IF ~~ THEN REPLY ~Ich verstehe schon. Ihr wollt nicht mit mir reden. Ich gehe jetzt und lasse Euch allein...~ DO ~NoAction()~ EXIT
END

IF ~~ THEN BEGIN no_reaction_2
  SAY ~(Der Zwerg zeigt keine Gefühlsregung und starrt weiter an Euch vorbei.)~
  IF ~~ THEN REPLY ~Darf ich Euch eine Frage stellen?~ GOTO no_reaction_3
  IF ~~ THEN REPLY ~Ich verstehe schon. Ihr wollt nicht mit mir reden. Ich gehe jetzt und lasse Euch allein...~ DO ~NoAction()~ EXIT
END

IF ~~ THEN BEGIN no_reaction_3
  SAY ~(Der Zwerg reagiert nicht. Nur seine Pupillen scheinen sich etwas zu verengen, aber vielleicht bildet Ihr Euch das auch ein.)~
  IF ~~ THEN REPLY ~Ich gebe mich geschlagen. Ihr wollt oder könnt nicht mit mir reden. Gehabt Euch Wohl bei Eurer seltsamen Aufgabe.~ EXIT
END

// ---------------------------------------------
// Otidak Ruhmesstein, Priester des Gorm
// ---------------------------------------------

BEGIN ~AC#DWGO2~

IF ~True()~ THEN BEGIN hello_again
  SAY ~Der goldene Wächter wacht über jeden Eurer Schritte und beschützt Euch auf Euren Reisen, im Schlafe und natürlich auch im Kampfe. Benötigt Ihr seine Dienste?~
  IF ~~ THEN REPLY #32297 /* ~Das tue ich.~ */ DO ~StartStore("AC#DWGO2",LastTalkedToBy())~ EXIT
  IF ~~ THEN REPLY ~Ich würde Euch gerne einige Fragen stellen.~ GOTO question
  IF ~~ THEN REPLY #32298 /* ~Zur Zeit nicht.~ */ GOTO 1
END

IF ~~ THEN BEGIN 1 // from: 0.1
  SAY ~Möge das Feuerauge jederzeit seinen wohlwollenden Blick auf Euch ruhen lassen.~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN question
  SAY ~Sicher. Wie kann ich Euch in meiner Rolle als Herr Beschützer dienen?~
  IF ~~ THEN REPLY ~Ich benötige die Hilfe Eures Tempels und würde gerne Eure Dienste in Anspruch nehmen.~ GOTO shop
  IF ~~ THEN REPLY ~Erzählt mir über Gorm.~ GOTO gorm_1
  IF ~~ THEN REPLY ~Vielleicht ein andermal. Lebt wohl.~ GOTO 1
END

IF ~~ THEN BEGIN shop
  SAY ~Gorm verteidigt und beschützt die Bedürftigen unserer Gesellschaft mit großer Güte und eisernem Willen. Er wird auch Euch eine Hilfe in der Not sein.~
  IF ~~ THEN DO ~StartStore("AC#DWGO2",LastTalkedToBy())~ EXIT
END

IF ~~ THEN BEGIN gorm_1
  SAY ~Gorm Gulthyn, der Herr der Bronzemaske, ist der Wächter und Beschützer unserer Rasse und der Schutzpatron all jener, die in irgendeinem Teil der Reiche auf Wache stehen. Diejenigen, die Schutz benötigen, senden ein Gebet an den Ewig Wachsamen und wenden sich an dessen Anhänger, um sicher durch alle Gefahren zu kommen. Wir Priester des Gorm werden Barakor genannt, was in die Sprache der Oberfläche übersetzt soviel wie "Schildmänner" heißt. Wir sind überall dort zu finden, wo unsere Zwergenbrüder besondere Bewachung benötigen. Deshalb steht dieser Tempel auch in der Nähe des Drakkalor-Tores, das in den gefährlichsten Teil nach Norden ins Unterreich führt.~
  IF ~~ THEN REPLY ~Interessant. Ich habe noch eine weitere Frage.~ GOTO question
  IF ~~ THEN REPLY ~Was ist im nördlichen Teil des Unterreiches denn so gefährlich?~ GOTO drakkalor
END

IF ~~ THEN BEGIN drakkalor
  SAY ~Einst erstreckte sich das große Zwergenreich Shanatar bis weit nach Norden. Eine unserer großen Festungen war Drakkalor. Das Tor aus Iltkazar nach Norden ist danach benannt, da es auf direktem Weg in diese prächtige Zwergenstadt führte. Doch nun ist von den mächtigen Hallen unserer Vorfahren nichts als Schutt und Trümmer übrig. Gefährliche Kreaturen streifen nun durch diese Ruinen - Riesen, Trolle und unsere verhassten Vettern, die Duergar. Man erzählt sich, dass es im Norden auch eine Stadt der Illithiden geben soll, weshalb wir auch häufig gegen die Gedankenschinder und deren Vasallen kämpfen müssen. Einer der unseren, Cernd Schüttergeist, konnte sich vor Jahren aus der Stadt der Illithiden befreien und hat sich bis nach Iltkazar zurück durchgeschlagen.~
  IF ~~ THEN REPLY ~Interessant. wo finde ich diesen Cernd Schüttergeist jetzt?~ GOTO cernd_01
END

IF ~~ THEN BEGIN cernd_01
  SAY ~Er steht unter Beobachtung in der Halle der Runensteine, unter dem Schutz von Bettargh Abgrundlied, dem obersten Priester des Dugmaren. Aber die Zeit bei den Schindern hat ihn schwer gezeichnet, ich weiß nicht, ob aus ihm etwas herauszubekommen ist.~
  IF ~~ THEN REPLY ~Interessant. Ich habe noch eine weitere Frage.~ GOTO question
  IF ~~ THEN REPLY ~Ich werde bei Gelegenheit nach ihm suchen. Ihr erwähntet vorhin die Stadttore. Wieviele führen aus Iltkazar heraus?~ GOTO citygates
  IF ~~ THEN REPLY ~Vielleicht ein andermal. Lebt wohl.~ GOTO 1
END

IF ~~ THEN BEGIN citygates
  SAY ~Unsere Stadt verfügt über drei mächtige Tore - nach Norden das Drakkalor-Tor, welches in das ehemalige Königreich Drakkalor führt. Nach Osten das Ultoksamrin-Tor, das in die ehemals mächtigste Zwergenstadt Shanatars, nach Ultoksamrin, führt. Das dritte Tor, das Barakuir-Tor, wurde vor vielen Jahren komplett mit Fels versiegelt und ist nicht mehr sichtbar.~
  IF ~~ THEN REPLY ~Warum wurde das Barakuir-Tor versiegelt?~ GOTO barakuir
  IF ~~ THEN REPLY ~Interessant. Ich habe noch eine weitere Frage.~ GOTO question
  IF ~~ THEN REPLY ~Vielleicht ein andermal. Lebt wohl.~ GOTO 1
END

IF ~~ THEN BEGIN barakuir
  SAY ~Das Barakuir-Tor führte in die gleichnamige Stadt nach Osten. Doch unsere dortigen Brüder verrieten uns. In dieser einst prächtigen Stadt herrschte ein rachsüchtiger, bösartiger Zwergenclan mit Namen Duergar, der mit zu Shanatars Untergang führte.~
  IF ~~ THEN REPLY ~Die Duergar lebten einst als Zwergenclan friedlich in Eurer Nachbarschaft? Warum haben sie sich so verändert?~ GOTO duergar
  IF ~~ THEN REPLY ~Interessant. Ich habe noch eine weitere Frage.~ GOTO question
  IF ~~ THEN REPLY ~Vielleicht ein andermal. Lebt wohl.~ GOTO 1
END

IF ~~ THEN BEGIN duergar
  SAY ~Hört zu, ich möchte nicht mehr über diese bösen Kreaturen reden, mit denen wir außer unserer Geschichte nichts mehr gemeinsam haben. Wenn Ihr Euch für die Geschichte Shanatars im Allgemeinen und der Duergar im Besonderen interessiert, solltet Ihr Shagretor Torgarsaxt einen Besuch abstatten. Er sammelt allerlei Gegenstände aus unserer Vergangenheit. Ihr findet ihn in seinem Laden "Das Vermächtnis" in der Speichenbrunnenzitadelle von Haelas Hallen im Osten der Stadt. Er wird Euch mehr über die Geschichte unseres Volkes erzählen können, als ich imstande bin.~
  IF ~~ THEN REPLY ~Danke für den Hinweis. Ich werde Shagretor demnächst einen Besuch abstatten. Ich habe noch eine weitere Frage an Euch.~ GOTO question
  IF ~~ THEN REPLY ~Vielleicht ein andermal. Lebt wohl.~ GOTO 1
END

// ---------------------------------------------
// Kampfmeister
// ---------------------------------------------

BEGIN ~AC#56DW6~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_firsttime
  SAY ~He, wenn Ihr keine Kämpfer der Bronzemaske seid, habt Ihr in diesem Teil der Zitadelle nichts zu suchen!~
  IF ~~ THEN REPLY ~Was für ein Kampfplatz ist das hier?~ GOTO kamfplatz
  IF ~~ THEN REPLY ~Schon gut. Ich gehe wieder.~ EXIT
END

IF ~True()~ THEN BEGIN hello_again
  SAY ~Sagt mal, macht es Euresgleichen so Spaß, anderen Leuten dabei zuzusehen, wie sie sich gegenseitig die Zähne rausschlagen? Was wollt Ihr?~
  IF ~~ THEN REPLY ~Ich würde Euch gerne einige Fragen stellen.~ GOTO frage
  IF ~~ THEN REPLY ~Schon gut. Ich gehe wieder.~ EXIT
END

IF ~~ THEN BEGIN kamfplatz
  SAY ~Wie Ihr vielleicht schon bemerkt habt, hauen sich meine Rekruten hier mit ihren bloßen Händen den Schädel ein. Wir üben den waffenlosen Kampf.~
  IF ~~ THEN REPLY ~Den waffenlosen Kampf? Wofür benötigt Ihr das?~ GOTO kamfplatz_2
  IF ~~ THEN REPLY ~Eine interessante Beschäftigung. Ich werde mich wieder auf den Weg machen.~ EXIT
END

IF ~~ THEN BEGIN kamfplatz_2
  SAY ~Gorm lehrt uns, jeden Moment wachsam zu sein und in jedem Augenblick mit einem Kampf rechnen zu müssen. Wir lernen hier, uns auch ohne Rüstung oder Waffen einem Gegner gegenüberstellen zu können. Außerdem könnte es sein, dass wir einen Feind nicht gleich töten, sondern nur kampfunfähig schlagen müssen - etwa, um ihn später noch zu verhören. Auch dies üben wir hier.~
  IF ~~ THEN REPLY ~Eine interessante Beschäftigung. Ich werde mich wieder auf den Weg machen.~ EXIT
END

IF ~~ THEN BEGIN frage
  SAY ~Ich bin nicht zum Rede schwingen, sondern zum Fäuste schwingen hier, <RACE>!~
  IF ~~ THEN REPLY ~Schon gut. Ich gehe wieder.~ EXIT
END

// ---------------------------------------------
// Petben Riesenkrüppler, Geschützmeister
// ---------------------------------------------

BEGIN ~AC#56DW7~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_firsttime
  SAY ~Geschützmeister Petben Riesenkrüppler, zu Euren Diensten!~
  IF ~~ THEN REPLY ~Was sind denn das für seltsame Belagerungswaffen hinter Euch?~ GOTO komische_waffen
  IF ~~ THEN REPLY ~Schon gut. Ich gehe wieder.~ EXIT
END

IF ~GlobalGT("AC#IL_FalseBeard","GLOBAL",0)
GlobalLT("AC#IL_FalseBeard","GLOBAL",10)~ THEN BEGIN hello_have_beard
  SAY ~Oh, Hallo <PRO_RACE> von der Oberfläche! Habt Ihr mir schon meinen Bart mitgebracht, <GIRLBOY>?~
  IF ~PartyHasItem("AC#ILDWB")~ THEN REPLY ~Ja, hier ist er.~ DO ~TakePartyItem("AC#ILDWB") DestroyItem("AC#ILDWB")~ GOTO retrieved_beard
  IF ~~ THEN REPLY ~Nein, noch nicht.~ GOTO bye_wait_beard
END

	IF ~~ THEN BEGIN retrieved_beard
	SAY ~Was für eine Freude! Seht nur, wie schön er geformt ist! Vielen Dank, <PRO_RACE>!~
	IF ~~ THEN REPLY ~Dann hätte ich gerne dafür jetzt das Drow-Kettenhemd.~ GOTO give_chainmail01
	END

IF ~True()~ THEN BEGIN hello_again
  SAY ~Oh, Ihr seid es wieder, der <RACE> von der Oberfläche! Immer noch Interesse an unseren Geschützen, <GIRLBOY>?~
  IF ~~ THEN REPLY ~Ich würde Euch gerne einige Fragen stellen.~ GOTO frage
  IF ~~ THEN REPLY ~Schon gut. Ich gehe wieder.~ EXIT
END

IF ~~ THEN BEGIN komische_waffen
  SAY ~Das sind keine "Belagerungswaffen", <RACE>. Das sind Geschütze, die wir in den Tunneln des Unterreiches gegen unsere Feinde schleudern werden!~
  IF ~~ THEN REPLY ~Interessant! Erzählt mir mehr darüber.~ GOTO komische_waffen_2
  IF ~~ THEN REPLY ~Eine interessante Beschäftigung. Ich werde mich wieder auf den Weg machen.~ EXIT
END

IF ~~ THEN BEGIN komische_waffen_2
  SAY ~Nun, das eine ist eine Tanthanus, eine Pfeilschleuder. "Tanthanus" ist das zwergische Wort für Pfeile, wisst Ihr? Im Gegensatz zu den mickrigen Pfeilen, die die schmächtigen Elfen an der Oberfläche abfeuern, könnt Ihr mit einem unserer Pfeile gleich einen ausgewachsenen Erdkoloss an die Höhlendecke nageln! Wir können die Pfeile auch mit allerlei Pasten beschicken, damit die Gegner vergiftet oder verätzt werden oder gleich in lodernden Flammen aufgehen.~
  = 
  ~Und das andere Gerät ist ein "Kurnfar", ein Feindzerstörer, wie er in unserer Sprache genannt wird. Die Kugel ist mit einem Mechanismus versehen, die sie fest auf dem fahrbaren Gestell verankert, bis das ganze Ding in Position gebracht ist. Sobald sich ein Gegner nähert, können wir die Arretierung lösen und die Kugel über unsere Feinde rollen lassen. Insbesondere in engen, abschüssigen und gewundenen Tunneln eine hervorragende Waffe, und zwar besonders gegen die verdammten Dunkelelfen geeignet, die sich soviel auf ihre Magieresistenz einbilden.~
  =
  ~Ich war mal bei einem Kampf mit den Dunkelelfen dabei, wo eine dieser Kugeln eine Priesterin der Lolth unter sich begraben hat. Ihr feines verzaubertes Kettenhemd war das einzige, das das Ganze unbeschadet überstanden hat, während von der schönen *olven* nur ein Haufen Matsch übrig geblieben ist. Das war ein Anblick, könnt Ihr mir Glauben!~
  IF ~~ THEN REPLY ~Nun, vielen Dank für diesen... äh... ausführlichen Bericht. Ich gehe dann wieder.~ GOTO bye
  IF ~Global("AC#IL_FalseBeard","GLOBAL",0)~ THEN REPLY ~Was habt Ihr mit dem Kettenhemd gemacht?~ GOTO chainmail01
END

IF ~~ THEN BEGIN bye
  SAY ~Macht das. Und denkt immer daran: Wenn Ihr in einem unserer Tunnel einmal eine dieser Kugeln auf Euch zurollen hört - weglaufen bringt nichts, unsere "Kurnfar" sind schneller! Harharhar!~
  IF ~~ THEN REPLY ~Vielen Dank für die Warnung. Ich werde daran denken.~ EXIT
END

IF ~~ THEN BEGIN frage
  SAY ~Na klar, wie kann Euch der alte Petben helfen?~
  IF ~~ THEN REPLY ~Was sind denn das für seltsame Belagerungswaffen hinter Euch?~ GOTO komische_waffen
  IF ~~ THEN REPLY ~Schon gut. Ich gehe wieder.~ EXIT
END

IF ~~ THEN BEGIN chainmail01
  SAY ~Ich hab's aufgehoben, als Andenken. Anziehen kann ich es nicht, ein Wunder, dass da überhaupt ein Wesen reinpasst, so eng, wie es ist! Warum fragt Ihr?~
  IF ~OR(3)
Race(LastTalkedToBy,DWARF)
Race(LastTalkedToBy,GNOME)
Race(LastTalkedToBy,HALFLING)
~ THEN REPLY ~Wenn Ihr es nicht benötigt, hätte ich vielleicht Verwendung dafür.~ GOTO no_chainmail
  IF ~OR(4)
Race(LastTalkedToBy,ELF)
Race(LastTalkedToBy,HALFORC)
Race(LastTalkedToBy,HUMAN)
Race(LastTalkedToBy,HALF_ELF)
~ THEN REPLY ~Wenn Ihr es nicht benötigt, hätte ich vielleicht Verwendung dafür.~ GOTO chainmail02
  IF ~~ THEN REPLY ~Ach, nichts Wichtiges. Lebt wohl.~ EXIT
END

IF ~~ THEN BEGIN no_chainmail
  SAY ~Ha! Das möchte ich sehen! Ein <RACE> wie Ihr zwängt sich in ein Kettenhemd einer Drow! Vergesst es <GIRLBOY>, in das Ding passt Ihr nicht hinein.~
  IF ~~ THEN REPLY ~Könnte man es nicht umarbeiten lassen?~ GOTO no_chainmail02
END

IF ~~ THEN BEGIN no_chainmail02
  SAY ~Glaubt Ihr, auf diese Idee wäre ich nicht auch schon gekommen? Ihr seid von der schlauen Sorte <RACE>, was? Selbst die Schmiede des Moradin haben bei dem Ding abgewunken. vergesst es, es taugt für einen Zwerg wie mich oder einen <RACE> wie Euch nur als Andenken an einen guten *arglary*.~
  IF ~~ THEN REPLY ~Es war ja auch nur so eine Idee. Gehabt Euch wohl.~ EXIT
END

IF ~~ THEN BEGIN chainmail02
  SAY ~Stimmt, Euch könnte es passen...~
  =
  ~He, aber denkt ja nicht, dass ich es Euch einfach umsonst gebe, ja? Viele meiner Kameraden sind an dem Tag gefallen, und diesen Preis kann man zwar nicht in Gold aufwiegen, aber Ihr werdet es Euch schon etwas kosten lassen müssen, wenn Ihr es denn haben möchtet.~
  IF ~~ THEN REPLY ~Was wollt Ihr denn dafür haben, Zwerg?~ GOTO chainmail03
END

IF ~~ THEN BEGIN chainmail03
  SAY ~Hmm... habe nie mit dem Gedanken gespielt, es zu verkaufen, weil ich dachte, dass es von meinen Clanbrüdern eh' niemand haben möchte... lasst mich mal überlegen...~
  IF ~~ THEN GOTO chain_change_chainmail_beard
END

IF ~~ THEN BEGIN give_chainmail01
  SAY ~Abgemacht! Wartet, ich muss es nur eben hervorholen, Moment...~
  = 
  ~So, da ist es. Geht sorgsam damit um, ja? Haltet es in Ehren - möge Gorm Euch in jeder Schlacht wachsam beiseite stehen.~
  IF ~~ THEN DO ~SetGlobal("AC#IL_FalseBeard","GLOBAL",10)
  GiveItemCreate("AC#DWCH1",LastTalkedToBy,0,0,0)
  AddJournalEntry(@66052,QUEST_DONE)~ EXIT
END

	CHAIN AC#56DW7 chain_change_chainmail_beard
	~Gut. Ich gebe es Euch. Wenn Ihr mir dafür meinen neuen Bart abholt!~
	END
	IF ~~ THEN REPLY ~Euren Bart?~ EXTERN AC#56DW7 chain_change_chainmail_beard_02
	
		CHAIN AC#56DW7 chain_change_chainmail_beard_02
		~Meinen Bart! Von Iltkazars Bartmacher.~
		END
		IF ~~ THEN REPLY ~Ihr tragt einen falschen Bart?~ EXTERN AC#56DW7 wrong_beard
		IF ~~ THEN REPLY ~Wo finde ich den Bartmacher?~ EXTERN AC#56DW7 find_beardmaker
		IF ~GlobalGT("AC#IL_MetBeardmaker","GLOBAL",0)~ THEN REPLY ~Ich glaube, ich habe den Bartmacher schon besucht.~ EXTERN AC#56DW7 find_beardmaker
		
		CHAIN AC#56DW7 wrong_beard
		~Psst! Nicht so laut! Das muss nicht jeder mitbekommen. Aber ja, so ist es. Nach einer Verletzung im Kampfe will mein eigener Bart nicht mehr so richtig wachsen. Ein Glück, dass wir in Iltkazar einen Bartmacher haben!~
		END
		IF ~~ THEN EXTERN AC#56DW7 find_beardmaker
		
		CHAIN AC#56DW7 find_beardmaker
		~Er hat sein Geschäft am Platz von Bhaerynden, neben dem Schrein Clangeddins.~
		END
		IF ~~ THEN REPLY ~In Ordnung, ich werde Euren Bart dort für Euch abholen.~ EXTERN AC#56DW7 bring_beard_yes
		IF ~~ THEN REPLY ~Nein, das möchte ich nicht machen. Sucht jemand anderen, der Euch Euren Bart bringt.~ EXTERN AC#56DW7 bring_beard_no
		
		CHAIN AC#56DW7 bring_beard_no
		~Wir Euch beliebt. Dann gibt's eben kein Drow-Kettenhemd.~
		EXIT
		
		CHAIN AC#56DW7 bring_beard_yes
		~Fabelhaft! Bezahlt habe ich den Bart schon im Voraus. Ihr müsst ihn mir nur noch bringen, und schon gehört das Drow-Kettenhemd Euch.~
		 END
		 IF ~~ THEN DO ~SetGlobal("AC#IL_FalseBeard","GLOBAL",1)
		 AddJournalEntry(@66050,QUEST)~ EXIT
		
		CHAIN AC#56DW7 bye_wait_beard
		~Denkt daran: Das Drow-Kettenhemd gibt es nur, wenn Ihr mir meinen Bart besorgt!~
		EXIT
		
// Faustkämpfer

BEGIN ~AC#56DW1~

IF ~RandomNum(5,1)~ THEN BEGIN 0
  SAY ~Mit Waffen kann jeder kämpfen. Zeigt mir, was ihr mit bloßen Fäusten könnt!~
  IF ~~ THEN EXIT
END

IF ~RandomNum(5,2)~ THEN BEGIN 1
  SAY ~Kinn runter, Deckung hoch. Sonst liegt Ihr schneller auf dem Boden, als Euch lieb ist.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(5,3)~ THEN BEGIN 2
  SAY ~Ein sauberer Treffer zählt mehr als zehn wilde Schläge.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(5,4)~ THEN BEGIN 3
  SAY ~Wenn Ihr zuschauen wollt, bleibt aus dem Ring. Wenn nicht, zieht die Handschuhe aus.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(5,5)~ THEN BEGIN 4
  SAY ~Meine Nase war früher gerader. Ich vermisse sie nicht.~
  IF ~~ THEN EXIT
END


BEGIN ~AC#56DW2~

IF ~RandomNum(5,1)~ THEN BEGIN 0
  SAY ~Ha! Endlich jemand, der nicht schon beim ersten Schlag jammert.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(5,2)~ THEN BEGIN 1
  SAY ~Ich kämpfe nicht, um schön auszusehen. Das wäre ohnehin längst zu spät.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(5,3)~ THEN BEGIN 2
  SAY ~Wer zuerst blinzelt, verliert. Wer zuerst umfällt, meistens auch.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(5,4)~ THEN BEGIN 3
  SAY ~Ein Bier darauf, dass der Große dort drüben als Nächstes zu Boden geht.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(5,5)~ THEN BEGIN 4
  SAY ~Haela liebt einen guten Kampf. Ich versuche, sie nicht zu enttäuschen.~
  IF ~~ THEN EXIT
END


BEGIN ~AC#56DW4~

IF ~RandomNum(5,1)~ THEN BEGIN 0
  SAY ~Nicht auf die Nase! Die ist gerade erst wieder zusammengewachsen.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(5,2)~ THEN BEGIN 1
  SAY ~Faustkampf ist ganz einfach: Schlagen, ausweichen und möglichst länger stehen bleiben als der andere.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(5,3)~ THEN BEGIN 2
  SAY ~Der letzte Kerl behauptete, er hätte einen harten Schädel. Jetzt wissen wir es besser.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(5,4)~ THEN BEGIN 3
  SAY ~Wenn ihr wetten wollt, setzt auf mich. Wenn ihr kämpfen wollt, besser nicht.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(5,5)~ THEN BEGIN 4
  SAY ~Zähne sind überbewertet. Man kann Bier auch ohne trinken.~
  IF ~~ THEN EXIT
END


BEGIN ~AC#56DW5~

IF ~RandomNum(5,1)~ THEN BEGIN 0
  SAY ~Ein Kampf ohne Stahl zeigt, wer wirklich etwas taugt.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(5,2)~ THEN BEGIN 1
  SAY ~Keine Klingen, keine Magie, keine Ausreden. So gefällt mir das.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(5,3)~ THEN BEGIN 2
  SAY ~Ihr seht kräftig aus. Das bedeutet leider noch lange nicht, dass ihr schlagen könnt.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(5,4)~ THEN BEGIN 3
  SAY ~Man lernt mehr aus einem guten Treffer ins Gesicht als aus zehn Stunden Training.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(5,5)~ THEN BEGIN 4
  SAY ~Haela schenkt uns Mut. Für die gebrochenen Rippen sind wir selbst verantwortlich.~
  IF ~~ THEN EXIT
END	

BEGIN ~AC#56DW3~

IF ~RandomNum(5,1)~ THEN BEGIN 0
  SAY ~Kraft allein gewinnt keinen Kampf! Wer nicht auf seine Füße achtet, liegt schneller am Boden, als ihm lieb ist.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(5,2)~ THEN BEGIN 1
  SAY ~Schlagt nicht härter. Schlagt im richtigen Augenblick. Das ist der Unterschied zwischen einem Raufbold und einem Kämpfer.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(5,3)~ THEN BEGIN 2
  SAY ~Ich habe schon viele starke Zwerge gesehen. Die klugen waren mir immer lieber.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(5,4)~ THEN BEGIN 3
  SAY ~Wer hier trainiert, lernt zuerst, Treffer einzustecken. Austeilen kommt danach.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(5,5)~ THEN BEGIN 4
  SAY ~Clangeddin verlangt Mut. Ich verlange außerdem Deckung, Haltung und ein wenig Verstand!~
  IF ~~ THEN EXIT
END				
		
		
		



