BEGIN ~AC#9BEL2~

IF ~Global("AC#DragonAttacked","GLOBAL",9)~ THEN BEGIN opened_door
SAY ~Das sollte tatsächlich ein alter Durchgang des Zwergenvolkes sein, die diese Brücke vor Äonen erbaut haben.~
IF ~~ THEN DO ~SetGlobal("AC#DragonAttacked","GLOBAL",10)~ EXIT
END

IF ~Global("AC#DragonAttacked","GLOBAL",5)~ THEN BEGIN hasitem
SAY ~Habt Ihr schon die Überreste dieser Kreatur gefunden, die wir vom Himmel geschossen haben?~
++ ~Nein, ich habe noch nichts gefunden.~ + nothing
IF ~OR(2)
PartyHasItem("AC#GITHL")
PartyHasItem("AC#GITHD")~ THEN REPLY ~Ich habe das Wesen gefunden. Es ist an einem Brückenpfeiler aufgeschlagen.~ + found_something
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY ~Halt, Fremdlinge! Keinen Schritt weiter, oder Ihr bekommt unsere Bögen zu spüren! Sagt, ist sie noch da draußen?~
++ ~*Sie*?~ + 2
END

IF ~~ THEN BEGIN nothing
SAY ~Dann sucht weiter!~
IF ~~ THEN DO ~~ EXIT
END

IF ~~ THEN BEGIN found_something
SAY ~Das ist ja interessant! Hatte es irgendetwas bei sich, das auf die Natur des Angreifers schließen lassen konnte?~
IF ~PartyHasItem("AC#GITHL")
PartyHasItem("AC#GITHD")~ THEN REPLY ~Ja, eine merkwürdige Lederrüstung und einen komisch geformten Dolch.~ + found_both
IF ~PartyHasItem("AC#GITHL")
!PartyHasItem("AC#GITHD")~ THEN REPLY ~Seht Euch diese Lederrüstung an!~ + found_armor
IF ~!PartyHasItem("AC#GITHL")
PartyHasItem("AC#GITHD")~ THEN REPLY ~Seht Euch diesen Dolch an!~ + found_dagger
END

IF ~~ THEN BEGIN found_both
SAY ~Ein Dolch und eine Rüstung! Ich hätte schwören können, dass das Wesen eine zweihändige Klinge geschwungen hat, die ist aber vermutlich im Wasser versunken. Lasst mich einmal die Gegenstände ansehen...~
= 
~Hmm... diese Klinge ist aus keinem mir bekannten Metall geschmiedet, und die Rüstung sieht wie ein Flickenteppich unterschiedlicher Rüstungsteile aus. Damit können wir wahrlich nichts anfangen.~
++ ~Vielleicht könnte ich mich einmal umhören, ob jemand diese Gegenstände einordnen kann.~ + identify_armor
++ ~Nun gut, was sollen wir jetzt machen?~ + break_wall_01
END

IF ~~ THEN BEGIN found_armor
SAY ~Eine Rüstung! Ich hätte schwören können, dass das Wesen eine zweihändige Klinge geschwungen hat, die ist aber vermutlich im Wasser versunken.~
= 
~Hmm... die Rüstung sieht wie ein Flickenteppich unterschieldicher Rüstungsteile aus. Damit können wir wahrlich nichts anfangen.~
++ ~Vielleicht könnte ich mich einmal umhören, ob jemand diese Rüstung einordnen kann.~ + identify_armor
++ ~Nun gut, was sollen wir jetzt machen?~ + break_wall_01
END

IF ~~ THEN BEGIN found_dagger
SAY ~Ein Dolch! Ich hätte schwören können, dass das Wesen eine zweihändige Klinge geschwungen hat, die ist aber vermutlich im Wasser versunken. Lasst mich einmal die Gegenstände ansehen...~
= 
~Hmm... diese Klinge ist aus keinem mir bekannten Metall geschmiedet. Damit können wir wahrlich nichts anfangen.~
++ ~Vielleicht könnte ich mich einmal umhören, ob jemand diesen Dolch einordnen kann.~ + identify_armor
++ ~Nun gut, was sollen wir jetzt machen?~ + break_wall_01
END

IF ~~ THEN BEGIN identify_armor
SAY ~Wenn es Euch interessiert, gerne, auch wenn meiner Gruppe nichts mehr nützen wird.~
IF ~~ THEN GOTO break_wall_01
END

IF ~~ THEN BEGIN break_wall_01
SAY ~Naja, wenigstens haben wir jetzt die Gewissheit, dass wir der Kreatur wirklich den Garaus gemacht haben.~
=
~Seht her, wir haben in der Zwischenzeit für Euch einen Durchgang gefunden.~
IF ~~ THEN DO ~SetGlobal("AC#DragonAttacked","GLOBAL",8)~ EXIT
END

IF ~~ THEN BEGIN 2
SAY ~Ja, das Drachenweibchen!~
++ ~Warum seid Ihr Euch sicher, dass es ein Weibchen war?~ + 4
END

