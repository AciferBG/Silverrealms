// Books History Shanatars

// Book #1
// about curses

BEGIN ~AC#23BO1~

IF ~Global("Books_Introduction","ACIL23",0)~ THEN BEGIN 0
  SAY ~Mehrere Bücher liegen in diesem Teil der Halle. Es scheint, als seien sie für diesen Zweck sorgfältig ausgewählt worden.~
  IF ~~ THEN REPLY ~Das Buch, das vor Euch liegt, näher ansehen.~ DO ~SetGlobal("Books_Introduction","ACIL23",1)~ GOTO hello_0_B
  IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ GOTO book_exit
END

	IF ~~ THEN BEGIN hello_0_B
	  SAY ~Vor Euch liegt ein altes, staubiges Buch, das zur Hälfte aufgeschlagen ist. Auf seinem ledernen Einband ist eine zerbrochene Kette eingeprägt. Die verblassten Buchstaben auf dem Buchrücken ergeben den Titel "Von Flüchen und ihrer Bannung".~
	  IF ~~ THEN REPLY ~Das Buch aufschlagen.~ GOTO page_1
	  IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ GOTO book_exit
	END

IF ~Global("AC#23Book01","ACIL23",1)~ THEN BEGIN hello_0
  SAY ~Vor Euch liegt ein altes, staubiges Buch, das zur Hälfte aufgeschlagen ist. Auf seinem ledernen Einband ist eine zerbrochene Kette eingeprägt. Die verblassten Buchstaben auf dem Buchrücken ergeben den Titel "Von Flüchen und ihrer Bannung".~
  IF ~~ THEN REPLY ~Das Buch aufschlagen.~ GOTO page_1
  IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ GOTO book_exit
END

IF ~~ THEN BEGIN page_1
  SAY ~"Ein Fluch ist mehr als ein Zauber. Er ist ein Wille, der einem anderen Wesen, einem Gegenstand oder einem ganzen Geschlecht aufgezwungen wurde. Manche Flüche vergehen mit dem Tod ihres Urhebers, andere überdauern Jahrhunderte und werden von einer Generation an die nächste weitergegeben. Wer einen Fluch brechen will, muss zunächst seinen Ursprung erkennen. Denn erst, wenn die Ursache bekannt ist, lässt sich ein Weg finden, seine Wirkung aufzuheben."~
  IF ~~ THEN REPLY ~Eine Seite weiterblättern.~ GOTO page_2
  IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ GOTO book_exit
END

IF ~~ THEN BEGIN page_2
  SAY ~"Nicht alle Flüche entspringen derselben Macht. Die Verwünschung eines sterblichen Zauberwirkers mag durch einen Gegenzauber aufgehoben werden. Ein Fluch, der aus einem gebrochenen Eid hervorgegangen ist, kann dagegen fortbestehen, bis der Eid erfüllt oder das begangene Unrecht gesühnt wurde. Andere Flüche stammen von Wesen, deren Macht die der Sterblichen weit übersteigt. Gegen solche Verwünschungen vermag selbst die stärkste Bannmagie zu versagen. Denn nicht die Stärke des Zaubers allein entscheidet über seine Aufhebung, sondern die Natur der Macht, die ihn hervorgebracht hat."~
  IF ~~ THEN REPLY ~Eine Seite zurückblättern.~ GOTO page_1
  IF ~~ THEN REPLY ~Eine Seite weiterblättern.~ GOTO page_3
  IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ GOTO book_exit
END

IF ~~ THEN BEGIN page_3
  SAY ~"Besonders tückisch sind jene Flüche, die nicht allein den Leib, sondern das Wesen ihres Opfers verändern. Sie mögen Gestalt und Erinnerung, Stimme und Verstand, bisweilen sogar die Seele berühren. So kann ein Fluch fortbestehen, ohne dass sein Opfer sich seiner bewusst ist."~
  IF ~~ THEN REPLY ~Eine Seite zurückblättern.~ GOTO page_2
  IF ~~ THEN REPLY ~Eine Seite weiterblättern.~ GOTO page_4
  IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ GOTO book_exit
END

IF ~~ THEN BEGIN page_4
  SAY ~"Der Unwissende sucht nach einem Zauber, der den Fluch vertreibt. Der Weise aber fragt, wer ihn ausgesprochen hat, weshalb er auferlegt wurde und welche Macht ihn noch immer aufrechterhält. Denn solange die Wurzel eines Fluches verborgen bleibt, mag man seine Zweige abschlagen, so oft man will. Stets werden neue nachwachsen."~
  IF ~~ THEN REPLY ~Eine Seite zurückblättern.~ GOTO page_3
  IF ~~ THEN REPLY ~Das Buch schließen.~ GOTO book_exit
