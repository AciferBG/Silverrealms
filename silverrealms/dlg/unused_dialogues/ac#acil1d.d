/*******************************************************************************************************
Dialog mit Otimorn, dem Priester des Eldaths, der die PCs zu verschiedenen Orten bringen kann
*******************************************************************************************************/

BEGIN ~AC#ELDA2~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY @0 /* Seid gegrüßt, <RACE>. Mein Name ist Otimorn, ich bin der Priester unserer geliebten Eldath. Meine Aufgabe ist es, Reisende sicher zu diesem Ort zu begleiten und genauso wohlbehalten wieder aus diesem friedvollen Ort herauszuführen. */
++ @1 /* Seid ebenfalls gegrüßt, Otimorn. Zu welchem Ort könnt Ihr mich geleiten? */ + 2
++ @2 /* Ich entschuldige die Störung. Gehabt Euch wohl. */ + 3
END

IF ~True()~ THEN BEGIN hello_again
SAY @3 /* Ihr seid zurückgekehrt. Wie kann Euch die Herrin der Ruhe diesmal helfen? */
++ @1 /* Seid ebenfalls gegrüßt, Otimorn. Zu welchem Ort könnt Ihr mich geleiten? */ + 2
++ @2 /* Ich entschuldige die Störung. Gehabt Euch wohl. */ + 3
END

IF ~~ THEN BEGIN 2
SAY @4 /* Das hängt davon ab, wo Ihr hinwollt. Ich kenne mich eigentlich nur besonders gut im Schlangenwald aus, denn dies ist meine Heimat. Ich kann Euch aber auch an den Rand des Schlangenwaldes und darüber hinaus führen, wenn Ihr wisst, wo Ihr hinwollt. */
IF ~~ THEN REPLY @5 /* Bringt mich nach Imnestal. */ + 4
IF ~~ THEN REPLY @6 /* Ich würde gerne zu den Füßen des Batyr-Berges reisen, zu einem Ort, der als der heulende Zwerg bekannt ist. */ + 5
++ @2 /* Ich entschuldige die Störung. Gehabt Euch wohl. */ + 3
END

IF ~~ THEN BEGIN 3
SAY @7 /* Möge der Friede immer mit Euch sein, mein <GIRLBOY>. */
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 4
SAY @8 /* Dann lasst uns also nach Imnestal aufbrechen. */
IF ~~ THEN DO ~ClearAllActions()
		StartCutSceneMode()
		StartCutScene("ac#1dimn")~
                EXIT
END

IF ~~ THEN BEGIN 5
SAY @9 /* Dann lasst uns also zum heulenden Zwerg aufbrechen. */
IF ~~ THEN DO ~ClearAllActions()
		StartCutSceneMode()
		StartCutScene("ac#1dwai")~
                EXIT
END

