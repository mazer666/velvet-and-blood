# Velvet and Blood – A City That Remembers

**Velvet and Blood – A City That Remembers** is an open-source occult narrative RPG set in **Aurelstein**, a fictional imperial city inspired by Vienna in 1903. The game will begin in German and will focus on choices, consequences, social pressure, grotesque humor, supernatural transformation, and the quiet menace of bureaucracy.

The player controls a nameless woman who wakes in the gutter behind a coffeehouse with no clear memory. Near her is a bloodstain that does not dry. The scene looks like a crime scene and feels like a social catastrophe. The player should not type a custom name; her name should emerge through story, rumors, failures, false identities, choices, and occasional records. Through choices, failures, clues, and consequences, she may develop into an occult investigator, a feline shapeshifter called a **Samtläuferin**, or a vampire entangled in family intrigue.

## Current Status

This repository is currently in the **concept and documentation phase**.

No gameplay code has been implemented yet. The current goal is to prepare a clean, IP-safe foundation for future prototyping and collaboration.

## What This Project Is

- A free and open-source browser game project.
- A non-commercial learning and fan-development project.
- An original occult narrative RPG with German as the initial game language.
- A future narrative prototype that may later become a browser-playable 2.5D hybrid with isometric scenes, limited movement, hotspots, dialogue, checks, and placeholder graphics.
- A project designed to treat failure as progression rather than a dead end.

## What This Project Is Not

- It is not a clone of any existing game, tabletop setting, novel, film, or franchise.
- It is not a disguised version of any existing detective RPG, vampire setting, shapeshifter setting, tabletop universe, or other protected intellectual property.
- It is not a commercial product, ad-supported game, or monetized live-service project.
- It is not ready for players yet.

## IP Safety Statement

All lore, terminology, factions, mechanics, locations, and characters in this project must remain original. Contributors should avoid copying protected storylines, faction structures, character concepts, exact mechanics, names, prose, art, or worldbuilding from existing works.

Inspirations may inform broad creative direction: talkative inner voices, urban supernatural politics, and bodily transformation are allowed as broad genres. The humor may be absurd, argumentative, socially observant, grotesque, and politically sharp. All implementation details must be newly created for this project. Do not copy specific characters, catchphrases, dialogue patterns, running jokes, scenes, factions, or mechanics from existing works.


## Aurelstein Remembers in Paper

Memory in Aurelstein is not only psychological or supernatural. The city also remembers through seals, ledgers, police reports, birth records, debt registers, hospital files, death certificates, church books, house records, and private dossiers. This is a setting pressure, not the main gameplay loop. An official stamp can sometimes be more frightening than a monster.

Archives are not neutral. A file can protect, erase, accuse, invent, misclassify, resurrect, or imprison a person on paper. This motif should appear when it sharpens a scene, not as a constant mechanic or replacement for every journal idea.

## Planned Roadmap

1. **Phase 0: Documentation and IP-safe concept**
   - Establish the project identity, lore boundaries, design pillars, code style, and initial data structure.
2. **Phase 1: Narrative prototype for Act 1 only**
   - Build a small text-first prototype around the first playable scene: “Gutter behind the coffeehouse.”
3. **Phase 2: First browser-playable prototype**
   - Add a minimal browser interface for choices, checks, journal entries, and character state.
4. **Phase 3: Save system and localization**
   - Create a robust save system and expand German and English localization support.
5. **Phase 4: Audio/visual prototype**
   - Test a 2.5D or isometric presentation with placeholder graphics and possible prerendered assets.
6. **Phase 5: Expanded content and contributor onboarding**
   - Add more Act 1 scenes, improve documentation, and prepare beginner-friendly contribution workflows.
7. **Future expansion candidates**
   - Later acts may explore the 1920s, 1970s, and present day, but they are not part of the initial prototype scope.

## Beginner-Friendly Contribution Principles

- Keep every future source file below 600 lines, with a target maximum of 400 lines.
- Start every future source file with a short English comment explaining what the file does.
- Add beginner-friendly comments to functions when code is introduced.
- Use clear variable names and avoid unnecessary abbreviations.
- Put balancing values in central settings files instead of hardcoding them.
- Keep narrative content and dialogue in data files, not directly in code.
- Keep German game text in localization or narrative data files.
- Make failures interesting: a meaningful failed check should change the world, the character, a clue, a rumor, or the way others see the protagonist.

## Future Technical Trust Requirements

Dialogue and text should be data-driven and ID-based so localization and possible future voice-over remain feasible. The future save system is a core player-trust requirement and should support manual saves, autosaves, multiple slots, visible save confirmation, savegame versioning, and protection against silent save failure.

## License

This project is released under the MIT License. See [LICENSE](LICENSE) for details.
