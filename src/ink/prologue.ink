// prologue.ink
// Rinnstein hinter dem Café Morgenstern — Aurelstein, 1903
// Phase 1 Narrative Prototype

INCLUDE zwirndl_conversation.ink
INCLUDE mizzi_confession.ink
INCLUDE siebte_tuer.ink

// ── Hauptattribute (gesetzt durch Charaktergenerator vor Spielstart) ──────────
VAR stat_koerper  = 2
VAR stat_geist    = 2
VAR stat_seele    = 2
VAR stat_schatten = 2

// ── Fertigkeiten ─────────────────────────────────────────────────────────────
// Startwert 2 für alle. Pfadentwicklung verändert diese später.
VAR skill_dame         = 2
VAR skill_ermittlerin  = 2
VAR skill_gosse        = 2
VAR skill_hungrige     = 1
VAR skill_pedantin     = 1
VAR skill_tote         = 1

// ── Hinweise ──────────────────────────────────────────────────────────────────
VAR clues_collected      = 0
VAR bloodstain_examined  = false
VAR button_found         = false
VAR note_examined        = false
VAR door_examined        = false
VAR pockets_searched     = false
VAR reflection_seen      = false

// ── Pfadaffinität (still, nie direkt benannt) ─────────────────────────────────
VAR affinity_jaegerin     = 0
VAR affinity_samtlaeuferin = 0
VAR affinity_vampirin      = 0

// ── Weltzustand ───────────────────────────────────────────────────────────────
VAR pospischil_bemerkt = false
VAR benedikt_bemerkt   = false
VAR kastner_kommt      = false
VAR mizzi_eindruck     = 0

-> prologue

// =============================================================================
=== prologue ===

Du wachst im Rinnstein hinter einem Kaffeehaus auf, halb unter der eisernen Kellertreppe, halb im offenen Hof. Über dir hängt ein schmaler Morgenhimmel zwischen rußigen Dachkanten, Wäscheleinen und einem schiefen Schild mit goldener Schrift: Café Morgenstern.

Der Boden ist unebenes Kopfsteinpflaster. In den Fugen steht schwarzes Wasser. Es riecht nach kaltem Rauch, Kaffeesatz, Pferdemist, Seife, altem Fett und einem Parfüm, das dir entweder gehört oder dich verfolgt.

Du trägst ein zerrissenes Kleid. Der Saum ist dunkel vor Nässe, ein Ärmel hängt nur noch aus Höflichkeit an deiner Schulter, und an der Taille fehlt ein Knopf, als hätte ihn jemand mit juristischer Entschlossenheit entfernt.

Neben dir liegt ein Blutfleck auf dem Pflaster. Er ist dunkel, rund, beinahe höflich. Er trocknet nicht.

Eine Katze sitzt auf einer Regentonne und betrachtet dich mit der Geduld einer Beamtin kurz vor Dienstschluss.

[Die Ermittlerin] Ein Fleck trocknet nicht. Dein Kleid ist zerrissen. Der Hof sieht aus wie ein Tatort, nur mit schlechterem Kaffee. # voice: die_ermittlerin
[Die Dame] Wenn du jetzt aufstehst, dann bitte so, als wäre der Rinnstein eine exzentrische Sitzgelegenheit. # voice: die_dame
[Die Gosse] Mizzi sieht dich gleich. Entscheide dich schnell: Opfer, Kundschaft oder Problem? # voice: die_gosse
[Die Hungrige] Blut ist Blut. Die Frage ist nur, ob es Warnung, Mahlzeit oder Einladung ist. # voice: die_hungrige
[Das Tierchen] Die Katze blinzelt nicht. Entweder weiß sie etwas, oder sie arbeitet für jemanden. # voice: das_tierchen

-> untersuchungsschleife


// =============================================================================
=== untersuchungsschleife ===

{ clues_collected >= 3: -> zwirndl_eintritt }

* { not bloodstain_examined } [Den Blutfleck untersuchen.]
    -> blutfleck_pruefen
* { not pockets_searched }    [In den eigenen Taschen nach Hinweisen suchen.]
    -> taschen_durchsuchen
