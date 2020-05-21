Capture() {
    Critical on
    
    global vCaptureCount 
    global vGameContainerWidth , vGameContainerHeight
    global trapAreaTL , trapAreaBR 
    global vGameContainerX1 , vGameContainerY1
    global CaptureIcon
    global vTrapColor
    global alchInv1, alchOption_14 ,alchemy_1L
    
    traceLog("stop capture")
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
        vTrapx1 := trapAreaTL.x-1
        vTrapy1 := trapAreaTL.y-1
        vTrapx2 := trapAreaBR.x+1
        vTrapy2 := trapAreaBR.y+1
        
        global alchInv1_x ,alchInv1_y ,alchInv1_x2 ,alchInv1_y2
        alchInv1_x :=alchInv1.x -3
        alchInv1_y :=alchInv1.y -3
        alchInv1_x2:=alchInv1_x + 8
        alchInv1_y2:=alchInv1_y + 8
        
        global alchOption_14_x , alchOption_14_y , alchOption_14_x2 , alchOption_14_y2 
        alchOption_14_x :=alchOption_14.x -3
        alchOption_14_y := alchOption_14.y -3
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