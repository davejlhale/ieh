UnblockMovement(){
    tooltip,
    BlockInput, MouseMoveOff
}

MovementBlock() {
    global vWinTitle
    WinGet, id, ,%vWinTitle%
    vHwnd:=id
    MouseGetPos,,, hWinUnderMouse
    if (vHwnd == hWinUnderMouse){
        BlockInput, MouseMove 
        tooltip blocked 
        settimer,movementBlocked,-2000
        return
        movementBlocked:
            tooltip
        return
    }
}