END

IF ~~ THEN BEGIN book_exit
  SAY ~Ihr wendet Euch wieder von dem Buch ab.~
  IF ~~ THEN EXIT
END


// Book #2
//astral plane

BEGIN ~AC#23BO2~

IF ~Global("Books_Introduction","ACIL23",0)~ THEN BEGIN 0
  SAY ~Mehrere Bücher liegen in diesem Teil der Halle. Es scheint, als seien sie für diesen Zweck sorgfältig ausgewählt worden.~
  IF ~~ THEN REPLY ~Das Buch, das vor Euch liegt, näher ansehen.~ DO ~SetGlobal("Books_Introduction","ACIL23",1)~ GOTO hello_0_B
  IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ GOTO book_exit
END


IF ~Global("AC#23Book02","ACIL23",1)~ THEN BEGIN 0
  SAY ~Vor Euch liegt ein altes, staubiges Buch, dessen Einband aus silbrig schimmerndem Leder gefertigt ist. Fremdartige Runen ziehen sich über den Rücken des Bandes. Wenn Ihr möchtet, könnt Ihr darin blättern.~
  IF ~~ THEN REPLY ~Das Buch aufschlagen.~ + page_1
  IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ + book_exit
END

	IF ~~ THEN BEGIN hello_0_B
	  SAY ~Vor Euch liegt ein altes, staubiges Buch, dessen Einband aus silbrig schimmerndem Leder gefertigt ist. Fremdartige Runen ziehen sich über den Rücken des Bandes. Wenn Ihr möchtet, könnt Ihr darin blättern.~
	  IF ~~ THEN REPLY ~Das Buch aufschlagen.~ + page_1
	  IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ + book_exit
	END

IF ~~ THEN BEGIN page_1
  SAY ~"Zwischen den Welten der Sterblichen und den Reichen der Götter erstreckt sich ein grenzenloses Meer aus silbernem Licht. Die Weisen nennen es die Astralebene, doch in den ältesten Schriften trägt es einen anderen Namen: Das Silberreich. Dort gibt es weder Tag noch Nacht, weder Himmel noch Erde. Die Zeit verliert ihre Bedeutung, und Entfernungen werden nicht allein durch Schritte überwunden. Gedanken und Wille bestimmen den Weg des Reisenden, denn was in der Welt der Sterblichen unüberwindlich scheint, mag hier nur einen Gedanken entfernt liegen."~
  IF ~~ THEN REPLY ~Eine Seite weiterblättern.~ + page_2
  IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ + book_exit
END

	IF ~~ THEN BEGIN page_2
	  SAY ~"In den stillen Weiten der Astralebene treiben die Überreste vergessener Zeitalter, verlorene Wunderwerke und die gewaltigen Leiber längst verstorbener Götter. Manche sind größer als ganze Königreiche, und fremdartige Wesen haben Wohnstätten auf ihnen errichtet. Doch nicht alles, was in diesem Meer ruht, ist tot. Nicht alles, was sich darin bewegt, ist lebendig. Und nicht jeder Wanderer, der die Silberne See betritt, verlässt sie wieder aus freiem Willen."~
	  IF ~~ THEN REPLY ~Eine Seite zurückblättern.~ + page_1
	  IF ~~ THEN REPLY ~Eine Seite weiterblättern.~ + page_3
	  IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ + book_exit
	END

	IF ~~ THEN BEGIN page_3
	  SAY ~"Zwei Wege stehen dem Sterblichen offen, um die Astralebene zu durchqueren. Der erste ist die Wanderung des Geistes. Durch mächtige Magie vermag ein Reisender seine körperliche Hülle zurückzulassen und in astraler Gestalt die Grenzen seiner Welt zu überschreiten."~
	  IF ~~ THEN REPLY ~Eine Seite zurückblättern.~ + page_2
	  IF ~~ THEN REPLY ~Eine Seite weiterblättern.~ + page_4
	  IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ + book_exit
	END

	IF ~~ THEN BEGIN page_4
	  SAY ~"Der zweite Weg ist ungleich seltener. Durch Tore zwischen den Ebenen kann ein Wesen die Astralebene mit seinem eigenen Leib betreten. Solche Wanderer tragen Fleisch und Blut mit sich in die grenzenlose Leere und vermögen von dort aus andere Ebenen zu erreichen. Doch nicht jedes Tor lässt sich von beiden Seiten öffnen, und nicht jeder Weg, der hinausführt, vermag den Reisenden auch wieder heimzubringen."~
	  IF ~~ THEN REPLY ~Eine Seite zurückblättern.~ + page_3
	  IF ~~ THEN REPLY ~Das Buch schließen.~ + book_exit
	END

