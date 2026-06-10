// siebte_tuer.ink
// Scene: Die Garderobe — Frau Zwirndl und die sieben Türen
// Follows from mizzi_confession.ink → mizzi_abschluss

// ── Neue Hinweise dieser Szene ─────────────────────────────────────────────────
VAR sieben_tueren_gesehen = false
VAR lisels_notiz_gesehen  = false


// =============================================================================
=== siebte_tuer_einstieg ===

Die Garderobe des Café Morgenstern ist kleiner, als sie sein müsste.

Das ist nicht sofort offensichtlich. Man sieht: eine Theke, eine Wand mit Haken, nummerierte Fächer für Schirme, einen Spiegel, einen schmalen Durchgang zum Personalbereich. Normal. Ordentlich. Die Art von Raum, den man betritt und sofort vergisst.

Und dann bemerkt man, dass er tiefer wirkt als die Außenwand erlaubt.

Frau Zwirndl steht hinter der Theke und sortiert Nummernmarken. Gleichmäßig, mit der Ruhe von jemandem, der diese Handlung schon zehntausendmal ausgeführt hat.

Als sie dich bemerkt, hört sie nicht auf zu sortieren.

„Mizzi", sagt sie. Keine Frage.

{ mizzi_trust >= 1:
    „Sie hat Ihnen mehr gesagt, als sie wollte. Das ist nicht ihre Schuld — sie sagt immer mehr, wenn ihr jemand zuhört."
}

