import Cocoa

class StopwatchApp: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem!
    var timer: Timer?
    var startTime: Date?
    var elapsedTime: TimeInterval = 0
    var isRunning = false
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        // Create status bar item
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        if let button = statusItem.button {
            button.title = "⏱ 00:00:00"
            button.target = self
            button.action = #selector(statusBarClicked(_:))
            button.sendAction(on: [.leftMouseUp, .rightMouseUp])
        }
    }
    
    @objc func statusBarClicked(_ sender: NSStatusBarButton) {
        let event = NSApp.currentEvent!
        
        // Right click - show quit menu
        if event.type == .rightMouseUp {
            let menu = NSMenu()
            menu.addItem(NSMenuItem(title: "Quit Tiny Stopwatch", action: #selector(quitApp), keyEquivalent: "q"))
            statusItem.popUpMenu(menu)
            return
        }
        
        // Double click - reset
        if event.clickCount == 2 {
            resetStopwatch()
            return
        }
        
        // Single click - toggle start/stop
        if event.clickCount == 1 {
            toggleStopwatch()
        }
    }
    
    @objc func toggleStopwatch() {
        if isRunning {
            stopStopwatch()
        } else {
            startStopwatch()
        }
    }
    
    func startStopwatch() {
        isRunning = true
        startTime = Date().addingTimeInterval(-elapsedTime)
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            self?.updateDisplay()
        }
    }
    
    func stopStopwatch() {
        isRunning = false
        timer?.invalidate()
        timer = nil
        
        if let start = startTime {
            elapsedTime = Date().timeIntervalSince(start)
        }
    }
    
    func resetStopwatch() {
        stopStopwatch()
        elapsedTime = 0
        updateDisplay()
    }
    
    func updateDisplay() {
        guard let button = statusItem.button else { return }
        
        let currentElapsed = isRunning ? Date().timeIntervalSince(startTime!) : elapsedTime
        
        let hours = Int(currentElapsed) / 3600
        let minutes = Int(currentElapsed) / 60 % 60
        let seconds = Int(currentElapsed) % 60
        
        button.title = String(format: "⏱ %02d:%02d:%02d", hours, minutes, seconds)
    }
    
    @objc func quitApp() {
        NSApplication.shared.terminate(self)
    }
}

// Main entry point
let app = NSApplication.shared
let delegate = StopwatchApp()
app.delegate = delegate
app.run()
