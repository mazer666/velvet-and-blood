// story.js
// Loads prologue.json (compiled Ink story) and drives the browser display.
// Requires inkjs UMD loaded via <script> before this file.

const STORY_FILE = './prologue.json';

// Tags emitted by the Ink story
const TAG_VOICE     = 'voice:';
const TAG_CLUE      = 'clue:';
const TAG_COMPANION = 'companion:';

// Clue labels shown as inline badges
const CLUE_LABELS = {
  bloodstain:               'Blutfleck',
  brass_button:             'Messingknopf',
  delivery_note:            'Lieferzettel',
  cellar_door:              'Kellertür',
  cellar_door_ribbon:       'Wollband',
  pockets:                  'Taschen',
  pockets_marble:           'Murmel',
  windschuetz_beschreibung: 'Windschütz',
  lisel_garderobe:          'Liesels Fluchtweg',
  sieben_tueren:            'Sieben Türen',
  lisels_notiz:             'Liesels Notiz',
};

let story = null;
let pendingClues = [];     // clues discovered in the current Continue() batch
const discoveredClues = []; // persistent journal across the full playthrough

// ── Journal ───────────────────────────────────────────────────────────────────

function journalAddClue(clueId) {
  if (discoveredClues.includes(clueId)) return;
  discoveredClues.push(clueId);

  const li = document.createElement('li');
  li.textContent = CLUE_LABELS[clueId] || clueId;
  document.getElementById('journal-list').appendChild(li);

  document.getElementById('journal-count').textContent = discoveredClues.length;
  document.getElementById('journal-toolbar').style.display = 'block';
}

function initJournal() {
  document.getElementById('journal-btn').addEventListener('click', () => {
    document.getElementById('journal-overlay').classList.add('open');
  });
  document.getElementById('journal-close').addEventListener('click', () => {
    document.getElementById('journal-overlay').classList.remove('open');
  });
  document.getElementById('journal-overlay').addEventListener('click', e => {
    if (e.target === e.currentTarget) {
      document.getElementById('journal-overlay').classList.remove('open');
    }
  });
}

// ── Initialisation ────────────────────────────────────────────────────────────

async function init() {
  try {
    const res = await fetch(STORY_FILE);
    if (!res.ok) throw new Error(`HTTP ${res.status}`);
    const json = await res.json();
    story = new inkjs.Story(json);
    document.getElementById('loading').style.display = 'none';
    document.getElementById('start-btn').style.display = 'inline-block';
    document.getElementById('start-btn').addEventListener('click', startStory);
    initJournal();
  } catch (err) {
    document.getElementById('loading').textContent =
      'Fehler: prologue.json nicht gefunden. Bitte zuerst "npm run compile" ausführen.';
    console.error(err);
  }
}

function startStory() {
  document.getElementById('title-screen').style.display  = 'none';
  document.getElementById('story-output').style.display  = 'block';
  continueStory();
}

// ── Story loop ────────────────────────────────────────────────────────────────

function continueStory() {
  const output    = document.getElementById('story-output');
  const choicesEl = document.getElementById('choices-container');

  pendingClues = [];

  // Consume all available text before showing choices
  while (story.canContinue) {
    const rawText = story.Continue().trim();
    const tags    = story.currentTags;

    if (!rawText) continue;

    // Collect clue tags from this line
    tags.forEach(tag => {
      const t = tag.trim();
      if (t.startsWith(TAG_CLUE)) {
        const clueId = t.slice(TAG_CLUE.length).trim();
        pendingClues.push(clueId);
        journalAddClue(clueId);
      }
    });

    // Build paragraph element
    const para = buildParagraph(rawText, tags, pendingClues);
    output.appendChild(para);
    pendingClues = [];  // each paragraph owns its clues
  }

  output.scrollTop = output.scrollHeight;

  // Show choices or end screen
  choicesEl.innerHTML = '';
  if (story.currentChoices.length > 0) {
    choicesEl.classList.remove('hidden');
    story.currentChoices.forEach((choice, i) => {
      const btn = document.createElement('button');
      btn.className   = 'choice-btn';
      btn.textContent = choice.text;
      btn.addEventListener('click', () => {
        choicesEl.classList.add('hidden');
        addDivider(output);
        story.ChooseChoiceIndex(i);
        continueStory();
      });
      choicesEl.appendChild(btn);
    });
  } else {
    choicesEl.classList.add('hidden');
    document.getElementById('end-screen').style.display = 'block';
    output.scrollTop = output.scrollHeight;
  }
}

// ── Paragraph builder ─────────────────────────────────────────────────────────

function buildParagraph(rawText, tags, clues) {
  const isVoiceLine     = tags.some(t => t.trim().startsWith(TAG_VOICE));
  const isCompanionLine = tags.some(t => t.trim().startsWith(TAG_COMPANION));

  // Companion status notification (no visible text, just a state marker)
  if (isCompanionLine && !rawText) return null;

  const para = document.createElement('p');
  para.className = 'story-paragraph';

  if (isVoiceLine) {
    // Inner voice: italic, muted, accent border
    para.classList.add('voice-line');
    const voiceMatch = rawText.match(/^\[([^\]]+)\]\s*/);
    if (voiceMatch) {
      const labelSpan = document.createElement('span');
      labelSpan.className   = 'voice-label';
      labelSpan.textContent = voiceMatch[1];
      para.appendChild(labelSpan);
      para.appendChild(document.createTextNode(rawText.slice(voiceMatch[0].length)));
    } else {
      para.textContent = rawText;
    }
  } else if (isCompanionLine) {
    // Companion observation: similar to voice line but visually distinct
    para.classList.add('companion-line');
    const match = rawText.match(/^\[([^\]]+)\]\s*/);
    if (match) {
      const labelSpan = document.createElement('span');
      labelSpan.className   = 'companion-label';
      labelSpan.textContent = match[1];
      para.appendChild(labelSpan);
      para.appendChild(document.createTextNode(rawText.slice(match[0].length)));
    } else {
      // Status line like "[Frau Zwirndl ist jetzt in der Nähe...]"
      const bracketMatch = rawText.match(/^\[([^\]]+)\]$/);
      if (bracketMatch) {
        para.classList.add('companion-status');
        para.textContent = bracketMatch[1];
      } else {
        para.textContent = rawText;
      }
    }
  } else {
    para.textContent = rawText;
  }

  // Append clue badges
  clues.forEach(clueId => {
    const badge = document.createElement('span');
    badge.className   = 'clue-found';
    badge.textContent = '+ ' + (CLUE_LABELS[clueId] || clueId);
    para.appendChild(badge);
  });

  return para;
}

function addDivider(container) {
  const hr = document.createElement('hr');
  hr.className = 'story-divider';
  container.appendChild(hr);
}

// ── Start ─────────────────────────────────────────────────────────────────────

init();
