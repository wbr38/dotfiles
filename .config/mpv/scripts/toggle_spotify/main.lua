local utils = require 'mp.utils'
local enabled = false

PLAY_SPOTIFY_AHK = mp.get_script_directory() .. "/play_spotify.ahk"
PAUSE_SPOTIFY_AHK = mp.get_script_directory() .. "/pause_spotify.ahk"

local function run_command_osx(cmd)
    local handle = io.popen(cmd)
    local result = handle:read("*a")
    handle:close()
    return result
end

local function getOS()
	-- ask LuaJIT first
	if jit then
		return jit.os
	end

	-- Unix, Linux variants
	local fh,err = assert(io.popen("uname -o 2>/dev/null","r"))
	if fh then
		osname = fh:read()
	end

	return osname or "Windows"
end

local function spotify_pause()
    if not enabled then
        return
    end

    local os_type = getOS()
    if os_type == "Windows" then
        mp.command_native({
            name = "subprocess",
            args = {"C:\\Program Files\\AutoHotkey\\v2\\AutoHotkey64.exe", PAUSE_SPOTIFY_AHK},
            detach = true
        })
    elseif os_type == "Darwin" then
        run_command_osx([[osascript -e 'tell application "Spotify" to pause']])
    end
end

local function spotify_play()
    if not enabled then
        return
    end

    local os_type = getOS()
    if os_type == "Windows" then
        mp.command_native({
            name = "subprocess",
            args = {"C:\\Program Files\\AutoHotkey\\v2\\AutoHotkey64.exe", PLAY_SPOTIFY_AHK},
            detach = true
        })
    elseif os_type == "Darwin" then
        run_command_osx([[osascript -e 'tell application "Spotify" to play']])
    end
end

local function on_pause(name, value)
    if value then
        spotify_play()  -- Resume Spotify when MPV is paused
    else
        spotify_pause() -- Pause Spotify when MPV starts playing
    end
end

-- Resume spotify when mpv is closed
local function on_shutdown()
    spotify_play()
end


local function toggle_pause_spotify()
    enabled = not enabled
    mp.osd_message("Toggle Spotify: " .. tostring(enabled))

    local is_paused = mp.get_property_native("pause")
    if is_paused then
        spotify_play()
    else
        spotify_pause()
    end
end

mp.add_key_binding(nil, "toggle-pause-spotify", toggle_pause_spotify)

mp.observe_property("pause", "bool", on_pause)
mp.register_event("shutdown", on_shutdown)
