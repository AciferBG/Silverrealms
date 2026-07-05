// ---------------------------------------------
// Malphas in fireplane, during siege in Iltkazar
// ---------------------------------------------

BEGIN ~AC#MAL77~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_01
SAY ~So sehen wir uns also wieder, <CHARNAME>.~
IF ~~ THEN REPLY ~Ihr habt damals den Magier in seinem Turm getötet!~ GOTO killed_aldym
//IF ~~ THEN REPLY ~Was sucht Ihr hier?~ + whatayawant
END

	IF ~~ THEN BEGIN killed_aldym
	SAY ~Ja, das war ich. Und Ihr wart so freundlich, mir dieses Zwergenzepter zu überlassen, mit dessen Hilfe man alte Feuerportale wieder öffnen kann - so wie dieses hinter Euch!~
	IF ~~ THEN REPLY ~Ihr habt mit Hilfe des Zepters ein Portal nach Iltkazar geöffnet?~ GOTO opened_portal01
	END
	
		IF ~~ THEN BEGIN opened_portal01
		SAY ~Ja, so ist es. Ist es nicht ironisch, dass gerade Ihr derjenige seid, der Iltkazar in den Untergang geführt hat, indem er mir ein Mittel zur Hand gab, endlich die Grenzen der Ebenen zu überwinden?~
		IF ~~ THEN REPLY ~Ich werde Euch aufhalten!~ GOTO stop_you
		END
		
			IF ~~ THEN BEGIN stop_you
			SAY ~Und wie habt Ihr das vor? Seht Euch doch einmal um. Die Hitze wird Euch in wenigen Atemzügen verbrennen. Überall um Euch herum geht es steil bergab. Wenn Euch nicht geschwind Flügel wachsen, werdet Ihr niemals von dieser Plattform herunter können!~
			IF ~~ THEN REPLY ~Ich werde Euch töten, und dann sehen wir weiter!~ GOTO kill_you
			END
			
				IF ~~ THEN BEGIN kill_you
				SAY ~Ich bin nicht an einem Kampf interessiert, auch wenn ich Euch liebend gerne hier vernichten würde. Ihr habt uns mit dem Tode meines Generals vorab einen Strich durch die Rechnung gemacht. Meine Herrin Tiamat wird außer sich vor Zorn sein und nun alle ihre Mittel auf Euch richten, <CHARNAME>. Entweder Ihr sterbt hier durch die Hände meiner Soldaten oder später durch den Zorn der Herrin der Drachen!~
				IF ~~ THEN REPLY ~Ihr steckt mit dieser Drachengottheit unter einer Decke?~ GOTO tiamat_01
				END
				
					IF ~~ THEN BEGIN tiamat_01
					SAY ~Ich diene Ihr, und dafür lässt sie mir in meinen Angelegenheiten freie Hand. Mit der Gefangennahme Mith Baraks bin ich in ihrer Gunst weit gestiegen!~
					IF ~~ THEN REPLY ~Ihr habt Mith Barak entführt! Wo steckt er?~ GOTO wheres_mith_barak
					END
					
						IF ~~ THEN BEGIN wheres_mith_barak
						SAY ~Nun, der eine Teil von ihm sitzt leider immer noch auf seinem Thron. Deshalb wollten wir ja dieses Portal eröffnen, um seiner habhaft zu werden!~
						IF ~~ THEN REPLY ~Was ich verhindern werde!~ GOTO well_see
						IF ~~ THEN REPLY ~Bisher wart Ihr in Eurer Unternehmung nicht sehr erfolgreich.~ + not_successful
						END
						
							IF ~~ THEN BEGIN not_successful
							SAY ~Verärgert mich nicht! Ihr würdet es nicht überleben, meinen entfesselten Zorn zu erleben.~
							IF ~~ THEN REPLY ~Ach, Euer Zorn ist doch nur Zeichen Eures kläglichen Versagens.~ GOTO failure01
							END
							
								IF ~~ THEN BEGIN failure01
								SAY ~Ihr habt Euch mit Euren Taten einen mächtigen Feind geschaffen, <CHARNAME>! Einen Feind, der nichts unversucht lassen wird, Euer Leben zu beenden!~
								IF ~~ THEN GOTO bye 
								END
						
						IF ~~ THEN BEGIN well_see
						SAY ~Wir werden sehen.~
						IF ~~ THEN REPLY ~Und der... andere Teil? Wo ist der andere Mith Barak?~ GOTO other_part
						END
						
							IF ~~ THEN BEGIN other_part
							SAY ~Das wisst Ihr doch schon längst, auch wenn es nicht weiter von Belang ist!~
							IF ~~ THEN GOTO bye 							
							END
							
							IF ~~ THEN BEGIN bye
							SAY ~Diese Plauderei ist jetzt zu Ende. Meine Herrin ruft mich, und Ihr solltet Euch überlegen, auf welche Weise Ihr von dieser Welt scheiden möchtet!~
							IF ~~ THEN DO ~SetGlobal("AC#ACIL77TalkedToMalphas","GLOBAL",1)
							//EraseJournalEntry(@61000)
							//AddJournalEntry(@61001,QUEST)
							CreateVisualEffectObject("SPDIMNDR",Myself) 
							Wait(1)				
							DestroySelf()~ EXIT 
							END



