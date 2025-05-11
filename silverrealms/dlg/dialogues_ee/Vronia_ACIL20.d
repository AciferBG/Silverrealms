

/*******************************************************************************************************
Dialogue Vronia cre#2 in ACIL20
*******************************************************************************************************/

BEGIN ~AC#VRON8~

CHAIN IF ~True()~ THEN AC#VRON8 hello_01
~<CHARNAME>! Gut, dass Ihr gekommen seid. Hier sind sie. Die verschollene Patrouille. Aber seht Euch das an – nicht erschlagen, wie man erwarten würde. Ihre Augen weit aufgerissen. Blut aus Nase und Ohren. Sie sind von innen gebrochen.~ 
END
IF~~THEN REPLY ~Was wollt Ihr damit sagen?~ EXTERN AC#VRON8 patrol_01

	CHAIN IF ~~ THEN AC#VRON8 patrol_01
	~Das war kein fairer Kampf. Etwas muss unsere Kämpfer ausgeschaltet haben, bevor es überhaupt zum Kampf gekommen ist.~
	END
	IF~~THEN EXTERN AC#VRON8 illithids_01
	
	CHAIN IF ~~ THEN AC#VRON8 illithids_01
	~Und dann die Illithiden. Vier tot. Geköpft. Nicht verbrannt, nicht zerfetzt – sauber am Nacken durchtrennt. Ich kenne keinen Zwerg einer einfachen Patrouille, der so etwas fertigbringt. UNd sich dann die Zeit nimmt, die Schädel hier aufzuspießen.~
	END
	IF~~THEN EXTERN AC#VRON8 runes_01
	
	CHAIN IF ~~ THEN AC#VRON8 runes_01
	~Kommen wir zur Rune. Das ist kein Zwergenwerk. Nicht einmal etwas aus den Tiefen des Unterreichs. Seht, wie es schimmert – fremd, als würde es nicht in unsere Welt gehören. Ich habe so etwas nur in alten Schriften gesehen. Es wirkt... extraplanar.~
	END
	IF~~THEN EXTERN AC#VRON8 runes_02
	
	CHAIN IF ~~ THEN AC#VRON8 runes_02
	~Es steht nicht für einen Ort hier unten - sondern für einen Weg hinaus. Ein Tor? Ein Anker? Wer immer hier war - er kam nicht aus den Tiefen des Unterreichs. Er kam von viel weiter. Und er hatte ein Ziel, das nicht in unseren Hallen endet. Lasst mich die Rune etwas genauer untersuchen...~
	END
	IF~~THEN EXTERN AC#VRON8 runes_acivate_01
	
	CHAIN IF ~~ THEN AC#VRON8 runes_acivate_01
	~Diese Rune... diese Knotenpunkte... das war einst lebendig. Ein Portal, ein Durchgang... aber jetzt erloschen. Ich spüre keine Energie mehr.~
	END
	IF~~THEN EXTERN AC#VRON8 runes_acivate_02
	
	CHAIN IF ~~ THEN AC#VRON8 runes_acivate_02
	~Wenn ich den Musterlauf neu binde... nur ganz vorsichtig... vielleicht gibt uns das ein Echo, einen Nachhall, wohin es einst führte?~
	END
	IF~~THEN EXTERN AC#VRON8 runes_acivate_03
	
	CHAIN IF ~~ THEN AC#VRON8 runes_acivate_03
	~Lasst mich es einmal versuchen. Vielleicht können wir unseren Kopf durch dieses erkaltete Runenportal stecken?~
	END
	IF~~THEN DO ~SetGlobal("GithRuneActivate","ACIL20",1)~ 
	EXIT