IF ~~ THEN BEGIN 4
SAY ~Weil sie mit uns gesprochen, uns verhöhnt hat, als wir sie angeriffen. Ist sie noch da draußen?~
++ ~Nein, sie ist nicht mehr dort. Zumindest habe ich keine Anzeichen von ihr mehr gesehen.~ + 5
END

IF ~~ THEN BEGIN 5
SAY ~Gut. Es hat sie wohl entmutigt, dass wir den Drachenreiter abgeschossen haben.~
++ ~Jemand ist auf diesem Drachen geritten?~ + 6
END

IF ~~ THEN BEGIN 6
SAY ~Ja, und das ziemlich gut, würde ich sagen. Es muss ein gut tranierter Krieger und ein perfekt abgerichteter Drache gewesen sein. Hat ihm aber nicht viel genützt, dem Reiter, denn mit einem Schuss von Ilinorins Bogen ist er wie ein toter Greif vom Himmel gefallen.~
=
~Wir haben so ein Wesen wie das, das auf dem Drachen gesessen ist, noch nie zuvor gesehen, zumindest dort, wo wir herkommen nicht.~
++ ~Woher kommt Ihr eigentlich?~ + 7
END

IF ~~ THEN BEGIN 7
SAY ~Wir kommen aus Evereska. Unser Weg führt uns zu unseren Vettern in den Mirwald, die dort einige Probleme mit Drow haben, die aus dem Unterreich nach oben drängen. Und was führt Euch in diese Gegend?~
++ ~Ich denke, der Drache ist hinter mir her. Zumindest musste ich vor Kurzem gegen einen Drachen mit Reiter nicht weit von hier entfernt kämpfen, am Stein der Clantrennung.~ + 8
END

IF ~~ THEN BEGIN 8
SAY ~Ihr wart am `Monument Keltormirs und wurdet dort von einem Drachen angegriffen? Was habt Ihr an diesem für uns heiligen Ort eigentlich zu schaffen?~
++ ~Ich suchte nach einer Möglichkeit, zu einem Drachentempel zu reisen, der sich hier ganz in der Nähe befinden muss. Irgendeine Verbindung zu Eurem Volk soll er wohl auch haben.~ + 9
END

IF ~~ THEN BEGIN 9
SAY ~Unter uns Elfen erzählt man sich viele Geschichten über diese Gegend. Früher war hier alles von großen Wäldern bedeckt, bis die Drachen begannen, diese niederzubrennen. Der Tempel, den Ihr sucht, könnte der Ort sein, an dem Tethir, größter Held unserer Rasse, das erste Mal einen Drachen erlegte.~
++ ~Ich galube, ich habe den Ort schon auf meiner Kart markiert.~ + 10
END

IF ~~ THEN BEGIN 10
SAY ~Ja, die Beschreibung passt. Ihr müsstet dort noch ein Standbild Tethirs finden. Nicht weit entfernt davon sollen immer noch die beiden Drachenskelette liegen, die der Krieger erschlagen hat.~
++ ~Findet Ihr es nicht auch einen seltsamen Zufall, dass gerade, als ich auf dem Weg zu diesem Ort bin, Euch hier begegne?~ + 11
END

IF ~~ THEN BEGIN 11
SAY ~Wir haben bei uns Elfen ein altes Sprichwort: "Die großen Begebenheiten der Welt werden nicht gemacht, sondern sie finden sich." Vielleicht ist dies auch hier der Fall, und wir wissen nicht, was die Götter weiter mit uns vorhaben.~
=
~Ich habe noch eine Bitte an Euch. Der Kampf gegen diesen Drachen da draußen ist nicht unser Kampf. Gut möglich, dass die Kreatur nach Euch suchte. Meine Männer sind durch den Kampf schwer gezeichnet. Wir sollten aber beide mehr über diesen Zwischenfall erfahren. Geht hinaus und sucht nach dem Wesen, das wir da aus dem Sattel geschossen haben, damit wir etwas mehr über unsere Angreifer erfahren können. Wir konnten es durch den ganzen Rauch zwar nicht richtig sehen, aber es müsste irgendwo über der Brücke heruntergekommen sein. Viel wird von ihm zwar nicht mehr übrig sein, aber vielleicht finden wir Hinweise, wo es herkam.~
++ ~Gut, ich willige ein.~ + 12
END

IF ~~ THEN BEGIN 12
SAY ~So ist es abgemacht. Meine Krieger und ich werden solange diese alte Höhle untersuchen. Vielleicht gibt es einen Ausgang, damit wir alle unsere Reise fortsetzen können. Wie Ihr sicher schon bemerkt habt, ist der weitere Weg auf der Straße draußen durch Baumstämme und Felsbrocken versperrt. Da wollte Euch jemand wohl einen schönen Hinterhalt legen, würde ich sagen. Los, Brüder, an die Arbeit, sucht das Gestein nach Rissen ab, vielleicht gibt es hier irgendwo einen weiteren Ausgang!~
IF ~~ THEN DO ~SetGlobal("AC#DragonAttacked","GLOBAL",4)~ EXIT
END


