
doNitro2() {
    Critical on
    
    global vNirtoInterval
    global NitroIcon, nitro
    
    NitroIcon.toggle()
    if !(NitroIcon.isactive) {
        SetTimer, doNitro2, off
        VNitroTest:=0x0D1721
        nitroButtonX :=round(vGameContainerWidth * nitro.x)+begin_x
        nitroButtonY := round(vGameContainerHeight * nitro.y) +begin_y
        nitroButtonX2:=nsx +2
        nitroButtonY2:=nsy +8
        
        
        PixelSearch, , , %nitroButtonX%, %nitroButtonY%, %nitroButtonX2%, %nitroButtonY2%, %vNitroBarBlueColor%, 5, Fast 
        if  ErrorLevel
        {
            gClick(nitro,1,50)
            
        }
        return
    }
    else {
        ;call this label on interval
        SetTimer, doNitro2, %vNirtoInterval%
        doNitro2:
            doNitro()
        return
    } 
    
}

doNitro() { ;+- offsets allowing for slight error in other clients
    
    
    critical on
    global vNitroBarBlueColor
    global nitro, nitro_pixel_start
    global vGameContainerWidth,vGameContainerHeight
    global begin_x, begin_y
    global nitro, alchemy_plus_button, vHwnd
    
     MouseGetPos,,, hWinUnderMouse
        if (vHwnd != hWinUnderMouse){ ;uses pixel search so needs focus
            return False
            }
    
    
    MovementBlock()
    nsx :=round(vGameContainerWidth * nitro_pixel_start.x)+begin_x
    nsy := round(vGameContainerHeight * nitro_pixel_start.y)+begin_y
    nsx2:=nsx +2
    nsy2:=nsy +8
    gclick(menu1,2,100)
    gClick(sb_GoBack,2,100)
    
    VNitroTest:=0x0D1721
    nitroButtonX :=round(vGameContainerWidth * nitro.x)+begin_x
    nitroButtonY := round(vGameContainerHeight * nitro.y) +begin_y
    nitroButtonX2:=nsx +2
    nitroButtonY2:=nsy +8
    
    
    PixelSearch, , , %nitroButtonX%, %nitroButtonY%, %nitroButtonX2%, %nitroButtonY2%, %vNitroBarBlueColor%, 5, Fast 
    if ! ErrorLevel
    {
        gClick(nitro,1,50)
        
    }
    
    PixelSearch, , , %nitroButtonX%, %nitroButtonY%, %nitroButtonX2%, %nitroButtonY2%, %vNitroBarBlueColor%, 8, Fast 
    if ErrorLevel { ;not found 
        gClick(menu5,2.100) ;craft 
        gClick(Alchemy_check_Box,2,100)
        gclick(alchemy_plus_button,1,50)
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