* { not note_examined }       [Den verschmierten Lieferzettel an der Wand betrachten.]
    -> lieferzettel_pruefen
* { not door_examined }       [Die Kellertür untersuchen.]
    -> kellertuer_pruefen
*                             [Aufstehen und so tun, als sei dies eine gewählte gesellschaftliche Position.]
    -> aufstehen
* { not reflection_seen }     [Das eigene Gesicht im Spiegelbild einer Fensterscheibe ansehen.]
    -> spiegelbild
+ [Mizzi ansprechen, bevor sie dich offiziell bemerkt.]
    -> mizzi_ansprechen
+ [Die Katze ansprechen.]
    -> katze_ansprechen
-> untersuchungsschleife


// =============================================================================
=== blutfleck_pruefen ===
~ temp w = RANDOM(1, 6) + skill_ermittlerin
Du gehst in die Hocke. Der Fleck ist dunkel und beinahe perfekt rund.
{ w >= 5: -> blutfleck_erfolg | -> blutfleck_misserfolg }

= blutfleck_erfolg
~ bloodstain_examined = true
~ clues_collected++
~ affinity_jaegerin++
Der Fleck wurde nicht vergossen. Er wurde abgelegt. # clue: bloodstain

Das klingt nach einem kleinen Unterschied und ist ein großer: Blut folgt Schwerkraft, Druck, Bewegung. Es spritzt, läuft, verteilt sich entlang des niedrigsten Wegs. Dieser Fleck ist anders — gleichmäßig rund, mit einem Rand, der aussieht wie die Unterschrift einer Person, die weiß, wie Unterschriften auszusehen haben.

Jemand hat hier eine Form gewollt. Kreise entstehen nicht von selbst.

[Die Ermittlerin] Kein Aufprall. Kein Fließen. Das ist kein Unfallort. Das ist eine Ablage. # voice: die_ermittlerin

-> blutfleck_tiefergraben

= blutfleck_misserfolg
Du schaust so genau, dass die Katze anfängt, ebenfalls sehr genau zu schauen — als brauche die Szene eine zweite Perspektive.

Das Problem ist nicht, dass du nichts siehst. Das Problem ist, dass du zu viel siehst: den Schirmständer mit dem falschen Schatten, das Schild, das drei Fingerbreit zu weit links hängt. Aurelstein hat gelernt, interessant falsch zu wirken, damit man nicht auf das richtig Falsche schaut.

Die Katze stößt etwas unter der Regentonne hervor. Ein Messingknopf rollt auf dein Knie zu. Er glänzt, als hätte er gewartet. # clue: brass_button

~ button_found       = true
~ bloodstain_examined = true
~ clues_collected++
~ affinity_jaegerin++
-> untersuchungsschleife

= blutfleck_tiefergraben
* [Den Geruch einordnen — Nahrung, Warnung oder Einladung?]
    ~ temp hw = RANDOM(1, 6) + skill_hungrige
    { hw >= 6:
        Warnung. Nicht Nahrung — der Geruch ist falsch. Zu kalt, zu intentional, wie eine Nachricht in einer Sprache, die du noch nicht weißt zu sprechen, aber erkennst, dass sie an dich gerichtet ist.
        [Die Hungrige] Eine Einladung wäre wärmer. Nahrung wäre dringlicher. Das hier hat eine Meinung über dich. # voice: die_hungrige
        ~ affinity_vampirin++
    - else:
        Dein Körper gibt eine Antwort, bevor du die Frage fertiggestellt hast. Kein Hunger — das wäre einfacher. Eher der Ton, mit dem eine Schuld spricht, die man vergessen hatte.
        [Die Hungrige] Dein Körper weiß etwas über diesen Fleck, das du noch nicht weißt. Die Lücke zwischen diesen beiden Kenntnissen ist der eigentliche Hinweis. # voice: die_hungrige
        ~ affinity_vampirin++
        ~ affinity_samtlaeuferin++
    }
