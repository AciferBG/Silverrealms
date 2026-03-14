// ---------------------------------------------
// Das Blutige Bollwerk – Tavernenrumors
// ---------------------------------------------

BEGIN ~AC#ILRU1~

IF ~RandomNum(12,1)~ THEN BEGIN 0 
  SAY ~Gromi Arnschädels Sohn Khaernd ist von seiner Gefangenschaft der Illithiden als ein merkwürdiges Mischwesen aus Illithid und Zwerg entkommen. Kein Wunder, dass der Rat ihn nun irgendwo in Iltkazar versteckt hält.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(12,2)~ THEN BEGIN 1 
  SAY ~Sorni Arnschädel ist die Meisterin der Schmiede. Vierhundert Schmiede hören auf ihr Wort – und keiner wagt es, ihr zu widersprechen.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(12,3)~ THEN BEGIN 2 
  SAY ~Die Drow aus Guallidurth sind wieder in den äußeren Stollen gesichtet worden. Bresk Steinschulter hat bereits doppelte Wachen aufstellen lassen.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(12,4)~ THEN BEGIN 3 
  SAY ~Man sagt, König Mith Barak sitze noch immer reglos auf seinem Thron. Manche flüstern, seine Seele sei weit jenseits der Sterne gefangen.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(12,5)~ THEN BEGIN 4 
  SAY ~Der Gelehrte Bettargh Abgrundlied hat Schränke für Bücher von der Oberfläche aufstellen lassen. Papier! Als ob ein Zwerg Weisheit auf vergänglichem Zeug aufschreiben würde.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(12,6)~ THEN BEGIN 5 
  SAY ~In Dugmarens Bibliothek werkeln die Gnome Nebeluns wieder an irgendeiner verrückten Maschine. Bettargh sagt zwar, sie diene der Forschung – aber meistens fliegt danach ein halber Raum in die Luft.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(12,7)~ THEN BEGIN 6 
  SAY ~Hathar Steinschulter hält das Ultoksamrin-Tor wie ein Erdkoloss seine Tunnel. Wer dort Ärger macht, landet schneller im Staub, als er fluchen sagen kann.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(12,8)~ THEN BEGIN 7 
  SAY ~Die alten Hallen von Shanatar liegen überall um uns herum. Manche sagen, unter Iltkazar gebe es noch versiegelte Tore, die seit tausend Jahren niemand geöffnet hat.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(12,9)~ THEN BEGIN 8 
  SAY ~Turbaern Ghalmrin, unser Hohepriester Dumathoins, kennt mehr geheime Stollen unter Iltkazar als jeder Kartenschreiber der Stadt.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(12,10)~ THEN BEGIN 9 
  SAY ~Wenn Anthan Diamantklinge den Hammer hebt, hören selbst die Schmiede der Arnschädelhalle auf zu reden. Seine Klingen haben schon so manchen Riesen zu Boden geschickt.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(12,11)~ THEN BEGIN 10 
  SAY ~Dunnabar Steinschulter soll selbst in voller Rüstung baden gehen. Angeblich hat er einmal gesagt: "Wenn der Feind kommt, wartet er sicher nicht ab, bis ich mich angezogen habe."~
  IF ~~ THEN EXIT
END

IF ~RandomNum(12,12)~ THEN BEGIN 11 
  SAY ~Bresk Steinschulter gewinnt fast jede Schlacht. Aber wer ihn danach sieht, meint, jeder Sieg mache ihn nur noch mürrischer.~
  IF ~~ THEN EXIT
END
