CheckAllMenuaAreActive(pMenuNumber:=7)
{
    tracelog("checking menu button:" . pMenuNumber)
    vMenu :=menu%pMenuNumber%
    
    global vGameContainerWidth,vGameContainerHeight,vGameContainerX1,vGameContainerY1,vMenuColor,vHwnd
    gameClickX :=vMenu.x -3
    gameClickY :=vMenu.y -3
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