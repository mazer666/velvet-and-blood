export type StatKey = 'koerper' | 'geist' | 'seele' | 'schatten';

export interface StatDistribution {
  koerper: number;
  geist: number;
  seele: number;
  schatten: number;
}

export interface CharacterState {
  stats: StatDistribution;
}
