// compile.js
// Compiles src/ink/prologue.ink → src/runtime/prologue.json using inkjs.
// Run with: npm run compile

import { readFileSync, writeFileSync } from 'fs';
import { Compiler } from 'inkjs/compiler';

const INPUT  = 'src/ink/prologue.ink';
const OUTPUT = 'src/runtime/prologue.json';

const source = readFileSync(INPUT, 'utf8');

const compiler = new Compiler(source, {
    countAllVisits: false,
    errorHandler: (message, type) => {
        const label = type === 3 ? 'ERROR' : type === 2 ? 'WARNING' : 'INFO';
        console.error(`[${label}] ${message}`);
        if (type === 3) process.exit(1);
    }
});

const story = compiler.Compile();
writeFileSync(OUTPUT, story.ToJson(), 'utf8');
console.log(`Compiled: ${INPUT} → ${OUTPUT}`);
