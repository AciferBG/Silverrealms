// Books History Shanatars

// Book #1
// a small review of the founding stories of shanatar
// the 8 subkingdoms and its names
BEGIN ~AC#23BO1~

IF ~Global("AC#23Book01","ACIL23",1)~ THEN BEGIN 0 
  SAY ~Vor Euch liegt ein altes, staubiges Buch, welches zur Hälfte aufgeschlagen ist. Auf dem Deckel ist das Symbol eines Hammers und eines Amboss eingraviert. Wenn Ihr möchtet, könnt Ihr in dem uralten Einband blättern.~
  IF ~~ THEN REPLY ~Das Buch aufschlagen.~ + page_1
  IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ + book_exit
END

	IF ~~ THEN BEGIN page_1 
	SAY ~Das Buch scheint in unzähligen unterschiedlichen Sprachen und Schriften verfasst worden zu sein. Ihr blättert durch die verschiedenen Schriften, bis Ihr einen Teil, der in der Gemeinsprache und Thorass geschrieben ist, findet, und beginnt zu lesen.
	"Das große Königreich der Zwerge wurde zu einer Zeit, als noch Drachen und Riesen über die oberen Welten herrschten, von Taark Shanat und seinen acht Söhnen gegründet. Taark Shanat erschlug vier blaue Drachen in einer unterirdischen Höhle, die er fortan Prachtaxthalle nannte und zum Herrschaftssitz seines Königreiches Alatorin machte. Ein jeder seiner Söhne zog aus und gründete später sein eigenes Königreich. So entstanden die acht Unterreiche  - Barakuir, Drakkalor, Iltkazar, Korolnor, Sondarr, Torglor, Ultoksamrin, und Xothaerin, die sich alle unter dem Banner Shanatars in Alatorin, dem Reich Taark Shanats, vereinten."~
	IF ~~ THEN REPLY ~Eine Seite weiterblättern.~ + page_2
	IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ + book_exit
	END
	
		IF ~~ THEN BEGIN page_2 
		SAY ~"Die Unterkönigreiche besiedelten das gesamte südliche Unterreich. Ein jedes erhielt einen Namenszusatz, damit sich die Reiche besser voneinander unterscheiden konnten. Iltkazar nannte sich Mithrilkönigreich. Seine Nachbarstädte waren Torlgor, das Silberkönigreich; Korolnor, das Juwelenkönigreich; Barakuir, das Eisenkönigreich und Drakkalor, die Stadt des Geizes."~
		IF ~~ THEN REPLY ~Eine Seite zurückblättern.~ + page_1
		IF ~~ THEN REPLY ~Eine Seite weiterblättern.~ + page_3
		IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ + book_exit
		END

			IF ~~ THEN BEGIN page_3 
			SAY ~"Die Königreiche lebten friedlich unter der Herrschaft der Clans zusammen, vereint unter dem Banner Moradins ihres Gründers Taark Shanat."~
			IF ~~ THEN REPLY ~Eine Seite zurückblättern.~ + page_2
			IF ~~ THEN REPLY ~Eine Seite weiterblättern.~ + page_4
			IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ + book_exit
			END
			
				IF ~~ THEN BEGIN page_4 
				SAY ~Dies ist die letzte Seite des Buches, welche in Gemeinsprache gehalten ist.
				"Es waren die goldenen Tage Shanatars. Der Wohlstand wuchs, und die Kinder Shanatars dehnten ihr Herrschaftsgebiet immer weiter aus. Sogar in den Reichen unter der Sonne wurden mächtige Festungen errichtet, die die zahlreichen Eingänge in die Welt der Zwerge sichern sollten."~
				IF ~~ THEN REPLY ~Eine Seite zurückblättern.~ + page_3
				IF ~~ THEN REPLY ~Das Buch schließen.~ + book_exit
				END

	IF ~~ THEN BEGIN book_exit 
	  SAY ~Ihr wendet Euch wieder von Buch ab.~
	  IF ~~ THEN EXIT
	END

// Book #2
// a small review of the founding stories of shanatar
// the patron gods of the subkingdoms


