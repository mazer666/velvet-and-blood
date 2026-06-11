import { Story } from 'inkjs';
import { CharacterGenerator } from '../chargen/CharacterGenerator';
import type { CharacterState, StatKey, StatDistribution } from '../types/game';

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

const VOICE_STATS: Record<string, StatKey> = {
  die_ermittlerin: 'geist',
  die_pedantin:    'geist',
  die_dame:        'schatten',
  die_gosse:       'koerper',
  das_tierchen:    'koerper',
  die_hungrige:    'seele',
  die_tote:        'seele',
};

const TIE_THRESHOLD  = 1.0;
const PAGE_SIZE      = 4;
const MAX_HISTORY    = 25;
const NOTES_STORAGE  = 'vab-manual-notes';

let story: Story | null = null;
let characterStats: StatDistribution = { koerper: 2, geist: 2, seele: 2, schatten: 2 };
const discoveredClues: string[] = [];
let pendingParagraphs: HTMLElement[] = [];
const storyHistory: string[] = [];

const chargen = new CharacterGenerator();

// ── Helpers ───────────────────────────────────────────────────────────────────

function el<T extends HTMLElement>(id: string): T {
  const node = document.getElementById(id);
  if (!node) throw new Error(`Element #${id} not found`);
  return node as T;
}

function scoreVoice(voiceKey: string): number {
  const stat = VOICE_STATS[voiceKey] ?? 'geist';
  return characterStats[stat] + Math.random() * 6;
}

function scrollOutputToBottom(): void {
  const output = el('story-output');
  // Defer scroll until after browser has laid out new elements
  requestAnimationFrame(() => { output.scrollTop = output.scrollHeight; });
}

// ── Notes ─────────────────────────────────────────────────────────────────────

function addAutoNote(kind: 'choice' | 'clue', text: string): void {
  const li = document.createElement('li');
  li.className = `note-entry note-${kind}`;
  li.textContent = text;
  const list = el('notes-auto-list');
  list.appendChild(li);
  // Scroll notes list if the auto-tab is currently visible
  const autoSection = document.getElementById('notes-auto-section');
  if (autoSection && autoSection.style.display !== 'none') {
    requestAnimationFrame(() => { list.scrollTop = list.scrollHeight; });
  }
}

function initNotes(): void {
  const switchTab = (active: 'auto' | 'manual') => {
    const isAuto = active === 'auto';
    el('notes-auto-section').style.display   = isAuto ? 'block' : 'none';
    el('notes-manual-section').style.display = isAuto ? 'none'  : 'block';
    el('notes-tab-auto').classList.toggle('active', isAuto);
    el('notes-tab-manual').classList.toggle('active', !isAuto);
  };

  el('notes-tab-auto').addEventListener('click',   () => switchTab('auto'));
  el('notes-tab-manual').addEventListener('click', () => switchTab('manual'));

  const textarea = el<HTMLTextAreaElement>('notes-textarea');
  textarea.value = localStorage.getItem(NOTES_STORAGE) ?? '';
  textarea.addEventListener('input', () => {
    localStorage.setItem(NOTES_STORAGE, textarea.value);
  });

  el('notes-btn').addEventListener('click',  () => el('notes-overlay').classList.add('open'));
  el('notes-close').addEventListener('click', () => el('notes-overlay').classList.remove('open'));
  el('notes-overlay').addEventListener('click', e => {
    if (e.target === e.currentTarget) el('notes-overlay').classList.remove('open');
  });
}

// ── Journal ───────────────────────────────────────────────────────────────────

function journalAddClue(clueId: string): void {
  if (discoveredClues.includes(clueId)) return;
  discoveredClues.push(clueId);

  const li = document.createElement('li');
  li.textContent = CLUE_LABELS[clueId] ?? clueId;
  el('journal-list').appendChild(li);

  el('journal-count').textContent = String(discoveredClues.length);
  el('journal-btn').style.display = 'inline-block';

  addAutoNote('clue', '◆ ' + (CLUE_LABELS[clueId] ?? clueId));
}

function initJournal(): void {
  el('journal-btn').addEventListener('click',  () => el('journal-overlay').classList.add('open'));
  el('journal-close').addEventListener('click', () => el('journal-overlay').classList.remove('open'));
  el('journal-overlay').addEventListener('click', e => {
    if (e.target === e.currentTarget) el('journal-overlay').classList.remove('open');
  });
}

// ── Init ─────────────────────────────────────────────────────────────────────

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
    startBtn.addEventListener('click', showChargen);
    initJournal();
    initNotes();
  } catch (err) {
    el('loading').textContent =
      'Fehler: prologue.json nicht gefunden. Bitte zuerst "npm run compile" ausführen.';
    console.error(err);
  }
}

// ── Chargen ───────────────────────────────────────────────────────────────────

function showChargen(): void {
  el('title-screen').style.display   = 'none';
  el('chargen-screen').style.display = 'block';
  chargen.init(startStoryWithStats);
}

function applyCharacterStats(charState: CharacterState): void {
  if (!story) return;
  const { koerper, geist, seele, schatten } = charState.stats;
  characterStats = charState.stats;
  story.variablesState['stat_koerper']  = koerper;
  story.variablesState['stat_geist']    = geist;
  story.variablesState['stat_seele']    = seele;
  story.variablesState['stat_schatten'] = schatten;
  story.variablesState['affinity_jaegerin']      = Math.floor((koerper + schatten) / 4);
  story.variablesState['affinity_samtlaeuferin'] = Math.floor((geist + seele) / 4);
  story.variablesState['affinity_vampirin']      = Math.floor(seele / 3);
}

