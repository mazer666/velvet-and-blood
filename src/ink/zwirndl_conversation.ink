// zwirndl_conversation.ink
// Scene: Frau Zwirndls erstes Gespräch — Vertiefung
// Follows directly from prologue.ink → zwirndl_antwort

// ── Companion state ───────────────────────────────────────────────────────────
VAR companion_active  = ""
VAR zwirndl_trust     = 0
VAR mizzi_trust       = 0


// =============================================================================
=== zwirndl_zweite_runde ===

Frau Zwirndl schaut dich an. Nicht lange — aber die Art, wie sie schaut, macht aus kurzer Zeit etwas Schwereres.

Dann dreht sie sich um. Nicht weg — eher so, wie jemand einen Abstand herstellt, der kein Wegehen ist.

„Sie haben", sagt sie, ohne sich vollständig umzudrehen, „Blut am Mundwinkel. Das ist entweder ein Problem oder eine Nachricht. Beides ist unangenehm."

Eine Pause. Die Katze auf der Regentonne blinzelt.

„Lisel", sagt Frau Zwirndl. Der Name landet wie ein Gegenstand, das jemand absetzt — nicht wirft. „Kennen Sie den Namen?"

* [Ja. Ich glaube schon. Aber ich weiß nicht warum.]
    „Das ist ehrlich. Ungewöhnlich ehrlich für jemanden in Ihrer Lage."
    ~ zwirndl_trust++
    Sie schaut jetzt doch zu dir. Kurz, präzise.
    „Lisel ist seit heute Nacht weg. Sie ist elf. Sie kann Türen finden, die nicht existieren. Das macht sie nützlich und das macht sie gefährlich — für Leute, denen es lieber wäre, dass bestimmte Türen nicht gefunden werden."
    -> lisel_erklaerung

* [Nein. Den Namen kenne ich nicht.]
    Frau Zwirndl sagt nichts. Sie wartet so, als habe sie die Pause selbst eingebracht und wolle sie wieder einsammeln, wenn du fertig bist.
    „Interessant", sagt sie schließlich. Kein Urteil. Eine Registrierung.
    ~ zwirndl_trust--
    -> lisel_erklaerung

* [Ein Kind. Sie war hier, bevor ich aufgewacht bin?]
    Frau Zwirndl macht etwas Kleines mit einer Schulter — kein Zucken, eher eine Korrektur.
    ~ zwirndl_trust++
    „Sehr gut. Die meisten würden fragen, wer Lisel ist. Sie fragen, wann."
    „Sie war gestern Abend hier. Nicht heute Morgen."
    -> lisel_erklaerung

* [Warum fragen Sie mich?]
    „Weil Sie in dieser Nacht irgendwie dazugehört haben", sagt Frau Zwirndl. „Und weil der Hof aussieht wie eine Antwort auf eine Frage, die ich noch nicht vollständig gestellt habe."
    -> lisel_erklaerung


// =============================================================================
=== lisel_erklaerung ===

„Die Fürsorgestelle war hier." Frau Zwirndl sagt das so, wie man eine Wetterlage beschreibt: nicht erfreut, aber auch nicht überrascht. „Frau Chorrätin Windschütz. Graue Kleidung, saubere Handschuhe, der Blick einer Frau, die überzeugt ist, dass ihre Zuständigkeit weiter reicht als ihr Papier."

„Mizzi hat etwas unterschrieben. Mizzi hat das nicht böse gemeint. Das ändert nichts an der Unterschrift."

{ note_examined:
    [Frau Zwirndl] „Den Lieferzettel haben Sie gesehen." Eine kurze Pause. „Bestätigung rückwärtiger Zugangsverhältnisse. Das klingt nach Logistik. Es ist Logistik. Nur keine, die mit Milch zu tun hat." # companion: zwirndl.clue_note
}

{ door_examined:
    [Frau Zwirndl] „Die Kellertür. Ja." Sie sagt nicht mehr. # companion: zwirndl.clue_door
}