* [Die Form untersuchen — warum ist er so ordentlich?]
    ~ temp pw = RANDOM(1, 6) + skill_pedantin
    { pw >= 6:
        Kreise entstehen nicht von selbst. Es gibt keine Physik, die einen gleichmäßigen Kreis aus vergossenem Blut erzeugt. Ein perfekter Kreis erfordert Absicht, ein Werkzeug oder eine Eigenschaft des Blutes selbst, die dem Standardhandbuch widerspricht.
        [Die Pedantin] Alle drei Optionen sind unbefriedigend. Ich notiere alle drei und lasse die Frage offen. Das ist korrekte wissenschaftliche Praxis. # voice: die_pedantin
        ~ affinity_jaegerin++
    - else:
        Du hast drei Hypothesen und kannst keine ausschließen. Die Pedantin mag es nicht, wenn drei Hypothesen gleichwertig offen stehen. Sie nennt das einen Methodenfehler.
        [Die Pedantin] Die Akte ist offen. Sie wird wiederkommen. # voice: die_pedantin
        ~ affinity_jaegerin++
    }
* [Weitermachen.]
- -> untersuchungsschleife


// =============================================================================
=== taschen_durchsuchen ===
~ pockets_searched = true
~ clues_collected++

Eine verbogene Haarnadel. Eine Quittung ohne Namen — Datum von vor drei Tagen, Gesamtbetrag: 2 Kronen 40. Ein Stück Zucker, halbiert, als hätte jemand die andere Hälfte für später aufgehoben. Ein Papierfetzen mit einem einzigen Wort in einer fremden Handschrift: freiwillig. # clue: pockets

Und dann noch etwas. Etwas Rundes und Kleines — eine Murmel, marmorfarben wie das Innere eines Auges, das dir nie begegnet ist, aber das du vielleicht trotzdem kennst. # clue: pockets_marble

Das ist nicht dein Inventar. Das ist das Inventar einer Person, die kurz davor war, irgendwo zu sein.

[Die Ermittlerin] Kein Name. Keine Identität. Das Wort 'freiwillig' auf einem Fetzen ist entweder eine Erklärung oder ihr Gegenteil. # voice: die_ermittlerin
[Der Zweifel] Wessen Murmel ist das? # voice: der_zweifel

-> untersuchungsschleife


// =============================================================================
=== lieferzettel_pruefen ===
~ note_examined  = true
~ clues_collected++
~ affinity_jaegerin++

Der Lieferzettel wirkt banal: Kaffee, Milch, Kohle, Brot. Schlechte Handschrift, Flecken, Preise.

Aber zwischen den Lieferposten steht ein Stempel, der auf einem Lieferzettel nichts zu suchen hat: # clue: delivery_note

FMoGH — Sichtung erfolgt.

Darunter, halb abgerissen, eine Teilunterschrift: ...Windschütz. Und in der Randspalte: Bestätigung rückwärtiger Zugangsverhältnisse.

[Die Pedantin] Das ist kein Lieferzettel. Das ist ein Lieferzettel, der vorgibt, nur ein Lieferzettel zu sein. # voice: die_pedantin
[Die Ermittlerin] FMoGH. Fürsorgestelle für Minderjährige ohne gesicherten Hausstand. Die Fürsorgestelle war heute Nacht hier. # voice: die_ermittlerin

-> untersuchungsschleife


// =============================================================================
=== kellertuer_pruefen ===
~ temp tw = RANDOM(1, 6) + skill_ermittlerin
{ tw >= 6: -> tuer_erfolg | -> tuer_misserfolg }

= tuer_erfolg
~ door_examined = true
~ clues_collected++
~ affinity_jaegerin++
~ affinity_samtlaeuferin++

Die Tür ist falsch positioniert. Nicht kaputt — falsch. Sie sitzt um einen halben Meter östlicher als die Skizze auf dem Lieferzettel angibt. # clue: cellar_door

{ note_examined:
    Du hast den Lieferzettel gesehen. Die Skizze darauf zeigt die Kellertür dort, wo sie sein sollte. Nicht dort, wo sie ist.
- else:
    An der Wand neben der Tür klebt eine verblasste Lieferskizze. Die Kellertür ist darin eingezeichnet — nicht an dieser Stelle.
}

Das kann ein Fehler in der Skizze sein. Das kann auch bedeuten, dass eine von beiden Positionen nicht die wahre ist.

