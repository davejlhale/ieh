
;;sets golem farming at interval
golemFarmer(pDelay:=60000) 
{
    global Alchemy_check_Box, alchemy_10L, alchOption_8,alchInv16
    global challenge_start, challenge2
    global menu5,menu4
    golemRepeat := pDelay
    static golemToggle:=false
    global gameX,gameY
    global begin_x, begin_y
    
    golemToggle:=!golemToggle
    if !golemToggle {
        showTip("")
        setTimer, golemLoop,Off
        return
    }
    x:=round((gameX * menu7.x)+begin_x)
    y := round((gameY * menu7.y)+begin_y)
    PixelSearch, , , x, y, x, y, 0x001800 , 5
    ;;if menu button covers color
    if ! ErrorLevel
        return
    
    settimer, golemLoop,%golemRepeat%
    showTip("Golem farming")
    golemLoop:
        Critical on
        BlockInput mousemove
        MouseGetPos tx, ty
        gClick(menu5,2,100)
        
        gclick(Alchemy_check_Box,2,100)
        
        gclick(alchemy_10L,2,50)
        
        gclick(alchOption_8,2,50)
        
        gclick(alchInv16,2,50)
        
        gclick(menu4,2,300)
        
        gclick(challenge2,3,300)
        
        gclick(challenge_start,2,100)
        
        
        mousemove tx,ty
        BlockInput mousemoveoff
        Critical off
    return
}
