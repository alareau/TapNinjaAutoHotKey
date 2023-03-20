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

GameName := "Tap Ninja"
^1::
{
    if WinExist(GameName)
    {
        WinActivate GameName
        ResizeWin(1345,721, GameName)
        Loop
        {
            WinActivate GameName
            Ascend()
            ; After ascend, more to buy so more clicks here.
            BuyBuilding()
            BuyAbilities()   
            Loop 2
            {
                BuyBuilding(5)
                BuyAbilities(5)
                RandomClickingForFireFlies()
            }
        }
    }        
    Else
    {
        MsgBox "Tap Ninja not open"
    }
}    

Esc::ExitApp  ; Exit script with Escape key

Ascend()
{
    Send "{3}"
    sleep 100
    MouseClick "left", 1200, 194
    sleep 100 
    MouseClick "left", 1118, 507
    sleep 100
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

BuyAbilities(loopTimes := 12)
{
    Send "{2}"
    sleep 100
    Loop loopTimes
    {
        MouseClick "left", 1216, 171
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