[Die Ermittlerin] In Aurelstein werden diese beiden Möglichkeiten unterschiedlich schwer bewertet. # voice: die_ermittlerin
-> untersuchungsschleife

= tuer_misserfolg
~ door_examined = true
~ clues_collected++

Die Tür öffnet sich nicht. Du ziehst. Du drückst. Du überlegst, ob Kellertüren grundsätzlich Überzeugungsarbeit brauchen oder nur diese.

Was herausfällt: ein Band aus rosafarbenem Wollstoff, etwa einen Finger breit, durch den Türspalt gesteckt wie eine Notiz in einem Buch. Es gehört jemandem Kleinen. Es riecht nach Kaffeehaus und nach einem Kind, das irgendwo auf etwas wartet. # clue: cellar_door_ribbon

[Das Tierchen] Das Band wurde von innen durchgefädelt. # voice: das_tierchen
-> untersuchungsschleife


// =============================================================================
=== aufstehen ===
~ temp dw = RANDOM(1, 6) + skill_dame
{ dw >= 6: -> aufstehen_erfolg | -> aufstehen_misserfolg }

= aufstehen_erfolg
~ mizzi_eindruck = 1
Du stehst auf. Es ist keine perfekte Auferstehung — der Saum klebt, die Schulter ist feucht. Aber du stehst so auf, als hättest du überlegt, wie jemand in dieser Situation aufstehen würde, und hättest genau das getan.

Mizzi, die den Hintereingang aufgemacht hat, hält inne. Sie ordnet dich um. Der neue Satz lautet: „Kann ich helfen?"

Das ist eine bedeutende soziale Kapitulation. Sie hat entschieden, dass du jemand bist, dem man anbietet zu helfen — nicht jemanden, dem man erklärt, dass Hinterhöfe keine Schlafstätten sind.
-> untersuchungsschleife

= aufstehen_misserfolg
~ pospischil_bemerkt = true
Dein rechtes Knie findet Pflasterstein dreiundzwanzig in der zweiten Reihe links vom Lieferanteneingang. Der Stein nimmt das mit der Gelassenheit eines Zeugen auf, der schon Schlimmeres dokumentiert hat.

Hinten im zweiten Stock schiebt sich ein Vorhang zur Seite. Frau Pospischil, siebenundfünfzig, Witwe eines Kellermeisters, notiert innerlich: Die Person im Rinnstein ist eine Enttäuschung.

Dafür entdeckst du etwas: Der Blutfleck nimmt den Schmutz seiner Umgebung nicht an. Das Pflaster um ihn herum ist dunkel geworden. Er nicht.
{ not bloodstain_examined:
    ~ bloodstain_examined = true
    ~ clues_collected++
    [Die Ermittlerin] Zu rund. Nicht gespritzt, nicht gewischt. Eher platziert als passiert. # clue: bloodstain # voice: die_ermittlerin
}
-> untersuchungsschleife


// =============================================================================
=== spiegelbild ===
~ reflection_seen = true
~ temp stw = RANDOM(1, 6) + skill_tote
{ stw >= 6: -> spiegelbild_erfolg | -> spiegelbild_misserfolg }

= spiegelbild_erfolg
~ affinity_vampirin++
~ affinity_samtlaeuferin++
Das Gesicht im Fensterglas ist deins. Du weißt, dass es deins ist — nicht weil du dich erkennst, sondern weil es sich bewegt, wenn du dich bewegst, und aufgehört hat zu atmen, genau als du aufgehört hast.

Was nicht stimmt: Es schaut dich an. Nicht in dich — an. So wie jemand schaut, der entschieden hat, ehrlich zu sein, und noch auf den richtigen Moment wartet.

Du weißt nicht, welchen Namen das Gesicht hat. Du weißt, dass es denselben hat wie du. Das macht das Problem erst richtig interessant.

[Die Tote] Du erinnerst dich nicht. Das Gesicht erinnert sich vielleicht. Das ist nicht dasselbe. # voice: die_tote
-> untersuchungsschleife