* [„Die Garderobe hat sieben Türen. Sie haben das selbst gesagt."]
    Frau Zwirndl legt eine Nummernmarke ab. Präzise. Mittig.
    „Ich hab gesagt, dass sie sieben Türen hat." Eine kurze Pause. „Ich hab nicht gesagt, dass das eine Einladung ist."
    ~ zwirndl_trust++
    -> zwirndl_konfrontation_garderobe

* [„Lisel wollte durch die Manteltür. Und konnte nicht."]
    Frau Zwirndl hört auf zu sortieren. Das ist bemerkenswerter, als es klingt.
    „Was hat Mizzi gesagt?"
    „Dass Lisel zwischen die Mäntel wollte. Und nicht durchkam."
    Frau Zwirndl schaut dich an. Dann: „Das stimmt."
    -> zwirndl_konfrontation_garderobe

* [„Zeigen Sie mir, was hier ist."]
    Frau Zwirndl hebt eine Augenbraue. Nicht überrascht — eher wie jemand, der auf ein Argument wartet, das noch nicht gekommen ist.

    „Warum."

    Das ist keine Frage. Das ist eine Bedingung.
    -> zwirndl_konfrontation_garderobe

* [Warten. Die Garderobe ansehen. Zählen.]
    Du schaust. Du zählst.

    Eingang. Theke. Haken links, Haken rechts. Spiegel. Schirmständer. Durchgang. Schubladenwand.

    Sechs sichtbare Dinge. Und etwas, das sich nicht zählen lässt.

    [Die Ermittlerin] Die Maße stimmen nicht. Der Raum ist tiefer, als die Außenwand erlaubt. # voice: die_ermittlerin
    ~ zwirndl_trust++
    -> zwirndl_konfrontation_garderobe


// =============================================================================
=== zwirndl_konfrontation_garderobe ===

Frau Zwirndl legt die Nummernmarken weg. Alle.

„Mizzi hat unterschrieben." Sie sagt das nicht anklagend. Eher wie eine Wettervorhersage, die sich bestätigt hat. „Das Papier hat eine Bestätigung für die rückwärtige Seite dieses Hauses erzeugt. Rückwärtige Seite klingt nach Kohle und Lieferanten." Eine Pause. „In diesem Haus ist die rückwärtige Seite die Seite, die normalerweise nicht existiert."

{ door_examined:
    „Die Kellertür draußen. Ja. Nicht zufällig."
}

{ lisel_garderobe:
    „Lisel wusste, wo die Manteltür ist. Sie hätte durchkommen sollen." Frau Zwirndl sagt das so, als würde sie einen Fehler in einem Bericht beschreiben. „Jemand hat einen Namen als Sperrriegel eingesetzt. Bevor sie ankam."
}

* [„Wessen Namen? Wer hat das getan?"]
    „Das", sagt Frau Zwirndl, „ist die Frage, die ich auch habe."

    Eine Pause.

    „Ihr Name fehlt. Das wissen Sie." Sie schaut dich an. „Es ist möglich, dass das kein Zufall ist."
    ~ zwirndl_trust++
    -> die_schublade_oeffnung

* [„Zeigen Sie mir die sieben Türen."]
    Frau Zwirndl schaut dich an. Dann kurz zur Schubladenwand. Dann zurück.

    „Das ist keine gute Idee."

    Eine Pause.

    „Aber Sie haben das gedacht, bevor Sie gefragt haben."
    ~ zwirndl_trust++
    -> die_schublade_oeffnung

* [„Was ist Salon Siebte Tür?"]
    Frau Zwirndl hält inne. Nicht eingefroren — eher so, wie jemand überlegt, wie viel eine Antwort kostet.

    { zwirndl_trust >= 3:
        „Ein Netzwerk. Sehr alt. Sehr unordentlich." Sie wählt die Worte wie jemand, der aus einem Vorrat nimmt, der begrenzt ist. „Wir nehmen keine Mitglieder auf — man gehört dazu oder man gehört nicht dazu." Eine Pause. „Sie gehören möglicherweise dazu. Das weiß ich noch nicht."
    - else:
        „Ein Name." Mehr sagt sie nicht.
    }
    -> die_schublade_oeffnung


// =============================================================================
=== die_schublade_oeffnung ===

Frau Zwirndl tritt zur Schubladenwand.

Es sind kleine Schubladen — kaum breiter als eine Hand, mit kleinen Messingschildern. Nummern, Namen von Stammgästen, ein paar unleserliche Abkürzungen.

Sie greift nach Schublade 14.

Schublade 14 ist nicht größer als die anderen.

Frau Zwirndl schiebt den Arm hinein.

Der Arm hört nicht auf.

Er geht bis zum Ellbogen. Dann bis zur Schulter. Dann — kurz, sichtbar unangenehm — steckt sie fest. Ein kleines Geräusch, das wie „na gut" klingt. Dann kommt der Arm wieder heraus. In ihrer Hand liegt ein Ordner. Groß, gebunden, vergilbtes Etikett.

Er hätte nicht in die Schublade gepasst. Er hätte nicht einmal in diese Wand gepasst.

Frau Zwirndl legt den Ordner auf die Theke.

„Alte Möbel", sagt sie. „Die verziehen sich."

{ affinity_samtlaeuferin >= 1:
    [Das Tierchen] Das ist keine Schreinerei. Das ist ein Eingang. Du hast schon früher welche gefühlt, ohne zu wissen, was sie waren. # voice: das_tierchen
}
{ affinity_vampirin >= 1:
    [Die Tote] Dieselbe Technik. Nur umgekehrt. Hinein statt heraus. # voice: die_tote
}
{ affinity_jaegerin >= 1:
    [Die Ermittlerin] Schublade 14. Messingschild: unleserlich. Tiefe: nicht messbar. Dokumentieren. # voice: die_ermittlerin
}

* [„Das ist keine schlechte Tischlerei."]
    „Nein", sagt Frau Zwirndl. Kurz, sachlich. „Das ist schlechte Tischlerei mit Benehmen."

    Sie öffnet den Ordner.
    -> die_skizze_lesen

* [Nichts sagen. Den Ordner ansehen.]
    Du sagst nichts. Der Ordner liegt auf der Theke. Er sieht aus, als hätte er dort immer gelegen.

    Frau Zwirndl schaut dich an. „Gut", sagt sie. „Neugierig aber nicht hysterisch. Das ist nützlich."
    ~ zwirndl_trust++

    Sie öffnet den Ordner.
    -> die_skizze_lesen

* [„Kann ich das auch?"]
    Frau Zwirndl schaut dich an. Lange genug, dass die Frage einen Schatten wirft.

    „Das", sagt sie schließlich, „ist eine sehr gute Frage. Und keine, die ich jetzt beantworten werde."
    ~ zwirndl_trust++

    [Die Hungrige] Die Pause davor war eine Antwort. # voice: die_hungrige

    Sie öffnet den Ordner.
    -> die_skizze_lesen


// =============================================================================
=== die_skizze_lesen ===

Auf dem Tisch liegt eine Skizze.

Auf den ersten Blick: eine Grundrisszeichnung. Eingang. Theke. Hakenreihen. Spiegel. Schirmständer. Personalgang. Schubladenwand. Klar, ordentlich, gut lesbar.

Dann zählt man die eingezeichneten Türen.

{ not sieben_tueren_gesehen:
    ~ sieben_tueren_gesehen = true
    ~ clues_collected++
    Sieben. # clue: sieben_tueren
    Eine ist die Eingangstür. Eine ist der Personalgang. Beide sichtbar, beide verzeichnet. Die anderen fünf — eingezeichnet mit derselben ruhigen Linie — existieren nicht dort, wo Wände und Türen normalerweise zusammengehören.
}

Die Beschriftungen sind klein, sorgfältig, alt:

— Gästetür.
— Personaltür.
— Kellertür.
— Manteltür.
— Dienstbotentür.
— Katzentür.
— Siebte Tür.

[Die Pedantin] Sieben Türen in einem Raum dieser Größe widersprechen der Wiener Bauordnung. Das ist entweder eine Drohung oder ein Versprechen. # voice: die_pedantin

Frau Zwirndl lässt dich schauen.

* [„Was ist die Siebte Tür?"]
    „Der Name des Salons." Frau Zwirndl sagt das so, als wäre die Antwort offensichtlich. „Nicht weil wir nach ihr benannt sind. Weil sie existiert. Seit länger, als der Salon existiert."

    Eine Pause. „Wohin sie führt, weiß ich nicht. Ich habe sie einmal gesehen. Das hat gereicht."
    -> lisels_schriftzug_fund

* [„Die Manteltür — das ist die Tür, durch die Lisel wollte."]
    Frau Zwirndl schaut dich an. „Ja."

    Eine kurze Pause. „Gut."
    ~ zwirndl_trust++

    [Die Ermittlerin] Die Manteltür führt nicht in einen anderen Raum. Sie führt in eine andere Art von Ort. Das erklärt, warum sie nicht mit Holz blockiert werden kann. # voice: die_ermittlerin
    -> lisels_schriftzug_fund

* [„Die Katzentür." Nicht als Frage.]
    Frau Zwirndl schaut kurz zur Seite. „Die Katze benutzt sie. Ich habe nicht gefragt."

    Eine kurze Pause. „Sie hat mich einmal mitgenommen. Nur ein Stück weit. Das war höflich von ihr."

    [Das Tierchen] Das ist der Grund, warum die Katze dich anders anschaut als andere Menschen. # voice: das_tierchen
    -> lisels_schriftzug_fund

* [Die Randnotizen lesen.]
    Die Skizze hat Randnotizen. Klein, akkurat, die Handschrift von jemandem, der Beobachtungen für sich selbst festhält.

    Und dann, in einer anderen Handschrift — unregelmäßiger, größer, mit einem langen Aufstrich beim L —
    -> lisels_schriftzug_fund


// =============================================================================
=== lisels_schriftzug_fund ===

In der unteren rechten Ecke der Skizze, leicht schräg, in einer Handschrift, die noch nicht entschieden hat, was für eine sie sein will:

„Lisel war schneller"

Daneben: ein kleiner Mund. Grinsend. Mit einer Lücke, wo ein Zahn fehlt.

Frau Zwirndl sieht es.

Sie sagt nichts. Sie sagt es so, dass es schwer ist.

{ not lisels_notiz_gesehen:
    ~ lisels_notiz_gesehen = true
    ~ clues_collected++
    Der Schriftzug ist nicht neu. Er ist schon eine Weile da — von vorher, bevor alles das passiert ist. # clue: lisels_notiz
}

* [„Was hat sie damit gemeint? Schneller als was?"]
    Frau Zwirndl braucht einen Moment.

    „Als ich." Sie sagt es so, wie man einen Gegenstand ablegt, den man ungern losgelassen hat. „Sie war nirgends oft. Sie war überall zu oft."

    Eine Pause.

    „Das macht sie schwer zu finden. Und leicht, sie zu verlieren."
    ~ zwirndl_trust++
    -> abschluss_siebte_tuer

* [Nichts sagen. Frau Zwirndl schauen lassen.]
    Du sagst nichts.

    Frau Zwirndl schaut die Skizze an. Dann nimmt sie den Ordner und schließt ihn — sorgfältig, wie jemand, der einem Buch die Möglichkeit gibt, aufgehört zu haben.

    „Das hat sie draufgeschmiert." Eine kurze Pause. „Ich hab ihr nie gesagt, dass ich es gesehen hab."
    ~ zwirndl_trust++
    -> abschluss_siebte_tuer

* [„Sie hat hier gespielt. In dieser Garderobe."]
    Frau Zwirndl schaut kurz weg. Nicht weit — nur zur Seite.

    „Gespielt." Sie wiederholt das Wort, als würde sie seinen Geschmack prüfen. „Ja. Sie hat das, was hier ist, nicht als Bedrohung gesehen. Das ist ungewöhnlich."

    Eine Pause.

    „Das ist gefährlich."
    ~ zwirndl_trust++
    -> abschluss_siebte_tuer


// =============================================================================
=== abschluss_siebte_tuer ===

Frau Zwirndl legt den Ordner auf die Ablage. Nicht zurück in die Schublade — sichtbar, auf der Theke. Als wäre das eine Entscheidung.

{ zwirndl_trust >= 3:
    „Sie haben mehr verstanden, als ich erwartet habe." Sie sagt das ohne Kompliment darin. „Das macht Sie nützlicher. Und möglicherweise gefährlicher." Eine kurze Pause. „Ich weiß noch nicht, für wen."
- else:
    „Das ist genug für heute." Frau Zwirndl sagt das so, wie jemand eine Tür schließt, die er nicht abschließen will. Noch nicht.
}

{ companion_active == "zwirndl":
    Sie schaut kurz zur Manteltür — die Tür, die auf der Skizze steht, aber nicht an der Wand.
    „Wenn Sie Lisel finden wollen — und das ist, was Sie wollen, ob Sie das jetzt wissen oder nicht —, dann fangen Sie bei Windschütz an. Nicht bei der Fürsorgestelle. Bei Windschütz selbst."
}

{ companion_active == "mizzi":
    „Mizzi weiß, wo Windschütz dienstags ist." Eine kleine Pause. „Sie hat Ihnen das schon gesagt. Das heißt, sie hat sich entschieden."
}

Eine Nummernmarke fällt von der Theke.

Frau Zwirndl hebt sie nicht auf.

Das ist keine Unaufmerksamkeit.

-> akt1_ende


// =============================================================================
=== akt1_ende ===

Du verlässt die Garderobe.

Der Hof ist noch da. Der Blutfleck auch — immer noch nicht trocken, immer noch höflich rund, immer noch jemandes Aussage über etwas, das hier passiert ist.

Die Katze ist weg.

Du weißt jetzt:

— Wo Lisel flüchten wollte. Nicht, wo sie ist.
— Was Windschütz genommen hat. Nicht, warum.
— Dass du einen Namen hattest. Nicht, welchen.

Das ist in Aurelstein fast schon genug, um weiterzumachen.

{ clues_collected >= 5:
    [Die Ermittlerin] Fünf Hinweise. Das ist in einer Stadt wie dieser eine Theorie. Eine schlechte, aber eine. # voice: die_ermittlerin
- else:
    [Die Ermittlerin] Nicht genug. Aber es ist ein Anfang mit Kontur. # voice: die_ermittlerin
}

{ affinity_samtlaeuferin > affinity_jaegerin && affinity_samtlaeuferin > affinity_vampirin:
    [Das Tierchen] Du kommst wieder. Das weiß die Garderobe schon. # voice: das_tierchen
}
{ affinity_vampirin > affinity_jaegerin && affinity_vampirin > affinity_samtlaeuferin:
    [Die Tote] Die Schuld ist verteilt. Das macht sie nicht kleiner. Das macht sie praktischer. # voice: die_tote
}
{ affinity_jaegerin >= affinity_vampirin && affinity_jaegerin >= affinity_samtlaeuferin:
    [Die Ermittlerin] Windschütz. Dienstags. Das ist ein Termin. # voice: die_ermittlerin
}

-> DONE
