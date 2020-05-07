;;clicks on aClickponit, aClickCountTimes with aDelay between clicks
gClick( aClickPoint,aClickCount:=1,aDelay:=20){ 
    CoordMode, Mouse, Client
    Critical on
    global gWinTitle
    global gameX,gameY
    global begin_x, begin_y

    if ! isObject(aClickPoint) && aClickPoint.class!="ClickPoint"{
        aClickPoint :=%aClickPoint%.clone()
        if ! isObject(aClickPoint) && aClickPoint.class!="ClickPoint"
            return
    }
    WinGetTitle, Title, A
    if ! instr(Title,gWinTitle,false)
        return 1
    
    gameClickX :=round((gameX * aClickPoint.x)+begin_x)
    gameClickY := round((gameY * aClickPoint.y)+begin_y)
    
    loop %aClickCount%
    {
        Send {click, %gameClickX%, %gameClickY%}
        sleep %aDelay%
    }
    return
} 