BEGIN ~AC#23BO2~

IF ~Global("AC#23Book02","ACIL23",1)~ THEN BEGIN 0 
  SAY ~Vor Euch liegt ein altes, staubiges Buch, welches zur Hälfte aufgeschlagen ist. Auf dem Deckel ist das Symbol von Zwillingsäxten eingraviert. Wenn Ihr möchtet, könnt Ihr in dem uralten Einband blättern.~
  IF ~~ THEN REPLY ~Das Buch aufschlagen.~ + page_1
  IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ + book_exit
END

	IF ~~ THEN BEGIN page_1 
	SAY ~Ihr blättert durch die verschiedenen Schriften, bis Ihr einen Teil, der in der Gemeinsprache und Thorass geschrieben ist, findet, und beginnt zu lesen.~
	=
	~"Ein jedes der Königreiche wählte einen Schutzpatron aus dem Zwergenpantheon. Moradin war Alatorin vorbehalten. Die anderen acht Unterkönigreiche wählten eine passende Gottheit der Morndinsamman aus."~
	IF ~~ THEN REPLY ~Eine Seite weiterblättern.~ + page_2
	IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ + book_exit
	END
	
		IF ~~ THEN BEGIN page_2 
		SAY ~"Barakuir wählte Laduguer, Drakkalor Abbathor, Iltkazar Clangeddin, Korolnor Diinkarazan, Sondarr Vergadain, Torglor Diirinka, Ultoksamrin Dumathoin, und Xothaerin Sharindlar als ihre Schutzgottheit aus."~
		IF ~~ THEN REPLY ~Eine Seite zurückblättern.~ + page_1
		IF ~~ THEN REPLY ~Eine Seite weiterblättern.~ + page_3
		IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ + book_exit
		END

			IF ~~ THEN BEGIN page_3 
			SAY ~"Ultoksamrin wurde nach dem Fall Alatorins zum führenden Königreich Shanatars auserkoren. So kam es, dass Dumathoin der Schutzgott Shanatars und damit der Rasse der Schildzwerge wurde."~
			IF ~~ THEN REPLY ~Eine Seite zurückblättern.~ + page_2
			IF ~~ THEN REPLY ~Eine Seite weiterblättern.~ + page_4
			IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ + book_exit
			END
			
				IF ~~ THEN BEGIN page_4 
				SAY ~Dies ist die letzte Seite des Buches, welche in Gemeinsprache gehalten ist. "Einige der Schutzgötter wandten sich im Laufe der Jahrhunderte bösen Kräften zu, und so kam es, dass bis auf die Symbole in den Wappen der Unterkönigreiche wenig von ihrem einstigen Einfluss übrig geblieben ist.~
				IF ~~ THEN REPLY ~Eine Seite zurückblättern.~ + page_3
				IF ~~ THEN REPLY ~Das Buch schließen.~ + book_exit
				END

	IF ~~ THEN BEGIN book_exit 
	  SAY ~Ihr wendet Euch wieder von Buch ab.~
	  IF ~~ THEN EXIT
	END
	
// Book #3
// a small review of the founding stories of shanatar
// the elves of Keltormir


BEGIN ~AC#23BO3~

IF ~Global("AC#23Book03","ACIL23",1)~ THEN BEGIN 0 
  SAY ~Vor Euch liegt ein altes, staubiges Buch, welches zur Hälfte aufgeschlagen ist. Auf dem Deckel ist ein Euch unbekanntes Elfensymbol eingraviert. Wenn Ihr möchtet, könnt Ihr in dem uralten Einband blättern.~
  IF ~~ THEN REPLY ~Das Buch aufschlagen.~ + page_1
  IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ + book_exit
