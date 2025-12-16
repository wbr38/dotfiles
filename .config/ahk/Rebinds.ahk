#Requires AutoHotkey v2.0
#MaxThreadsPerHotkey 5
#SingleInstance Force

counter := 1
OutputVar := 0

; Increase Volume, Ctrl+Up
^Up::
{
	global counter
	if(counter)
	{
		counter := 0
		Send("{Volume_Up}")
		Sleep(50)
		counter := 1
	}
}

; Increase Volume, Ctrl+Down
^Down::
{
	global counter
	if(counter)
	{
		counter := 0
		Send("{Volume_Down}")
		Sleep(50)
		counter := 1
	}
}

; Sleep (Win+K)
<#K::DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)

; Discord move through unreads
Home::
{
	if WinActive("ahk_exe Discord.exe")
		Send("!+{Up}")
	else
		Send("{Home}")
}

End::
{
	if WinActive("ahk_exe Discord.exe")
		Send("!+{Down}")
	else
		Send("{End}")
}

Delete::
{
	if WinActive("ahk_exe Discord.exe")
		Send("{Escape}")
	else
		Send("{Delete}")
}

; Media keys
$f5::
{
	if not WinActive("ahk_exe devenv.exe") && not WinActive("ahk_exe code.exe") && not WinActive("ahk_exe ida64.exe") && not WinActive("ahk_exe Inpaint.exe") && not WinActive("ahk_exe idea64.exe")
		Send("{Media_Prev}")
	else
		Send("{F5}")
}

$f6::
{
	if not WinActive("ahk_exe devenv.exe") && not WinActive("ahk_exe code.exe") && not WinActive("ahk_exe ida64.exe") && not WinActive("ahk_exe Inpaint.exe") && not WinActive("ahk_exe idea64.exe") 
		Send("{Media_Play_Pause}")
	else
		Send("{F6}")
}

$f7::
{
	if not WinActive("ahk_exe devenv.exe") && not WinActive("ahk_exe code.exe") && not WinActive("ahk_exe ida64.exe") && not WinActive("ahk_exe Inpaint.exe") && not WinActive("ahk_exe idea64.exe")
		Send("{Media_Next}")
	else
		Send("{F7}")
}

; Spanish
accentMap := Map(
    "a", ["á", "Á"],
    "e", ["é", "É"],
    "i", ["í", "Í"],
    "o", ["ó", "Ó"],
    "u", ["ú", "Ú"],
    "n", ["ñ", "Ñ"]
)

_SendText(char) {
    return (*) => SendText(char)
}

for key, accents in accentMap {
    Hotkey ">!" key, _SendText(accents[1]) ; lowercase
    Hotkey ">!+" key, _SendText(accents[2]) ; uppercase
}

Hotkey ">!1", _SendText("¡")
Hotkey ">!/", _SendText("¿")
