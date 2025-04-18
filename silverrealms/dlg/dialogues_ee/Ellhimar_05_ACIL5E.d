/*
Dialogue Bresk
*/
BEGIN ~AC#BRES5~

IF ~Global("GithCutScene","ACIL5E",6)~ THEN BEGIN hello_mirror_broken
SAY ~Verdammt! Ich habe sie verfehlt!~
IF ~~ THEN REPLY ~Und Ihr habt den Spiegel kaputt gemacht.~ GOTO mirror_broken_who_cares
END

	IF ~~ THEN BEGIN mirror_broken_who_cares
	SAY ~Was kümmert uns der kaputte Spiegel, da die Githyanki in unsere Stadt eindringen konnten?~
	IF ~Global("AC#GithKillEllhimar","GLOBAL",0)~ THEN REPLY ~Vielleicht hätten wir sie darüber verfolgen können.~ GOTO no_matter
	IF ~Global("AC#GithKillEllhimar","GLOBAL",1)~ THEN REPLY ~Vielleicht hätten wir sie darüber verfolgen können.~ GOTO no_matter_ellhimars_dead
	END
	
	IF ~~ THEN BEGIN no_matter_ellhimars_dead
	SAY ~Wie dem auch sei. Ellhimar ist tot! Und den Kopf haben sie mitgenommen, die verfluchten Kreaturen! Ich nehme den Leichnam des Magiers an mich.~
	IF ~~ THEN DO ~AddJournalEntry(@62200,QUEST)~ GOTO back_to_council
	END
	
	IF ~~ THEN BEGIN no_matter
	SAY ~Wie dem auch sei. Ellhimar haben sie mitgenommen, die verfluchten Kreaturen!~
	IF ~~ THEN DO ~AddJournalEntry(@62201,QUEST)~ GOTO back_to_council
	END
	
	IF ~~ THEN BEGIN back_to_council
	SAY ~Die anderen müssen davon erfahren! Trefft mich draußen.~
	IF ~~ THEN DO ~SetGlobal("AC#EllhimarGith","GLOBAL",1)
	EscapeArea()~ EXIT
	END

IF ~Global("AC#GithKillEllhimar","GLOBAL",1)~ THEN BEGIN hello_what_happened_killed
SAY ~Was ist hier geschehen? Bei Clangeddin, jemand hat Ellhimar den Kopf abgeschlagen!~
IF ~~ THEN EXTERN ~AC#5EGI1~ gith_sword_01
END

IF ~Global("AC#GithKillEllhimar","GLOBAL",0)~ THEN BEGIN hello_what_happened
SAY ~Was geht hier vor, <CHARNAME>? Bei dem Feuerauge, Githyanki in meiner Stadt!~
IF ~~ THEN EXTERN ~AC#5EGI1~ gith_bye
END

/*
Dialogue Gith
*/
BEGIN ~AC#5EGI1~


IF ~Global("GithCutScene","ACIL5E",4)~ THEN BEGIN hello_ellhimar_death
SAY ~Es ist vorbei.~
IF ~~ THEN DO ~SetGlobal("GithCutScene","ACIL5E",5)
CreateCreature("AC#BRES5",[842.376],12)
   StartCutSceneMode()
	StartCutScene("AC#5ECT5")~ EXIT 
END


/*	
IF ~Global("GithCutScene","ACIL5E",4)~ THEN BEGIN hello_ellhimar_death
SAY ~Es ist vorbei.~
IF ~~ THEN DO ~SetGlobal("GithCutScene","ACIL5E",5)
    StartCutSceneMode()
	StartCutScene("AC#5ECT5")~ EXIT 
	END
*/

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello
SAY ~Wie töricht von Euch!~
IF ~~ THEN EXTERN ~ac#ilel5~ knew_it 
END

IF ~~ THEN BEGIN game_over
SAY ~Der Spiegel wurde wohl von diesem Drow manipuliert, ohne dass Ihr es bemerkt habt. Eure Neugierde war größer als Eure Vorsicht, Menschlein! Das Spiel ist aus, Magier. Und Ihr da drüben! Haltet still, oder ich schlage dem Magier mit meiner Silberklinge den Kopf ab!~
IF ~~ THEN REPLY ~Mich könnt Ihr nicht so leicht einschüchtern!~ GOTO kill_ellhimar
IF ~~ THEN REPLY ~Droht mir nicht, Gith-Weib!~ + kill_ellhimar
IF ~~ THEN REPLY ~Das ist mir so etwas von egal!~ + kill_ellhimar
IF ~~ THEN REPLY ~Nein! Wartet! Es muss kein Blut vergossen werden.~ + dont_kill_ellhimar
IF ~~ THEN REPLY ~Lasst vom Magier ab, wir werden Euch nicht angreifen.~ + dont_kill_ellhimar
END

