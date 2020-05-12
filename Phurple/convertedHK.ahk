

!0::
    t := 50
    z := 0
    
    while(!GetKeyState("Left")) {
        z++
        checkNitroOnUpgrade()
        checkUpgrades()
        Tooltip, %z%, 2007, 749
    }
return 

!1::
    t := 200
    While(!getKeyState("Left")) {
        doUpgrades()
        doNitro()
        sleep, 15000
        ;doOvernightUpgrades()
    }
return
!5::
    t := 50
    MovementBlock()
    gclick(menu5,2,100)
    gClick(Alchemy_check_Box,2,100)
    gClick(alchemy_1ml2,50)
    gClick(alchOption_1,20,20)
    gClick(alchemy_use_all,2,50) 
    UnblockMovement() 
return
;farm white fox 
!8::
    MovementBlock()
    gClick(menu3,2,200) ;explore 
    gClick(explore_area5,2,100) ;5 
    ; Send {a down} 
    ; sleep, 300 
    ; Send { a up} 
    gClick(explore_map4)
    
    while(!GetKeyState("Left")) {
        gClick(explore_map4) ;5-4 
    } 
    UnblockMovement() 
return 

!2::
    t := 100
    doUpgrades()
return

!3::
    t := 200
    While(!getKeyState("Left")) {
        doUpgradesAsAngel()
        doNitro()
        ;doAlchemy()
        ;doOvernightUpgrades()
        ;buyUpgrade()
        sleep, 15000 
    } 
return

!4::
    t := 100
    doUpgradesAsAngel()
return
;Used by pressing alt ` it writes in notepad++
;the function to click at that spot
!`::
    MouseGetPos, xpos, ypos, hWinUnderMouse
    if (openNotepad())
        Send {Enter}MCS(%xpos%, %ypos%, t){Space}{;}
    MouseMove, xpos, ypos, 0
    Winactivate ahk_id %hWinUnderMouse%
return

!q::
    
    MouseGetPos, xpos, ypos, hWinUnderMouse
    if (openNotepad())
        Send {Enter}%xpos%, %ypos%
    MouseMove, xpos, ypos, 0
    Winactivate ahk_id %hWinUnderMouse%
return

!w::
    MouseGetPos, xpos, ypos, hWinUnderMouse
    PixelGetColor, color, %xpos%, %ypos%
    if (openNotepad())
        send {Enter}%color%
    MouseMove, xpos, ypos, 0
    Winactivate ahk_id %hWinUnderMouse%
return