IF ~~ THEN BEGIN book_exit
  SAY ~Ihr wendet Euch wieder von dem Buch ab.~
  IF ~~ THEN EXIT
END

	
//  Book #3
// about the lower planes


BEGIN ~AC#23BO3~

IF ~Global("Books_Introduction","ACIL23",0)~ THEN BEGIN 0
  SAY ~Mehrere Bücher liegen in diesem Teil der Halle. Es scheint, als seien sie für diesen Zweck sorgfältig ausgewählt worden.~
  IF ~~ THEN REPLY ~Das Buch, das vor Euch liegt, näher ansehen.~ DO ~SetGlobal("Books_Introduction","ACIL23",1)~ GOTO hello_0_B
  IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ GOTO book_exit
END


IF ~Global("AC#23Book03","ACIL23",1)~ THEN BEGIN 0
  SAY ~Vor Euch liegt ein altes, staubiges Buch, dessen Einband aus geschwärztem Leder gefertigt ist. Auf dem Deckel ist eine fremdartige Spirale eingeprägt, die sich in neun verschlungene Linien verzweigt. Wenn Ihr möchtet, könnt Ihr darin blättern.~
  IF ~~ THEN REPLY ~Das Buch aufschlagen.~ + page_1
  IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ + book_exit
END

IF ~~ THEN BEGIN hello_0_B
  SAY ~Vor Euch liegt ein altes, staubiges Buch, dessen Einband aus geschwärztem Leder gefertigt ist. Auf dem Deckel ist eine fremdartige Spirale eingeprägt, die sich in neun verschlungene Linien verzweigt. Wenn Ihr möchtet, könnt Ihr darin blättern.~
  IF ~~ THEN REPLY ~Das Buch aufschlagen.~ + page_1
  IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ + book_exit
END

	IF ~~ THEN BEGIN page_1
	  SAY ~"Jenseits der sterblichen Welt liegen zahllose Reiche, deren Natur nicht durch die Gesetze von Erde, Feuer und Wasser bestimmt wird, sondern durch die Mächte, die sie beherrschen. Unter ihnen befinden sich die Unteren Ebenen, Orte der Verderbnis, des Hasses und der ewigen Zwietracht. Hier werden die Seelen der Verdammten ihrem Schicksal zugeführt, und hier herrschen Wesen, deren Namen in der Welt der Sterblichen nur mit Furcht ausgesprochen werden. Doch wer glaubt, diese Reiche seien lediglich von Dämonen und Teufeln bewohnt, der irrt. Auch zahlreiche Götter haben dort ihre Heimstatt gefunden."~
	  IF ~~ THEN REPLY ~Eine Seite weiterblättern.~ + page_2
	  IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ + book_exit
	END

		IF ~~ THEN BEGIN page_2
		  SAY ~"Die Neun Höllen von Baator sind ein Reich unerbittlicher Ordnung. Neun Ebenen steigen hinab in immer größere Finsternis, und jede wird von einem mächtigen Herrscher regiert. Verträge, Gehorsam und Unterwerfung bilden die Grundfesten ihrer Macht. Anders verhält es sich mit dem Abyss, dessen unzählige Schichten von Chaos und Zerstörung erfüllt sind. Dämonenfürsten führen dort seit undenklichen Zeiten Krieg gegeneinander, und ganze Reiche mögen entstehen oder vergehen, wenn einer von ihnen die Oberhand gewinnt. Doch die Unteren Ebenen umfassen noch weitere Gefilde: die grauen Weiten von Hades, die finsteren Abgründe von Gehenna und die Gefängnisreiche von Carceri. Ein jedes ist auf seine Weise ein Ort, an dem die Hoffnung der Sterblichen zugrunde gehen kann."~
		  IF ~~ THEN REPLY ~Eine Seite zurückblättern.~ + page_1
		  IF ~~ THEN REPLY ~Eine Seite weiterblättern.~ + page_3
		  IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ + book_exit
		END

			IF ~~ THEN BEGIN page_3
			  SAY ~"Nicht jeder Herrscher der Unteren Ebenen ist ein Teufel oder Dämon. Dort leben auch jene böse Götter aller Rassen, die von Sterblichen verehrt und gefürchtet werden. In ihrem Reich sammeln sich die Seelen ihrer verstorbenen Anhänger, dort walten ihre Diener, und dort entfaltet sich die Macht ihrer Herren in einem Ausmaß, das kein Sterblicher zu ermessen vermag."~
			  IF ~~ THEN REPLY ~Eine Seite zurückblättern.~ + page_2
			  IF ~~ THEN REPLY ~Eine Seite weiterblättern.~ + page_4
			  IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ + book_exit
			END

			
				IF ~~ THEN BEGIN page_4
				  SAY ~"Doch nicht alle Götter der Unteren Ebenen verweilen dort aus freiem Willen. Für manche sind diese finsteren Reiche ein Gefängnis, in das sie verbannt wurden. Hinter den Mauern ihrer Kerker sinnen sie auf Rache und warten auf den Tag, an dem ihre Fesseln zerbrechen und sie erneut Verderben über die Welten der Sterblichen bringen können."~
				  IF ~~ THEN REPLY ~Eine Seite zurückblättern.~ + page_3
				  IF ~~ THEN REPLY ~Das Buch schließen.~ + book_exit
				END


	IF ~~ THEN BEGIN book_exit
	  SAY ~Ihr wendet Euch wieder von dem Buch ab.~
	  IF ~~ THEN EXIT
	END

	
