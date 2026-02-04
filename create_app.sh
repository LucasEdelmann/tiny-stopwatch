#!/bin/bash

APP_NAME="Tiny Stopwatch"

echo "🔨 Building ${APP_NAME}.app..."

# Compile the Swift file
swiftc MenubarStopwatch.swift -o MenubarStopwatch

if [ $? -ne 0 ]; then
    echo "❌ Build failed!"
    exit 1
fi

# Create app bundle structure
mkdir -p "${APP_NAME}.app/Contents/MacOS"
mkdir -p "${APP_NAME}.app/Contents/Resources"

# Move compiled binary
mv MenubarStopwatch "${APP_NAME}.app/Contents/MacOS/"

# Create Info.plist
cat > "${APP_NAME}.app/Contents/Info.plist" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleExecutable</key>
    <string>MenubarStopwatch</string>
    <key>CFBundleIdentifier</key>
    <string>com.menubar.stopwatch</string>
    <key>CFBundleName</key>
    <string>Tiny Stopwatch</string>
    <key>CFBundleIconFile</key>
    <string>AppIcon</string>
    <key>CFBundlePackageType</key>
    <string>APPL</string>
    <key>CFBundleShortVersionString</key>
    <string>1.0</string>
    <key>CFBundleVersion</key>
    <string>1</string>
    <key>LSMinimumSystemVersion</key>
    <string>10.15</string>
    <key>LSUIElement</key>
    <true/>
    <key>NSHighResolutionCapable</key>
    <true/>
</dict>
</plist>
EOF

echo "✅ ${APP_NAME}.app created successfully!"
echo ""
echo "📦 Next steps:"
echo "  1. Move ${APP_NAME}.app to /Applications:"
echo "     mv ${APP_NAME}.app /Applications/"
echo ""
echo "  2. Launch it from Spotlight or Applications folder"
echo ""
echo "  3. (Optional) Add to Login Items in System Settings"
echo "     to start automatically on boot"
echo ""
