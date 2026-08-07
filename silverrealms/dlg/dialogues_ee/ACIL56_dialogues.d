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
	SAY ~Oh! Haben sie endlich beschlossen, sich dieser Sache anzunehmen? Das ist gut.~
	IF ~~ THEN REPLY ~Sie vermuten, dass die Kuo-Toa irgendwo ein Schlupfloch haben, das sich auf normalem Wege nicht erreichen lässt und dort einen Gegenstand versteckt halten, der die Wasserelementare kontrollieren kann.~ GOTO kuo_toa_problem_02
	END
	
		IF ~~ THEN BEGIN kuo_toa_problem_02
		SAY ~Das könnte in der Tat so sein. Da die Kuo-Toa immer wieder auftauchen, scheinen sie sich in den überfluteten Gängen ungehindert fortbewegen können. Der Steinkreis, an dem die Elementarwesen erscheinen, ist sogar älter als diese Stadt hier. Wenn die Kuo-Toa einen Weg gefunden haben, diese Steinrunen zu kontrollieren, wird es schwierig, gegen sie anzukommen.~
		IF ~~ THEN REPLY ~Und was könntet Ihr dagegen tun?~ GOTO kuo_toa_problem_03
		END
		
			IF ~~ THEN BEGIN kuo_toa_problem_03
			SAY ~Wir Svirfnebli? Gar nichts. Kuo-Toa sind für uns lästige Gegner. Normalerweise verlässt sich unsere Rasse auf Heimlichkeit und Tarnung, um unbemerkt zuschlagen zu können. All das hilft bei diesen Fischwesen nicht, da sie sich davon nicht täuschen lassen. Wenn sich einer von uns vor ihnen versteckt, bemerken sie das relativ schnell. Ich werde keinen meiner Krieger in solch einen aussichtslosen Kampf schicken.~
			IF ~~ THEN GOTO rock_to_mud_01
			END
			
				IF ~~ THEN BEGIN rock_to_mud_01
				SAY ~Aber es gibt eine andere Möglichkeit, wie wir diesen Kreaturen Herr werden könnten. Tauchen können wir nicht, aber wir können den Fels passierbar machen und so vielleicht bis in ihren Unterschlupf vordringen.~
				IF ~~ THEN REPLY ~Wie wollt Ihr das bewerkstelligen?~ GOTO rock_to_mud_02
				END
				
					IF ~~ THEN BEGIN rock_to_mud_02
					SAY ~Meine Rasse besitzt die Gabe, Fels zu verformen. Da Ihr auf Euch alleine gestellt seid, wird Euch das nichts nützen. Glücklicherweise besitze ich einen Stab, der diese Fähigkeit innehat. Wenn Ihr ihn in den Kuo-Toa-Tunneln an der richtigen Stelle einsetzt, könnte dies eine dünne Felswand zum Schmelzen bringen und so ihr Lager freilegen. Hier ist der Stab. Geht sorgsam mit ihm um.~
					IF ~~ THEN REPLY ~Ihr wollt, dass ich mit Eurem Stab Fels zum Schmelzen bringe?~ DO ~GiveItemCreate("AC#WAND7",LastTalkedToBy(),1,0,0)~ GOTO rock_to_mud_03
					END
					
						IF ~~ THEN BEGIN rock_to_mud_03
						SAY ~Genauer gesagt - zu Schlamm verwandelt! Das wird die Kreaturen mächtig verrückt machen. Um zu wissen, wo Ihr ihn einsetzen könnt, solltet Ihr dem strengen Geruch folgen, der häufig aus den Ritzen ihres Versteckes nach draußen dringt.~
						IF ~~ THEN GOTO gogondy
						END
						
							IF ~~ THEN BEGIN gogondy
							SAY ~Wartet - "verrückt" und "Geruch" sind gute Stichworte. Ich habe noch eine weitere Idee.~
							IF ~~ THEN GOTO gogondy_02
							END
							
								IF ~~ THEN BEGIN gogondy_02
								SAY ~Aus unseren zahlreichen Kämpfen mit den Kuo-Toa wissen wir, dass ihr größter Schwachpunkt ihre geistige Gesundheit ist. Sie schrammen immer knapp am Rande des Wahnsinns entlang.~
								IF ~~ THEN GOTO gogondy_03
								END
								
									IF ~~ THEN BEGIN gogondy_03
									SAY ~Halten sich so viele Kuo-toa an einem Ort auf, dann meistens deshalb, weil sie eine ihrer finsteren Gottheiten an dieser Stelle verehren. Ihr Gott gibt ihnen Zusammenhalt. Nimmt man ihnen die Zuversicht in ihren Glauben, fällt ihre ganze Disziplin in sich zusammen und sie zerfleischen sich meistens gegenseitig.~
									IF ~~ THEN REPLY ~Soll ich mit dem Stab auch das Götzenbild zum Schmelzen bringen?~ GOTO gogondy_05
									END
										
											IF ~~ THEN BEGIN gogondy_05
											SAY ~Ha, das wäre auch ein guter Gedanke. Ich fürchte nur, dass dies zunächst ihren ganzen Zorn entfesseln könnte. Nein, mein Gedanke war, am Ort der Anbetung einen derart betörenden Duft freizusetzen, dass sie den Verstand verlieren.~
											IF ~~ THEN REPLY ~Ich soll die Fischwesen mit Parfum einnebeln? Das könnt Ihr nicht ernst meinen.~ GOTO gogondy_06
											END
											
												IF ~~ THEN BEGIN gogondy_06
												SAY ~Der Gogondy, den ich im Sinne habe, ist kein Parfum, sondern ein Wein. Wir Svirfnebli stellen ihn her. Er besitzt berauschende Wirkung und kann uns einen Blick in die Zukunft schenken. Bei anderen Rassen führt dieses Getränk aber zu Halluzinationen. Dies könnten wir uns bei den Kuo-Toa zunutze machen, wenn Ihr nicht jeden Einzelnen von diesen Biestern niedermachen wollt.~
												IF ~~ THEN REPLY ~Es wäre ein Versuch wert. Gebt mir den Wein.~ GOTO gogondy_yes
												IF ~~ THEN REPLY ~Das ist mir zuviel Hokuspokus. Ich werde mit den Wesen auch ohne den Wein fertig!~ GOTO gogondy_no
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
													SAY ~Benutzt den Stab, um Zugang zu ihrem Tempel zu erlangen. Der Wächter des goldenen Hügels möge Euch beistehen.~
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
		~Mein Bart! Von Iltkazars Bartmacher.~
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
		~Wir Euch beliebt. Dann gibt's eben kein DRow-Kettenhemd.~
		EXIT
		
		CHAIN AC#56DW7 bring_beard_yes
		~Fabelhaft! Bezahlt habe ich den Bart schon im Voraus. Ihr müsst ihn mir nur noch bringen, und schon gehört das Drow-Kettenhemd Euch.~
		 END
		 IF ~~ THEN DO ~SetGlobal("AC#IL_FalseBeard","GLOBAL",1)
		 AddJournalEntry(@66050,QUEST)~ EXIT
		
		CHAIN AC#56DW7 bye_wait_beard
		~Denkt daran: Das Drow-Kettenhemd gibt es nur, wenn Ihr mir meinen Bart besorgt!~
		EXIT
		
		
		
		
		



