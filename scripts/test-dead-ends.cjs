'use strict';
const { Story } = require('inkjs');
const { readFileSync } = require('fs');
const path = require('path');

const storyData = JSON.parse(
  readFileSync(path.join(__dirname, '../src/runtime/public/prologue.json'), 'utf8')
);

function runPath(label, strategy) {
  const s = new Story(storyData);
  s.variablesState['stat_koerper']  = 3;
  s.variablesState['stat_geist']    = 3;
  s.variablesState['stat_seele']    = 3;
  s.variablesState['stat_schatten'] = 3;

  let steps = 0;
  let lastText = '';
  while (steps < 200) {
    while (s.canContinue) lastText = s.Continue().trim();
    if (s.currentChoices.length === 0) {
      const ok = lastText.length > 30;
      console.log(`[${label}] ${ok ? 'OK' : 'DEAD END'} after ${steps} choices. Last: "${lastText.slice(0,60)}"`);
      return;
    }
    const idx = strategy(s.currentChoices, steps);
    s.ChooseChoiceIndex(Math.max(0, Math.min(idx, s.currentChoices.length - 1)));
    steps++;
  }
  console.log(`[${label}] LOOP LIMIT after ${steps} steps`);
}

// Test several strategies
runPath('always-first',   (choices) => 0);
runPath('always-last',    (choices) => choices.length - 1);
runPath('always-middle',  (choices) => Math.floor(choices.length / 2));
runPath('alternating',    (choices, step) => step % 2 === 0 ? 0 : choices.length - 1);
runPath('prefer-sticky',  (choices) => {
  // Mizzi and Katze are sticky (+) choices — they appear last
  return choices.length - 1;
});
