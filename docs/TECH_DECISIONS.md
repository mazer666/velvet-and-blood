# Technical Decisions

## Current Engine Status

No final engine choice has been made yet. The project should remain flexible until the first narrative prototype proves what the game needs.

## Preferred Development Approach

### Phase 1: Narrative Prototype

Create a text-first prototype that validates tone, choices, checks, inner voices, consequences, social pressure, and data organization.

### Phase 2: Browser Prototype

Build a browser-playable version with a simple interface for scenes, choices, journal or notes entries, character state, saves, and localization.

### Phase 3: 2.5D Hybrid Prototype

Explore a browser-playable 2.5D hybrid with isometric scenes, limited movement, hotspots, dialogue, checks, and placeholder graphics first.

## Possible Technology Options

### Godot 4 with GDScript

Godot 4 remains a possible option if the project benefits from a game-editor workflow, scene tools, animation support, and export targets.

### TypeScript and Web Stack

A TypeScript-based browser stack remains a possible option if the project benefits from direct web deployment, simple data loading, and accessible contributor workflows.

### Blender Asset Pipeline

Blender may become useful later for prerendered or hybrid 2.5D assets, especially if the project uses isometric scenes, fixed-camera environments, or painterly placeholder renders.

## Data and Audio Readiness

Narrative text and dialogue should be data-driven and ID-based. This keeps localization, revision tracking, and possible future voice-over practical. Avoid player-entered protagonist names so voiced lines and translated references can remain stable.

## Save-System Trust

The future save system must be treated as core infrastructure, not polish. It should support manual saves, autosaves, multiple slots, visible confirmation, versioned save data, and safeguards against silent save failure.

## Current Technical Principle

Do not choose technology before the narrative prototype clarifies the needs of the game. Avoid building a large engine before there is a small playable scene.
