#Requires AutoHotkey v2.0
#Include "SpotifyLocal.ahk"

DetectHiddenWindows true

spotify := SpotifyLocal()
spotify.Pause()