END

	IF ~~ THEN BEGIN page_1 
	SAY ~Ihr blättert durch die verschiedenen Schriften, bis Ihr einen Teil, der in der Gemeinsprache und Thorass geschrieben ist, findet, und beginnt zu lesen.~
	=
	~"Die Zwergenreiche kämpften Seite an Seite gegen die Bedrohungen des Unterreiches. Ein jedes hatte mit ganz eigenen Feinden zu kämpfen. So schlugen Korolnor und Torglor die Illithiden und Iltkazar die Betrachter in zahlreichen Schlachten zurück. Vereint boten die Zwerge Seite an Seite den immer zahlreicher werdenden Feinden die Stirn."~
	IF ~~ THEN REPLY ~Eine Seite weiterblättern.~ + page_2
	IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ + book_exit
	END
	
		IF ~~ THEN BEGIN page_2 
		SAY ~"In den immer verzweifelter werdenden Kämpfen suchten die Zwerge das Bündnis mit den Elfen. Die Elfen, die die großen Wälder Keltormirs auf der Oberfläche beherrschten, hatten schon früh, bevor die ersten Zwerge das Licht der Oberwelt erblickten, die dort hausenden Drachen vernichtet und ein blühendes Reich erschaffen. Doch unter den Elfen herrschte Zwietracht und Verrat, und ihr großes Reich Keltormir zerfiel schon vor Shanatars Aufstieg in drei kleinere Elfenclans - Shilmista, Mirwald und Tethyr, von denen Tethyr als einziges Elfenreich überdauerte. Das Bündnis mit den Elfen währte lange, bis die Zwerge von den Elfen hintergangen wurden."~
		IF ~~ THEN REPLY ~Eine Seite zurückblättern.~ + page_1
		IF ~~ THEN REPLY ~Eine Seite weiterblättern.~ + page_3
		IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ + book_exit
		END

			IF ~~ THEN BEGIN page_3 
			SAY ~"Auch die wenigen Menschen, die zu dieser Zeit die Oberfläche besiedelten, erwiesen sich als wechselhafte Verbündetete. Deren Gier nach dem Reichtum der Zwerge war größer als die Loyalität zu einem einmal gegebenen Schwur."~
			IF ~~ THEN REPLY ~Eine Seite zurückblättern.~ + page_2
			IF ~~ THEN REPLY ~Eine Seite weiterblättern.~ + page_4
			IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ + book_exit
			END
			
				IF ~~ THEN BEGIN page_4 
				SAY ~Dies ist die letzte Seite des Buches, welche in Gemeinsprache gehalten ist. "Die Zwerge merkten, dass die Bewohner der Oberfläche keine guten Verbündeten waren. Sie beschlossen, sich fortan nur auf sich selbst zu verlassen und jeder anderen Rasse mit Misstrauen zu begegnen."~
				IF ~~ THEN REPLY ~Eine Seite zurückblättern.~ + page_3
				IF ~~ THEN REPLY ~Das Buch schließen.~ + book_exit
				END

	IF ~~ THEN BEGIN book_exit 
	  SAY ~Ihr wendet Euch wieder von Buch ab.~
	  IF ~~ THEN EXIT
	END
	
// Book #4
// a small review of the founding stories of shanatar
// the decline of shanatar


BEGIN ~AC#23BO4~

IF ~Global("AC#23Book04","ACIL23",1)~ THEN BEGIN 0 
  SAY ~Vor Euch liegt ein altes, staubiges Buch, welches zur Hälfte aufgeschlagen ist. Auf dem Deckel ist das Symbol eines zerbrochenen Pfeiles eingraviert. Wenn Ihr möchtet, könnt Ihr in dem uralten Einband blättern.~
  IF ~~ THEN REPLY ~Das Buch aufschlagen.~ + page_1
  IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ + book_exit
