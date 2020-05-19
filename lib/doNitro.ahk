doNitro() { 
    
    global NitroIcon, vNirtoInterval
    
    traceLog("`nnitro start")
    NitroIcon.toggle()
    if !(NitroIcon.isactive) {
        SetTimer, doNitroLoop, off
        return
    } else {
        SetTimer, doNitroLoop, %vNirtoInterval%
        doNitroLoop()
    } 
}

doNitroLoop(){
    
    global nitro, nitro_pixel_start, NitroIcon, vNitroBarBlueColor
    global vGameContainerWidth,vGameContainerHeight, vGameContainerX1, vGameContainerY1 
    global vHwnd, vMonitorCount
    
    MouseGetPos,,, hWinUnderMouse
    if (vHwnd != hWinUnderMouse && vMonitorCount ==1 )
        return
    
    WinActivate ahk_id %vHwnd%
    WinWaitActive, ahk_id %vHwnd%
    
    MovementBlock()
    nsx :=round(vGameContainerWidth * nitro_pixel_start.x)+vGameContainerX1
    nsy := round(vGameContainerHeight * nitro_pixel_start.y)+vGameContainerY1
    nsx2:=nsx +4
    nsy2:=nsy +8
    gclick(menu1,2,100)
    gClick(sb_GoBack,2,100)
    
    nitroButtonX :=round(vGameContainerWidth * nitro.x)+vGameContainerX1 -2
    nitroButtonY := round(vGameContainerHeight * nitro.y) +vGameContainerY1 -2
    nitroButtonX2:=nitroButtonX +5
    nitroButtonY2:=nitroButtonY +5
    
    PixelSearch,rx ,ry , %nitroButtonX%, %nitroButtonY%, %nitroButtonX2%, %nitroButtonY2%, %VNitroTest% ,20
    if ErrorLevel {
        gClick(nitro,1,150)
    } 
    
    PixelSearch, , , %nsx%, %nsy%, %nsx2%, %nsy2%, %vNitroBarBlueColor%, 8, Fast 
    if ErrorLevel { ;not found 
        
        MouseGetPos,,, hWinUnderMouse
        if ( hWinUnderMouse==vHwnd) {
            PixelSearch, , , x, y, x2, y2, 0x001800 , 2
            ;;if menu button covers color
            if ErrorLevel
                gClick(menu5,2,100)
            else
                gClick(menu4,2,100)
        }
        else {
            gClick(menu5,2,100) 
        }
        gClick(Alchemy_check_Box,2,100)
        gClick(alchemy_1ml,2,100)
        gClick(alchOption_5,20,40) ;nitro gen 
        gClick(alchemy_use_all,2,50)
        UnblockMovement()
        traceLog("end nitro ok") 
        return 1
    }
    UnblockMovement()
    return
}