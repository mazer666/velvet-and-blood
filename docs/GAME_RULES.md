# Game Rules

This document defines the character system, check logic, and core mechanical direction. It is not a final system.

Scene design and dialogue direction live in `docs/SCENES_ACT1.md`.
Threshold-ability concepts live in `docs/SCHWELLENKUNST.md`.

## Core Rule Direction

The game should be driven by choices, checks, consequences, inner voices, and social perception. The player should not choose a final supernatural path during character creation. Instead, the path develops through play.

## Character Categories

The character sheet should eventually contain three main categories.

### Geistig

Mental, investigative, interpretive, and memory-related voices.

Initial voices:

- **Die Ermittlerin**: Notices clues, contradictions, public records, and procedural details.
- **Die Tote**: Speaks from absence, dread, memory gaps, death certificates, and death-adjacent intuition.
- **Die Pedantin**: Cares about exactness, rules, documents, grammar, stamps, and improper forms.
- **Der Zweifel**: Questions motives, evidence, self-image, and convenient answers.

### Sozial

Social, performative, moral, vulgar, and conversational voices.

Initial voices:

- **Die Dame**: Reads manners, status, clothes, rooms, and polite violence.
- **Die Gosse**: Understands street logic, insults, hunger, and survival below respectability.
- **Die Anständige**: Worries about propriety, guilt, duty, and what decent people pretend not to do.
- **Die Freche**: Pushes boundaries, mocks authority, flirts with danger, and says the wrong thing usefully.

### Körperlich

Bodily, sensory, painful, hungry, and instinctive voices.

Initial voices:

- **Die Hungrige**: Tracks appetite, craving, blood, food, and the body as an argument.
- **Die Hand**: Handles touch, tools, gestures, theft, locks, and practical action.
- **Der Schmerz**: Registers injury, endurance, punishment, and useful suffering.
- **Das Tierchen**: Notices small movements, fear, warmth, fur, corners, and animal logic.

## Path Development

The three major paths are:

1. **Jägerin**: Occult investigator or huntress.
2. **Samtläuferin**: Feline shapeshifter.
3. **Vampirin**: Vampire involved in family intrigue.

The player must not choose Jägerin, Samtläuferin, or Vampirin during character creation. These paths should emerge from repeated choices, failed checks, relationships, physical changes, consequences, scenes, and occasional contradictory records. A player should discover what the character is becoming rather than select it from a menu at the start.

Path affinity is tracked silently per path. See `game-data/settings/project_settings.json` for the schema.

## Checks and Failure

Checks should produce story. Some checks should be final. Others may become repeatable if something meaningful changes, such as character attributes, story progress, new evidence, a different document, or a changed social situation. Every meaningful failure should change the world, the character, a clue, a rumor, or the way others see the protagonist.

A failed check may create:

- A clue discovered in an embarrassing way.
- A social enemy or debt.
- A physical scar or condition.
- A new rumor.
- A comedic disaster.
- An alternate entrance to a scene.
- A stronger pull toward one supernatural path.
- A police note, unpaid fine, witness statement, hospital observation, scandal sheet, or family dossier.

## Records and Dossiers

Aurelstein uses records as setting texture and story pressure. Documents can be clues, weapons, traps, lies, protections, or forms of imprisonment, but they should be used deliberately and sparingly. The game may later include dossier-like journal entries, but the core loop should remain choices, voices, social pressure, investigation, and consequence.

Possible future examples:

- The player finds three different names for herself in three different records.
- A failed social check causes a police clerk to open a file on her.
- A hospital record claims she died years ago.
- A church book lists her as never born.
- A debt ledger gives her access to someone else's secrets.
- A vampire family uses inheritance law as a supernatural weapon.
- A Samtläufer Salon hides its territory behind harmless-looking municipal property records.
- A hunter faction tracks monsters through inconsistencies in public files.

## Tracking, Inventory, and Resources

Future prototypes need documentation-friendly tracking for choices, checks, evidence, path pressure, open leads, closed leads, and dead-end prevention. Player decisions and checks should be documented so scenes can be tested for unresolved branches. This tracking can stay behind the scenes and does not need to become an in-world file mechanic.

The game will also need an inventory or resource-management concept for evidence, documents, money, favors, hunger, wounds, social debts, and other narrative resources.

## Protagonist Name

The player should not type a custom name. The protagonist's names should emerge through story, records, rumors, failures, false identities, and player choices. Different people and documents may call her by different names, which keeps later localization and possible voice-over feasible.

## Player Trust and Saves

A future robust save system is a core trust requirement. It should eventually support manual saves, autosaves, multiple save slots, visible save confirmation, savegame versioning, and protection against silent save failure.

## Future Audio Readiness

Dialogue and text should be data-driven and ID-based so future localization and possible voice-over can be added without rewriting scenes. Avoid arbitrary player-entered names because they make voiced dialogue and translated references harder to maintain.

## Combat

Combat is rare and not the core loop. Violence can exist, but the game should focus first on investigation, dialogue, pressure, shame, hunger, fear, witnesses, and consequence.
