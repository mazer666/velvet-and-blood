# Contributing to Velvet and Blood

Thank you for your interest. This project is open-source, non-commercial, and designed to be beginner-friendly.

## Current Phase

The project is in the **documentation and concept phase**. There is no gameplay code yet. The most useful contributions right now are to the narrative design, lore, scene writing, and data structure.

## How to Contribute

1. **Fork** the repository and create a new branch from `main`.
2. **Make your changes** following the guidelines below.
3. **Open a pull request** with a short description of what you changed and why.

If you are unsure whether your idea fits the project, open an issue first and ask.

## What Needs Work

- Scene writing and dialogue in German (see `game-data/narrative/` and `docs/scenes/`)
- Localization strings in `game-data/localization/de.json` and `en.json`
- Lore additions that fit the existing world (see `docs/LORE_BIBLE.md`)
- Design feedback on open questions in `docs/GAME_RULES.md`, `docs/SCENES_ACT1.md`
- Future code contributions (Phase 1 and beyond) following `docs/CODE_STYLE.md`

## File and Code Standards

- Keep every file below **600 lines** (target: 400 lines). Split by responsibility if it grows.
- Start every source file with a short **English comment** explaining what it does.
- Narrative content and dialogue must live in **data files**, not code.
- Use **stable IDs** for all dialogue, choices, clues, and checks so localization stays feasible.
- Do not hardcode values that belong in `game-data/settings/project_settings.json`.
- See `docs/CODE_STYLE.md` for full coding standards.

## Narrative and Lore Standards

- Use **original terminology only**. Do not borrow names, factions, mechanics, or catchphrases from existing games, novels, or tabletop settings. See `docs/LORE_BIBLE.md`.
- Keep early clues **ambiguous** across all three paths (Jägerin, Samtläuferin, Vampirin). No scene in Act 1 should lock the player's path.
- Write **failure as progression**: every failed check should change something — a clue, a rumor, a social relationship, a physical condition, a record.
- Use **German** for all in-game text. English for comments, documentation, and code.
- Do not invent a custom name for the protagonist. Her name emerges through story and records.

## Adding a Scene

1. Create a design document in `docs/scenes/` describing the narrative intent, choices, checks, and failure outcomes.
2. Create a data file in `game-data/narrative/` following the JSON format shown in `prologue_gutter_behind_cafe.json`.
3. Add any new localization strings to `game-data/localization/de.json` and `game-data/localization/en.json` using the ID convention described in those files.

## Adding Localization Strings

Key naming convention: `category.scene_or_context.type.identifier`

Examples:
- `ui.new_game` — a UI label
- `scene.prologue.choice.inspect_bloodstain` — a player choice in a scene
- `scene.prologue.voice.die_ermittlerin.enter` — an inner voice line triggered on entering a scene
- `scene.prologue.clue.bloodstain` — a clue description

Always add both a German (`de.json`) and English (`en.json`) entry for every new key.

## IP Safety

All contributions must use original content. Do not copy characters, mechanics, dialogue, factions, or worldbuilding from existing intellectual property. When in doubt, invent something new. See `README.md` for the full IP safety statement.

## Questions

Open a GitHub issue. Label it `question` if you need clarification before contributing.
