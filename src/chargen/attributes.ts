import type { StatKey, StatDistribution } from '../types/game';

export interface StatDefinition {
  key: StatKey;
  name: string;
  description: string;
  tendency: string;
  skills: readonly string[];
  flavorText: Record<number, string>;
}

export const STAT_KEYS: readonly StatKey[] = ['koerper', 'geist', 'seele', 'schatten'];

export const STATS: Record<StatKey, StatDefinition> = {
  koerper: {
    key: 'koerper',
    name: 'Körper',
    description: 'Kraft, Reflexe, das Tier in dir',
    tendency: 'Instinkt vor Analyse. Der Körper entscheidet zuerst.',
    skills: ['Gewalt', 'Zähigkeit', 'Reflexe', 'Schleichen', 'Sinne', 'Tier'],
    flavorText: {
      1: 'Dein Körper ist ein Werkzeug, das du noch nicht ganz beherrschst.',
      2: 'Du spürst jeden Muskel, jeden Herzschlag mit ungewohnter Deutlichkeit.',
      3: 'Deine Hände wissen, was sie tun sollen, bevor dein Kopf es entschieden hat.',
      4: 'Du riechst die Angst im Schweiß der anderen. Es macht dich wach.',
      5: 'Der Körper lügt nicht. Er kennt die Wahrheit lange bevor der Verstand aufholt.',
      6: 'Du bist mehr Tier als du zugeben willst. Das Dunkle in dir genießt es.',
    },
  },
  geist: {
    key: 'geist',
    name: 'Geist',
    description: 'Wissen, Wahrnehmung, okkulte Analyse',
    tendency: 'Analyse vor Gefühl. Du verstehst, bevor du spürst.',
    skills: ['Okkultismus', 'Analyse', 'Gedächtnis', 'Geschichte', 'Medizin', 'Überlieferung'],
    flavorText: {
      1: 'Manche Dinge weißt du. Woher, ist unklar.',
      2: 'Du erkennst Muster dort, wo andere nur Chaos sehen.',
      3: 'Die Zeichen an den Wänden – sie bedeuten etwas. Warte. Du weißt es gleich.',
      4: 'Aurelstein ist ein Buch mit tausend Schichten. Du liest es wie ein Alphabet.',
      5: 'Dein Gedächtnis funktioniert wie eine Maschine. Was dir fehlt, zeichnet sich durch seine Abwesenheit ab.',
      6: 'Du verstehst Dinge, die du nicht verstehen solltest. Die Grenze zwischen Wissen und Wahn ist dünn.',
    },
  },
  seele: {
    key: 'seele',
    name: 'Seele',
    description: 'Willenskraft, Empathie, das Übernatürliche',
    tendency: 'Fühlen vor Denken. Die Welt spricht zu dir – du hörst sie.',
    skills: ['Willenskraft', 'Empathie', 'Ahnung', 'Blutruf', 'Traumwandeln', 'Bann'],
    flavorText: {
      1: 'Du spürst die Stimmung eines Raumes, bevor du ihn betrittst.',
      2: 'Jemand hier oben war verzweifelt. Du weißt es ohne Grund.',
      3: 'Der Hunger meldet sich. Nicht nach Brot. Nach etwas anderem.',
      4: 'Deine Träume und die Wirklichkeit beginnen, ineinander zu verschwimmen.',
      5: 'Du hörst, was die Menschen nicht sagen. Es ist lauter als das Gesagte.',
      6: 'Die Grenze zwischen dir und dem Anderen ist porös. Du weißt nicht mehr, wo du endest.',
    },
  },
  schatten: {
    key: 'schatten',
    name: 'Schatten',
    description: 'Täuschung, soziale Masken, Unterwelt',
    tendency: 'Lesen vor Handeln. Menschen sind ein offenes Buch, wenn man den Rand kennt.',
    skills: ['Täuschung', 'Charme', 'Einschüchterung', 'Maske', 'Diebstahl', 'Unterwelt'],
    flavorText: {
      1: 'Du lächelst. Es ist fast echt.',
      2: 'Du zählst instinktiv die Ausgänge. Drei. Plus eine Falltür.',
      3: 'Menschen lesen heißt: die Lücken zwischen ihren Worten lesen.',
      4: 'Du hast mehr Gesichter als Namen. Das ist eine Stärke.',
      5: 'Die Stadt hat Schichten unter den Schichten. Du kennst die Kellertüren.',
      6: 'Wer bist du wirklich? Gute Frage. Du wirst sie nicht beantworten.',
    },
  },
};

export function dominantStat(stats: StatDistribution): StatKey {
  return (STAT_KEYS as StatKey[]).reduce((a, b) => stats[a] >= stats[b] ? a : b);
}
