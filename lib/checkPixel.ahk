checkPixel(ColorScanLocation,pcolor,pdimentionX:=3,pdimentionY:=8)
{
    global vGameContainerWidth,vGameContainerHeight
    global begin_x, begin_y
    global vHwnd
    WinActivate, ahk_id %vHwnd%
    
    
    X :=round((vGameContainerWidth * ColorScanLocation.x)+begin_x)
    Y := round((vGameContainerHeight * ColorScanLocation.y)+begin_y)
    X2:=X+pdimentionX
    Y2:=Y+pdimentionY
    
    ;mousemove X,Y
    PixelGetColor,col, X,Y
    PixelSearch, , , %X%, %Y%, %X2%, %Y2%, pColor , 10
    msg="pixelSearch on id " %vHwnd% %ErrorLevel% %X% %Y% %X2% %Y2% %pColor% %pVariance% "color found " %col% "end"
    traceLog(msg)
    return ErrorLevel ;0 = found
}