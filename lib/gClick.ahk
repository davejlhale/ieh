;;clicks on aClickponit, aClickCountTimes with aDelay between clicks
gClick( aClickPoint,aClickCount:=1,aDelay:=20) { 
    
    Critical on
    global vWinTitle
    global vHwnd
    global vGameContainerWidth,vGameContainerHeight
    global begin_x, begin_y
 
    TraceLog("gclick")
    if ! isObject(aClickPoint) {
        aClickPoint :=%aClickPoint%.clone()
        TraceLog("clone " . aClickPoint.name)
        if ! isObject(aClickPoint) && aClickPoint.class!="ClickPoint" {
            TraceLog("failed cloning" . %aClickPoint%)
            return
        }
    }
    
    gameClickX :=round((vGameContainerWidth * aClickPoint.x)+begin_x)
    gameClickY := round((vGameContainerHeight * aClickPoint.y)+begin_y)
    
    MovementBlock()
    
    loop %aClickCount%
    { 
        TraceLog("click " . aClickpoint.name . " x:" . gameClickX . " y:" . gameClickY )
        PostMessage, 0x200, 0, gameClickX&0xFFFF | gameClickY<<16,, ahk_id %vHwnd% ; WM_MOUSEMOVE
        sleep %aDelay%
        PostMessage, 0x201, 0, gameClickX&0xFFFF | gameClickY<<16,, ahk_id %vHwnd% ; WM_LBUTTONDOWN 
        sleep 20
        PostMessage, 0x202, 0, gameClickX&0xFFFF | gameClickY<<16,, ahk_id %vHwnd% ; WM_LBUTTONUP 
        sleep 20
    }
    return
} 

