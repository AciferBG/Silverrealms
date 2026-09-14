BEGIN ~AC#SORNI~

BEGIN ~AC#ANT64~

	IF ~~ THEN BEGIN abishai_attack_iltkazar
	SAY ~Deshalb galt der Angriff dieser... dieser Monster auch seinem Körper hier in der Stadt!~
	IF ~~ THEN EXTERN ~AC#STURV~ why_hostage
	END
	
BEGIN ~AC#ELERN~

	IF ~~ THEN BEGIN mithbarak_curse_01
	SAY ~Unser König ist verflucht und deshalb zu einer Statue erstarrt?~
	IF ~~ THEN REPLY ~Ja. In seinen Schlafensperioden konnte er in Drachenform die Astralebene bereisen, während sein Zwergenkörper hier zur Säule erstarrt auf dem Thron saß.~ EXTERN ~AC#BETTA~ chain_mith_astral_01
	END
	
	IF ~~ THEN BEGIN dragon_attack_beldas
	SAY ~...deshalb auch der Angriff auf Beldas durch einen roten Drachen!~
	IF ~~ THEN EXTERN ~AC#BETTA~ dragon_attack_beldas_02
	END
	
	IF ~~ THEN BEGIN how_travel_to_astralplane
	SAY ~Könnte einer unserer Priester dann ein Portal zu dieser Astralebene öffnen?~
	IF ~~ THEN EXTERN ~AC#TORTH~ send_in_the_army
	END
	
BEGIN ~AC#TORTH~

	IF ~~ THEN BEGIN send_in_the_army
	SAY ~Tut das! Dann schicken wir unsere besten Krieger hindurch und zeigen es diesen Teufeln!~
	IF ~~ THEN EXTERN ~AC#TURBA~ stealthy_travel
	END
	
BEGIN ~AC#STURV~

	IF ~~ THEN BEGIN why_hostage
	SAY ~Warum halten die Anhänger dieser Drachengöttin unseren... König denn überhaupt fest?~
	IF ~~ THEN REPLY ~Das weiß ich auch nicht. Mithbarakaz, wie Euer König in vollem Namen eigentlich heißt, scheint über mächtiges Wissen zu verfügen und deshalb auch von einem anderen Gott seiner Art, Kalzareinad, verflucht worden zu sein.~ EXTERN ~AC#VRONI~ kalazareinad_01
	END
	
BEGIN ~AC#FENYL~

BEGIN ~AC#TURBA~

	IF ~~ THEN BEGIN mith_astral_02
	SAY ~Das bedeutet, in den fünfundsiebzig Jahren, in denen er hier immer regungslos auf dem Thron verharrte, verließ sein Drachenkörper die Zwergengestalt und verweilte auf der Astralebene? Und nach dieser Zeit vereinten sich beide Wesen wieder für fünfundzwanzig Jahre in dem uns allen wohlbekannten Charakter unseres Königs Mith Barak?~
	IF ~~ THEN REPLY ~So scheint es wohl gewesen zu sein, ja.~ + why_not_back
	END
	
		IF ~~ THEN BEGIN why_not_back
		SAY ~Warum ist er dann diesmal nicht zu der errechneten Zeit in seinen Körper zurückgekehrt?~
		IF ~~ THEN REPLY ~Weil er auf der Astralebene von etwas sehr Mächtigem gefangengehalten wird.~ EXTERN ~AC#VRONI~ mith_hostage
		END

	IF ~~ THEN BEGIN stealthy_travel
	SAY ~Es gibt Zauber, um die Astralebene zu bereisen, aber ich bezweifle, dass wir mit einer unserer Kompanien bei so einem Unterfangen Erfolg haben könnten.~
	IF ~~ THEN REPLY ~Wir sollten auch nicht durch einen Zauber, sondern durch ein Portal in diese Ebene reisen.~ EXTERN ~AC#BETTA~ chain_torglor_01
	END
	
BEGIN ~AC#VRONI~

	IF ~~ THEN BEGIN mith_hostage
	SAY ~Wenn ich mir die ganzen Verwüstungen in der Halle des Regentschaftsrates ansehe, vermute ich, dass es etwas mit dem fünfköpfigen Drachensymbol zu tun hat, welches sich in unseren Runenboden gebrannt hat, um die Schutzzauber zu umgehen.~
	IF ~~ THEN REPLY ~In der Tat ist Euer König wohl in die Fänge eines Dieners von Tiamat, der Herrin der bösen Drachen, geraten.~ EXTERN ~AC#ELERN~ dragon_attack_beldas
	END
	
	IF ~~ THEN BEGIN kalazareinad_01
	SAY ~Warum hat unser König... dieser Drache Mithbarakaz nicht versucht, den Fluch, der auf ihm lastete, zu bannen?~
	IF ~~ THEN REPLY ~Weil der Drachengott, der ihm das angetan hat, bereits tot ist.~ EXTERN ~AC#BETTA~ kalzareinad_02
	END
	
