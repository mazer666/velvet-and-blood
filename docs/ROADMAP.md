# Roadmap

## Scope Principle

The game may eventually span more than a century, but development must begin small. **Act 1: 1903 — Awakening, City, First Truth** is the MVP scope and the only act that should be developed at the beginning.

Later acts are future expansion candidates, not required content for the initial prototype.

---

## Phase 0: Documentation and IP-Safe Concept

- Create the repository structure.
- Define the project identity, design pillars, lore boundaries, game rules, technical direction, and code style.
- Establish original terminology and avoid protected material from existing intellectual property.
- Document the long-term act vision without expanding the first playable scope.

**Done when:**
- Core documentation files exist and are internally consistent (GAME_RULES, DESIGN_PILLARS, LORE_BIBLE, SCENES_ACT1, SCHWELLENKUNST, ROADMAP, CODE_STYLE, TECH_DECISIONS).
- Scene data schema exists in `game-data/narrative/` with at least the prologue skeleton.
- Localization ID convention is defined and applied to `de.json` and `en.json`.
- CONTRIBUTING.md exists and covers how to add scenes, strings, and lore.

---

## Phase 1: Act 1 Narrative Prototype

- Create the first playable text-first scene: "Gutter behind the coffeehouse," where the protagonist wakes in Aurelstein in 1903 beside a bloodstain that does not dry.
- Test German prose, multisensory scene writing, shame, confusion, social observation, a crime-scene-like setup, grotesque humor, inner voices, choices, checks, failure consequences, and tiny hints toward all three future paths.
- Keep all narrative content in data files.
- Begin documenting player decisions, checks, consequences, and unresolved leads.
- Design checks so some are final and others can be retried after meaningful changes.

**Done when:**
- The prologue scene runs end-to-end in a text-only runtime (no UI required).
- At least three interactable objects (bloodstain, brass button, delivery note, cellar door, or pockets) each produce at least one success outcome, one failure outcome, and one clue.
- All five initial inner voices fire at least once during the scene.
- Path affinity accumulates silently without locking or naming a path.
- Frau Zwirndl's first conversation is reachable and all six response styles produce distinct outcomes.
- No dead ends: every branch leads to a next step or a consequence.

---

## Phase 2: First Browser-Playable Prototype

- Add a minimal browser interface.
- Display scene text and choices.
- Track basic character state, story progress, choices, checks, and open consequences.
- Add placeholder journal or notes view, inventory, and character-sheet screens without overcommitting to an in-world file mechanic.
- Support testing for dead ends so branches can reconnect cleanly.

**Done when:**
- The prologue runs in a browser without a local server setup.
- Player choices, check outcomes, and clue state persist within a single session.
- A placeholder journal screen shows at least one entry from the prologue.
- The browser version runs on current Firefox and Chrome without errors.

---

## Phase 3: Save System and Localization

- Implement a reliable save and load system with manual saves, autosaves, multiple slots, visible confirmation, savegame versioning, and protection against silent save failure.
- Add versioning for save data.
- Track story progress, evidence, documents, inventory, resources, and closed or open leads.
- Expand German localization and add English translation support with stable text and dialogue identifiers for possible future voice-over.
- Document save behavior clearly for players.

**Done when:**
- A manual save and load cycle completes without data loss across all tested scenes.
- Autosave triggers reliably at scene transitions.
- A corrupted or outdated save file fails gracefully with an explanatory message.
- All player-facing strings in the prologue and Frau Zwirndl scene exist in both `de.json` and `en.json`.
- Language switching works without restarting the game.

---

## Phase 4: Audio/Visual Prototype with 2.5D or Isometric Presentation

- Test placeholder scenes, hotspots, limited movement, and dialogue overlays.
- Explore a 2.5D hybrid or isometric visual style.
- Prioritize show-don't-tell presentation through props, lighting, documents, posture, sound, and environmental detail.
- Evaluate Blender for prerendered or hybrid scene assets.

**Done when:**
- At least one scene (prologue courtyard) renders with placeholder 2.5D or isometric art.
- Hotspot interaction works for at least three objects in the scene.
- Dialogue overlay displays and dismisses correctly over the scene background.
- Placeholder ambient sound plays without blocking gameplay.

---

## Phase 5: Expanded Act 1 Content and Contributor Onboarding

- Add more Act 1 scenes and consequences.
- Improve contributor documentation.
- Create issue templates and beginner-friendly tasks.
- Expand lore only where it supports playable content.

**Done when:**
- Act 1 contains at least three playable scenes beyond the prologue.
- GitHub issue templates exist for bug reports, scene contributions, and lore additions.
- A new contributor can add a scene and localization strings by following CONTRIBUTING.md without asking for help.

---

## Future Expansion Candidates

- **Act 2: 1920s — Interwar Years**: Aurelstein changes politically, socially, and culturally. Do not detail this act yet.
- **Act 3: 1970s — Postwar Ghosts**: The city carries buried guilt, reconstruction, silence, inherited crimes, and institutional memory. Do not detail this act yet.
- **Act 4: Present Day — The City Remembers**: Long-term consequences of earlier choices, failures, identities, documents, betrayals, and alliances may become visible. Do not detail this act yet.
