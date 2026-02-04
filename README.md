# ⏱ MenuBar Stopwatch

A lightweight, minimal macOS stopwatch that lives in your menu bar.

## 🚀 Quick Start

```bash
# Make the build script executable (first time only)
chmod +x build_and_run.sh

# Build and run
./build_and_run.sh
```

## 🎮 Controls

- **Single Click**: Start/Stop the stopwatch
- **Double Click**: Reset to 00:00:00
- **Right Click**: Quit the app

## 📦 Manual Build

If you prefer to build manually:

```bash
# Compile
swiftc MenubarStopwatch.swift -o MenubarStopwatch

# Run
./MenubarStopwatch
```

## ✨ Features

- ⚡️ Lightweight - pure Swift, no dependencies
- 🎯 Simple - lives in your menu bar
- ⏱ Precise - updates 10 times per second
- 🖱 Intuitive - click to control

## 📝 Notes

- The stopwatch shows hours:minutes:seconds format
- Time continues counting even when stopped (preserves elapsed time)
- Reset brings everything back to zero
- No Xcode needed - just compile from terminal!

Enjoy your new menubar stopwatch! 🎉
