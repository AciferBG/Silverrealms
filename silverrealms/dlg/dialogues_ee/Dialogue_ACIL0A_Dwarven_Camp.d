// ---------------------------------------------
// ACIL0A-Dwarven Camp-Dialoge
// ---------------------------------------------
// Goblin Captain

BEGIN ~AC#0AGO1~

IF ~Global("GoblinTrap","ACIL0A",1)~ THEN BEGIN hello_trap_spun
SAY ~Hat geklappt! Falle zugeschnappt! Zwerge entwischt, aber jetzt bessere Beute. Schnappt die Großlinge!~
IF ~~ THEN DO ~Enemy()
SetGlobal("GoblinTrap","ACIL0A",15)~ EXIT
END

IF ~Global("GoblinTrap","ACIL0A",10)~ THEN BEGIN hello_trap_disarmed
SAY ~Hmm. Großlinge zu schlau für Falle! Nicht gut. Tötet sie!~
IF ~~ THEN DO ~Enemy()
SetGlobal("GoblinTrap","ACIL0A",19)~ EXIT
END


