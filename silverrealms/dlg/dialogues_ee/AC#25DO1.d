

/*******************************************************************************************************
Dialog Tür
*******************************************************************************************************/

BEGIN ~AC#25DO1~

IF ~True()~ THEN BEGIN 0
SAY @0
IF ~~ THEN REPLY @1 + do_nothing
IF ~GlobalGT("AC#25_Bloodmoon","GLOBAL",0)~ THEN REPLY @2 + do_nothing
IF ~GlobalGT("AC#25_Bloodmoon","GLOBAL",0)~ THEN REPLY @3 + do_nothing
IF ~GlobalGT("AC#25_Bloodmoon","GLOBAL",0)~ THEN REPLY @4 + do_nothing
IF ~GlobalGT("AC#25_Bloodmoon","GLOBAL",0)~ THEN REPLY @5 + door_open
END

IF ~~THEN BEGIN do_nothing
SAY @35
   IF ~~ THEN DO ~~  EXIT
END

IF ~~ THEN BEGIN door_open
SAY @6
IF ~~ THEN  DO ~SetGlobal("AC#Door25","ACIL25",2)
EraseJournalEntry(@23000)~ EXIT

END