* [Was hat Windschütz mit Lisel gemacht?]
    „Mitgenommen. Das ist das Wort, das die Fürsorgestelle benutzt. 'Überstellung'. Als wäre Lisel ein Akt, der einen anderen Schreibtisch braucht."
    ~ zwirndl_trust++
    -> windschuetz_und_lisel

* [Warum konnte Lisel nicht fliehen?]
    Frau Zwirndl bleibt still. Das ist eine andere Art von Stille als vorher.
    „Das", sagt sie schließlich, „ist die richtige Frage."
    ~ zwirndl_trust++
    -> lisels_flucht

* [Was wollen Sie von mir?]
    „Ich will wissen, was Sie wissen. Auch wenn Sie es noch nicht wissen."
    -> was_zwirndl_will


// =============================================================================
=== windschuetz_und_lisel ===

„Windschütz ist kein gewöhnlicher Beamter." Frau Zwirndl holt einen Schlüsselbund aus der Tasche — nicht um eine Tür zu öffnen, sondern weil ihre Hände etwas zu tun brauchen. „Sie ist die Art von Beamtin, die genau weiß, welche Türen existieren und welche nicht existieren sollten."

„Sie hat das Papier, das Mizzi unterschrieben hat, als Werkzeug benutzt. Als Schlüssel. Für etwas, das keinen gewöhnlichen Schlüssel braucht."

{ affinity_vampirin >= 2:
    [Die Tote] Das klingt wie etwas, das auch anders funktionieren könnte. Mit anderen Schlüsseln. # voice: die_tote
}

-> lisels_flucht


// =============================================================================
=== lisels_flucht ===

„Lisel kann — konnte — Türen finden. Zwischen Manteln, in Ecken, unter Treppen." Frau Zwirndl sagt das ohne Verzierung. „Das lernt man nicht. Das hat man oder hat es nicht."

„Sie hätte durch die Garderobe fliehen können. Durch meine Garderobe." Eine kleine Pause. „Sie hat es versucht. Es hat nicht funktioniert."

* [Warum nicht?]
    Frau Zwirndl schaut zur Seite. Nicht weg — zur Seite. Das ist ein Unterschied.
    „Weil jemand die Tür blockiert hat. Nicht mit Holz. Mit einem Namen."
    ~ zwirndl_trust++
    -> der_verlorene_name

* [Mit einem Namen?]
    Sie sagt es, bevor Frau Zwirndl es sagt. Frau Zwirndl dreht sich zu ihr.
    „Sie wissen es bereits." Keine Frage.
    ~ zwirndl_trust++
    -> der_verlorene_name

* [Das verstehe ich nicht.]
    „Nein", sagt Frau Zwirndl. „Noch nicht."
    -> was_zwirndl_will


// =============================================================================
=== der_verlorene_name ===

„Bestimmte Türen funktionieren über Ansprüche. Schulden, Erbschaften, Namen, Versprechen — der Anspruch ist der Schlüssel." Frau Zwirndl wählt die Worte wie jemand, der aus einem Vorrat nimmt, der begrenzt ist. „Wenn jemanden ein Name weggenommen wird — oder wenn jemand ihn abgibt —, dann kann dieser Name woanders benutzt werden. Als Riegel. Als falscher Ausweis."

Sie schaut dich an. Direkt, diesmal.

„Sie haben keinen Namen. Sie wissen, dass Sie keinen haben. Ich sage Ihnen jetzt, was das bedeuten kann: Ihr Name wurde benutzt. Als Sperrriegel. Gegen Lisel."

Die Stille, die danach kommt, hat eine andere Textur als die vorherige.

{ affinity_vampirin >= 1:
    [Die Hungrige] Das klingt wie eine Schuld. Schulden haben Zinsen. # voice: die_hungrige
}
{ affinity_samtlaeuferin >= 1:
    [Das Tierchen] Das erklärt, warum die Katze dich anders anschaut als andere Menschen. # voice: das_tierchen
}

