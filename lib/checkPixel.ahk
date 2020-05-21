checkPixel(ColorScanLocation,pcolor,pdimentionX:=3,pdimentionY:=8,variance:=10)
{
    global vHwnd
    WinActivate, ahk_id %vHwnd%
    
    
    X := ColorScanLocation.x - pdimentionX
    Y := ColorScanLocation.y - pdimentionY
    X2:= ColorScanLocation.x + pdimentionX
    Y2:= ColorScanLocation.y + pdimentionY
    
    if ! isObject(ColorScanLocation) {
        ColorScanLocation :=%ColorScanLocation%.clone()
        TraceLog("gclick clone " . ColorScanLocation.name)
        if ! isObject(ColorScanLocation) && ColorScanLocation.class!="ClickPoint" {
            TraceLog("failed cloning" . %ColorScanLocation%)
            return
        }
    }
    
    
    
    
    
    PixelGetColor,col, X,Y %pColor% 
    PixelSearch, , , %X%, %Y%, %X2%, %Y2%, pColor , variance
    msg="pixelSearch on id " %vHwnd% %ErrorLevel% %X% %Y% %X2% %Y2% %pColor% %Variance% "color found " %col% "end"
    traceLog(msg)
    return ErrorLevel ;0 = found
}