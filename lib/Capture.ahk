Capture() {
    Critical on
    
    global vCaptureCount 
    global vGameContainerWidth , vGameContainerHeight
    global trapAreaTL , trapAreaBR 
    global begin_x , begin_y
    global CaptureIcon
    global vTrapColor
    global alchInv1, alchOption_14 

    traceLog("`nstart lootBestiary")
    CaptureIcon.toggle()
    if !(CaptureIcon.isactive) {
        SetTimer, doNitro,off
        SetTimer, TrapMaker,off
        SetTimer, MonsterSearch,off
        SetTimer, ConvertSCtoG,off
        UnblockMovement()
        TraceLog("end caputre hotkey ok") 
        return
    }
    else {
        ;defining here as they dont change
        global vTrapx1 , vTrapy1 , vTrapx2 , vTrapy2 
        vTrapx1 := round((vGameContainerWidth * trapAreaTL.x)+begin_x)
        vTrapy1 := round((vGameContainerHeight * trapAreaTL.y)+begin_y)
        vTrapx2 := round((vGameContainerWidth * trapAreaBR.x)+begin_x)
        vTrapy2 := round((vGameContainerHeight * trapAreaBR.y)+begin_y)
        
        global alchInv1_x ,alchInv1_y ,alchInv1_x2 ,alchInv1_y2
        alchInv1_x :=round(vGameContainerWidth * alchInv1.x)+begin_x
        alchInv1_y := round(vGameContainerHeight * alchInv1.y)+begin_y
        alchInv1_x2:=alchInv1_x + 5
        alchInv1_y2:=alchInv1_y + 5
        
        global alchOption_14_x , alchOption_14_y , alchOption_14_x2 , alchOption_14_y2 
        alchOption_14_x :=round(vGameContainerWidth * alchOption_14.x)+begin_x
        alchOption_14_y := round(vGameContainerHeight * alchOption_14.y)+begin_y
        alchOption_14_x2:= alchOption_14_x + 5
        alchOption_14_y2:= alchOption_14_y + 5
        
        SetTimer, doNitro,60000
        SetTimer, TrapMaker,10000
        settimer, ConvertSCtoG,20000
        SetTimer, MonsterSearch,200
        TraceLog("Start Capture hotkey")
        return 
    } 
}