BEGIN ~AC#BETTA~

	IF ~~ THEN BEGIN dragon_attack_beldas_02
	SAY ~Dazu habe ich auch etwas herausgefunden, aber fahrt Bitte zunächst mit Eurem schockierenden Bericht fort, <CHARNAME>.~
	IF ~~ THEN REPLY ~Jedenfalls sitzt die astrale Form Eures Königs in der Astralebene fest und kann nicht zurück in seinen Körper.~ EXTERN ~AC#ANT64~ abishai_attack_iltkazar
	END
	
		IF ~~ THEN BEGIN kalzareinad_02
		SAY ~Und so schließt sich der Kreis. Ich nehme an, der tote Körper des Gottes treibt auf der Astralebene?~
		IF ~~ THEN REPLY ~So ist es. Mithbarakaz suchte nach einem Weg, dort von seinem Fluch befreit zu werden.~ + kalzareinad_03
		END
		
			IF ~~ THEN BEGIN kalzareinad_03
			SAY ~Das bedeutet, jemand müsste auf die Astralebene reisen, dort nach unserem König suchen, ihn aus den Fängen seiner Häscher zu befreien und versuchen, den Fluch von ihm zu nehmen?~
			IF ~~ THEN REPLY ~Genau das ist der Plan, ja.~ EXTERN ~AC#ELERN~ how_travel_to_astralplane
			END


// ---------------------------------------------
// Dunnabar Steinschulter in Thronsaal ACIL64
// ---------------------------------------------

BEGIN ~AC#DUN64~

IF ~GlobalGT("AC#HatharQuest","GLOBAL",0)~ THEN BEGIN hello_whats_with_hathar
  SAY ~Habt Ihr Hathar schon gefunden?~
	IF ~~ THEN REPLY ~Nein, ich suche noch danach.~ + keep_on_searching_for_hathar
	IF ~Global("AC#HatharQuest","GLOBAL",3)~ THEN REPLY ~Ich bedaure, Euch mitteilen zu müssen, dass Euer Sohn tot ist.~ + hathar_dead
END

	IF ~~ THEN BEGIN keep_on_searching_for_hathar
	SAY ~Bitte sucht nach meinem Sohn.~
	IF ~~ THEN EXIT
	END
	
	IF ~~ THEN BEGIN hathar_dead
	SAY ~Was? Tot? N-nein... nein...~
	IF ~~ THEN EXTERN ~AC#GROM2~ sorry_for_hathar
	END
		
	IF ~~ THEN BEGIN sorry_for_hathar_02
	SAY ~Das ist nur die Schuld dieses verfluchten Königs! Ein Leben lang habe ich ihm treu gedient. Und was ist der dank? Jetzt habe ich meine Söhne verloren!~
	IF ~~ THEN EXTERN ~AC#GROM2~ sorry_for_hathar_03
	END

	IF ~~ THEN BEGIN goodbye_hathar
	SAY ~Was für eine verfluchte Stadt dies doch ist! Die Götter haben uns verlassen!~
	IF ~~ THEN DO ~SetGlobal("AC#HatharQuest","GLOBAL",10)
	EscapeArea()~ EXIT
	END
	
IF ~Global("AC#RC_Spiderstalkings","GLOBAL",1)~ THEN BEGIN hello_in_throneroom
  SAY ~Nur damit das klar ist- ich lasse den König keinen Wimpernschlag aus den Augen, <CHARNAME>!~
	++ ~Aber ich...~ + hrmpf
END

	IF ~~ THEN BEGIN hrmpf
	SAY ~Hrmpf.~
	IF ~~ THEN  EXIT
	END
