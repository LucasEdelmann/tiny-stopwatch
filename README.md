# ⏱ Tiny Stopwatch

A lightweight, minimal macOS stopwatch that lives in your menu bar.

## 🚀 Quick Start

```bash
# Make the build script executable (first time only)
chmod +x create_app.sh

# Build the app
./create_app.sh

# Move to Applications
mv "Tiny Stopwatch.app" /Applications/
```

## 🎨 Customizing the Icon

Want to add your own icon? Here's how:

### Option 1: Use the included icon
If there's an `AppIcon.icns` file in the repo:
```bash
# After building the app, copy the icon
cp AppIcon.icns "Tiny Stopwatch.app/Contents/Resources/AppIcon.icns"

# Then move to Applications
mv "Tiny Stopwatch.app" /Applications/

# Refresh macOS icon cache
touch "/Applications/Tiny Stopwatch.app"
killall Finder Dock
```

### Option 2: Create your own icon
1. **Create/get a 1024x1024px PNG icon**

2. **Convert to .icns format:**
   ```bash
   # Install imagemagick (if needed)
   brew install imagemagick
   
   # Create iconset
   mkdir MyIcon.iconset
   sips -z 512 512 your-icon.png --out MyIcon.iconset/icon_512x512.png
   sips -z 256 256 your-icon.png --out MyIcon.iconset/icon_256x256.png
   sips -z 128 128 your-icon.png --out MyIcon.iconset/icon_128x128.png
   
   # Convert to .icns
   iconutil -c icns MyIcon.iconset
   ```

3. **Add to your app:**
   ```bash
   cp MyIcon.icns "Tiny Stopwatch.app/Contents/Resources/AppIcon.icns"
   ```

4. **Refresh the icon:**
   ```bash
   touch "/Applications/Tiny Stopwatch.app"
   killall Finder Dock
   ```

**Note:** If the icon doesn't update immediately, log out and back in, or restart your Mac.

## 🎮 Controls

- **Single Click**: Start/Stop the stopwatch
- **Double Click**: Reset to 00:00:00
- **Right Click**: Quit the app

## 📦 Manual Build

If you prefer to build manually:

```bash
# Compile
swiftc MenubarStopwatch.swift -o MenubarStopwatch

# Run directly (for testing)
./MenubarStopwatch
```

## ✨ Features

- ⚡️ Lightweight - pure Swift, no dependencies
- 🎯 Simple - lives in your menu bar
- ⏱ Precise - updates 10 times per second
- 🖱 Intuitive - click to control
- 🚫 No dock icon - stays out of your way

## 🔄 Auto-start on Login

To launch Tiny Stopwatch automatically when you log in:
1. Open **System Settings**
2. Go to **General** → **Login Items**
3. Click the **+** button
4. Select **Tiny Stopwatch** from Applications
5. Done! It'll start automatically next time you log in

## 📤 Sharing the App

You can share `Tiny Stopwatch.app` with others:
```bash
# Zip it up
zip -r TinyStopwatch.zip "Tiny Stopwatch.app"
```

**Recipients will need to:**
- Right-click the app → "Open" → "Open anyway" (first time only)
- Or go to System Settings → Privacy & Security → "Open Anyway"

## 📝 Notes

- The stopwatch shows hours:minutes:seconds format (HH:MM:SS)
- Time continues counting even when stopped (preserves elapsed time)
- Reset brings everything back to zero
- No Xcode needed - just compile from terminal!
- Requires macOS 10.15 (Catalina) or later

## 🛠 Troubleshooting

**Icon not showing?**
- Make sure the icon file is named `AppIcon.icns`
- Try `killall Finder Dock` to refresh
- Log out and back in if needed

**App won't open?**
- Right-click → Open (bypass Gatekeeper)
- Check System Settings → Privacy & Security

Enjoy your new menubar stopwatch! 🎉