= spiegelbild_misserfolg
~ kastner_kommt = true
Du schaust in die Scheibe. Die Scheibe schaut zurück. Das ist anatomisch korrekt — Reflexionen tun das. Das Problem ist, dass du ungefähr zwei Sekunden gebraucht hast, um dich zu erkennen.

In diesen zwei Sekunden ist die Hintertür aufgegangen.

Herr Kastner, siebenundsechzig, Besitzer des Café Morgenstern, hat eine Meinung über Personen, die in seinen Hinterhof gaffen. Er hat sie mitgebracht.
-> untersuchungsschleife


// =============================================================================
=== mizzi_ansprechen ===
~ temp gw = RANDOM(1, 6) + skill_gosse
{ gw >= 6: -> mizzi_erfolg | -> mizzi_misserfolg }

= mizzi_erfolg
~ mizzi_eindruck = 1
Du bewegst dich, bevor Mizzi die Tür vollständig aufgemacht hat. Richtige Positionierung, richtiger Gesichtsausdruck — du hast hier ein Recht.

Mizzi bleibt auf der Schwelle stehen. Ihr vorbereiteter Satz ordnet sich um.

„Sie sehen aus", sagt sie, „als ob die Nacht mit Ihnen fertig ist und nicht umgekehrt."

Das ist kein Vorwurf. Das ist eine Einladung zu erklären, was passiert ist.
{ not benedikt_bemerkt:
    Vom Küchenfenster aus hat Benedikt Hrdlicka, achtzehn, Hilfsküchenjunge, zugeschaut. Er zieht sich zurück. Er hat registriert, dass du weißt, wie Situationen funktionieren. Das macht dich für ihn uninteressant — was bedeutet, er wird nichts melden.
}
-> untersuchungsschleife

= mizzi_misserfolg
~ mizzi_eindruck = -1
~ kastner_kommt  = true
Zu spät. Mizzi hat dich bereits eingeordnet: Problem.

„Ich schau Herrn Kastner, was er meint", sagt sie.

{ not benedikt_bemerkt:
    ~ benedikt_bemerkt = true
    Vom kleinen vergitterten Küchenfenster beobachtet dich Benedikt Hrdlicka, achtzehn, Hilfsküchenjunge, schon seit drei Minuten. Er hat dich beim Aufwachen gesehen. Er hat dich beim Blutfleck gesehen. Er wird nichts sagen — Schweigen ist in Küchen eine Währung.
    [Die Gosse] Aber er hat dich gesehen. Das ist jetzt ein Faden in der Welt, den nur er kennt. # voice: die_gosse
}
-> untersuchungsschleife


// =============================================================================
=== katze_ansprechen ===
Die Katze betrachtet dich. Du redest mit ihr.

In Aurelstein ist das keine ungewöhnliche Entscheidung. Die Stadt hat schon Seltsameres als Selbstgespräche in Hinterhöfen gesehen, und Katzen haben den Ruf, nicht zu plaudern.

Die Katze blinzelt einmal. Das ist ihre offizielle Antwort.

Dann schiebt sie — langsam, mit dem Ausdruck einer Beamtin, die ein Formular bearbeitet, das sie für unsinnig hält — den Messingknopf unter der Regentonne hervor.

{ not button_found:
    ~ button_found   = true
    ~ clues_collected++
    ~ affinity_samtlaeuferin++
    Ein Messingknopf. Nicht von deinem Kleid. Auf der Rückseite ein winziges Kürzel: FMoGH. # clue: brass_button
    [Das Tierchen] Sie hat ihn schon die ganze Zeit gewusst. # voice: das_tierchen
- else:
    Du hast den Knopf bereits. Die Katze betrachtet ihn, dann dich, dann ihn wieder. Ihre Meinung bleibt unausgesprochen, ist aber spürbar.
}
-> untersuchungsschleife


// =============================================================================
=== zwirndl_eintritt ===

