#Requires AutoHotkey v2.0

class SpotifyLocal {
    previous_hwnd := 0

    PlayPause() {
        this.Msg(0xE0000)
    }

    Pause() {
        this.Msg(0xD0000)
    }

    Play() {
        this.Msg(0xD0000) ; sends stop
        Sleep 1           ; necessary to make Spotify receive both commands
        this.Msg(0xE0000) ; sends the play message
    }

    Next() {
        this.Msg(0xB0000)
    }

    Prev() {
        this.Msg(0xC0000)
    }

    Msg(msg) {
        hwnd := this.getWindow()
        if hwnd
            PostMessage(0x319, 0, msg, , hwnd)
    }

    getWindow(prefix := true) {
        if this.previous_hwnd && this._getWindowMeta(this.previous_hwnd) {
            return this.previous_hwnd
        }

        hwnds := WinGetList("ahk_exe spotify.exe")
        for hwnd in hwnds {
            if this._getWindowMeta(hwnd) {
                this.previous_hwnd := hwnd
                return hwnd
            }
        }

        MsgBox("No matching Spotify window found")
        return false
    }

    _getWindowMeta(hwnd) {
        class := WinGetClass(hwnd)
        title := WinGetTitle(hwnd)
        ; MsgBox("hwnd: " hwnd "`nClass: " class "`nTitle: " title)

        return class = "Chrome_WidgetWin_1"
            && RegExMatch(title, "^(Spotify.*|.* - .*)$")
    }
}
