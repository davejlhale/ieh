;;clicks on aClickponit, aClickCountTimes with aDelay between clicks
gClick( aClickPoint,aClickCount:=1,aDelay:=20) { 
    
    Critical on
    global vWinTitle
    global vHwnd
    global vGameContainerWidth,vGameContainerHeight
    global begin_x, begin_y
    global vMouseBlocked
    
    
    if ! isObject(aClickPoint) {
        aClickPoint :=%aClickPoint%.clone()
        TraceLog("gclick clone " . aClickPoint.name)
        if ! isObject(aClickPoint) && aClickPoint.class!="ClickPoint" {
            TraceLog("failed cloning" . %aClickPoint%)
            return
        }
    }
    
    gameClickX :=round((vGameContainerWidth * aClickPoint.x)+begin_x)
    gameClickY := round((vGameContainerHeight * aClickPoint.y)+begin_y)
   
    TraceLog("gclick " . aClickCount . " - " aClickpoint.name . " x:" . gameClickX . " y:" . gameClickY )
    loop %aClickCount%
    {
        if (MovementBlock())
        {
            Send {click, %gameClickX%, %gameClickY%}
            sleep %aDelay%
        } else {
            PostMessage, 0x200, 0, gameClickX&0xFFFF | gameClickY<<16,, ahk_id %vHwnd% ; WM_MOUSEMOVE
            PostMessage, 0x201, 0, gameClickX&0xFFFF | gameClickY<<16,, ahk_id %vHwnd% ; WM_LBUTTONDOWN 
            PostMessage, 0x202, 0, gameClickX&0xFFFF | gameClickY<<16,, ahk_id %vHwnd% ; WM_LBUTTONUP 
            sleep %aDelay% 

        }
    }
    return
} 

