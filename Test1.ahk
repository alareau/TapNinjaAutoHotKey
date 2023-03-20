#Requires AutoHotkey v2.0
#SingleInstance
; Written for 100pAG Discord - https://discord.gg/dXc8uWVW
; See #Idle-games
; Written by Sideswipe
; Ctrl + 1 to start the process after script has been run.
; Press ESC to end the script

^1::
{
    if WinExist("Tap Ninja")
    {
        Loop
        {
            WinActivate "Tap Ninja"
            ResizeWin(1345,721, "Tap Ninja") 
            MouseClick "left", 1190, 206
        }
    }        
    Else
    {
        MsgBox "Tap Ninja not open"
    }
}    

Esc::ExitApp  ; Exit script with Escape key



ResizeWin(Width := 0,Height := 0, WinTitle := "Tap Ninja")
{
    WinGetPos ,, &W, &H, WinTitle
    if Width = 0
    {
        Width := W
    }

    if Height = 0
    {
        Height := H
    }

  WinMove 364,175,Width,Height, WinTitle
}

