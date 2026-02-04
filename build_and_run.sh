#!/bin/bash

# MenuBar Stopwatch - Build & Run Script

echo "🔨 Compiling MenuBar Stopwatch..."

# Compile the Swift app
swiftc MenubarStopwatch.swift -o MenubarStopwatch

if [ $? -eq 0 ]; then
    echo "✅ Build successful!"
    echo ""
    echo "🚀 Starting stopwatch..."
    echo ""
    echo "Controls:"
    echo "  • Click: Start/Stop"
    echo "  • Double-click: Reset"
    echo "  • Right-click: Quit"
    echo ""
    
    # Run the app
    ./MenubarStopwatch
else
    echo "❌ Build failed!"
    exit 1
fi
