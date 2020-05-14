doNitro() { ;+- offsets allowing for slight error in other clients
    
    critical on
    global vNitroBarBlueColor, vMonitorCount
    global nitro, nitro_pixel_start, NitroIcon
    global vGameContainerWidth,vGameContainerHeight
    global begin_x, begin_y ,vHwnd,vWinTitle
    
    
    Critical on
    traceLog("`nnitro start")
    NitroIcon.toggle()
    if !(NitroIcon.isactive) {
        SetTimer, doNitroLoop, off
        return
    }
    else {
        ;call this label on interval - 120000 = 2mins
        SetTimer, doNitroLoop, 120000
        doNitroLoop()
    } 
    
}
doNitroLoop(){
    
    global vNitroBarBlueColor, vMonitorCount
    global nitro, nitro_pixel_start, NitroIcon
    global vGameContainerWidth,vGameContainerHeight
    global begin_x, begin_y ,vHwnd,vWinTitle
    MouseGetPos,,, hWinUnderMouse
    if (vHwnd != hWinUnderMouse && vMonitorCount ==1 )
        return
    WinActivate ahk_id %vHwnd%
    WinWaitActive, ahk_id %vHwnd%
    
    MovementBlock()
    nsx :=round(vGameContainerWidth * nitro_pixel_start.x)+begin_x
    nsy := round(vGameContainerHeight * nitro_pixel_start.y)+begin_y
    nsx2:=nsx +4
    nsy2:=nsy +8
    gclick(menu1,2,100)
    gClick(sb_GoBack,2,100)
    ;WinActivate %vWinTitle%
    VNitroTest:=0x112435
    nitroButtonX :=round(vGameContainerWidth * nitro.x)+begin_x -2
    nitroButtonY := round(vGameContainerHeight * nitro.y) +begin_y -2
    nitroButtonX2:=nitroButtonX +5
    nitroButtonY2:=nitroButtonY +5
    
    PixelGetColor, OutputVar, nitroButtonX, nitroButtonY
    ;tooltip %OutputVar% . " - " . %nitroButtonX% . " - " . %nitroButtonY% . " - " . %nitroButtonX2% . " - " . %nitroButtonY2% . " - " . %VNitroTest%
    
    ;WinActivate, ahk_id vHwnd
    PixelSearch,rx ,ry , %nitroButtonX%, %nitroButtonY%, %nitroButtonX2%, %nitroButtonY2%, %VNitroTest% ,20
    if ErrorLevel ;not fount
    {
        ; tooltip %ErrorLevel% . " - " . %rx% . " - " . %ry% ,2
        gClick(nitro,1,150)
    }else 
    {
        ;tooltip %ErrorLevel% . " - " . %rx% . " - " . %ry% ,2
    }
    PixelSearch, , , %nsx%, %nsy%, %nsx2%, %nsy2%, %vNitroBarBlueColor%, 8, Fast 
    if ErrorLevel { ;not found 
        gClick(menu5,2.100) ;craft 
        gClick(Alchemy_check_Box,2,100)
        
        gClick(alchemy_1ml,2,100)
        gClick(alchOption_5,20,10) ;nitro gen 
        
        gClick(alchemy_use_all,2,50)
        UnblockMovement()
        traceLog("end ok") 
        return 1
    }
    UnblockMovement()
    return
}