tell application "System Events"
    tell process "ControlCenter"
        tell menu bar 1
            click first menu bar item whose description is "Sound"
        end tell
    end tell
end tell