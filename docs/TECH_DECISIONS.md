# Technical Decisions

## Narrative Scripting: Ink

**Decision:** Ink by Inkle Studios is the narrative scripting language for this project.

**Rationale:** Ink is MIT-licensed and open source. It was designed specifically for branching narrative games with state tracking, conditional text, and complex choice structures. It is used in production in 80 Days, Heaven's Vault, and as the dialogue backbone for Disco Elysium. The browser runtime (`inkjs`) fits the browser-first requirement without a game engine.

**Stack for Phase 1:**
- `.ink` files contain all narrative logic, German prose, checks, and story state.
- `inkjs` (npm) provides the browser runtime.
- A compile step (see `package.json`) produces a `.json` story file that the browser loads.
- A minimal HTML/JS harness in `src/runtime/` drives the display.

**Phase 2 forward:** The HTML harness grows into a proper TypeScript frontend as visual and save-system needs become clear. Ink remains the story layer; TypeScript handles state persistence, save/load, and UI.

**Blender** remains a candidate for Phase 4 prerendered or hybrid 2.5D scene assets. No engine decision needed before Phase 3.

---

## Project Structure

```
src/
  ink/
    prologue.ink        ← story source (version controlled)
  runtime/
    index.html          ← browser harness
    story.js            ← inkjs integration
    prologue.json       ← compiled story (generated via npm run compile)
game-data/              ← scene data, settings, localization
docs/                   ← design documentation
```

---

## Getting Started

```bash
npm install
npm run compile    # compiles src/ink/prologue.ink → src/runtime/prologue.json
npm run dev        # serves src/runtime/ at localhost:3000
```

The Inky editor (free, by Inkle Studios) can also open `.ink` files directly for editing and live preview.

---

## Data and Audio Readiness

Narrative text and dialogue are in `.ink` files for Phase 1. In Phase 3, localization keys (`de.json`, `en.json`) replace inline text as the story is prepared for voice-over. The ID convention is already established in the localization files.

## Save-System Trust

The future save system is core infrastructure. Inkjs provides `story.state.ToJson()` and `story.state.LoadJson()` for save/restore. A robust save layer will be built on top of this in Phase 3.
