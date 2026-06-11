import { defineConfig } from 'vite';

export default defineConfig({
  root: 'src/runtime',
  base: './',
  build: {
    outDir: '../../dist',
    emptyOutDir: true,
  },
});