/*	
	IF ~~ THEN BEGIN its_true
	SAY ~Das ist wahr, Meister Gromi. Ich habe ihn dorthin begleitet.~
	++ ~Was?~ EXTERN ~AC#GROM2~ you_did_WHAT
	END
	
		IF ~~ THEN BEGIN i_am_bodyguard
		SAY ~Ich bin als Herr der Bronzemaske der Leibwächter des Königs und ihm zu absoluter Treue verpflichtet!~
		++ ~Er hat Euch nie gesagt, was er mit seinen Ausflügen bezwecken wollte, nicht wahr?~ + mith_never_said_anything
		END
		
			IF ~~ THEN BEGIN mith_never_said_anything
			SAY ~Er verlor kein Sterbenswörtchen, was er an der Oberfläche überhaupt suchte.~
			++ ~Dann wart Ihr also der mysteriöse Begleiter, der Mith Barak zu diesem toten Drachen begleitet hat?~ + mith_dragon_cemetary
			END
			
				IF ~~ THEN BEGIN mith_dragon_cemetary
				SAY ~Nein, dorthin ist er alleine aufgebrochen. Ich dachte immer, es geht um die Suche nach seinen Ahnen, aber dass es etwas mit seinem Zustand zu tun haben könnte - darauf bin ich wirklich nicht gekommen.~
				++ ~Dunnabar, Ihr müsst uns sagen, an welchem Ort der Oberfläche Ihr gewesen seid. Vielleicht hängt dies mit Mith Baraks Schlaf zusammen!~ + where_have_you_been
				END
				
					IF ~~ THEN BEGIN where_have_you_been
					SAY ~Das kann ich nicht. Ich habe dem König geschworen, mit keinem Bewohner des Unterreichs jemals darüber zu reden.~
					++ ~Deshalb komme ich ja von der Oberfläche. Ist Euch da vielleicht schon ein Zusammenhang aufgefallen?~ EXTERN ~AC#GROM2~ where_have_you_been_02
					END
					
						IF ~~ THEN BEGIN where_have_you_been_03
						SAY ~Hmm... so habe ich das noch gar nicht betrachtet... Wir sind aus dem Unterreich tatsächlich zu zweit aus Iltkazar aufgebrochen, weil Mith Barak zu diesem Ort im Norden wollte, den man den Drachenfriedhof nennt.~
						++ ~Wie seid Ihr von Iltkazar aus dem Unterreich gekommen?~ + how_did_you_get_there
						END
						
							IF ~~ THEN BEGIN how_did_you_get_there
							SAY ~Durch Drakkalor.~
							++ ~Drakkalor?~ EXTERN ~AC#GROM2~ drakkalor
							END
	
								IF ~~ THEN BEGIN no_dragon_seen
								SAY ~Der König erwähnte, dass wir in diesem Gebiet aufpassen müssen. Von einem Drachen hat er nichts gesagt. Wir haben auch keinen gesehen.~
								=
								~Jedenfalls sind wir tatsächlich irgendwann an das helle Licht des Tages gekommen. Den Rest des Weges ist Mith Barak allein gegangen. Der Drachenfriedhof befand sich irgendwo weiter nördlich, meinte er.~
								IF ~~ THEN REPLY ~Geht es vielleicht auch etwas genauer?~ + dont_know_location
								END
								
									IF ~~ THEN BEGIN dont_know_location
									SAY ~An der Oberfläche sieht alles so gleich aus! Mith Barak führte uns zu diesem großen Gebirge, in der Ferne sahen wir sogar schneebedeckte Gipfel!~
									++ ~Das klingt nach den Wolkengipfeln. Ihr könnt mir nicht genauer sagen, wo sich dieser Ort befindet?~ + dont_know_location_02
									END
									
										IF ~~ THEN BEGIN dont_know_location_02
										SAY ~Beim besten Willen, nein. Und die letzte Strecke wollte er wie gesagt ganz allein zurücklegen. Er hatte den Ort wohl in einem Buch nachgelesen.~
										IF ~~ THEN EXTERN ~AC#GROM2~ mithbarak_should_know_location
										END
										*/
// ---------------------------------------------
// Gromi Arnskull in Thronsaal ACIL64
// ---------------------------------------------

BEGIN ~AC#GROM2~
// Travel to Drakkalor
IF ~Global("Mith_Dragon","ACIL64",4)~ THEN BEGIN hello_journey_to_astral
  SAY ~Viel Glück auf Eurer Suche nach unserem König, <CHARNAME>. Wo immer dies auch sein möge. Die Hoffnung unserer ganzen Stadt liegt auf Euren Schultern.~
IF ~~ THEN  EXIT
END

IF ~~ THEN BEGIN goodbye_travel_to_astral
	SAY ~Leider bleibt uns nicht viel Zeit für lange Abschiedszeremonien. Vertreter der Clans, geht Bitte zurück in Eure Zitadellen und steht den Bewohnern unserer Stadt nach dem großen Unheil bei. Ich wünsche Euch viel Glück bei Eurer Reise. Mögen die Morndinsamman über Euch wachen.~
	IF ~~ THEN DO ~SetGlobal("Mith_Dragon","ACIL64",3)
	AddJournalEntry(@64900,QUEST)~ EXIT
	END
	
// The truth about king Mith Barak

