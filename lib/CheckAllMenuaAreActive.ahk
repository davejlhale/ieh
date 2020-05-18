CheckAllMenuaAreActive(pMenuNumber:=7)
{
    tracelog("checking menu button:" pMenuNumber)
    vMenu :=menu%pMenuNumber%
    
    global vGameContainerWidth,vGameContainerHeight,begin_x,begin_y,vMenuColor,vHwnd
    gameClickX :=round((vGameContainerWidth * vMenu.x)+begin_x) -3
    gameClickY := round((vGameContainerHeight * vMenu.y)+begin_y) -3
    gameClickX2:=gameClickX+6
    gameClickY2:=gameClickY+6
    
    WinActivate, ahk_id %vHwnd%
    
    PixelSearch, x,y , %gameClickX%, %gameClickY%, %gameClickX2%, %gameClickY2%, vMenuColor, 5
    
    tracelog("menu id hwnd" . vHwnd . " check for:" . vMenuColor . " x:" . gameClickX . " y:" . gameClickY . " result:" . ErrorLevel )
    if errorlevel {
        return false ;not all found
    } Else {
        return true ;background col found
    }
    
    
}