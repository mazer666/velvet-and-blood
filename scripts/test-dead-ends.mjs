import { readFileSync } from 'fs';
import { createRequire } from 'module';

const require = createRequire(import.meta.url);
// Use the engine directly (CJS), not the bundled browser version
const ink = require('../node_modules/inkjs/dist/ink-full.js');
const Story = ink.Story;

const storyData = JSON.parse(
  readFileSync(new URL('../src/runtime/public/prologue.json', import.meta.url))
);

let deadEnds = 0, validEnds = 0, explored = 0;

function explore(stateJson, depth, pathTail) {
  if (depth > 100) return;
  explored++;

  const s = new Story(storyData);
  s.state.LoadJson(stateJson);

  let text = '';
  while (s.canContinue) text += s.Continue();

  if (s.currentChoices.length === 0) {
    // -> DONE reached
    if (text.length > 50) { validEnds++; }
    else {
      deadEnds++;
      process.stderr.write(`DEAD END depth=${depth} path=[${pathTail}] text="${text.slice(0,80)}"\n`);
    }
    return;
  }

  for (let i = 0; i < s.currentChoices.length; i++) {
    const s2 = new Story(storyData);
    s2.state.LoadJson(stateJson);
    s2.ChooseChoiceIndex(i);
    explore(s2.state.ToJson(), depth + 1, pathTail.concat(i).slice(-6));
  }
}

const init = new Story(storyData);
init.variablesState['stat_koerper']  = 3;
init.variablesState['stat_geist']    = 3;
init.variablesState['stat_seele']    = 3;
init.variablesState['stat_schatten'] = 3;
explore(init.state.ToJson(), 0, []);

process.stderr.write(`Explored ${explored} | Valid: ${validEnds} | Dead: ${deadEnds}\n`);