IF ~Global("Mith_Dragon","ACIL64",2)~ THEN BEGIN announcement
  SAY ~Zwerge Iltkazars, Freunde! <CHARNAME> war vor der Katastrophe, die über unsere Stadt hereingebrochen ist, an die Oberfläche aufgebrochen, um die Geheimnisse über unseren schlafenden König zu lüften. Hört nun, was <PRO_HESHE> Euch zu berichten hat!~
  =
  ~<CHARNAME>, berichtet bitte in allen Einzelheiten, was Ihr herausgefunden habt.~
//IF ~~ THEN REPLY ~Also gut. Nachdem ich an die Oberfläche zurückgekehrt war, suchte ich den Ort auf, den Mith Barak erwähnt hatte, den Drachenfriedhof. Hier wurde ich von einem Githyanki und einem Drachen angegriffen.~ EXTERN ~AC#ELERN~ chain_attacked_by_gith_with_dragon
IF ~~ THEN REPLY ~Euer König ist ein Silberdrache, der in einer Zwergengestalt gefangen ist.~ EXTERN ~AC#ANT64~ chain_mith_dragon_01
END

IF ~Global("AC#HatharQuest","GLOBAL",11)~ THEN BEGIN goodbye_dunnabar
  SAY ~Da geht er von dannen, der stolze Dunnabar, gebrochen und vergrämt. Was ist nur aus unserer Stadt geworden?~
  =
  ~Doch alles Wehklagen nützt nichts, denn wir müssen die weiteren Schritte planen, um den Untergang unserer Stadt abzuwenden. Was für ein böses Schicksal, dass uns diese Teufel gerade in diesem Moment heimsuchten, als Ihr ins Unterreich zurückkehrtet! Sagt, <CHARNAME>, welche Neuigkeiten bringt Ihr as den Landen des Lichts zu uns herunter?~
IF ~~ THEN REPLY ~Ich habe viel in Erfahrung gebracht. In aller Kürze: Euer König ist ein Drache in Zwergengestalt, der auf der Astralebene gefangen gehalten wird.~ + mith_gromi_dragon
END

	IF ~~ THEN BEGIN mith_gromi_dragon
	SAY ~Bitte was? Wartet, das müssen die anderen Zwerge mit anhören.~
	=
	~Wachen! Ruft die Clanführer der Zitadellen und die verbliebenen Mitglieder des Regentschaftsrates herbei!~
	IF ~~ THEN DO ~SetGlobal("Mith_Dragon","ACIL64",1)~ EXIT
	END

IF ~GlobalGT("AC#HatharQuest","GLOBAL",0)
GlobalLT("AC#HatharQuest","GLOBAL",10)~ THEN BEGIN hello_whats_with_hathar_gromi
  SAY ~Redet Bitte mit Dunnabar, wenn Ihr etwas über seinen Sohn in Erfahrung bringen konntet. Erst dann werden wir die nächsten Schritte planen.~
IF ~~ THEN  EXIT
END

IF ~Global("AC#BackToSurface","GLOBAL",10)
Global("AC#Clans_Parting","GLOBAL",10)~ THEN BEGIN hello_before_departure
  SAY ~Ihr habt alles beisammen, was Ihr benötigt, um uns an der Oberfläche zu helfen, <CHARNAME>. Redet mit Bresk am Platz von Bhaerynden, wenn Ihr soweit seid, dann werden wir Euch vor den Toren der Stadt verabschieden.~
IF ~~ THEN  EXIT
END

IF ~OR(2)
Global("AC#BackToSurface","GLOBAL",10)
Global("AC#Clans_Parting","GLOBAL",10)~ THEN BEGIN hello_before_departure
  SAY ~Habt Ihr jetzt alles für Eure Reise beisammen, <CHARNAME>?~
	IF ~GlobalGT("AC#Clans_Parting","GLOBAL",2)
	GlobalLT("AC#Clans_Parting","GLOBAL",10)~ THEN REPLY ~Wegen des Drachenfriedhofes...~ + about_clans_parting
	IF ~Global("AC#BackToSurface","GLOBAL",6)~ THEN REPLY ~Wegen meiner Rückkehr an die Oberfläche...~ + about_back_to_surface
	IF ~~ THEN REPLY ~Nein, noch nicht.~ GOTO not_ready_for_back_to_surface
END