IF ~~ THEN BEGIN dont_kill_ellhimar
SAY ~Was für ein erbärmlicher Feigling Ihr doch seid!~
IF ~~ THEN DO ~SetGlobal("GithCutScene","ACIL5E",5)
CreateCreature("AC#BRES5",[842.376],12)
   StartCutSceneMode()
	StartCutScene("AC#5ECT5")~ EXIT 
END

IF ~~ THEN BEGIN kill_ellhimar
SAY ~Ihr habt es so gewollt!~
IF ~~ THEN DO ~SetGlobal("GithCutScene","ACIL5E",4)
SetGlobal("AC#GithKillEllhimar","GLOBAL",1)
	StartCutSceneMode()
	StartCutScene("AC#5ECT4")~ EXIT 
	END
	
IF ~~ THEN BEGIN gith_sword_01
SAY ~Fürchtet die Waffen der Githyanki! Ich nehme den Kopf des Magiers mit in unsere Basis. Soll Eure Stadt doch zugrunde gehen! Dies ist meinem Volk nicht mehr wichtig. Los, zurück durch den Spiegel!~
IF ~~ THEN DO ~SetGlobal("GithCutScene","ACIL5E",6)
	StartCutSceneMode()
	StartCutScene("AC#5ECT6")~ EXIT 
	END
	
IF ~~ THEN BEGIN gith_bye
SAY ~Der Magier wird eine geeignete Geisel werden. Soll Eure Stadt doch zugrunde gehen! Dies ist meinem Volk nicht mehr wichtig. Los, zurück durch den Spiegel!~
IF ~~ THEN DO ~SetGlobal("GithCutScene","ACIL5E",6)
	StartCutSceneMode()
	StartCutScene("AC#5ECT6")~ EXIT 
	END


/*******************************************************************************************************
Dialog Ellhimar cre#5 in ACIL5E, healed
*******************************************************************************************************/

BEGIN ~ac#ilel5~
IF ~Global("GithCutScene","ACIL5E",2)~ THEN BEGIN hello_torglor
SAY ~Bevor ich Euch den Drachenfriedhof zeige, möchte ich Euch den Ort zeigen, an dem sich zumindest ein Teil derer aufhält, die unsere Mission zu verhindern suchen.~
IF ~~ THEN REPLY ~Was ist das für ein Stein dort?~ GOTO thats_silver
END

	IF ~~ THEN BEGIN thats_silver
	SAY ~Das, mein Freund, ist reines Silber! Eine benachbarte, verlassene Zwergenstadt. Von wegen verlassen! Und gar nicht weit entfernt von dieser Stadt hier. Wartet, ich werde versuchen, noch etwas näher heranzugehen...~
	IF ~~ THEN DO ~SetGlobal("GithCutScene","ACIL5E",3)
	StartCutSceneMode()
	StartCutScene("AC#5ECT3")~ EXIT 
	END


IF ~~ THEN BEGIN knew_it
SAY ~Githyanki! Ich wusste es! Wie habt Ihr es durch den Spiegel geschafft?~
IF ~~ THEN EXTERN ~AC#5EGI1~ game_over
END


IF ~Global("GithCutScene","ACIL5E",1)~ THEN BEGIN hello_mirror
SAY ~Ich habe den Spiegel wieder in Gang gesetzt!~
IF ~~ THEN REPLY ~Das ist Euer Spiegel? Ich dachte, er gehörte den Drow.~ + your_mirror
IF ~~ THEN REPLY ~Könnt Ihr mich damit nicht zurück an die Oberfläche teleportieren?~ + teleport_me
END

	IF ~~ THEN BEGIN teleport_me
	SAY ~Nein, so mächtig ist der Gegenstand nicht. In früherer Zeit konnte man vielleicht durch den Spiegel reisen, aber solch eine Magie ist in heutiger Zeit nahezu unbekannt.~
	IF ~~ THEN GOTO your_mirror
	END

	IF ~~ THEN BEGIN your_mirror
	SAY ~Der Drow hatte meinen Spiegel für seine Machenschaften manipuliert. Ich habe ihn nun wieder auf mich eingestimmt. Und die Erkenntnisse, die ich dadurch gewinnen konnte, möchte ich nun mit Euch teilen! Ich glaube nämlich zu wissen, wer Mith Barak wirklich ist, und wo sich die Gruppe Feinde aufhält, die für den Tod der Patrouille verantwortlich ist und mit dem Bösen, das unsere Stadt heimsuchen möchte, unter einer Decke steckt! Ich werde den Spiegel aktivieren...~
	IF ~~ THEN DO ~SetGlobal("GithCutScene","ACIL5E",2)
	StartCutSceneMode()
	StartCutScene("AC#5ECT2")~ EXIT
	END	

