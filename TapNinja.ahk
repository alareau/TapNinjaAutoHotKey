#Requires AutoHotkey v2.0
#SingleInstance

; Written for 100pAG Discord - https://discord.gg/dXc8uWVW
; See #Idle-games
; Written by Sideswipe
; Ctrl + 1 to start the process after script has been run.
; Press ESC to end the script
; Make sure the auto attack and other things are turned on by default (E,Q,W)
; Best to be in windowed mode.

; v1, ascending + buying code
; v2, click randomly in a box during the downtime (instead of just sitting around doing nothing)
; test for git

GameName := "Tap Ninja"
^1::
{
    if WinExist(GameName)
    {
        WinActivate GameName
        ResizeWin(1345,721, GameName)

        ; click the intial fight button while on the conquest map
        MouseClick "left", 670, 670
        sleep 10         
        Loop
        {
            WinActivate GameName
            FightLots()

        }
    }        
    Else
    {
        MsgBox "Tap Ninja not open"
    }
}   


Esc::ExitApp  ; Exit script with Escape key

FightLots()
{
    MouseClick "left", 666, 600    
    sleep 65000 
    MouseClick "left", 670, 475
    sleep 1000 
}

BuyBuilding(loopTimes := 10)
{
    Send "{1}"
    sleep 100
    MouseClick "left", 1123, 660 
    Loop loopTimes
    {
        MouseClick "left", 1245, 655
        sleep 750
    }
}

BuyAbilities(loopTimes := 12, coordX := 1216, coordY := 171)
{
    Send "{2}"
    sleep 100
    Loop loopTimes
    {
        MouseClick "left", coordX, coordY
        sleep 500
    }        
}

RandomClickingForFireFlies(loopTime := 5000)
{
    sleepTime := 100
    totalTimes := loopTime / sleepTime

    loop totalTimes
    {
        randCoord1 := Random(450, 900)
        randCoord2 := Random(200, 450)
        
        MouseClick "left", randCoord1, randCoord2
        sleep sleepTime 
    }
}

ResizeWin(Width := 0,Height := 0, WinTitle := GameName)
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
  sleep 100
}