IF ~Global("AC#RC_Spiderstalkings","GLOBAL",1)~ THEN BEGIN hello_in_throneroom
  SAY ~Hier finden wir uns nun also wieder zusammen, inmitten des kristallenen Thronsaals vor unserem schlafenden Monarchen.~
	IF ~Global("TalkedToMithBarak","ACIL64",1)~ THEN REPLY ~Wegen König Mith Barak...~ GOTO already_talked_to_mithbarak
	IF ~GlobalGT("AC#Clans_Parting","GLOBAL",2)~ THEN REPLY ~Wegen des Drachenfriedhofes...~ + about_clans_parting
	IF ~Global("AC#BackToSurface","GLOBAL",6)~ THEN REPLY ~Wegen meiner Rückkehr an die Oberfläche...~ + about_back_to_surface
	IF ~Global("TalkedToMithBarak","ACIL64",0)~ THEN REPLY ~Wie geht es dem König?~ GOTO not_talked_to_mithbarak_yet
	//IF ~Global("AC#ACIL23DreamReflection","GLOBAL",2) Global("AC#BackToSurface","GLOBAL",0)~ THEN REPLY ~Wegen der Spinnenschächte...~ GOTO about_spiderstalkings
END

	IF ~~ THEN BEGIN about_back_to_surface
	SAY ~Habt Ihr eine Möglichkeit gefunden, an die Oberfläche zurückzukehren?~
	IF ~PartyHasItem("AC#DRFT2")~ THEN REPLY ~Ja. Ich habe hier noch eine Schwebescheibe der Drow zum Hinaufschweben und für meine Rückkehr zu Euch.~ DO ~SetGlobal("AC#BackToSurface","GLOBAL",10)~ GOTO yes_back_to_surface_whats_clans_parting
	IF ~PartyHasItem("AC#DRFT1")
	Global("AC#RepairDriftdisc","GLOBAL",0)~ THEN REPLY ~Vielleicht. Diese Schwebescheibe der Drow habe ich in den Spinnenschächten gefunden.~ GOTO found_driftdisc
	IF ~~ THEN REPLY ~Nein, noch nicht.~ GOTO not_ready_for_back_to_surface
	END
	
		IF ~~ THEN BEGIN found_driftdisc
		SAY ~Oh! Dann sind diese Spitzohren wenigstens einmal zu etwas nutze! Schwebt sie denn?~
		IF ~~ THEN REPLY ~Nein.~ GOTO driftdisc_not_working
		END
		
			IF ~~ THEN BEGIN driftdisc_not_working
			SAY ~Das hatte ich befürchtet. Fragt am Besten einmal Bettargh um Rat, wie man den Gegenstand wieder in Gang setzen kann.~
			IF ~~ THEN DO ~SetGlobal("AC#RepairDriftdisc","GLOBAL",1)~ EXIT 
			END
	
		IF ~~ THEN BEGIN yes_back_to_surface_whats_clans_parting
		SAY ~Das ist großartig! Und wisst Ihr auch, wo sich dieser Ort befindet, den Mith Barak besucht hatte?~
		++ ~Nein, noch nicht.~ + again_talk_to_bettargh_about_stone
		IF ~Global("AC#Clans_Parting","GLOBAL",3)~ THEN REPLY ~Ich habe ein Buch, das mir den Weg dorthin zeigen könnte, habe es aber noch nicht gelesen.~ GOTO not_acil46_revealed
		IF ~Global("AC#Clans_Parting","GLOBAL",4)~ THEN REPLY ~Ja. Ich habe Borthuns Buch von Anthan Diamantklinge erhalten. Dort steht beschrieben, wo sich dieser Ort an der Oberfläche befindet.~ DO ~SetGlobal("AC#Clans_Parting","GLOBAL",10)~ GOTO yes_acil46_revealed_02
		END
		
			IF ~~ THEN BEGIN again_talk_to_bettargh_about_stone
			SAY ~Wie gesagt, Ihr solltet mit Bettargh über diesen Ort an der Oberfläche reden.~
			IF ~~ THEN EXIT
			END
			
			IF ~~ THEN BEGIN yes_acil46_revealed_02
			SAY ~Das ist ja fantastisch, <CHARNAME>! Seid Ihr bereit aufzubrechen?~
			IF ~~ THEN REPLY ~Ja. Ich kann aufbrechen.~ GOTO yes_ready_for_back_to_surface
			IF ~~ THEN REPLY ~Nein, noch nicht.~ GOTO not_ready_for_back_to_surface
			END

