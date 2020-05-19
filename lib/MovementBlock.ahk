UnblockMovement(){
    global vMouseBlocked
    global vMouseMemoryX,vMouseMemoryY
    
    
    if vMouseBlocked {
        BlockInput, MouseMoveOff
        mousemove, vMouseMemoryX,vMouseMemoryY
        vMouseBlocked:=False
         ShowTip("") 
    }
   
}

MovementBlock() {
    global vHwnd
    global vMouseBlocked
    global vMouseMemoryX,vMouseMemoryY ,GB_ScanPoint
    global vGameContainerX1, vGameContainerY1, vGameContainerX2, vGameContainerY2
    
    MouseGetPos,vX,vY, hWinUnderMouse
    ;if im over game winow
    if (vHwnd == hWinUnderMouse){ 
        if (vX < vGameContainerX1) or (vX > vGameContainerX2) or (vY < vGameContainerY1) or (vY > vGameContainerY2) 
            return false
        vMouseBlocked:=true
        MouseGetPos, vMouseMemoryX,vMouseMemoryY
        BlockInput, MouseMove ;block me moving mouse
        ShowTip("Mouse Movement Suspended")
        return true
    } 
    else { ;not over game 
        return False
    } ;not over game 
}