// Book #4
// dragon gods dying


BEGIN ~AC#23BO4~

IF ~Global("Books_Introduction","ACIL23",0)~ THEN BEGIN 0
  SAY ~Mehrere Bücher liegen in diesem Teil der Halle. Es scheint, als seien sie für diesen Zweck sorgfältig ausgewählt worden.~
  IF ~~ THEN REPLY ~Das Buch, das vor Euch liegt, näher ansehen.~ DO ~SetGlobal("Books_Introduction","ACIL23",1)~ GOTO hello_0_B
  IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ GOTO book_exit
END


IF ~Global("AC#23Book04","ACIL23",1)~ THEN BEGIN 0
  SAY ~Vor Euch liegt ein uraltes Buch, dessen Einband aus dunklem, schuppenartigem Leder gefertigt ist. Auf dem Deckel ist das verblasste Bild eines Drachen eingraviert, der einen Kreis aus Sternen umschließt. Wenn Ihr möchtet, könnt Ihr darin blättern.~
  IF ~~ THEN REPLY ~Das Buch aufschlagen.~ + page_1
  IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ + book_exit
END

IF ~~ THEN BEGIN hello_0_B
  SAY ~Vor Euch liegt ein uraltes Buch, dessen Einband aus dunklem, schuppenartigem Leder gefertigt ist. Auf dem Deckel ist das verblasste Bild eines Drachen eingraviert, der einen Kreis aus Sternen umschließt. Wenn Ihr möchtet, könnt Ihr darin blättern.~
  IF ~~ THEN REPLY ~Das Buch aufschlagen.~ + page_1
  IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ + book_exit
