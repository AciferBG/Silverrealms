// creator  : weidu (version 24000)
// argument : AC#TIGL2.DLG
// game     : .
// source   : ./override/AC#TIGL2.DLG
// dialog   : .\dialog.tlk
// dialogF  : .\dialogF.tlk

BEGIN ~AC#TIGL2~

IF ~Global("AC#_TiglathSpawn","GLOBAL",4)~ THEN BEGIN 0 // from:
  SAY ~Ihr habt mich gefunden. Gut.~ /* ~Ihr habt mich gefunden. Gut.~ #108044 */
  IF ~~ THEN REPLY ~Warum habt Ihr Euch denn ausgerechnet in dem hintersten Winkel dieses Gasthauses versteckt? Noch dazu in dem Bereich des Freudenhauses?~ /* ~Warum habt Ihr Euch denn ausgerechnet in dem hintersten Winkel dieses Gasthauses versteckt? Noch dazu in dem Bereich des Freudenhauses?~ #108045 */ GOTO 1
END

	IF ~~ THEN BEGIN 1 // from: 0.0
	  SAY ~Glaubt mir, ich bin solche Gemächer hier mehr gewöhnt als Ihr denkt, denn einst war ich selbst eine jener Mädchen, die ihren Körper darbieten mussten.~ /* ~Glaubt mir, ich bin solche Gemächer hier mehr gewöhnt als Ihr denkt, denn einst war ich selbst eine jener Mädchen, die ihren Körper darbieten mussten.~ #108046 */
	  IF ~~ THEN REPLY ~Ihr wart eine Kurtisane?~ /* ~Ihr wart eine Kurtisane?~ #108047 */ GOTO 2
	END

		IF ~~ THEN BEGIN 2 // from: 1.0
		  SAY ~Ich war ein Haremsmädchen aus dem Harem Gilgeams. Kennt Ihr diesen Namen?~ /* ~Ich war ein Haremsmädchen aus dem Harem Gilgeams. Kennt Ihr diesen Namen?~ #108048 */
		  IF ~~ THEN REPLY ~Nein, den Namen Gilgeam habe ich noch nie gehört.~ /* ~Nein, den Namen Gilgeam habe ich noch nie gehört.~ #108049 */ GOTO 3
		END

			IF ~~ THEN BEGIN 3 // from: 2.0
			  SAY ~Gilgeam war der Gottkönig meiner Hemat Unther. Schön, stark, und grausam. Als Teil seines Harems wurde ich Zeugin von Grausamkeiten, die sich nur eine Gottheit ausdenken konnte.~ /* ~Gilgeam war der Gottkönig meiner Hemat Unther. Schön, stark, und grausam. Als Teil seines Harems wurde ich Zeugin von Grausamkeiten, die sich nur eine Gottheit ausdenken konnte.~ #108050 */
			  IF ~~ THEN REPLY ~Ihr wart die Konkubine eines Gottes?~ /* ~Ihr wart die Konkubine eines Gottes?~ #108051 */ GOTO 4
			END

				IF ~~ THEN BEGIN 4 // from: 3.0
				  SAY ~Wenn Ihr so wollt, ja. Oh, wie habe ich ihn gehasst. Doch was soll ein junges Mädchen schon gegen einen Gott ausrichten?~ /* ~<Not Available>Wenn Ihr so wollt, ja. Oh, wie habe ich ihn gehasst. Doch was soll ein junges Mädchen schon gegen einen Gott ausrichten?~ #108052 */
				  IF ~~ THEN REPLY ~Warum erzählt Ihr mir das alles?~ /* ~Warum erzählt Ihr mir das alles?~ #71881 */ GOTO 5
				END

					IF ~~ THEN BEGIN 5 // from: 4.0
					  SAY ~Weil ich denke, dass es für Euch wichtig ist. Glaubt mir, ich erzähle meine Geschichte nicht jedem beliebigen Fremden. Aber bei Euch habe ich gute Gründe, Euch von mir zu berichten.~ /* ~Weil ich denke, dass es für Euch wichtig ist. Glaubt mir, ich erzähle meine Geschichte nicht jedem beliebigen Fremden. Aber bei Euch habe ich gute Gründe, Euch von mir zu berichten.~ #108053 */
					  IF ~~ THEN GOTO 6
					END

					IF ~~ THEN BEGIN 6 // from: 5.0
					  SAY ~Als junges Mädchen begann ich das Einzige zu machen, was ich in dieser hoffnungslosen Zeit der Gewalt und Angst machen konnte. Ich begann zu beten. Immer und immer wieder. Ich wusste nicht, zu wem ich beten sollte, denn ich glaubte, die Götter hätten mich und meine Heimat verlassen, deshalb redete und weinte ich mir einfach meine Sorgen von der Seele. Doch eines Tages wurden meine Gebete beantwortet. Ich spürte neue Hoffnung, und auf die Hoffnung folgte Macht. Da vernahm ich zum ersten Mal den Namen meiner neuen Herrin: Tiamat.~ /* ~Als junges Mädchen begann ich das Einzige zu machen, was ich in dieser hoffnungslosen Zeit der Gewalt und Angst machen konnte. Ich begann zu beten. Immer und immer wieder. Ich wusste nicht, zu wem ich beten sollte, denn ich glaubte, die Götter hätten mich und meine Heimat verlassen, deshalb redete und weinte ich mir einfach meine Sorgen von der Seele. Doch eines Tages wurden meine Gebete beantwortet. Ich spürte neue Hoffnung, und auf die Hoffnung folgte Macht. Da vernahm ich zum ersten Mal den Namen meiner neuen Herrin: Tiamat.~ #108054 */
					  IF ~~ THEN REPLY ~Eure Gebete wurden ausgerechnet von der Drachengöttin Tiamat erhört?~ /* ~Eure Gebete wurden ausgerechnet von der Drachengöttin Tiamat erhört?~ #108055 */ GOTO 7
					END

					IF ~~ THEN BEGIN 7 // from: 6.0
					  SAY ~Ja. Könnt Ihr Euch vorstellen, wie dankbar ich war, dass sich ein Wesen meiner annahm? Und wie mir ging es vielen aus dem Harem. Wir beteten zu Tiamat und verbreiteten den Glauben im ganzen Palast. Bald trugen wir die Worte der Hoffnung hinaus in die Stadt und über das Ganze Land. Immer mehr Anhänger folgten unseren Lehren, in der Hoffnung, das Joch Gilgeams endlich ablegen zu können. Und die größte Verehrerin Tiamats blieb ich.~ ~Ja. Könnt Ihr Euch vorstellen, wie dankbar ich war, dass sich ein Wesen meiner annahm? Und wie mir ging es vielen aus dem Harem. Wir beteten zu Tiamat und verbreiteten den Glauben im ganzen Palast. Bald trugen wir die Worte der Hoffnung hinaus in die Stadt und über das Ganze Land. Immer mehr Anhänger folgten unseren Lehren, in der Hoffnung, das Joch Gilgeams endlich ablegen zu können. Und die größte Verehrerin Tiamats war ich.~ /* ~Ja. Könnt Ihr Euch vorstellen, wie dankbar ich war, dass sich ein Wesen meiner annahm? Und wie mir ging es vielen aus dem Harem. Wir beteten zu Tiamat und verbreiteten den Glauben im ganzen Palast. Bald trugen wir die Worte der Hoffnung hinaus in die Stadt und über das Ganze Land. Immer mehr Anhänger folgten unseren Lehren, in der Hoffnung, das Joch Gilgeams endlich ablegen zu können. Und die größte Verehrerin Tiamats blieb ich.~ #108056 */
					  IF ~~ THEN GOTO 8
					END

					IF ~~ THEN BEGIN 8 // from: 7.0
					  SAY ~Eines Tages war der Zeitpunkt des Umsturzes gekommen, und die Anhänger meines Glauben standen den verhassten Dienern Gilgeams in zwei riesigen Heeren gegenüber. Und dann erschienen die beiden Götter selbst. Zuerst Gilgeam - schön, mächtig - und eingebildet, wie er eben war. Doch auch wir hatten all unseren Glauben in unsere Sache gelegt, und so erschien vor unseren Reihen der Avatar meiner Göttin, Tiamats, in all ihrer furchteinflößenden Schönheit. Sagt mir, <CHARNAME>, habt Ihr schon einmal einem Gott gegenübergestanden?~ /* ~Eines Tages war der Zeitpunkt des Umsturzes gekommen, und die Anhänger meines Glauben standen den verhassten Dienern Gilgeams in zwei riesigen Heeren gegenüber. Und dann erschienen die beiden Götter selbst. Zuerst Gilgeam - schön, mächtig - und eingebildet, wie er eben war. Doch auch wir hatten all unseren Glauben in unsere Sache gelegt, und so erschien vor unseren Reihen der Avatar meiner Göttin, Tiamats, in all ihrer furchteinflößenden Schönheit. Sagt mir, <CHARNAME>, habt Ihr schon einmal einem Gott gegenübergestanden?~ #108058 */
					  IF ~~ THEN REPLY ~Nein, eigentlich noch nicht.~ /* ~Nein, eigentlich noch nicht,~ #108059 */ GOTO 9
					END

					IF ~~ THEN BEGIN 9 // from: 8.0
					  SAY ~Dann könnt Ihr Euch wahrscheinlich nicht vorstellen, was für ein Anblick das gewesen ist. Doch es blieb nicht viel Zeit, denn die Schlacht begann, und die beiden Götter gingen aufeinander los. Gilgeam in seinem muskulösen, goldenen Körper, und Tiamat mit ihren fünf Drachenköpfen. Der Himmel verdunkelte sich und die Erde bebete, als die beiden Götter miteinander kämpften, und am Ende hatte meine Göttin den verhassten Gilgeam besiegt. Ich hätte glücklich sein können, denn alles, was ich erreichen wollte, war so eingetreten, wie ich es mir immer erwünscht hatte.~ 
					  IF ~~ THEN GOTO evil_with_evil
					END
					
						IF ~~ THEN BEGIN evil_with_evil 
						  SAY ~Aber in Unther gibt es die Redewendung "Böses kann nur durch noch mehr Böses besiegt werden".~ 
						  IF ~~ THEN REPLY ~Das bedeutet, es wurde Euch bewusst, dass Ihr nur die weibliche Form eines weiteren Tyrannen erschaffen hattet?~ GOTO evil_with_evil_02
						END
						
						IF ~~ THEN BEGIN evil_with_evil_02 
						  SAY ~Ich dachte, Tiamat ging es wirklich darum, ein geknechtetes Volk zu befreien. Stattdessen suchte sie sich die für Götter einfachste Möglichkeit heraus, an Macht zu gelangen: Menschen mit Hoffnung für Ihre Zwecke auszunutzen. Ihre Tempel wurden zu Horten des Schreckens, die Drachen, die einst mit uns kämpften, begannen nun, uns zu tyrannisieren, und einige ihrer treuesten Anhänger versuchten, Portale in ihr Reich in den Neun Höllen zu öffnen, um noch mehr Schrecken über das Land zu bringen.~ 
						  IF ~~ THEN REPLY ~Das bedeutet, Ihr hattet nur eine weibliche Form eines Tyrannen erschaffen?~ GOTO evil_with_evil_03
						END
						
							IF ~~ THEN BEGIN evil_with_evil_03 
							  SAY ~Ja. Und ich war als ihre Hohepriesterin an all den Grausamkeiten gegen unser eigenes Volk beteiligt.~ 
							IF ~~ THEN REPLY ~Was ist dann geschehen?~ GOTO what_happened_next
							END
							
								IF ~~ THEN BEGIN what_happened_next 
								  SAY ~Eines Tages wurde Tiamat dorthin geschickt, wo sie herkam - zurück in die Neun Höllen. Selbst da hielt ich ihr noch die Treue, da ich glaubte, sie sei eine Gefangene inmitten von lauter Teufeln. Dabei war sie selbst der größte Teufel von allen.~ 
								IF ~~ THEN REPLY ~Wie meint Ihr das?~ GOTO why_devil
								END
								
									IF ~~ THEN BEGIN why_devil 
									  SAY ~Ich erfuhr, dass sie auch an anderen Orten Faeruns die Unruhen, die dort herrschten, für ihre Zwecke ausnutzen wollte. Ihr ging es nie um Unther oder mein Volk! Ihr geht es nur um Macht.~ 
									IF ~~ THEN REPLY ~Und was hat das mit mir zu tun?~ GOTO why_me
									END
									
										IF ~~ THEN BEGIN why_me 
										  SAY ~Jedesmal, wenn Tiamat versuchte, einen Fuß in diese Welt zu setzen, wurde sie wieder in die Verbannung zurückgestoßen. Dennoch ist es ihr eiserner Wille, Menschen mit Versprechen auf ein besseres Leben für ihre Zwecke auszunutzen.~
										=
										~Ich weiß nicht, warum und wann ihr Blick auf diesen Teil der Schwertküste fiel. Aber seht Euch doch einmal um. Der Osten von Amn wird von einer riesigen Horde Monster bedroht. In Tethyr tobte seit Jahren ein erbitterter Bürgerkrieg. Das Chaos und der Unfrieden, der hier herrscht, erinnert mich zu sehr an meine eigene Heimat, als dass dies ein Zufall sein könnte.~  
										IF ~~ THEN REPLY ~Euer... Vertrauter erwähnte, dass Ihr etwas über Mith Barak wissen würdet.~ GOTO why_mith_barak
										END
										
										IF ~~ THEN BEGIN why_mith_barak 
										  SAY ~Nein, da muss ich Euch enttäuschen. Doch ich weiß, dass Tiamat mit ihren Anhängern um jeden Preis die alten Zwergenruinen unter diesen Landen in ihre Kontrolle bringen möchte. Was dieser Zwergenkönig Mith Barak damit zu tun hat, weiß ich nicht. Doch ich habe seinen Namen schon gehört, seit ich aus Unther nach Westen aufgebrochen bin.~  
										IF ~~ THEN REPLY ~Warum erzählt Ihr mir das alles?~ GOTO why_do_you_tell_me
										END
										
										IF ~~ THEN BEGIN why_do_you_tell_me 
										  SAY ~Nachdem Tiamat wieder aus Faerun verbannt wurde, spürte ich eine große Schuld. Und eine große Leere. Gleichzeitig merkte ich, dass viele ihrer fanatischen Anhänger dennoch mit ihren Grausamkeiten fortfahren wollten und begannen, andere Regionen mit Chaos und Schrecken zu überziehen.~
										=
										~Gleichzeitig spüre ich noch immer das vertraute Gefühl, diese Hoffnung, die mir Tiamat in der Zeit meiner Sklaverei schenkte. Vieleicht gibt es verschiedene Aspekte der gleichen Göttin? Vielleicht wurde sie nur durch die Neuen Höllen korrumpiert? Ich weiß es nicht. Letztendlich bin ich hier und erzähle Euch meine Geschichte, um meinen Glauben wiederzufinden.~										
										IF ~~ THEN REPLY ~Und was soll ich mit dieser Information anfangen?~ GOTO why_do_you_tell_me_02
										END
										
										IF ~~ THEN BEGIN why_do_you_tell_me_02 
										  SAY ~Wenn Ihr bereits wisst, dass Tiamat und ihre Anhänger bei Eurer Suche einen großen Anteil haben werden, gibt es wirklich nicht viel neue Erkenntnisse für Euch zu gewinnen. Ihr solltet Euch nur vergegenwärtigen, dass es bei all den Dingen nicht um einen Zwergenkönig geht, sondern das Schicksal dieser Länder, dieser Leute - vielleicht auch Euer eigenes - ebenfalls in der Waagschale liegt. Ihr seid früh dran, <CHARNAME>. Verspielt Euren Vorsprung nicht.~						
										  IF ~~ THEN + talk_about_tiamat
										END
										
										IF ~~ THEN BEGIN talk_about_tiamat 
										  SAY ~Wenn Ihr also wissen wollt, wie Ihr mit dieser neuen Bedrohung umgehen sollt, kann ich Euch meine Hilfe anbieten, da ich selbst einmal Teil dieser Gruppierung war, die Euch mittlerweile nach dem Leben trachtet.~							IF ~~ THEN EXIT
										END
					
					
