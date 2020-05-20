checkPixel(ColorScanLocation,pcolor,pdimentionX:=3,pdimentionY:=8,variance:=10)
{
    global vGameContainerWidth,vGameContainerHeight
    global vGameContainerX1, vGameContainerY1
    global vHwnd
    WinActivate, ahk_id %vHwnd%
    
    
    X :=round((vGameContainerWidth * ColorScanLocation.x)+vGameContainerX1) - pdimentionX
    Y := round((vGameContainerHeight * ColorScanLocation.y)+vGameContainerY1)-pdimentionY
    X2:=X+pdimentionX + pdimentionX
    Y2:=Y+pdimentionY +pdimentionY
    
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