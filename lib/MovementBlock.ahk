UnblockMovement(){
    global vMouseBlocked
    global vMouseMemoryX,vMouseMemoryY
    if (vMouseBlocked){
        CoordMode, mouse,Screen
        BlockInput, MouseMoveOff
        mousemove, vMouseMemoryX,vMouseMemoryY
        vMouseBlocked:=False
        ShowTip("")
    }
    
}

MovementBlock() {
    global vWinTitle
    global vHwnd
    global vMouseBlocked
    global vMouseMemoryX,vMouseMemoryY
    
    ; WinGet, id, ,%vWinTitle%
    ; vHwnd:=id
    MouseGetPos,,, hWinUnderMouse
    ;if im over game winow
    if (vHwnd == hWinUnderMouse)
    {
        if (!vMouseBlocked) {
            ;and not blocked then
            vMouseBlocked:=true
            MouseGetPos, vMouseMemoryX,vMouseMemoryY
            BlockInput, MouseMove ;block me moving mouse
            WinActivate, %vWinTitle% ;activate the game window inc\ase ive not clicked it
            CoordMode, mouse,client ;set mouse movements to the window
            return true
        } 
        else {
            ;over game and mouse blocked following clicks
        } 
    }
    if !(vHwnd == hWinUnderMouse) {
        
    }
    
    
    
}