rClickOn(x, x2, y, y2, theColor) {
    global vHwnd
    global vCaptureCount
    global MobColorVariance

    critical on
    PixelSearch, Px, Py, %x%, %y%, %x2%, %y2%, %theColor%, %MobColorVariance%, Fast
    if ErrorLevel {
        return false
    }
    ;msg:="trapped mob at x:"  Px " Py:" y " col:" theColor " mob capture tries" vCaptureCount
    ;TraceLog(msg)
    x:= Px + 3
    y:= Py + 3
    MouseGetPos, ,,_hwnd
    if (vHwnd == _hwnd) {
        MouseClick, Right , x,y ,1,0
    } 
    return true 
}