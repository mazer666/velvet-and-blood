// mizzi_confession.ink
// Scene: Mizzi gesteht — Café Morgenstern, später Vormittag
// Follows from zwirndl_conversation.ink → zwirndl_abschluss

// ── Neue Hinweise dieser Szene ─────────────────────────────────────────────────
VAR windschuetz_beschreibung = false
VAR lisel_garderobe          = false


// =============================================================================
=== mizzi_treffen ===

Das Café Morgenstern ist nach dem Morgenansturm halbleer. Zwei Stammgäste über Zeitungen, die schon drei Stunden alt sind. Ein junger Mann, der auf jemanden wartet und es schlecht verbirgt. Ein Tisch mit Kuchentellern, die noch niemand weggeräumt hat.

Mizzi räumt Tische ab. Schnell, nicht hastig — mit der ökonomischen Präzision von jemandem, der die Arbeit mit dem Körper erledigt, während der Kopf woanders ist.

{ mizzi_eindruck >= 1:
    Als sie dich sieht, hält sie kurz inne. Der Teller, den sie trägt, bleibt im Gleichgewicht. Dann geht sie weiter.
    „Noch Kaffee?", fragt sie, ohne aufzuschauen. Das ist Gastfreundschaft als Verteidigung.
- else:
    Als sie dich sieht, gibt sie sich einen kaum sichtbaren Ruck und ordnet das Tablett neu.
    „Wir haben noch Frühstück." Sie sagt es zum Tablett hin, nicht zu dir.
}

[Die Gosse] Arbeit als Rüstung. Sie hat diese Unterhaltung heute schon dreimal angefangen und immer wieder aufgehört. # voice: die_gosse

* [Nichts sagen. Hinsetzen. Warten, bis sie aufhört, beschäftigt zu sein.]
    Du setzt dich an einen freien Tisch und wartest. Nicht unhöflich. Nur — da.

    Mizzi räumt noch einen Tisch. Dann noch einen. Dann bleibt sie stehen, Tablett in der Hand, und schaut dich an.

    „Was wollen Sie eigentlich?"
    ~ mizzi_trust++
    -> mizzi_erste_frage

