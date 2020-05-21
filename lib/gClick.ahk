;;clicks on aClickponit, aClickCountTimes with aDelay between clicks
gClick( aClickPoint,aClickCount:=1,aDelay:=20) { 
    
    Critical on
    global vHwnd
    global vGameContainerWidth,vGameContainerHeight
    global vGameContainerX1, vGameContainerY1 
    
    if ! isObject(aClickPoint) {
        aClickPoint :=%aClickPoint%.clone()
        TraceLog("gclick clone " . aClickPoint.name)
        if ! isObject(aClickPoint) && aClickPoint.class!="ClickPoint" {
            TraceLog("failed cloning" . %aClickPoint%)
            return
        }
    }
    
    gameClickX:=aClickPoint.x
    gameClickY:=aClickPoint.y
    TraceLog("gclick " . aClickCount . " - " aClickpoint.name . " x:" . gameClickX . " y:" . gameClickY )
    loop %aClickCount%
    {
        if (MovementBlock())
        {
            click, %gameClickX%, %gameClickY%
            sleep %aDelay%
        } else {
            PostMessage, 0x200, 0, aClickPoint.x&0xFFFF | aClickPoint.y<<16,, ahk_id %vHwnd% ; WM_MOUSEMOVE
            PostMessage, 0x201, 0, aClickPoint.x&0xFFFF | aClickPoint.y<<16,, ahk_id %vHwnd% ; WM_LBUTTONDOWN 
            PostMessage, 0x202, 0, aClickPoint.x&0xFFFF | aClickPoint.y<<16,, ahk_id %vHwnd% ; WM_LBUTTONUP 
            sleep %aDelay% 
            
        }
    }
    return
} 

