import { Story } from 'inkjs';

const STORY_FILE = './prologue.json';

const TAG_VOICE     = 'voice:';
const TAG_CLUE      = 'clue:';
const TAG_COMPANION = 'companion:';

const CLUE_LABELS: Record<string, string> = {
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

let story: Story | null = null;
let pendingClues: string[] = [];
const discoveredClues: string[] = [];

// ── Helpers ───────────────────────────────────────────────────────────────────

function el<T extends HTMLElement>(id: string): T {
  const node = document.getElementById(id);
  if (!node) throw new Error(`Element #${id} not found`);
  return node as T;
}

// ── Journal ───────────────────────────────────────────────────────────────────

function journalAddClue(clueId: string): void {
  if (discoveredClues.includes(clueId)) return;
  discoveredClues.push(clueId);

  const li = document.createElement('li');
  li.textContent = CLUE_LABELS[clueId] ?? clueId;
  el('journal-list').appendChild(li);

  el('journal-count').textContent = String(discoveredClues.length);
  el('journal-toolbar').style.display = 'block';
}

function initJournal(): void {
  el('journal-btn').addEventListener('click', () => {
    el('journal-overlay').classList.add('open');
  });
  el('journal-close').addEventListener('click', () => {
    el('journal-overlay').classList.remove('open');
  });
  el('journal-overlay').addEventListener('click', e => {
    if (e.target === e.currentTarget) {
      el('journal-overlay').classList.remove('open');
    }
  });
}

// ── Initialisation ────────────────────────────────────────────────────────────

async function init(): Promise<void> {
  try {
    const res = await fetch(STORY_FILE);
    if (!res.ok) throw new Error(`HTTP ${res.status}`);
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    const json = await res.json() as any;
    story = new Story(json);
    el('loading').style.display = 'none';
    const startBtn = el<HTMLButtonElement>('start-btn');
    startBtn.style.display = 'inline-block';
    startBtn.addEventListener('click', startStory);
    initJournal();
  } catch (err) {
    el('loading').textContent =
      'Fehler: prologue.json nicht gefunden. Bitte zuerst "npm run compile" ausführen.';
    console.error(err);
  }
}

function startStory(): void {
  el('title-screen').style.display = 'none';
  el('story-output').style.display = 'block';
  continueStory();
}

// ── Story loop ────────────────────────────────────────────────────────────────

function continueStory(): void {
  const output    = el('story-output');
  const choicesEl = el('choices-container');

  pendingClues = [];

  while (story!.canContinue) {
    const rawText = (story!.Continue() ?? '').trim();
    const tags    = story!.currentTags ?? [];

    if (!rawText) continue;

    tags.forEach(tag => {
      const t = tag.trim();
      if (t.startsWith(TAG_CLUE)) {
        const clueId = t.slice(TAG_CLUE.length).trim();
        pendingClues.push(clueId);
        journalAddClue(clueId);
      }
    });

    const para = buildParagraph(rawText, tags as string[], pendingClues);
    if (para) output.appendChild(para);
    pendingClues = [];
  }

  output.scrollTop = output.scrollHeight;

  choicesEl.innerHTML = '';
  if (story!.currentChoices.length > 0) {
    choicesEl.classList.remove('hidden');
    story!.currentChoices.forEach((choice, i) => {
      const btn = document.createElement('button');
      btn.className   = 'choice-btn';
      btn.textContent = choice.text;
      btn.addEventListener('click', () => {
        choicesEl.classList.add('hidden');
        addDivider(output);
        story!.ChooseChoiceIndex(i);
        continueStory();
      });
      choicesEl.appendChild(btn);
    });
  } else {
    choicesEl.classList.add('hidden');
    el('end-screen').style.display = 'block';
    output.scrollTop = output.scrollHeight;
  }
}

// ── Paragraph builder ─────────────────────────────────────────────────────────

function buildParagraph(rawText: string, tags: string[], clues: string[]): HTMLElement | null {
  const isVoiceLine     = tags.some(t => t.trim().startsWith(TAG_VOICE));
  const isCompanionLine = tags.some(t => t.trim().startsWith(TAG_COMPANION));

  if (isCompanionLine && !rawText) return null;

  const para = document.createElement('p');
  para.className = 'story-paragraph';

  if (isVoiceLine) {
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
    para.classList.add('companion-line');
    const match = rawText.match(/^\[([^\]]+)\]\s*/);
    if (match) {
      const labelSpan = document.createElement('span');
      labelSpan.className   = 'companion-label';
      labelSpan.textContent = match[1];
      para.appendChild(labelSpan);
      para.appendChild(document.createTextNode(rawText.slice(match[0].length)));
    } else {
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

  clues.forEach(clueId => {
    const badge = document.createElement('span');
    badge.className   = 'clue-found';
    badge.textContent = '+ ' + (CLUE_LABELS[clueId] ?? clueId);
    para.appendChild(badge);
  });

  return para;
}

function addDivider(container: HTMLElement): void {
  const hr = document.createElement('hr');
  hr.className = 'story-divider';
  container.appendChild(hr);
}

// ── Boot ──────────────────────────────────────────────────────────────────────

init();