// Gromi kondoliert Dunnabar
	IF ~~ THEN BEGIN sorry_for_hathar
	SAY ~Es tut mir leid, Dunnabar. Die gesamte Stadt fühlt mit Euch. Ich habe zwar auch einen Sohn verloren, aber der Schmerz, den Ihr jetzt empfinden möget, ist für mich dennoch nicht vorstellbar. Seid Euch gewiss, dass die Morndinsamman jedes Eurer Kinder in der Seelenschmiede voller Stolz empfangen werden.~
	IF ~~ THEN EXTERN ~AC#DUN64~ sorry_for_hathar_02
	END
	
		IF ~~ THEN BEGIN sorry_for_hathar_03
		SAY ~Auch, wenn ich Euren Zorn verstehen kann, so ist dies doch nicht der richtige Ort, ihm freien Lauf zu lassen, Dunnabar.~
		=
		~Geht zurück in die Bronzemaske und bittet Gorm um Vergebung.~
		IF ~~ THEN EXTERN ~AC#DUN64~ chain_hathar_01
		END
	
	IF ~~ THEN BEGIN about_clans_parting
	SAY ~Wisst Ihr, wo sich der Ort ist?~
	IF ~Global("AC#Clans_Parting","GLOBAL",3)~ THEN REPLY ~Ich habe ein Buch, das mir den Weg dorthin zeigen könnte, habe es aber noch nicht gelesen.~ GOTO not_acil46_revealed
	IF ~Global("AC#Clans_Parting","GLOBAL",4)~ THEN REPLY ~Ja. Ich habe Borthuns Buch von Anthan Diamantklinge erhalten. Dort steht beschrieben, wo sich dieser Ort an der Oberfläche befindet.~ DO ~SetGlobal("AC#Clans_Parting","GLOBAL",4)~ GOTO yes_acil46_revealed
	END
	
		IF ~~ THEN BEGIN not_acil46_revealed
		SAY ~Dann holt das schleunigst nach, bei Moradin! Das könnte unsere einzige Spur zu Mith Baraks Rettung sein!~
		IF ~~ THEN  EXIT
		END
		
		IF ~~ THEN BEGIN yes_acil46_revealed
		SAY ~Das ist ja fantastisch, <CHARNAME>! Seid Ihr bereit aufzubrechen?~
		IF ~GlobalGT("AC#DRIFR","GLOBAL",2)~ THEN REPLY ~Ja. Ich habe eine Drow-Schwebescheibe repariert, mit der ich an die Oberfläche zurückkehren kann.~ GOTO yes_ready_for_back_to_surface
		IF ~~ THEN REPLY ~Nein, noch nicht. Ich suche immer noch nach einer Möglichkeit, zurück an die Oberfläche zu gelangen.~ GOTO not_ready_for_back_to_surface
		END
		
			IF ~~ THEN BEGIN not_ready_for_back_to_surface
			SAY ~Sagt Bescheid, wenn Ihr alles beisammen habt. Wir werden solange hier an der Seite unseres Königs verharren.~
			IF ~~ THEN  EXIT
			END
		
			IF ~~ THEN BEGIN yes_ready_for_back_to_surface
			SAY ~So rückt der Abschied näher, auch wenn ich hoffe, dass Ihr bald mit Antworten wieder zu uns zurückkehren werdet.~
			=
			~Wir würden Euch gerne alle verabschieden. Rüstet Euch für den Rückweg gut aus. Sprecht Bresk am Platz von Bhaerynden an, wenn Ihr fertig seid. Er wird uns Bescheid sagen und wir werden Euch alle Lebewohl sagen.~
			IF ~~ THEN DO ~SetGlobal("AC#Goodbye_Iltkazar","GLOBAL",1)
			AddJournalEntry(@64300,QUEST)
			AddexperienceParty(1000)
			~ EXIT
			END		
		
	IF ~~ THEN BEGIN already_talked_to_mithbarak
	SAY ~Ihr habt Euch unseren König also näher angesehen. Was denkt Ihr über seinen Zustand?~
	++ ~Glaubt Ihr, er kann uns hören?~ + can_he_hear_us
	END
	
		IF ~~ THEN BEGIN can_he_hear_us
		SAY ~Das wissen wir nicht. Wenn er bisher aus seinem Schlaf wieder erwacht ist, hat er nie berichtet, wie es ihm in der Zeit seiner Abwesenheit ergangen ist.~
		//++ ~Ich würde Euch gerne noch etwas fragen.~ + ask_questions
		++ ~Ich werde Euch wieder allein lassen.~ + good_bye
		END
		
	IF ~~ THEN BEGIN not_talked_to_mithbarak_yet
	SAY ~Ihr solltet Euch unseren König einmal genauer ansehen. Ich bezweifle zwar, dass Ihr mehr entdecken würdet als die zahlreichen Gelehrten, die sich bereits an ihm versucht haben. Aber mir wäre es wichtig, wenn Ihr Euch selbst ein Bild von ihm machen würdet.~
	++ ~Ich werde Euren Vorschlag beherzigen.~ + good_bye
	END
	
		IF ~~ THEN BEGIN good_bye
		SAY ~Tut das. Wir werden hier an der Seite unseres Königs verharren.~
		IF ~~ THEN  EXIT
		END
												
