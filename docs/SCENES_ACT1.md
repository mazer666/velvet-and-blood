# Act 1 Scene Design

This document covers the narrative and structural design for Act 1 opening scenes. It is design documentation, not gameplay code. Do not implement engine logic here.

See also: `SCHWELLENKUNST.md` for threshold-ability context, `GAME_RULES.md` for check and voice mechanics.

---

## First Frau Zwirndl Dialogue

The first conversation with Frau Zwirndl must not be written as a simple confession scene. Frau Zwirndl presses toward truth about Lisel's disappearance, but the protagonist genuinely does not remember what happened. The scene should preserve uncertainty: Frau Zwirndl does not fully believe the protagonist, yet she does not dismiss the possibility of real memory loss.

Do not push the scene too early or too explicitly toward the vampire path. Avoid early certainty such as wrong pulse, unnatural coldness, corpse-like body, or clear undeath. Her observations should remain socially sharp and physically ambiguous:

- "Ist Ihnen nicht gut? Sie sehen blass aus."
- "Sie sehen aus, als hätte der Morgen Sie zurückgegeben und sofort bereut."
- "Sie haben Erde am Saum, Blut am Mundwinkel und den Blick einer Frau, die gerade versucht, sich selbst höflich nicht zu kennen."

The player should be able to answer through six valid styles. None is the single correct answer. Each should alter tone, trust, inner voice reactions, available hints, and possible consequences:

- Ehrliche Verwirrung: zugeben, dass Erinnerung fehlt.
- Beschämtes Erfinden: eine harmlose Erklärung improvisieren.
- Bewusstes Lügen: eine kontrollierte Fassung anbieten.
- Ausweichender Selbstschutz: nichts Belastbares sagen.
- Gegenfrage: Frau Zwirndl prüfen, was sie weiß und warum sie fragt.
- Schweigen: den Blick, den Fleck oder die Tür antworten lassen.

Core line for Frau Zwirndl:

> "Ich will kein Geständnis. Geständnisse sind oft nur Lügen mit besserer Haltung. Ich will wissen, was wahr ist."

Possible closing direction:

> "Fangen Sie bei dem an, was nicht weglaufen kann: Fleck, Knopf, Lieferzettel, Tür."

---

## Investigation Mini-Loop: Courtyard

After Frau Zwirndl's first conversation, the player investigates the gutter and courtyard behind Café Morgenstern. This is the first playable mini-loop.

Design goals:

- The player should not immediately solve the mystery.
- Clues should be small, contradictory, embarrassing, humorous, and unsettling.
- Failure should still create clues, complications, rumors, or consequences.
- At least three gathered clues before returning to Frau Zwirndl or advancing.
- All early evidence must remain ambiguous enough to support future **Jägerin**, **Samtläuferin**, or **Vampirin** development.

### 1. Bloodstain

- Does not dry, though the courtyard draft and coal ash stain everything else.
- Too round, too orderly — placed rather than spilled.
- Must not immediately imply only the vampire path.
- Voices: **Die Ermittlerin**, **Die Hungrige**, **Die Dame**.
- Failure: slipping or kneeling in something unpleasant reveals that the stain does not absorb surrounding dirt.

Voice lines:
- **Die Ermittlerin**: "Zu rund. Nicht gespritzt, nicht gewischt. Eher platziert als passiert."
- **Die Hungrige**: "Es riecht nach Antwort. Das ist nicht dasselbe wie Nahrung."
- **Die Dame**: "Wenn Blut schon eine Form annimmt, sollte es wenigstens eine weniger kompromittierende wählen."

### 2. Brass Button

- Does not belong to the protagonist's dress; color, weight, and thread remnant contradict the fabric.
- May carry a small **FMoGH** emblem on the back.
- **FMoGH** = **Fürsorgestelle für Minderjährige ohne gesicherten Hausstand**; almost everyone says only **"die Fürsorgestelle"**.
- May have come from a grey coat or official-looking uniform.
- Optional: the cat nudges it from under the rain barrel or sits exactly on top of it.

### 3. Delivery Note

- Appears banal: coffee, milk, coal, bread; prices, stains, bad handwriting.
- Between the delivery items, a partial mark or stamp from the Fürsorgestelle.
- Possible fragments:
  - "FMoGH — Sichtung erfolgt"
  - partial signature "… Windschütz"
  - "Minderjährige Hinterhofnutzung: vorläufig ungeklärt"
  - "Bestätigung rückwärtiger Zugangsverhältnisse"
- Should feel like an embarrassing administrative note that accidentally wandered into morning.

### 4. Cellar Door

- Looks ordinary: damp wood, rusty handle, peeling paint. But its position is wrong.
- May be absent from a nearby delivery sketch or plan.
- Quietly suggests **Schwellenkunst** without naming which path applies.
- Surface interpretation: Lisel's blocked ability appears tied to the bureaucratic access document, so Mizzi and others can plausibly blame a mundane access mistake.
- Failure to open or inspect it still reveals something: a child's ribbon, cloakroom token, or hidden scratch mark.

### 5. Protagonist's Pockets

- No clear identity, no reliable name, no clean ID.
- Possible contents:
  - bent hairpin
  - unnamed receipt
  - piece of sugar
  - paper scrap with the word "freiwillig"
  - small Lisel-object: marble, ribbon, or cloakroom token
