rClickOn(theColor) {
    global vHwnd
    global vCaptureCount
    global MobColorVariance, vTrapx1 , vTrapy1 , vTrapx2 , vTrapy2 

    critical on
    PixelSearch, Px, Py, %vTrapx1%, %vTrapy1%, %vTrapx2%, %vTrapy2%, %theColor%, %MobColorVariance%, Fast
    if ErrorLevel {
        return false
    }

    x:= Px + 3
    y:= Py + 3
    MouseGetPos, ,,_hwnd
    if (vHwnd == _hwnd) {
        MouseClick, Right , x,y ,1,0
         vCaptureCount++
    } 
    return true 
}