// ---------------------------------------------
// König Mith Barak
// ---------------------------------------------

BEGIN ~AC#MITH1~

IF ~True()~ THEN BEGIN hello
SAY ~Ihr steht vor König Mith Barak. Sein Anblick ist ergreifend und furchteinflößend zugleich, wie er Euch als glänzende Statue aus seinen leblosen Augen heraus anstarrt. Ihr könnt nicht sagen, ob sich noch ein Funken Leben in diesem Körper befindet.~
IF ~~ THEN REPLY ~König Mith Barak in Ruhe lassen.~ + leave_him_be
END

	IF ~~ THEN BEGIN leave_him_be
	SAY ~Ihr wendet Euch wieder von Mith Barak ab.~
	IF ~~ THEN DO ~SetGlobal("TalkedToMithBarak","ACIL64",1)~ EXIT
	END
	
// CHAIN

CHAIN IF ~~ THEN AC#DUN64 chain_hathar_01
~Um Vergebung bitten? Dafür, dass er unsere Stadt nicht beschützt hat? Ich werde ihm meine prächtige Rüstung vor die Füße knallen, ich werde...~
== AC#GROM2 ~Tut, was immer Ihr müsst, Dunnabar, und tretet in das Zwiegespräch mit Eurem Gott. Wir überlassen Euch Eurem Zorn und Eurer Trauer.~
END
IF ~~ THEN EXTERN ~AC#DUN64~ goodbye_hathar

CHAIN IF ~~ THEN AC#ANT64 chain_mith_dragon_01
~Was redet Ihr da? Unser König, den wir hier vor uns sehen, soll ein Drache sein?~
== AC#FENYL ~Ein Drache? Hier in unseren Hallen?~
== AC#BETTA ~Das ist in der Tat schwer zu glauben.~
== AC#TORTH ~Nach der Verwüstung unserer Stadt ist dies die zweite schlechte Nachricht, die wir verkraften müssen.~
== AC#VRONI ~Warum haben unsere Runen eine solche Illusion nicht gebannt?~
END
++ ~Es ist keine Illusion, sondern ein Fluch, der auf ihm lastet.~ EXTERN ~AC#ELERN~ mithbarak_curse_01

CHAIN IF ~~ THEN AC#BETTA chain_mith_astral_01
~Deshalb das Interesse an der Astralebene!~
== AC#ELERN ~Was ist die Astralebene?~
== AC#BETTA ~Eine Art parallele Ebene des Geistes, die man ohne seinen Körper bereisen kann.~
= ~Habe ich das so richtig ausgedrückt, <CHARNAME>?~
END
++ ~Ich weiß es selbst nicht genau, aber Eure Beschreibung scheint ganz gut zuzutreffen, ja.~ EXTERN ~AC#TURBA~ mith_astral_02
++ ~Das ist richtig. In der Astralebene scheinen Zeit und Raum keine Rolle zu spielen, und dies war der Ort, an dem Mith Barak in seiner Drachengestalt verweilen konnte.~ EXTERN ~AC#TURBA~ mith_astral_02

CHAIN IF ~~ THEN AC#BETTA chain_torglor_01
~...und hier kommt das Buch ins Spiel, welches Beldas aus Kerzenburg besorgen wollte. Es beschreibt Portale, die in diese Ebene führen. Überraschenderweise gibt es davon auch viele im Unterreich.~
= ~Ich habe zahlreiche Stunden damit verbracht, die alten Runentafeln Shanatars zu wälzen und denke, ich bin fündig geworden. Ich vermute, dass sich eines dieser Portale in Torglor befinden könnte.~
== AC#TURBA ~In Torglor? Dem Silberkönigreich?~
== AC#BETTA ~Richtig. <CHARNAME>, dazu müsst Ihr wissen: Torglor war eines der alten Unterkönigreiche Shanatars, das sogenannte Silberkönigreich. *Tor* heißt in unserer Sprache Hügel. Und *glor* bedeutet See.~
== AC#TORTH ~Und was soll das Königreich "Hügelsee" mit der Astralebene zu tun haben, Bettargh?~
== AC#BETTA ~Es gibt im Zwergischen noch eine andere Bedeutung für *tor*, und die bedeutet Seele. Dann hätte dieser Zwergenclan sein Königreich nicht Hügelsee genannt, was auch irgendwie unsinnig erscheint, sondern Seelensee, in Anspielung auf die Astrale See, der Ebene des Geistes. Und der Begriff Silberkönigreich hätte damit auch eine völlig andere Bedeutung, da die Astralebene als ein Meer aus Silber beschrieben wird.~
END
IF ~OR(2)
!PartyHasItem("AC#TORGL")
Global("AC#GithTorglor","GLOBAL",0)~ THEN GOTO chain_gith_in_torglor
IF ~OR(2)
PartyHasItem("AC#TORGL")
Global("AC#GithTorglor","GLOBAL",1)~ THEN REPLY ~Das würde dazu passen, dass ich bei einigen Githyanki eine Silbermünze aus Torglor gefunden habe.~ + chain_gith_torglor_coin

