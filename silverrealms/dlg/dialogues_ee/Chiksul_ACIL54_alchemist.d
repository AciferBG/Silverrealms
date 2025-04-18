BEGIN ~AC#STO01~

IF ~True()~ THEN BEGIN 0
  SAY ~Seid gegrüßt, *Jyff*. Ich habe hier einige gute Tränke für Euresgleichen, solltet Ihr denn daran Interesse haben.~
  IF ~Global("AC#RotheQuest","GLOBAL",2)
  Global("ChiksulRothe","ACIL54",0)~ THEN REPLY ~Ich benötige einen speziellen... Trank, der das Feuer der Liebe wieder neu entfachen könnte.~ + potion_for_rothe
  IF ~~ THEN REPLY #26058 /* ~Ihr habt Tränke? Lasst mich einen Blick darauf werfen.~ */ DO ~StartStore("AC#STO01",LastTalkedToBy())~ EXIT
  IF ~~ THEN REPLY #26059 /* ~Nichts für mich, danke.~ */ GOTO 1
  IF ~Global("AC#Return_to_Surface","GLOBAL",4)~ THEN REPLY ~Ich benötige etwas Quecksilber.~ + need_mercury
END

	IF ~~ THEN BEGIN need_mercury
	SAY ~Quecksilber? Ich kann Euch einige Tropfen geben. Das macht dann 4000 Goldmünzen.~
	IF ~~ THEN REPLY ~4000 Goldmünzen?~ GOTO 4000_coins 
	IF ~~ THEN REPLY ~Vergesst es. Ich werde anderswo nach der Substanz suchen.~ + forget_about_mercury
	IF ~PartyGoldGT(3999)~ THEN REPLY ~Also gut, hier ist das Gold.~ DO ~TakePartyGold(4000)~ GOTO buy_mercury
	IF ~PartyGoldLT(4000)~ THEN REPLY ~So viel Gold habe ich nicht, bedaure.~ GOTO not_enogh_money_mercury
	END
	
		IF ~~ THEN BEGIN not_enogh_money_mercury
		SAY ~Tja, <RACE>, dann solltet Ihr Euch in der Stadt nach etwas Arbeit umsehen, um Euer Geld zusammen zu bekommen!~
		IF ~~ THEN EXIT
		END
	
		IF ~~ THEN BEGIN 4000_coins
		SAY ~He, die Tatsache, dass ich kein Zwerg bin, bedeutet nicht, dass ich Euch hier etwas umsonst gebe! 4000 Goldmünzen sind's und keine weniger!~
		IF ~PartyGoldGT(3999)~ THEN REPLY ~Also gut, hier ist das Gold.~ DO ~TakePartyGold(4000)~ GOTO buy_mercury
		IF ~~ THEN REPLY ~Vergesst es. Ich werde anderswo nach der Substanz suchen.~ + forget_about_mercury
		IF ~PartyGoldLT(4000)~ THEN REPLY ~So viel Gold habe ich nicht, bedaure.~ GOTO not_enogh_money_mercury
		END
		
			IF ~~ THEN BEGIN buy_mercury
			SAY ~Kunden wie Euch mag ich am gernsten, wisst Ihr? Sich einfach einmal eine handvoll Quecksilber zu leisten, alle Achtung! Also passt auf, hier ist das Zeug, aber gebt Acht, dass es Euch nicht zwischen den Fingern entrinnt.~
			IF ~~ THEN DO ~GiveItemCreate("AC#MERC1",LastTalkedToBy,1,0,0)
			EraseJournalEntry(@64220)
			AddJournalEntry(@64221,QUEST)~ EXIT 
			END
		
		IF ~~ THEN BEGIN forget_about_mercury
		SAY ~Wir Ihr meint. Ich kann auch nichts für die hohen Preise. Einige Zwerge sind ganz besessen davon, aus Quecksilber Gold herzustellen. Geschafft hat's noch keiner, aber gut für's Geschäft ist es allemal. Irgendwo in einer verlassenen Mine soll noch etwas Erz zu finden sein. Viel Hoffnung würde ich mir dabei nicht machen.~
		IF ~~ THEN EXIT
		END

