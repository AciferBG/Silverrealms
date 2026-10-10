EXTEND_BOTTOM WSMITH01 13
IF ~PartyHasItem("AC#ILRDS")~ THEN GOTO AC#IL_RedDragonScales
END 

APPEND WSMITH01

IF ~~ THEN BEGIN AC#IL_RedDragonScales
  SAY ~Na, was haben wir denn da? Die Schuppen von einem jungen roten Drachen! Noch weich und biegsam. Bei älteren Drachen werden die Dinger hart wie Eisen.~
  =
  ~Daraus ließe sich eine prächtige Rüstung fertigen! Leicht wie eine Lederrüstung, aber weit widerstandsfähiger. Allerdings bräuchte ich dafür drei dieser Schuppen. Und siebentausendfünfhundert Goldstücke für meine Arbeit.~
  IF ~Global("AC#IL_ForgeRDragScales","GLOBAL",0)
      PartyGoldGT(7499)
      NumItemsParty("AC#ILRDS",3)~
  THEN REPLY ~Drei Schuppen und 7500 Goldstücke? Einverstanden. Macht Euch an die Arbeit!~
       DO ~SetGlobal("AC#IL_ForgeRDragScales","GLOBAL",1)
           TakePartyGold(7500)
           DestroyGold(7500)~
       GOTO 56
  IF ~~ THEN REPLY ~Nein, danke. Habt Ihr vielleicht noch etwas anderes für mich?~
       GOTO AC#IL_RedDragonScalesNo
END

IF ~~ THEN BEGIN AC#IL_RedDragonScalesNo
  SAY ~Wie Ihr meint. Dann sehen wir mal, was Ihr sonst noch habt.~
  COPY_TRANS WSMITH01 13
END

END 

