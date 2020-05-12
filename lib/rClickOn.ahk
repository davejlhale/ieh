rClickOn(x, x2, y, y2, theColor) {
    global vHwnd
    global vCaptureCount
    global MobColorVariance
    WinActivate, ahk_id %vHwnd%
    critical on
    PixelSearch, Px, Py, %x%, %y%, %x2%, %y2%, %theColor%, %MobColorVariance%, Fast
    if ErrorLevel {
        return false
    }
    msg:="trapped mob at x:"  Px " Py:" y " col:" theColor " mob capture tries" vCaptureCount
    TraceLog(msg)
    x:= Px + 3
    y:= Py + 3
    MouseGetPos, ,,_hwnd
    if (vHwnd == _hwnd) {
        MouseClick, Right , x,y ,2,0
    } else {
        TraceLog("*** POSTMESSAGE from rClickOn ***")
        PostMessage, 0x200, 0, x&0xFFFF | y<<16,, ahk_id %vHwnd% ; WM_MOUSEMOVE
        PostMessage, 0x204, 0, x&0xFFFF | y<<16,, ahk_id %vHwnd% ; 
        PostMessage, 0x205, 0, x&0xFFFF | y<<16,, ahk_id %vHwnd% ;  
    }
    return true 
}