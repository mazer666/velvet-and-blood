import { STATS, STAT_KEYS, dominantStat } from './attributes';
import type { StatKey, CharacterState, StatDistribution } from '../types/game';

const TOTAL_POINTS = 12;
const MIN_STAT = 1;
const MAX_STAT = 6;

function el<T extends HTMLElement>(id: string): T {
  const node = document.getElementById(id);
  if (!node) throw new Error(`#${id} not found`);
  return node as T;
}

export class CharacterGenerator {
  private stats: StatDistribution = { koerper: 1, geist: 1, seele: 1, schatten: 1 };
  private onConfirm: ((state: CharacterState) => void) | null = null;

  private readonly flavorEl     = el('chargen-flavor');
  private readonly tendencyEl   = el('chargen-tendency');
  private readonly pointsEl     = el('chargen-points-value');
  private readonly confirmBtn   = el<HTMLButtonElement>('chargen-confirm');

  private readonly valueEls     = {} as Record<StatKey, HTMLElement>;
  private readonly pipContainers = {} as Record<StatKey, HTMLElement>;
  private readonly decBtns      = {} as Record<StatKey, HTMLButtonElement>;
  private readonly incBtns      = {} as Record<StatKey, HTMLButtonElement>;

  constructor() {
    for (const key of STAT_KEYS) {
      this.valueEls[key]      = el(`stat-value-${key}`);
      this.pipContainers[key] = el(`stat-pips-${key}`);
      this.decBtns[key]       = el<HTMLButtonElement>(`stat-dec-${key}`);
      this.incBtns[key]       = el<HTMLButtonElement>(`stat-inc-${key}`);

      this.decBtns[key].addEventListener('click', () => this.changeStat(key, -1));
      this.incBtns[key].addEventListener('click', () => this.changeStat(key, +1));

      el(`stat-card-${key}`).addEventListener('mouseenter', () => this.showFlavor(key));
      el(`stat-card-${key}`).addEventListener('mouseleave', () => this.showDominantFlavor());
    }

    this.confirmBtn.addEventListener('click', () => {
      if (this.remaining() === 0) this.onConfirm?.({ stats: { ...this.stats } });
    });
  }

  init(onConfirm: (state: CharacterState) => void): void {
    this.onConfirm = onConfirm;
    this.update();
  }

  private remaining(): number {
    return TOTAL_POINTS - (Object.values(this.stats) as number[]).reduce((a, b) => a + b, 0);
  }

  private changeStat(key: StatKey, delta: number): void {
    const val = this.stats[key];
    if (delta > 0 && (this.remaining() <= 0 || val >= MAX_STAT)) return;
    if (delta < 0 && val <= MIN_STAT) return;
    this.stats[key] += delta;
    this.update();
  }

  private update(): void {
    const rem = this.remaining();
    this.pointsEl.textContent = String(rem);

    for (const key of STAT_KEYS) {
      const val = this.stats[key];

      this.valueEls[key].textContent = String(val);

      const pips = this.pipContainers[key].children;
      for (let i = 0; i < pips.length; i++) {
        pips[i].classList.toggle('filled', i < val);
      }

      this.decBtns[key].disabled = val <= MIN_STAT;
      this.incBtns[key].disabled = val >= MAX_STAT || rem <= 0;
    }

    // Tendency: show dominant stat's name + one-line description (no path spoilers)
    const dom = dominantStat(this.stats);
    const def = STATS[dom];
    this.tendencyEl.innerHTML =
      `<span class="tendency-label">${def.name}</span>` +
      `<span class="tendency-desc">${def.tendency}</span>`;

    this.confirmBtn.disabled   = rem !== 0;
    this.confirmBtn.textContent = rem > 0 ? `${rem} Punkte verbleibend` : 'In die Geschichte treten';

    this.showDominantFlavor();
  }

  private showDominantFlavor(): void {
    this.showFlavor(dominantStat(this.stats));
  }

  private showFlavor(key: StatKey): void {
    const text = STATS[key].flavorText[this.stats[key]];
    if (this.flavorEl.textContent === text) return;
    this.flavorEl.style.opacity = '0';
    setTimeout(() => {
      this.flavorEl.textContent = text;
      this.flavorEl.style.opacity = '1';
    }, 150);
  }
}
