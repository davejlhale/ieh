doNitro() { ;+- offsets allowing for slight error in other clients
    
    critical on
    global vNitroBarBlueColor
    global nitro, nitro_pixel_start, NitroIcon
    global vGameContainerWidth,vGameContainerHeight
    global begin_x, begin_y ,vHwnd
    
   
    if ! (A_GuiEvent) {
    NitroIcon.Toggle()
} else {
    NitroIcon.Toggle()
}

MovementBlock()
nsx :=round(vGameContainerWidth * nitro_pixel_start.x)+begin_x
nsy := round(vGameContainerHeight * nitro_pixel_start.y)+begin_y
nsx2:=nsx +4
nsy2:=nsy +8
gclick(menu1,2,100)
gClick(sb_GoBack,2,100)

VNitroTest:=0x0F1922
nitroButtonX :=round(vGameContainerWidth * nitro.x)+begin_x
nitroButtonY := round(vGameContainerHeight * nitro.y) +begin_y
nitroButtonX2:=nitroButtonX +6
nitroButtonY2:=nitroButtonY +6

mousemove nitroButtonX,nitroButtonY

;WinActivate, ahk_id vHwnd
PixelSearch, , , %nitroButtonX%, %nitroButtonY%, %nitroButtonX2%, %nitroButtonY2%, %VNitroTest%, 10, Fast 
if ErrorLevel
{
    gClick(nitro,1,150)
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