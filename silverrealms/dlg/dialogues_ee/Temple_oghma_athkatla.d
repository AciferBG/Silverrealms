// Priest of Oghma

APPEND DOGHMA

IF ~~ THEN BEGIN need_book
   SAY ~Aber natürlich! Dies ist ein Allerweltsbuch. Hier, ich kann es Euch sogar umsonst geben. Es enthält die grundsätzlichen Lehren Oghmas der vergangenen Jahrhunderte.~
   IF ~~ THEN DO ~SetGlobal("AC#ACIL5O_OghmaBook","GLOBAL",2)
   AddJournalEntry(@57101,QUEST)
   GiveItemCreate("AC#ILBOG",LastTalkedToBy,1,0,0)~ EXIT
END
END

EXTEND_BOTTOM DOGHMA 0
IF ~Global("AC#ACIL5O_OghmaBook","GLOBAL",1)~ THEN REPLY ~Ich suche nach dem Buch 'Die leisen Stimmen der Wahrheit'. Habt Ihr dieses hier?~ GOTO need_book
END


