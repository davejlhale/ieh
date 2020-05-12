UnblockMovement(){
    global vMouseBlocked
    global vMouseMemoryX,vMouseMemoryY
    if (vMouseBlocked){
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
    
    if (!vMouseBlocked) {     
        MouseGetPos,,, hWinUnderMouse
        ;if im over game winow
        if (vHwnd == hWinUnderMouse)
        {  ;and not blocked then
            vMouseBlocked:=true
            MouseGetPos, vMouseMemoryX,vMouseMemoryY
            BlockInput, MouseMove ;block me moving mouse
             ShowTip("Mouse Movement Suspended")
            return true
        } 
       ; else {} ;not over game 
         
    }
 
    
    
    
}