IF ~~ THEN BEGIN 1 // from: 0.1
  SAY #26057 /* ~Ganz wie Ihr wollt.~ */
  IF ~~ THEN EXIT
END

	IF ~~ THEN BEGIN potion_for_rothe
	SAY ~Hat Snorri, der Rothézüchter, Euch geschickt?~
	IF ~~ THEN REPLY  ~Ja.~ GOTO yes_snorri_sent_me
	IF ~~ THEN REPLY  ~Nein.~ GOTO no_snorri_did_not_send_me
	END
	
		IF ~~ THEN BEGIN no_snorri_did_not_send_me
		SAY ~Na, dann ist ja gut. Kam mir so verdächtig vor! Dieser Zwerg ist nämlich wirklich hartnäckig! Ich habe ihm schon tausendmal gesagt, dass er sich die Idee mit den Liebestränken aus dem Kopf schlagen soll!~
		=
		~Also, an Eurer Stelle würde ich es einmal mit einem Trank der Lebenskraft versuchen. Das macht Euch munter und könnte Euer Liebesleben wieder in Schwung bringen.~
		IF ~~ THEN REPLY  ~Danke für den Hinweis.~ DO ~SetGlobal("ChiksulRothe","ACIL54",1)~ GOTO need_something_else
		END
		
		IF ~~ THEN BEGIN yes_snorri_sent_me
		SAY ~Dieser Zwerg ist wirklich hartnäckig! Ich habe ihm schon tausendmal gesagt, dass er sich die Idee mit den Liebestränken aus dem Kopf schlagen soll!~
		IF ~~ THEN REPLY  ~Was ist daran denn so schlimm?~ GOTO whats_wrong_with_potion
		END
		
			IF ~~ THEN BEGIN whats_wrong_with_potion
			SAY ~Es ist nicht schlimm, es ist gefährlich! Tiefenrothé können sehr aggressiv werden, wenn sie in Paarungslaune sind. Nicht auszudenken, was passieren könnte, wenn eines dieser Tiere hier in der Zitadelle herumtobt!~
			IF ~~ THEN REPLY  ~Nun, wenn das so ist, werde ich den Trank lieber nicht nehmen.~ GOTO not_use_potion
			IF ~~ THEN REPLY  ~Danke für den Hinweis, aber ich versuch's trotzdem.~ GOTO yes_use_potion
			END
			
				IF ~~ THEN BEGIN yes_use_potion
				SAY ~Nun ja, wenn der Rothé tot umfällt, habe ich diesen lästigen Zwerg nicht mehr ständig hier bei mir im Laden stehen. Also gut, ich sage Euch, was Ihr braucht: Zehn Tränke der Lebenskraft könnten einen Rothé richtig in Fahrt bringen - oder Euch eine Menge Ärger einhandeln. Das kann niemand vorhersehen.~
				IF ~~ THEN REPLY  ~Danke für den Hinweis.~ DO ~SetGlobal("ChiksulRothe","ACIL54",1)~ GOTO need_something_else
				END
				
					IF ~~ THEN BEGIN need_something_else
					SAY ~Gern geschehen. Braucht Ihr sonst noch was?~
					IF ~~ THEN REPLY #26059 /* ~Nichts für mich, danke.~ */ GOTO 1
					IF ~~ THEN REPLY ~Ich würde gerne Eure Tränke sehen.~ DO ~StartStore("AC#STO01",LastTalkedToBy())~ EXIT
					END
				
				IF ~~ THEN BEGIN not_use_potion
				SAY ~Sage ich doch. Zehn Tränke der Lebenskraft für einen Tiefenrothé - was für eine Idee. Tss.~
				IF ~~ THEN DO  ~SetGlobal("ChiksulRothe","ACIL54",1)~ EXIT
				END

