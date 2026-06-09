# Code Style

These standards apply to future source code. There is no gameplay code in the repository yet.

## File Size

- Every future source file should stay below 600 lines.
- The target maximum is 400 lines per file.
- If a file becomes too large, split it by responsibility.

## File Headers

Every future source file should begin with a short English comment explaining what the file does.

## Function Comments

Every function should have beginner-friendly comments that explain intent, inputs, and important side effects. Comments should help a new contributor understand why the function exists.

## Clear Naming

Use clear, beginner-friendly names. Avoid abbreviations unless they are widely understood in the project.

Prefer names like:

- `currentSceneIdentifier`
- `selectedChoiceIdentifier`
- `availableDialogueOptions`

Avoid unclear names like:

- `curScn`
- `sel`
- `dlgOpts`

## Central Settings

Do not hardcode balancing values, language choices, path weights, check difficulty values, or scene identifiers directly in code. Put configurable values in central settings or data files.

## Data-Driven Narrative

Narrative content, dialogue, scene text, choices, and localization should live in data files rather than source code. Dialogue and text should use stable identifiers so future localization, tracking, and possible voice-over remain practical. Code should load and interpret content instead of containing the story directly.

## Localization

The initial game language is German. Localization files should make UI labels and future player-facing text easy to translate. README files, documentation, and source code comments should remain in English. Avoid player-entered protagonist names so translations and possible voiced lines can stay stable.

## Save-System Trust

The future save system must be robust and player-trustworthy. It should support manual saves, autosaves, multiple slots, visible save confirmation, savegame versioning, protection against silent save failure, compatibility where possible, and graceful handling of corrupted or outdated saves.

## Beginner-Friendly Structure

Keep systems small and documented. Prefer simple, explicit code over clever code. Make it easy for a new contributor to find settings, narrative data, localization files, and documentation.
