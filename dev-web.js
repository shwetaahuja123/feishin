#!/usr/bin/env node

const { spawn } = require('child_process');
const path = require('path');

// Run Vite dev server for web with proper host binding
const viteProcess = spawn('npx', [
    'vite',
    '--config', 'web.vite.config.ts',
    '--host', '0.0.0.0',
    '--port', '12001',
    '--cors'
], {
    cwd: path.resolve(__dirname),
    stdio: 'inherit',
    env: {
        ...process.env,
        NODE_ENV: 'development'
    }
});

viteProcess.on('close', (code) => {
    console.log(`Vite dev server exited with code ${code}`);
    process.exit(code);
});

process.on('SIGINT', () => {
    viteProcess.kill('SIGINT');
});

process.on('SIGTERM', () => {
    viteProcess.kill('SIGTERM');
});