function startStoryWithStats(charState: CharacterState): void {
  el('chargen-screen').style.display  = 'none';
  el('story-output').style.display    = 'block';
  el('story-toolbar').style.display   = 'flex';
  applyCharacterStats(charState);
  continueStory();
}

// ── Voice probe ───────────────────────────────────────────────────────────────

interface VoiceCandidate {
  para: HTMLElement;
  voiceKey: string;
  score: number;
}

// Show 1 voice; show 2 only when the top two scores tie within TIE_THRESHOLD
function flushVoicesToQueue(buffer: VoiceCandidate[]): void {
  if (buffer.length === 0) return;
  const sorted = [...buffer].sort((a, b) => b.score - a.score);
  const toShow = new Set([sorted[0].voiceKey]);
  if (sorted.length > 1 && sorted[0].score - sorted[1].score <= TIE_THRESHOLD) {
    toShow.add(sorted[1].voiceKey);
  }
  for (const v of buffer) {
    if (toShow.has(v.voiceKey)) pendingParagraphs.push(v.para);
  }
}

// ── Story loop ────────────────────────────────────────────────────────────────

function continueStory(): void {
  pendingParagraphs = [];
  const voiceBuffer: VoiceCandidate[] = [];
  let pendingClues: string[] = [];

  while (story!.canContinue) {
    const rawText = (story!.Continue() ?? '').trim();
    const tags    = story!.currentTags ?? [];
    if (!rawText) continue;

    const isVoice     = tags.some(t => t.trim().startsWith(TAG_VOICE));
    const isCompanion = tags.some(t => t.trim().startsWith(TAG_COMPANION));

    if (!isVoice && !isCompanion) { flushVoicesToQueue(voiceBuffer); voiceBuffer.length = 0; }

    tags.forEach(tag => {
      const t = tag.trim();
      if (t.startsWith(TAG_CLUE)) {
        const clueId = t.slice(TAG_CLUE.length).trim();
        pendingClues.push(clueId);
        journalAddClue(clueId);
      }
    });

    const para = buildParagraph(rawText, tags as string[], pendingClues);
    pendingClues = [];
    if (!para) continue;

    if (isVoice) {
      const voiceTag = tags.find(t => t.trim().startsWith(TAG_VOICE));
      const voiceKey = voiceTag ? voiceTag.trim().slice(TAG_VOICE.length).trim() : 'unknown';
      voiceBuffer.push({ para, voiceKey, score: scoreVoice(voiceKey) });
    } else {
      pendingParagraphs.push(para);
    }
  }
  flushVoicesToQueue(voiceBuffer);
  renderPage();
}

// Reveal up to PAGE_SIZE regular paragraphs; then Weiter button or choices
function renderPage(): void {
  const output    = el('story-output');
  const choicesEl = el('choices-container');

  let shown = 0;
  while (pendingParagraphs.length > 0 && shown < PAGE_SIZE) {
    const para = pendingParagraphs.shift()!;
    output.appendChild(para);
    if (
      !para.classList.contains('voice-line') &&
      !para.classList.contains('companion-line') &&
      !para.classList.contains('companion-status')
    ) shown++;
  }

  scrollOutputToBottom();

  if (pendingParagraphs.length > 0) {
    choicesEl.innerHTML = '';
    choicesEl.classList.remove('hidden');
    const btn = document.createElement('button');
    btn.className = 'weiter-btn';
    btn.textContent = 'Weiter';
    btn.addEventListener('click', () => {
      choicesEl.innerHTML = '';
      choicesEl.classList.add('hidden');
      renderPage();
    });
    choicesEl.appendChild(btn);
    return;
  }

  // All text visible — show choices or end screen
  choicesEl.innerHTML = '';

  if (story!.currentChoices.length > 0) {
    choicesEl.classList.remove('hidden');
    story!.currentChoices.forEach((choice, i) => {
      const btn = document.createElement('button');
      btn.className   = 'choice-btn';
      btn.textContent = choice.text;
      btn.addEventListener('click', () => {
        // Save state for potential undo
        storyHistory.push(story!.state.ToJson());
        if (storyHistory.length > MAX_HISTORY) storyHistory.shift();
        addAutoNote('choice', '→ ' + choice.text);
        choicesEl.classList.add('hidden');
        addDivider(output);
        story!.ChooseChoiceIndex(i);
        continueStory();
      });
      choicesEl.appendChild(btn);
    });
  } else {
    // No choices: -> DONE or unexpected dead end
    choicesEl.classList.add('hidden');
    el('end-screen').style.display = 'block';
    scrollOutputToBottom();
    // Offer undo in case this was not the intended ending
    if (storyHistory.length > 0) {
      choicesEl.classList.remove('hidden');
      const undoBtn = document.createElement('button');
      undoBtn.className = 'choice-btn undo-btn';
      undoBtn.textContent = '← Zurück zum letzten Entscheidungspunkt';
      undoBtn.addEventListener('click', () => {
        el('end-screen').style.display = 'none';
        choicesEl.classList.add('hidden');
        const prevState = storyHistory.pop()!;
        story!.state.LoadJson(prevState);
        continueStory();
      });
      choicesEl.appendChild(undoBtn);
    }
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
