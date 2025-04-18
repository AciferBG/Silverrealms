// creator  : weidu.exe (version 24000)
// argument : AC#GOLIR.DLG
// game     : .
// source   : ./override/AC#GOLIR.DLG
// dialog   : .\dialog.tlk
// dialogF  : .\dialogF.tlk

BEGIN ~AC#GOLIR~

IF ~Global("Activated","LOCALS",0)~ THEN BEGIN 0 // from:
  SAY @1 /* ~Dieser Eisengolem steht untätig in einer Ecke. Er wartet offensichtlich darauf, aktiviert zu werden.~ #60 */
  IF ~!PartyHasItem("AC#MSC4A")~ THEN REPLY @2 /* ~Den Golem in Ruhe lassen.~ #108105 */ EXIT
  IF ~PartyHasItem("AC#MSC4A")~ THEN REPLY @3 /* ~Ich frage mich, ob dieser Aktivierungsstein passen könnte...~ #108106 */ GOTO 1
END

IF ~~ THEN BEGIN 1 // from: 0.1
  SAY @4 /* ~Der Aktivierungsstein rastet mit einem hörbaren Klicken in der Brust des metallenen Geschöpfes ein. Kurze Zeit später erwacht der Golem zum Leben...~ #108107 */
  IF ~~ THEN DO ~SetGlobal("Activated","LOCALS",1)
~ EXIT
END