{ kastner_kommt:
    Die Hintertür geht auf. Herr Kastner erscheint in der Türöffnung — breit, siebenundsechzig, mit der Miene eines Mannes, der gleich etwas erklären wird.

    Hinter ihm, kaum sichtbar: eine ältere Frau. Mantelgeruch, Schlüsselbund, höfliche Müdigkeit. Ihr Blick sortiert dich kurz, präzise, ergebnislos.

    „Lassen S' den Herrn Kastner", sagt sie zu ihm, so beiläufig, als würde sie Münzen zählen. „Ich schau nach."

    Herr Kastner sieht aus, als würde er widersprechen wollen. Er widerspricht nicht.
- else:
    Aus dem Hintereingang des Kaffeehauses tritt eine ältere Frau: Mantelgeruch, Schlüsselbund, höfliche Müdigkeit. Ihr Blick sortiert Menschen wie abgegebene Hüte — kurz, sachlich, ohne Ergebnis zu zeigen.
}

„Drei Hinweise", sagt sie. „Das ist in Aurelstein fast schon eine Persönlichkeit."

Sie wartet. Nicht ungeduldig. Eher wie jemand, der weiß, dass die Antwort kommen wird, und sich die Zeit aussucht, in der sie es tut.

„Ich bin Frau Zwirndl. Ich nehme die Mäntel im Morgenstern." Eine kurze Pause. „Ich weiß, dass Lisel weg ist. Ich weiß, dass die Fürsorgestelle heute Nacht hier war. Und ich weiß, dass Sie irgendwie dazugehört haben."

Ihr Blick ist nicht feindselig. Er ist präzise.

„Ich will kein Geständnis. Geständnisse sind oft nur Lügen mit besserer Haltung. Ich will wissen, was wahr ist."

-> zwirndl_antwort


// =============================================================================
=== zwirndl_antwort ===

* [Ehrliche Verwirrung: zugeben, dass du dich an nichts erinnerst.]
    „Ich erinnere mich an nichts. Wirklich nicht. Ich weiß nicht einmal meinen Namen."

    Frau Zwirndl schaut dich an. Lange genug, dass es ein eigenes Gewicht bekommt.

    „Das", sagt sie schließlich, „glaube ich Ihnen. Was ich nicht glaube, ist, dass das die ganze Geschichte ist."
    ~ affinity_jaegerin++

* [Beschämtes Erfinden: eine harmlose Erklärung improvisieren.]
    Du hörst dir selbst beim Reden zu. Die Geschichte klingt plausibel und falsch zugleich — wie ein Schlüssel, der ins Schloss passt, aber nichts aufsperrt.

    Frau Zwirndl hört zu. „Das ist eine ordentliche Erklärung", sagt sie. „Sie haben sie geübt. Auf dem Weg hierher oder schon vorher."
    ~ affinity_samtlaeuferin++

* [Bewusstes Lügen: eine kontrollierte Version anbieten.]
    Du entscheidest dich für eine Version. Eine, die schützt. Plausibel. Nichts verrät, was du noch nicht verstehst.

    „Interessant", sagt Frau Zwirndl. „Das war gut. Zu gut für jemanden, der behauptet, verwirrt zu sein."
    ~ affinity_vampirin++

* [Ausweichend: nichts Belastbares sagen.]
    Du sagst nichts Konkretes. Du lässt Pausen sprechen. Du fragst zurück, bevor du antwortest.

    „Sie sind vorsichtig", sagt Frau Zwirndl. „Das ist vernünftig. Das macht es schwieriger."

* [Gegenfrage: Was wissen Sie? Und warum fragen Sie mich?]
    „Was wissen Sie? Und warum fragen Sie mich?"

    Frau Zwirndl hebt eine Augenbraue. „Eine Gegenfrage ist auch eine Antwort. Sie sagt: Ich traue Ihnen noch nicht. Das ist immerhin ehrlich."
    ~ affinity_jaegerin++

* [Schweigen.]
    Du sagst nichts. Du lässt den Hof antworten, den Blutfleck, die Tür, die Stille.

    Frau Zwirndl wartet. Dann: „Gut. Manchmal ist das Schweigen das Ehrlichste, was man anbieten kann."

-

„Fangen Sie bei dem an, was nicht weglaufen kann", sagt sie schließlich, fast nebenbei. „Fleck, Knopf, Lieferzettel, Tür."

{ clues_collected > 3:
    „Sie haben schon angefangen. Das ist besser als die meisten."
}

-> zwirndl_zweite_runde