- May quietly echo Lisel's later line: "Das ist nicht dein Name." No explanation yet.
- Tone: funny, sad, and unsettling at once — the pockets feel like the inventory of a person filed as evidence.

### Optional Supporting Elements

- Torn dress: proves nothing, but contradicts every dignified explanation.
- Dark window or puddle: shows a face that should be familiar and politely refuses to confirm it.
- Cat on the rain barrel: may move the button, block a path, or simply judge.

### Returning to Frau Zwirndl

After at least three clues, Frau Zwirndl bundles them without solving them:

> "Drei Hinweise. Das ist in Aurelstein fast schon eine Persönlichkeit."

She may then ask which lead comes first: blood, office, door, Lisel, or the protagonist's own lie. Shared guilt should be implied: Mizzi, the protagonist, the Fürsorgestelle, and possibly others each did one harmless-seeming thing.

---

## Act 1 Follow-Up Scenes

After the courtyard investigation. Keep this as design guidance only; no gameplay code.

### Frau Zwirndl Follow-Up

Frau Zwirndl gathers the clues without solving them. She is not a neutral source and not a lore lecturer.

Under pressure she may hint at old families, door debts, bloodlines, inheritances, superstitions, and people who read doors like crime scenes — but she remains guarded and biased. She knows much about her own doors; she knows little about other threshold practices, though she speaks about them with confidence.

### Mizzi's Confession Scene

Mizzi is a waitress, secret witness, and partly responsible, but not evil. She signed **"Bestätigung rückwärtiger Zugangsverhältnisse"**. The document did not name Lisel; it described a rear access, door, or place. This made a protected place visible to the city and allowed the Fürsorgestelle to act. Mizzi believes she may be guilty.

Mizzi provides two concrete hints:

1. **Frau Chorrätin Windschütz** (FMoGH) was calm, polite, official, and frighteningly convinced of her own correctness: grey or dove-grey suit, very clean gloves, small FMoGH emblem, dark leather folder. She says **"Minderjährige"** more readily than **"Kind"** and uses words like **"Obhut"**, **"Überstellung"**, and **"Zugangsverhältnisse"**. Possible line: **"Niemand nimmt dem Kind etwas weg. Wir geben ihm eine Zuständigkeit."**
2. Lisel could not use the cloakroom escape as expected. Do not state directly which door she sought: "Mizzi sah nur, dass Lisel zwischen die Mäntel wollte. Frau Zwirndl sah, welche Tür sie meinte."

Interruption sequence when Mizzi begins to break down:

> Mizzi: "Ich wollte doch nur—"
>
> Der Dampfkessel schreit.
>
> Gast: "Fräulein! Die Sachertorte ist trocken!"
>
> Mizzi, weinend: "Dann begießen S' sie mit Ihrer Enttäuschung!"

### Zwirndl Demonstration and Seven-Door Sketch

Under pressure, Frau Zwirndl may reluctantly demonstrate that the cloakroom is not ordinary by pulling a full folder from a drawer far too small to contain it. She disappears to the shoulder, briefly gets stuck, and emerges with a folder that could not fit inside. Immediate denial:

- "Alte Möbel. Die verziehen sich."
- "Das ist keine Schwellenkunst. Das ist schlechte Tischlerei mit Benehmen."

The folder contains a cloakroom sketch that looks normal at first — entrance, counter, coat hooks, mirror, umbrella stand, staff passage, drawer wall — but shows seven marked doors. Only one or two are ordinarily visible.

Possible door labels:

- Gästetür
- Personaltür
- Kellertür
- Manteltür
- Dienstbotentür
- Katzentür
- Siebte Tür

Do not explain all seven doors. The sketch should imply that **Salon Siebte Tür** is bound to places, routes, habits, and thresholds — not just people.

Lisel's mark on the sketch:

> "Lisel war schneller"

Beside it: a small grinning mouth with a tooth gap. Frau Zwirndl should go briefly quiet and hide it poorly.

Possible lines:

- "Das hat sie draufgeschmiert."
- "Sie war nirgends oft. Sie war überall zu oft."

### Shared Guilt and Rewards

The scene should create shared guilt: Mizzi signed the access document, the protagonist lost or gave away her name, the Fürsorgestelle acted on the opening, Windschütz may know more than she admits, and the Salon failed to protect Lisel. Each character can believe they are the most guilty while hoping someone else is more so.

Reward detecting Zwirndl's biased knowledge with insight rather than blocking progress:

- Akte: "Zwirndls Wissen hat Grenzen."
- Einsicht: "Die Garderobe hat sieben Wege."
- Spätere Dialogoption: "Sie wussten viel über Ihre Türen. Nicht über alle."

Voice reactions when detecting the bias:

- **Die Ermittlerin**: "Sie weiß, was sie tut. Sie weiß nicht, was die anderen tun. Ihre Spötteleien sind Landkarten mit fehlenden Straßen."
- **Die Pedantin**: "Eine Garderobe mit sieben Türen ist nicht kompliziert. Sie ist baurechtlich beleidigend."
- **Der Zweifel**: "Sie sagt 'Garderobe', meint aber Revier."
- **Die Freche**: "Frag, ob die Mäntel auch Mitgliedsbeiträge zahlen."
