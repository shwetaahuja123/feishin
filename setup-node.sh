#!/bin/bash

# Setup script to use the latest Node.js version with NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Use Node.js v24.2.0
nvm use 24.2.0

echo "Node.js version: $(node --version)"
echo "npm version: $(npm --version)"
echo "pnpm version: $(pnpm --version)"
echo ""
echo "Environment is ready for building Feishin!"
echo ""
echo "Available build commands:"
echo "  pnpm run dev          - Start development server"
echo "  pnpm run build        - Full build (electron + remote)"
echo "  pnpm run build:web    - Build web version"
echo "  pnpm run build:electron - Build electron version"
echo "  pnpm run typecheck    - Type check the project"
echo "  pnpm run lint         - Lint the project"