END

	IF ~~ THEN BEGIN page_1
	  SAY ~"Als die Welt noch jung war und die Reiche der Sterblichen kaum mehr als ein ferner Traum, herrschten die Drachen über weite Teile der Schöpfung. Ihre Macht war gewaltig, ihre Lebensspanne schien grenzenlos, und selbst die mächtigsten unter ihnen beugten ihre Häupter vor Wesen, deren Macht weit über die ihre hinausreichte. Dies waren die alten Drachengötter. Manche wurden als Schöpfer und Bewahrer verehrt, andere als Herren der Zerstörung gefürchtet. Ihnen errichteten die Drachen gewaltige Heiligtümer, brachten Opfer dar und führten in ihrem Namen Kriege, die ganze Zeitalter überdauerten."~
	  IF ~~ THEN REPLY ~Eine Seite weiterblättern.~ + page_2
	  IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ + book_exit
	END

		IF ~~ THEN BEGIN page_2
		  SAY ~"Doch selbst Götter sind nicht unvergänglich. Ihre Macht erwächst nicht allein aus ihrem eigenen Wesen, sondern auch aus dem Glauben jener, die sie verehren. Solange ihre Namen auf den Lippen der Gläubigen ruhen, solange Gebete gesprochen und Opfer dargebracht werden, bleibt ihre Gegenwart in der Schöpfung bestehen. Wenn Königreiche vergehen und Tempel zerfallen, geraten selbst die Namen einst mächtiger Gottheiten irgendwann in Vergessenheit. Ihre Anhänger sterben, ihre Priesterschaften verschwinden, und mit jedem verstummenden Gebet schwindet ein Teil ihrer Macht. Denn selbst ein Gott vermag nicht ewig fortzubestehen, wenn niemand mehr seinen Namen kennt."~
		  IF ~~ THEN REPLY ~Eine Seite zurückblättern.~ + page_1
		  IF ~~ THEN REPLY ~Eine Seite weiterblättern.~ + page_3
		  IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ + book_exit
		END

		IF ~~ THEN BEGIN page_3
		  SAY ~"Von zahlreichen Drachengöttern der Vorzeit sind heute kaum mehr als Legenden geblieben. Ihre Heiligtümer liegen verschüttet unter den Ruinen vergessener Reiche, ihre heiligen Schriften sind verloren, und selbst die ältesten Drachen erinnern sich nicht mehr an ihre Namen. Einige dieser Gottheiten fanden ihr Ende in gewaltigen Kriegen zwischen den Mächten der Schöpfung. Andere schwanden dahin, als ihre letzten Verehrer starben. Doch der Tod eines Gottes gleicht nicht dem eines Sterblichen. Wo sein Wille einst die Welt berührte, mögen Spuren seiner Macht zurückbleiben. Verfluchte Orte, uralte Artefakte und längst vergessene Verwünschungen können Jahrtausende überdauern, selbst wenn die Gottheit, die sie hervorbrachte, nicht mehr existiert."~
		  IF ~~ THEN REPLY ~Eine Seite zurückblättern.~ + page_2
		  IF ~~ THEN REPLY ~Eine Seite weiterblättern.~ + page_4
		  IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ + book_exit
		END

		IF ~~ THEN BEGIN page_4
		  SAY ~"Was also bedeutet es, wenn ein Gott stirbt? Vergehen seine Gedanken, sein Wille und seine Macht mit ihm? Oder verbleibt ein Teil seines Wesens in der Schöpfung, gebunden an jene Dinge, die er einst berührte? Darüber streiten die Weisen seit undenklichen Zeiten. Gewiss ist nur, dass selbst die größten Götter dem Vergessen anheimfallen können. Denn der wahre Tod einer Gottheit tritt ein, wenn ihr letzter Verehrer verstummt und niemand mehr ihren Namen kennt."~
		  IF ~~ THEN REPLY ~Eine Seite zurückblättern.~ + page_3
		  IF ~~ THEN REPLY ~Das Buch schließen.~ + book_exit
		END

IF ~~ THEN BEGIN book_exit
  SAY ~Ihr wendet Euch wieder von dem Buch ab.~
  IF ~~ THEN EXIT
END


// Book #5
// shanatar


BEGIN ~AC#23BO5~

IF ~Global("Books_Introduction","ACIL23",0)~ THEN BEGIN 0
  SAY ~Mehrere Bücher liegen in diesem Teil der Halle. Es scheint, als seien sie für diesen Zweck sorgfältig ausgewählt worden.~
  IF ~~ THEN REPLY ~Das Buch, das vor Euch liegt, näher ansehen.~ DO ~SetGlobal("Books_Introduction","ACIL23",1)~ GOTO hello_0_B
  IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ GOTO book_exit
END


IF ~Global("AC#23Book05","ACIL23",1)~ THEN BEGIN 0
  SAY ~Vor Euch liegt ein schweres, staubiges Buch mit einem Einband aus dunkelbraunem Leder. Auf dem Deckel sind acht kleine Kronen eingeprägt, die eine größere Krone umgeben. Darunter steht in verblassten goldenen Lettern: "Die Unterkönigreiche Shanatars".~
  IF ~~ THEN REPLY ~Das Buch aufschlagen.~ + page_1
  IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ + book_exit