CHAIN IF ~~ THEN AC#BETTA chain_gith_torglor_coin
~Oh, das ist in der Tat ein interessanter Hinweis.~
== AC#ELERN ~Was wollten die Githyanki denn in Torglor?~
END
IF ~~ THEN GOTO chain_gith_in_torglor 

CHAIN IF ~~ THEN AC#BETTA chain_gith_in_torglor
~Die Githyanki, die immer wieder in Erscheinung getreten sind, könnten dieses Portal genutzt haben, um in das Unterreich zu gelangen.~
== AC#ELERN ~Ihr meint, dass die Githyanki mit dieser Drachengöttin unter einer Decke stecken?~
END
IF ~GlobalGT("AC#HatharQuest","GLOBAL",2)~ THEN REPLY ~Das stimmt. Dies erwähnte der Githyanki, der Hathar umgebracht hatte.~ EXTERN ~AC#GROM2~ chain_bettargh_whats_next
++ ~Ich bin schon mehreren Githyanki begegnet, die mich von unserem Vorhaben abhalten wollten.~ EXTERN ~AC#GROM2~ chain_bettargh_whats_next

CHAIN IF ~~ THEN AC#GROM2 chain_bettargh_whats_next
~Was schlagt Ihr also vor, Bettargh?~
== AC#BETTA ~Der einzige nächste sinnvolle Schritt besteht darin, nach Torglor zu reisen. Dort werden sich sehr wahrscheinlich die Githyanki aufhalten, die zumindest als Handlanger dieser Drachengöttin in Erscheinung getreten sind.~
= ~Sicherlich existiert dort auch ein Portal in die Astralebene, welches man benutzen könnte, um Mith Barak - beziehungsweise Mithbarakaz - zu befreien.~
END
IF ~~ THEN REPLY ~Ihr denkt, dass ich diese Reise unternehmen sollte, richtig?~ + chain_who_is_gonna_do_it

CHAIN IF ~~ THEN AC#GROM2 chain_who_is_gonna_do_it
~Ihr habt viel für unsere Stadt getan, <CHARNAME>. Ich kann mir gar nicht mehr vorstellen, dass ich Euch bei unserem ersten Zusammentreffen unter Arrest stellen ließ.~
== AC#ELERN ~Das war auch wirklich eine Schande.~
== AC#VRONI ~Bei dem derzeitigen Zustand unserer Stadt wüsste ich nicht, wer außer Euch, <CHARNAME>, dieses Abenteuer auf sich nehmen könnte.~
END
++ ~Dann ist dies also der nächste Schritt. Ich werde Euch sehr gerne helfen. Auf ins Silberkönigreich Torglor!~ EXTERN ~AC#TURBA~ chain_torglor_via_drakkalor

CHAIN IF ~~ THEN AC#TURBA chain_torglor_via_drakkalor
~Torglor liegt im Norden. Wir müssen <CHARNAME> durch das Drakkalor-Tor gen Norden reisen lassen.~
== AC#GROM2 ~Selbstverständlich steht Euch auch unsere Stadt immer offen, wenn Ihr Verpflegung für Eure Reise benötigt.~
== AC#TURBA ~Ich werde die Wachen anweisen, das Drakkalor-Tor im Norden der Stadt zu öffnen.~
END
++ ~Ich werde also durch das Drakkalor-Tor nach Norden aufbrechen, bis ich Torglor erreiche und dort ein Portal in die Astralebene finde.~ EXTERN ~AC#GROM2~ chain_good_plan

CHAIN IF ~~ THEN AC#GROM2 chain_good_plan
~Das ist ein guter Plan.~
== AC#VRONI ~Es ist auch die einzige Möglichkeit, die uns noch bleibt.~
== AC#ELERN ~Ich finde es schon verrückt, dass Ihr bald in einer anderen Existenzebene sein werdet!~
== AC#TURBA ~Bereitet Euch gut auf Eure Reise vor, <CHARNAME>. Wenn Ihr bereit seid, geht durch das Drakkalor-Tor im Norden.~
== AC#SORNI ~Viel Glück, <CHARNAME>!~
END
IF ~~ THEN + goodbye_travel_to_astral