END

	IF ~~ THEN BEGIN page_1 
	SAY ~Ihr blättert durch die verschiedenen Schriften, bis Ihr einen Teil, der in der Gemeinsprache und Thorass geschrieben ist, findet, und beginnt zu lesen.~
	=
	~"In der Blüte ihres Reiches wurde den Zwergen Shanatars irgendwann auch ihre eigene Gier nach Macht und Reichtum zum Verhängnis. Der Zusammenhalt, der einst das Lebenselixier ganzer Generationen ausmachte, schwand unaufhaltsam dahin, bis zwischen den einzelnen Unterreichen offener Krieg ausbrach und sich die Zwerge gegenseitig auszulöschen drohten. Kein Feind von außen hätte je vermocht, was die Zwerge unter ihresgleichen anzurichten imstande waren."~
	IF ~~ THEN REPLY ~Eine Seite weiterblättern.~ + page_2
	IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ + book_exit
	END
	
		IF ~~ THEN BEGIN page_2 
		SAY ~"Clan Duergar aus Barakuir hegte einen Groll, weil es sich bei der Wahl zum Großkönig übergangen fühlte. Die Zwerge Barakuirs zogen sich aus der Gemeinschaft Shanatars zurück, und auch die anderen Königreiche kümmerten sich mehr und mehr um ihre eigenen Belange, als weiterhin vereint einem gemeinsamen Feind ins Auge zu sehen. Dies war der Anfang vom Ende Shanatars."~
		IF ~~ THEN REPLY ~Eine Seite zurückblättern.~ + page_1
		IF ~~ THEN REPLY ~Eine Seite weiterblättern.~ + page_3
		IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ + book_exit
		END

			IF ~~ THEN BEGIN page_3 
			SAY ~"In blutigen Kriegen zogen die Zwerge Shanatars nun gegeneinander auf das Schlachtfeld. Einige der Clans gingen Bündnisse mit dunklen Mächten ein, um sich gegen die ehemaligen Brüder und Schwestern behaupten zu können."~
			IF ~~ THEN REPLY ~Eine Seite zurückblättern.~ + page_2
			IF ~~ THEN REPLY ~Eine Seite weiterblättern.~ + page_4
			IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ + book_exit
			END
			
				IF ~~ THEN BEGIN page_4 
				SAY ~Dies ist die letzte Seite des Buches, welche in Gemeinsprache gehalten ist. "Von dieser Schwäche sollte sich Shanatar nie mehr erholen."~
				IF ~~ THEN REPLY ~Eine Seite zurückblättern.~ + page_3
				IF ~~ THEN REPLY ~Das Buch schließen.~ + book_exit
				END

	IF ~~ THEN BEGIN book_exit 
	  SAY ~Ihr wendet Euch wieder von Buch ab.~
	  IF ~~ THEN EXIT
	END

// Book #5
// a small review of the founding stories of shanatar
// iltkazar is the last subkingdom


BEGIN ~AC#23BO5~

IF ~Global("AC#23Book05","ACIL23",1)~ THEN BEGIN 0 
  SAY ~Vor Euch liegt ein altes, staubiges Buch, welches zur Hälfte aufgeschlagen ist. Auf dem Deckel ist das Symbol eines zerbrochenen Pfeiles eingraviert. Wenn Ihr möchtet, könnt Ihr in dem uralten Einband blättern.~
  IF ~~ THEN REPLY ~Das Buch aufschlagen.~ + page_1
  IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ + book_exit