-> schuld_und_reaktion


// =============================================================================
=== schuld_und_reaktion ===

* [Ich habe das nicht gewollt.]
    „Das glaube ich Ihnen." Frau Zwirndl sagt das ohne Trost darin. „Wollen hat damit wenig zu tun. Namen, die verloren gehen, gehen selten freiwillig verloren."
    ~ zwirndl_trust++
    -> was_zwirndl_will

* [Wie bekomme ich meinen Namen zurück?]
    Frau Zwirndl sieht aus, als hätte sie diese Frage nicht erwartet, was wahrscheinlich bedeutet, dass sie sie erwartet und gehofft hat, dass sie nicht kommt.
    „Das", sagt sie, „ist eine sehr lange Antwort."
    ~ zwirndl_trust++
    -> was_zwirndl_will

* [Wie bekomme ich Lisel zurück?]
    Diesmal macht Frau Zwirndl das Kleine mit der Schulter nicht. Sie steht still.
    „Zuerst müssen wir wissen, wo sie ist. Und was sie ist, jetzt." Eine Pause. „Das sind möglicherweise nicht dieselbe Frage."
    ~ zwirndl_trust += 2
    -> was_zwirndl_will

* [Sagen Sie mir nicht mehr als das.]
    „Gut", sagt Frau Zwirndl. „Dann wissen Sie jetzt genug, um schlecht zu schlafen."
    -> was_zwirndl_will


// =============================================================================
=== was_zwirndl_will ===

{ zwirndl_trust >= 2:
    -> zwirndl_bietet_an
- else:
    -> zwirndl_haelt_ab
}

= zwirndl_haelt_ab
Frau Zwirndl holt tief Luft — kaum hörbar, die Art von Atemzug, die eine Entscheidung begleitet.

„Ich weiß noch nicht, was ich mit Ihnen anfangen soll", sagt sie. „Das ist keine Drohung. Das ist eine ehrliche Bestandsaufnahme." Sie dreht sich zur Tür. „Gehen Sie nicht zu weit. Nicht heute."

{ benedikt_bemerkt:
    „Das Kind im Küchenfenster hat Sie gesehen. Benedikt. Er redet nicht — aber er erinnert sich. Das ist manchmal schlimmer."
}

-> zwirndl_abschluss

= zwirndl_bietet_an
Frau Zwirndl schaut kurz zur Garderobentür. Dann zurück.

„Die Garderobe des Morgenstern hat sieben Türen." Sie sagt das so, als wäre es eine administrative Auskunft. „Nur eine ist von außen sichtbar. Wenn Sie in eine Schwierigkeit geraten, die eine gewöhnliche Tür nicht löst — kommen Sie zur Garderobe."

{ mizzi_eindruck >= 1:
    „Und sagen Sie Mizzi nichts davon. Sie hat genug zu tragen."
}

~ companion_active = "zwirndl"
~ zwirndl_trust++
-> zwirndl_abschluss


// =============================================================================
=== zwirndl_abschluss ===

Frau Zwirndl geht zur Hintertür des Kaffeehauses. Nicht eilig. Die Art von Gehen, das aussieht, als wäre sie schon halb woanders.

Bei der Tür hält sie kurz an.

„Der Fleck trocknet nicht." Sie sagt es ohne sich umzudrehen. „Das habe ich vergessen zu erwähnen: das ist kein Rückstand. Das ist ein Anspruch. Jemand hat hier markiert, dass Sie etwas schulden oder etwas geschuldet bekommen." Eine Pause. „Ich weiß noch nicht welches."

Die Tür fällt ins Schloss.

Die Katze auf der Regentonne blinzelt einmal. Dann springt sie ab und verschwindet über die Mauer.

{ companion_active == "zwirndl":
    [Frau Zwirndl ist jetzt in der Nähe. Sie ist nicht immer sichtbar. Sie ist selten weit.] # companion: zwirndl.active
}

-> mizzi_treffen