END

	IF ~~ THEN BEGIN hello_0_B
	  SAY ~Vor Euch liegt ein schweres, staubiges Buch mit einem Einband aus dunkelbraunem Leder. Auf dem Deckel sind acht kleine Kronen eingeprägt, die eine größere Krone umgeben. Darunter steht in verblassten goldenen Lettern: "Die Unterkönigreiche Shanatars".~
	  IF ~~ THEN REPLY ~Das Buch aufschlagen.~ + page_1
	  IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ + book_exit
	END

		IF ~~ THEN BEGIN page_1
		  SAY ~"Vor ungezählten Jahrhunderten führte der Zwergenherrscher Taark Shanat sein Volk in die Tiefen unter den Ländern des Südens. Dort gründete er Alatorin, das erste große Zwergenkönigreich dieser Lande. Seine acht Söhne zogen später aus, um eigene Reiche zu errichten. So entstanden die acht Unterkönigreiche Shanatars: Barakuir, Drakkalor, Iltkazar, Korolnor, Sondarr, Torglor, Ultoksamrin und Xothaerin. Ein jedes dieser Reiche erlangte Ruhm durch seine besonderen Schätze, seine Handwerkskunst oder die Eigenheiten seiner Bewohner. Aus diesen Eigenschaften erwuchsen die Namen, unter denen sie in die Geschichte eingingen."~
		  IF ~~ THEN REPLY ~Eine Seite weiterblättern.~ + page_2
		  IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ + book_exit
		END

		IF ~~ THEN BEGIN page_2
		  SAY ~"Iltkazar, das Mithrilkönigreich, verdankte seinen Namen den reichen Vorkommen des kostbaren Metalls, das die Schmiede seiner Hallen zu unvergleichlichen Kunstwerken verarbeiteten. Seine Könige galten als Bewahrer alter Überlieferungen und der Traditionen Shanatars. Barakuir, das Eisenkönigreich, war für seine gewaltigen Erzvorkommen und seine mächtigen Schmieden bekannt. Eisen aus Barakuir fand seinen Weg in die Waffen und Rüstungen zahlreicher Zwergenheere. Die Bewohner dieses Reiches waren stolz auf ihre Stärke und die Kunst ihrer Schmiedemeister."~
		  IF ~~ THEN REPLY ~Eine Seite zurückblättern.~ + page_1
		  IF ~~ THEN REPLY ~Eine Seite weiterblättern.~ + page_3
		  IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ + book_exit
		END

		IF ~~ THEN BEGIN page_3
		  SAY ~"Korolnor trug den Beinamen Juwelenkönigreich. Seine Minen bargen Edelsteine von außergewöhnlicher Schönheit, und seine Steinmetze und Juweliere waren weit über die Grenzen des Reiches hinaus berühmt. Die prächtigen Hallen Korolnors sollen mit unzähligen funkelnden Steinen geschmückt gewesen sein. Drakkalor hingegen erlangte einen weniger schmeichelhaften Ruf. Seine Hauptstadt wurde als Stadt des Geizes bekannt, denn die dortigen Zwerge hüteten ihre Schätze mit einer Eifersucht, die selbst unter ihrem eigenen Volk sprichwörtlich wurde. Gleichwohl wuchs Drakkalor zu einem wohlhabenden Reich heran, dessen Schatzkammern sagenhafte Reichtümer bargen."~
		  IF ~~ THEN REPLY ~Eine Seite zurückblättern.~ + page_2
		  IF ~~ THEN REPLY ~Eine Seite weiterblättern.~ + page_4
		  IF ~~ THEN REPLY ~Das Buch in Ruhe lassen.~ + book_exit
		END

		IF ~~ THEN BEGIN page_4
		  SAY ~"Torglor schließlich war als Silberkönigreich bekannt. Seine reichen Silberadern brachten dem Reich großen Wohlstand, während seine Handwerker das edle Metall zu kostbaren Gefäßen, kunstvollen Waffen und prächtigen Schmuckstücken verarbeiteten. Doch der Glanz der acht Unterkönigreiche sollte nicht ewig währen. Zwietracht, Kriege und die Feinde des Unterreiches ließen ihre Macht nach und nach schwinden. Die alten Wege zwischen den Reichen wurden aufgegeben, ihre Hallen verfielen und ihre Namen gerieten vielerorts in Vergessenheit. Von den einst mächtigen Königreichen Shanatars überdauerte allein Iltkazar die Jahrhunderte. Tief verborgen unter den Bergen bewahrt das Mithrilkönigreich noch heute das Erbe seiner längst versunkenen Bruderkönigreiche."~
		  IF ~~ THEN REPLY ~Eine Seite zurückblättern.~ + page_3
		  IF ~~ THEN REPLY ~Das Buch schließen.~ + book_exit
		END

IF ~~ THEN BEGIN book_exit
  SAY ~Ihr wendet Euch wieder von dem Buch ab.~
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