IF ~NumTimesTalkedToGT(0)~ THEN BEGIN hello_again
SAY  ~Seid gegrüßt, <CHARNAME>! Was kann ich für Euch tun?~
IF ~~ THEN REPLY ~Ich wollte nur kurz sehen, wie es Euch geht.~ + just_looking
END

	IF ~~THEN BEGIN just_looking
	SAY ~Oh, mir geht es immer besser. Ich bin zwar noch nicht in der Form, in der ich einmal war, aber sehr dankbar, wieder einen wachen Geist zu besitzen!~
	IF ~~ THEN EXIT
	END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY  ~<CHARNAME>! Es ist schön, wieder auf zwei Beinen stehen zu können - in meinem eigenen Haus! Ich habe mein Zauberbuch gesichtet und bereits den entsprechenden Zauber auf die Schwebescheibe gewirkt.~
++ ~Und, fliegt sie wieder?~ + 2
END

	IF ~~ THEN BEGIN 2
	SAY ~Und ob! Was für ein interessantes Artefakt die Drow damit doch geschaffen haben. Die Drow...~
	++ ~Den letzten Ellhimar, den ich hier getroffen habe, musste ich erschlagen, weil er ein Drow war.~ + killed_drow
	END
	
		IF ~~ THEN BEGIN killed_drow
		SAY ~Ich weiß. Ich bin immer noch dabei, all das, was mir widerfahren ist, aufzuarbeiten. Aber das soll nicht Eure Sorge sein.~
		IF ~~ THEN + give_driftdisc_01
		END
		
			IF ~~ THEN BEGIN give_driftdisc_01
			SAY ~Ihr seid wegen der Scheibe gekommen, und ich möchte sie Euch nun geben. Hier, nehmt sie.~
			IF ~~ THEN DO ~GiveItemCreate("AC#DRFT2",LastTalkedToBy,0,0,0)~ + give_driftdisc_02
			END
			
				IF ~~ THEN BEGIN give_driftdisc_02
				SAY ~Ihr könnt sie in der Nähe der Spalte, die wieder zu Ravimors Höhle hinaufführt, verwenden. Sobald Ihr die Scheibe dort ablegt, wird sie zu schweben beginnen und Euch an die Oberfläche bringen - und bei Bedarf wieder zurück zu uns, versteht sich. Denn ich hoffe, dass Ihr bald zurückkehrt!~
				++ ~Ich danke Euch, Ellhimar.~ DO ~SetGlobal("AC#BackToSurface","GLOBAL",6)
				EraseJournalEntry(@64210)
				EraseJournalEntry(@20803)
				AddJournalEntry(@64211,QUEST_DONE)~ + give_driftdisc_exit
				END
				
				IF ~~ THEN BEGIN give_driftdisc_exit
				SAY ~Ihr müsst mir nicht danken - ich muss Euch danken! *Ihr* habt mich aus den Fängen der Illithiden gerettet und das vollendet, das ich nicht imstande war zu tun. Mehr noch - Ihr schickt Euch gerade an, endlich diese Stadt zu retten! Etwas, das ich mit all meiner Magie nicht geschafft habe...~				
				IF ~~ THEN GOTO found_out
				END
				
					IF ~~ THEN BEGIN found_out
					SAY ~Bevor Ihr geht, möchte ich Euch noch etwas Wichtiges mitteilen. Man hat mir über Eure Visionen in der Halle des Blutmondes berichtet. Ich habe ein wenig nachgeforscht und denke, dass es sich bei dem von Euch geschilderten Ort wirklich um die sagenumwobene Stelle handelt, an der vor Jahrtausenden die ersten Drachen fielen. Ein Elfenheld erschlug zwei der Biester und läutete so das Ende der Herrschaft dieser Wesen über Faerûn ein.~
					IF ~~ THEN REPLY ~Was wollte Mith Barak an diesem Ort?~ GOTO why_there 
					END
					
						IF ~~ THEN BEGIN why_there
						SAY ~In der Nähe des damaligen Kampfes liegt ein alter Tempel der Drachen. Es scheint so, dass der Elf damals den Drachen auflauerte und sie vor diesem Tempel zur Strecke brachte. Der Ort ist einer längst vergessenen Drachengottheit namens Kalzareinad geweiht. Deshalb wollte Mith Barak ihn besuchen.~
						IF ~~ THEN REPLY ~Wer ist Kalzareinad?~ GOTO about_kalzareinad
						END
						
							IF ~~ THEN BEGIN about_kalzareinad
							SAY ~Kalzareinad muss vor langer Zeit ein Gott gewesen sein, dem die Drachen huldigten. Allerdings ist sein Glaube in heutiger Zeit schon längst erloschen.~
							IF ~~ THEN REPLY ~Was hatte Mith Barak an diesem Ort zu suchen?~ GOTO why_there_02
							END
							
							IF ~~ THEN BEGIN why_there_02
							SAY ~Jetzt kommen wir zu der wirklich wichtigen Frage. Ich hatte schon vor meiner Gefangenschaft die Vermutung, doch nun habe ich Gewissheit. Folgt mir, ich muss Euch etwas zeigen!~
							IF ~~ THEN DO ~SetGlobal("GithCutScene","ACIL5E",1)
							StartCutSceneMode()
							StartCutScene("AC#5ECT1")~ EXIT 
							END
										
				
	
