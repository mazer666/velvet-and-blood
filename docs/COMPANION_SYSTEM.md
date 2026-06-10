# Companion System

This document defines how companions work in Velvet and Blood. Companions are not guides. They are people with limited knowledge, territorial biases, and agendas of their own that sometimes align with the protagonist's and sometimes do not.

See individual character sheets in `docs/characters/` for companion-specific dialogue direction, speech patterns, and knowledge limits.

---

## Core Principle

The inner voices are the protagonist's internal monologue. A companion is external — a person with a body, a separate history, and things they have decided not to say.

A companion does not know everything the protagonist knows. The protagonist does not know everything the companion knows. Neither knows everything the game knows. This asymmetry is the engine of the relationship.

---

## How Companions Emerge

Companions are not selected from a menu. They emerge from early decisions.

**Frau Zwirndl** becomes a companion if the protagonist earns provisional trust in the first encounter — through honest confusion, silence, or a well-placed question. She does not become a companion through clever deception; she recognizes deception and distances herself without saying so.

**Mizzi** becomes a companion if the protagonist treats her with genuine regard rather than tactical calculation — by showing interest in what she knows rather than what she can be made to provide.

**Path-specific companions** emerge in Act 1's later scenes as the protagonist's development becomes more visible. A companion aligned with the Jägerin path reads thresholds like crime scenes. A Samtläufer companion has their own territory and reasons for investment. A companion aligned with the vampire path brings inherited obligations that are not all the protagonist's benefit.

A player may have one primary companion at a time. Secondary figures remain present as NPCs who may shift back into companion status if circumstances change.

---

## What Companions Do

Companions comment **after the fact**, not before. They do not hint at the right answer. They react to what has already happened, from their own limited perspective.

Companions may:
- Notice something the protagonist missed, from a different angle
- Be wrong about what a clue means, in a way the player can eventually detect
- Refuse to answer a question, and have the refusal say something
- Share partial information and withhold the rest without flagging the withholding
- Change their behavior based on accumulated relationship state
- Disappear for a scene when they have a reason to be elsewhere, then return

Companions do not:
- Tell the player what to do next
- Explain the rules of the supernatural
- Give accurate lore lectures (they have partial and biased knowledge)
- React identically in every scene (their mood, trust level, and current agenda affect what they say)

---

## Companion State

Each companion tracks three values:

**Trust** (`companion_trust`, integer, default 0)
Adjusts based on how the protagonist treats them. Low trust = shorter responses, more deflection, some information withheld. High trust = more candor, more visible bias, more willingness to demonstrate knowledge.

Trust is not a reward meter. A companion with low trust is not broken; they are appropriately cautious.

**Mood** (`companion_mood`, string)
Set contextually: `"neutral"`, `"suspicious"`, `"uncomfortable"`, `"alert"`, `"momentarily_honest"`. Mood affects line selection, not availability. A companion in an uncomfortable mood deflects more. A companion who is momentarily honest may say something they later wish they hadn't.

**Position** (`companion_position`, string)
`"present"`, `"nearby"`, `"absent"`. Companions are not magically omnipresent. They are absent when they have something else to do, something they don't want to witness, or when their presence would make no narrative sense.

---

## Companion Reactions in Ink

Companion lines are embedded at specific trigger points, not generated generically. Each scene notes where companion reactions occur.

Tag convention in `.ink` files:
```
# companion: zwirndl.reacts_to_clue
# companion: mizzi.sees_bloodstain
```

These tags signal to `story.js` that the following text should be rendered as a companion observation rather than narration. Companion lines use the same voice-line styling as inner voices, but with a distinct visual treatment (a small portrait or name tag rather than italic text).

Companion lines are conditional on `companion_active` and `companion_trust`. A companion with `trust <= -1` does not react to most things. A companion with `trust >= 2` may react with more candor than intended.

---

## What Companions Are Wrong About

Each companion has documented blind spots. These are not bugs. They are the character's perspective expressed through incomplete information.

Frau Zwirndl is wrong about the vampire families' current influence in 1903. She treats them as more dangerous and more coordinated than they currently are. She is also wrong about the Jägerin path — she considers threshold-hunters territorial threats by default, which means she will misread early Jägerin development in the protagonist as hostile.

Mizzi is wrong about the FMoGH. She believes the access document was a bureaucratic mistake with ordinary consequences. She will continue to believe this until the evidence becomes impossible to dismiss, and then she will need time to process it.

Path-specific companions have their own structural blind spots, documented in their character sheets.

The player should be able to notice these errors. Inner voices may flag them. Later records may contradict what a companion has said. The reward for noticing is not a points bonus but a more accurate understanding of the situation and occasionally an extra dialogue option.

---

## Companion Lines: Style Standards

Companion lines must not sound like inner voice lines. Inner voices are disembodied, categorical, and somewhat abstract. Companions are specific people in physical space who have just observed something.

Frau Zwirndl speaks in short, practical sentences. She uses objects — coats, doors, keys, drawers — as metaphors for social and supernatural situations. She does not explain. She states, then waits.

Mizzi speaks Wienerisch in her natural register but code-switches to more formal German when she is nervous or trying to seem authoritative. She uses coffeehouse logistics as her frame of reference. She is more likely to ask a question than give an answer.

**Never:** `[Frau Zwirndl] Das deutet möglicherweise auf eine übernatürliche Erklärung hin.`
**Right:** `[Frau Zwirndl] Der Fleck trocknet nicht. Das ist entweder ein Problem oder eine Nachricht. Beides ist unangenehm.`

**Never:** `[Mizzi] Ich glaube, das könnte mit der Fürsorgestelle zusammenhängen.`
**Right:** `[Mizzi] Windschütz hat so ein Papier noch nie ohne Handschuhe angefasst. Das fällt einem auf.`

---

## Companion Development Across Acts

Companions are not static. Their knowledge, trust baseline, and availability change across Acts.

In Act 1 (1903), companions are at baseline — still assessing the protagonist, still working out what kind of person she is becoming.

In later acts, if the same characters survive and remain relevant, they carry the accumulated history of Act 1. A Zwirndl who was deceived in 1903 arrives in 1920 with that deception in her archive.

The game should not require players to remember exactly what they did in Act 1; the consequences should be visible in how characters behave, not in a "you did X so Y" recap.