* [„Ich muss mit Ihnen reden. Über Lisel."]
    Das Wort landet. Mizzi stellt das Tablett ab — nicht fallen, aber nah.

    „Hier drin sagt man den Namen nicht." Dann, leiser: „Oder man sagt ihn so, dass es klingt wie etwas anderes."
    -> mizzi_erste_frage

* [Kaffee bestellen. Erst einmal das.]
    Sie bringt Kaffee. Schnell, gut, ohne überflüssige Worte.

    Du trinkst. Sie wartet darauf, dass du fertig bist, damit sie abräumen kann.

    „Noch etwas?"
    ~ mizzi_trust++
    -> mizzi_erste_frage

* [„Das Papier", sagen. Mehr nicht.]
    Mizzi dreht sich nicht um. Aber ihre Schultern verändern sich.

    „Welches Papier."

    Das ist keine Frage.
    -> mizzi_papier


// =============================================================================
=== mizzi_erste_frage ===

Mizzi setzt sich kurz — nicht wirklich, eher ein geduldetes Halbsitzen an der Tischkante. Die Art Pause, die jederzeit aufhören kann, eine zu sein.

„Ich hab das gesehen." Sie sagt es so, als ob das ein vollständiger Satz wäre. „Was ich davon sagen soll und was nicht — das weiß ich noch nicht."

{ note_examined:
    „Den Zettel draußen haben Sie gefunden." Keine Frage. „Ja. Den hab ich auch gesehen. Davor, danach, alles."
}

* [„Erzählen Sie mir von Windschütz."]
    „Frau Chorrätin." Mizzi berichtigt automatisch. Dann schaut sie auf ihre eigenen Hände. „Das klingt respektvoller, als es sein sollte."
    -> mizzi_windschuetz

* [„Sie haben ein Papier unterschrieben."]
    Eine kleine Pause. Nicht überraschend — eher die Art Pause, die kommt, wenn jemand schon lange auf eine Frage gewartet hat und noch nicht weiß, ob sie willkommen ist.
    -> mizzi_papier

* [„Was haben Sie gesehen? In dieser Nacht."]
    Mizzi schaut kurz zur Küchentür.

    „Ich hab's vom Küchenfenster aus gesehen. Dem vergitterten." Eine Pause. „Das reicht eigentlich für eine Aussage."
    -> mizzi_windschuetz

* [„Sie müssen sich keine Vorwürfe machen."]
    Das stimmt vielleicht nicht. Aber es klingt menschlich.

    Mizzi schaut dich an. Lange genug, dass es unbequem wird.

    „Das sagen Sie, weil Sie nicht wissen, was ich unterschrieben hab. Oder weil Sie's wissen und trotzdem nett sind." Eine kurze Pause. „Beides macht mich nervöser als eine Beschuldigung."
    ~ mizzi_trust++
    -> mizzi_papier


// =============================================================================
=== mizzi_windschuetz ===

Mizzi räumt dabei nicht auf. Das ist schon bemerkenswert.

„Graues Kostüm. Nicht grau wie Schmutz — grau wie eine Entscheidung." Sie wählt das Wort sorgfältig. „Handschuhe. Saubere Handschuhe, Anfang Oktober, da draußen. Das ist entweder Gewohnheit oder eine Aussage."

{ not windschuetz_beschreibung:
    ~ windschuetz_beschreibung = true
    ~ clues_collected++
    „Ein kleines Emblem an der Jacke. FMoGH." Sie sagt die vier Buchstaben einzeln, als hätten sie schlechten Geschmack. „Fürsorgestelle für Minderjährige ohne gesicherten Hausstand." # clue: windschuetz_beschreibung
}

[Die Ermittlerin] Saubere Handschuhe. Kleines FMoGH-Emblem. Ledermappe, die Mizzi nicht erwähnt hat. Das sind Werkzeuge, keine Uniform. # voice: die_ermittlerin

„Sie hat gesagt: 'Wir nehmen dem Kind nichts weg. Wir geben ihm eine Zuständigkeit.'" Mizzi spricht das nach, gleichmäßig, ohne Ironie — die Ironie ist schon darin. „Das ist die schlimmste Art zu lügen. Wenn man selbst glaubt, was man sagt."

* [„Was wollte sie hier?"]
    „Rückwärtige Zugangsverhältnisse." Mizzi presst die Lippen kurz zusammen. „Das ist ihr Wort. Nicht meins."
    -> mizzi_papier

* [„Hat sie Lisel beim Namen genannt?"]
    „'Minderjährige'." Mizzi sagt das Wort, als wäre es ein fremdes Werkzeug, das man ungern anfasst. „Ich hab gefragt, welche. Sie hat gesagt: 'Die relevante.' Als wäre das eine Antwort."
    ~ mizzi_trust++
    -> mizzi_papier

* [„War das das erste Mal, dass sie hier war?"]
    „Nein." Mizzi dreht das Tablett in den Händen. „Sie war schon einmal da. Vorher. Zum 'Informieren', wie sie's genannt hat. Ich hab mir nichts dabei gedacht."
    ~ mizzi_trust++
    [Die Pedantin] Zweimaliger Besuch. Erst Information sammeln, dann Papier vorlegen. Das hat eine Struktur. # voice: die_pedantin
    -> mizzi_papier


// =============================================================================
=== mizzi_papier ===

Mizzi stellt das Tablett ab. Beides, die Geste und der Grund dafür.

„Ich hab's nicht gelesen." Sie sagt es so, wie jemand einen Gegenstand abstellt, den er zu lange getragen hat. „Bestätigung rückwärtiger Zugangsverhältnisse. Das klingt nach Milchlieferung. Nach Kohle. Nach irgendwas, das für den Betrieb gebraucht wird."

Eine Pause.

„Ich hab das Papier nicht gelesen. Das ist mein Problem, ja. Das weiß ich."

{ note_examined:
    „Den Zettel da draußen — der ist nicht dasselbe Papier. Aber er gehört dazu. Bestimmte Dinge werden auf viele Zettel verteilt, damit kein einzelner davon kompromittierend aussieht."
    [Die Pedantin] Verteilte Zuständigkeit als Technik. Kein einzelnes Papier ist genug. Zusammen sind sie ein Schlüssel. # voice: die_pedantin
}

* [„Sie hätten es nicht wissen können."]
    „Doch", sagt Mizzi. „Ich hätte fragen können. Ich hab nicht gefragt, weil Frau Chorrätin so geredet hat, als wäre Fragen schon eine Unverschämtheit." Eine kleine Pause. „Viktor sagt, ich red zu schnell, wenn ich lüg. Ich red auch zu schnell, wenn mir jemand Angst macht."
    ~ mizzi_trust++
    -> mizzi_lisel_flucht

* [„Was hat das Papier bewirkt?"]
    Mizzi schaut kurz zur Küchentür. Als ob Frau Zwirndl dort stehen könnte.

    „Frau Zwirndl hat... nicht erklärt. Aber sie hat elf Tage nicht mit mir geredet. Danach hab ich gewusst: das war nicht einfach Kohle."
    ~ mizzi_trust++
    -> mizzi_lisel_flucht

* [„Das macht Sie mitverantwortlich. Das wissen Sie."]
    Das ist keine Frage. Mizzi hört es so.

    Sie sagt nichts. Dann: „Ja, eh."

    Das ist keine Zustimmung. Das ist das Wort, das man benutzt, wenn man mit etwas einverstanden ist, das man trotzdem für falsch hält.
    -> mizzi_lisel_flucht

* [Nichts sagen. Ihr Zeit lassen.]
    Du sagst nichts. Das ist manchmal das Freundlichste.

    Mizzi atmet kurz aus — nicht erleichtert, aber anders. Als hätte jemand eine Frage gestellt, die keine Antwort wollte.
    ~ mizzi_trust++
    -> mizzi_lisel_flucht


// =============================================================================
=== mizzi_lisel_flucht ===

„Ich hab's durch das Fenster gesehen." Mizzi spricht langsamer jetzt. Nicht bedächtiger — eher so, als würde sie Schritte zählen. „Das vergitterte Küchenfenster. Lisel war im Hof."

„Sie wollte durch die Garderobe. Durch die Mäntel." Eine Pause. „Sie hat das früher gemacht — einmal war sie plötzlich hinter dem Tresen, obwohl die Tür zu war. Das hab ich... Frau Zwirndl sieht manchmal Sachen. Ich frag nicht nach."

{ door_examined:
    „Die Kellertür. Ja." Eine kurze Pause. „Ich weiß, warum Sie da geschaut haben."
}

{ not lisel_garderobe:
    ~ lisel_garderobe = true
    ~ clues_collected++
    „Lisel hat versucht, zwischen die Mäntel zu gehen. Und dann — nichts. Sie ist nicht durchgekommen." Eine längere Pause. „Mizzi sah nur, dass Lisel zwischen die Mäntel wollte. Frau Zwirndl sah, welche Tür sie meinte. Ich nicht." # clue: lisel_garderobe
}

[Die Ermittlerin] Garderobe als Fluchtweg. Lisel kannte die Tür. Jemand hat sie blockiert — nicht mit Holz. # voice: die_ermittlerin

{ affinity_vampirin >= 1:
    [Die Tote] Ein Name als Riegel. Das hat Gewicht. Das hat Zinsen. # voice: die_tote
}
{ affinity_samtlaeuferin >= 1:
    [Das Tierchen] Die Garderobe riecht anders als der Rest des Kaffeehauses. Du hast das bemerkt, ohne es zu benennen. # voice: das_tierchen
}

-> mizzi_zusammenbruch


// =============================================================================
=== mizzi_zusammenbruch ===

„Ich hab — ich wollte doch nur —"

Mizzi hält inne. Nicht weil sie fertig ist. Weil ihr die Worte abhandenkommen auf dem Weg vom Gedanken zum Mund.

Dann schreit der Dampfkessel.

Schrill, metallisch, ohne Entschuldigung. Aus der Küche. Der Klang eines Geräts, dem vollkommen gleichgültig ist, was gerade passiert.

Zwei Sekunden später, aus der Ecke: „Fräulein! Die Sachertorte ist trocken!"

Mizzi schaut kurz zu dir. In ihren Augen liegt noch etwas, das vor einer Sekunde ein Satz war.

Dann dreht sie sich um.

„Dann begießen S' sie mit Ihrer Enttäuschung!"

Die Stille danach hat eine andere Qualität als vorher.

Vom betreffenden Tisch kommt kein Laut.

[Die Gosse] Das war nicht für den Gast. Das war für das Gespräch, das unterbrochen wurde. # voice: die_gosse

-> mizzi_nach_dem_dampfkessel


// =============================================================================
=== mizzi_nach_dem_dampfkessel ===

Mizzi steht da, Tablett in der Hand, und schaut nicht zu dir.

Dann schaut sie doch.

„Entschuldigung." Sie sagt es nicht an den Gast.

Eine kurze, ungeplante Stille.

{ mizzi_trust >= 2:
    -> mizzi_oeffnet_sich
- else:
    -> mizzi_haelt_ab
}

= mizzi_haelt_ab

Sie richtet das Tablett. Die professionelle Maske kommt zurück — nicht glatt, aber erkennbar.

„Ich muss wieder an die Arbeit."

Eine Pause. Dann, ohne sich umzudrehen: „Was ich Ihnen gesagt hab — das war... ich weiß nicht genau, was das war. Aber es war wahr. Das ist selten genug."

-> mizzi_abschluss

= mizzi_oeffnet_sich

Sie legt das Tablett ab. Richtig diesmal. Mit Absicht.

„Ich weiß, wo Windschütz dienstags ist." Sie sagt es schnell, zu schnell — wie jemand, der eine Entscheidung trifft und ihr nicht genug Zeit gibt, sich umzuentscheiden. „Ich frag nicht, wie ich das weiß. Ich weiß es."

{ mizzi_eindruck >= 1:
    „Und — was ich heute früh im Hof gesehen hab." Eine kurze Pause. „Sie haben sich nicht aufgeführt, wie jemand, der weiß, was er ist. Das ist nicht der schlechteste Anfang."
}

~ mizzi_trust++
~ companion_active = "mizzi"
-> mizzi_abschluss


// =============================================================================
=== mizzi_abschluss ===

Mizzi nimmt das Tablett wieder auf. Die Küche ruft immer.

„Was ich gesehen hab, hab ich gesehen." Sie sagt es so, als wäre das eine vollständige Position.

Vielleicht ist sie das.

Dann geht sie. Nicht weg — zurück zur Arbeit. In Aurelstein ist das nicht immer dasselbe.

{ companion_active == "mizzi":
    [Mizzi ist jetzt in der Nähe. Sie erscheint dort, wo Arbeit und Schuld sich überschneiden.] # companion: mizzi.active
}

-> DONE