END

	IF ~~ THEN BEGIN page_1 
	SAY ~Ihr blättert durch die verschiedenen Schriften, bis Ihr einen Teil, der in der Gemeinsprache und Thorass geschrieben ist, findet, und beginnt zu lesen.~
	=
	~"Nacheinander schwanden die einst so mächtigen Zwergenreiche dahin und gerieten in Vergessenheit. Alle bekannten Zugänge zu der Oberfläche wurden versiegelt. Die Unterkönigreiche verloren den Kontakt zueinander, und Eines nach dem Anderen wurde von den verschiedensten Feinden ausgelöscht."~
	IF ~~ THEN REPLY ~Eine Seite weiterblättern.~ + page_2
	IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ + book_exit
	END
	
		IF ~~ THEN BEGIN page_2 
		SAY ~"Einzig Iltkazar hielt dem Ansturm der Feinde stand und konnte überleben. Mit der Zeit geriet es für den Rest der Welt in Vergessenheit und entwickelte sich in seiner Abgeschiedenheit des Unterreiches zu einem Hort des Wissens und der Geschichte im südlichen Unterreich."~
		IF ~~ THEN REPLY ~Eine Seite zurückblättern.~ + page_1
		IF ~~ THEN REPLY ~Eine Seite weiterblättern.~ + page_3
		IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ + book_exit
		END

			IF ~~ THEN BEGIN page_3 
			SAY ~"Als der Herrscher Iltkazars und letzte Erbe des Gründers Shanatars ohne Nachkommen auf dem Sterbebett lag, sandte Dumathoin Mith Barak, den Clanlosen, nach Iltkazar. Der alte König wählte kurz vor seinem Tod Mith Barak als seinen Nachfolger aus."~
			IF ~~ THEN REPLY ~Eine Seite zurückblättern.~ + page_2
			IF ~~ THEN REPLY ~Eine Seite weiterblättern.~ + page_4
			IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ + book_exit
			END
			
				IF ~~ THEN BEGIN page_4 
				SAY ~Dies ist die letzte Seite des Buches, welche in Gemeinsprache gehalten ist. "Mith Barak, der Clanlose unbekannter Herkunft, herrschte fortan gütig und weise über das Zwergenvolk Iltkazars."~
				IF ~~ THEN REPLY ~Eine Seite zurückblättern.~ + page_3
				IF ~~ THEN REPLY ~Das Buch schließen.~ + book_exit
				END

	IF ~~ THEN BEGIN book_exit 
	  SAY ~Ihr wendet Euch wieder von Buch ab.~
	  IF ~~ THEN EXIT
	END
/*

"Nacheinander schwanden die einst so mächtigen Zwergenreiche dahin und gerieten in Vergessenheit. Alle bekannten Zugänge zu der Oberfläche wurden versiegelt. Einzig Iltkazar hielt dem Ansturm der Feinde stand und konnte überleben. Mit der Zeit geriet es in Vergessenheit und entwickelte sich zu einem Hort des Wissens und der Geschichte im südlichen Unterreich."

		IF ~~ THEN BEGIN page_2 
		SAY ~"In der Blüte ihres Reiches wurde den Zwergen Shanatars ihre eigene Gier nach Macht und Reichtum zum Verhängnis. Der Zusammenhalt, der einst das Lebenselixier ganzer Generationen ausmachte, schwand unaufhaltsam dahin, bis zwischen den einzelnen Unterreichen offener Krieg ausbrach und sich die Zwerge gegenseitig auszulöschen drohten. Kein Feind von außen hätte je vermocht, was die Zwerge unter ihresgleichen anzurichten imstande waren."~
		IF ~~ THEN REPLY ~Eine Seite zurückblättern.~ + page_1
		IF ~~ THEN REPLY ~Eine Seite weiterblättern.~ + page_3
		IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ + book_exit
		END

			IF ~~ THEN BEGIN page_3 
			SAY ~"Nacheinander schwanden die einst so mächtigen Zwergenreiche dahin und gerieten in Vergessenheit. Einzig Iltkazar hielt dem Ansturm der Feinde stand und konnte überleben. Mit der Zeit geriet es in Vergessenheit und entwickelte sich zu einem Hort des Wissens und der Geschichte im südlichen Unterreich. Als der Herrscher Iltkazars und letzte Erbe des Gründers Shanatars ohne Nachkommen auf dem Sterbebett lag, sandte Dumathoin Mith Barak, den Clanlosen, den der alte König kurz vor seinem Tod als Nachfolger auswählte."~
			IF ~~ THEN REPLY ~Eine Seite zurückblättern.~ + page_2
			IF ~~ THEN REPLY ~Eine Seite weiterblättern.~ + page_4
			IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ + book_exit
			END
			
				IF ~~ THEN BEGIN page_4 
				SAY ~Dies ist die letzte Seite des Buches, welche in Gemeinsprache gehalten ist. Sie enthält nur einen Satz: "Mith Barak, der Clanlose unbekannter Herkunft, herrschte fortan gütig und weise über das Zwergenvolk Iltkazars.~
				IF ~~ THEN REPLY ~Eine Seite zurückblättern.~ + page_3
				IF ~~ THEN REPLY ~Das Buch schließen.~ + book_exit
				END
*/	