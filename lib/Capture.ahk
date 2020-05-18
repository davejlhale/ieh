Capture() {
    Critical on
    
    global vCaptureCount 
    global vGameContainerWidth , vGameContainerHeight
    global trapAreaTL , trapAreaBR 
    global begin_x , begin_y
    global CaptureIcon
    global vTrapColor
    global alchInv1, alchOption_14 
    
    traceLog("`nstop capture")
    CaptureIcon.toggle()
    if !(CaptureIcon.isactive) {
        SetTimer, TrapMaker,off
        SetTimer, MonsterSearch,off
        SetTimer, ConvertSCtoG,off
        UnblockMovement()
        return
    }
    else {
        TraceLog("Start Capture hotkey")
        ;defining here as they dont change
        global vTrapx1 , vTrapy1 , vTrapx2 , vTrapy2 
        vTrapx1 := round((vGameContainerWidth * trapAreaTL.x)+begin_x)
        vTrapy1 := round((vGameContainerHeight * trapAreaTL.y)+begin_y)
        vTrapx2 := round((vGameContainerWidth * trapAreaBR.x)+begin_x)
        vTrapy2 := round((vGameContainerHeight * trapAreaBR.y)+begin_y)
        
        global alchInv1_x ,alchInv1_y ,alchInv1_x2 ,alchInv1_y2
        alchInv1_x :=round(vGameContainerWidth * alchInv1.x)+begin_x -3
        alchInv1_y := round(vGameContainerHeight * alchInv1.y)+begin_y -3
        alchInv1_x2:=alchInv1_x + 8
        alchInv1_y2:=alchInv1_y + 8
        
        global alchOption_14_x , alchOption_14_y , alchOption_14_x2 , alchOption_14_y2 
        alchOption_14_x :=round(vGameContainerWidth * alchOption_14.x)+begin_x -3
        alchOption_14_y := round(vGameContainerHeight * alchOption_14.y)+begin_y -3
        alchOption_14_x2:= alchOption_14_x + 8
        alchOption_14_y2:= alchOption_14_y + 8
        
        global NitroIcon
        if ! NitroIcon.isactive && vDoAutoNitroWhileCaputre {
            doNitro()
        }
        SetTimer, TrapMaker,10000
        TrapMaker()
        if vAutoConvertSCtoG {
            settimer, ConvertSCtoG,20000
        }
        SetTimer, MonsterSearch,200
        return 
    } 
}