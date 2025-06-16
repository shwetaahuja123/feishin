#!/bin/bash

# Start virtual display
export DISPLAY=:99
Xvfb :99 -screen 0 1024x768x24 > /dev/null 2>&1 &
XVFB_PID=$!

# Wait for Xvfb to start
sleep 2

echo "Starting Electron development environment..."
echo "Virtual display started on :99"

# Set Electron flags for running as root
export ELECTRON_DISABLE_SANDBOX=1

# Cleanup function
cleanup() {
    echo "Cleaning up..."
    kill $XVFB_PID 2>/dev/null
    exit
}

# Set trap to cleanup on exit
trap cleanup SIGINT SIGTERM EXIT

# Run the development server with no-sandbox flag
cd /workspace/feishin
npx electron-vite dev -- --no-sandbox