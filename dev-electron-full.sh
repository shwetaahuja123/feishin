#!/bin/bash

# Start D-Bus service
service dbus start

# Start virtual display
export DISPLAY=:99
Xvfb :99 -screen 0 1024x768x24 > /dev/null 2>&1 &
XVFB_PID=$!

# Wait for Xvfb to start
sleep 2

echo "🚀 Starting Full Electron Development Environment..."
echo "📺 Virtual display started on :99"
echo "🔧 D-Bus service started"

# Set Electron flags for running as root
export ELECTRON_DISABLE_SANDBOX=1

# Cleanup function
cleanup() {
    echo "🧹 Cleaning up..."
    kill $XVFB_PID 2>/dev/null
    pkill -f "electron-vite" 2>/dev/null
    exit
}

# Set trap to cleanup on exit
trap cleanup SIGINT SIGTERM EXIT

echo "🎵 Starting Feishin Electron app..."
echo ""
echo "📱 Electron app will run in virtual display"
echo "🌐 Renderer process will be available at:"
echo "   - Local: http://localhost:5173/"
echo "   - External: https://work-2-vncyigvmzlcsrtyq.prod-runtime.all-hands.dev"
echo ""
echo "Press Ctrl+C to stop the development server"
echo ""

# Run the development server with no-sandbox flag
cd /workspace/feishin
npx electron-vite dev -- --no-sandbox