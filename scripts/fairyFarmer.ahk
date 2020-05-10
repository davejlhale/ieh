
;;sets fairy farming at interval
fairyFarmer(pDelay:=60000) 
{
    global Alchemy_check_Box, alchemy_10L, alchOption_10,alchInv16
    global challenge_start, challenge4
    global menu5,menu4,menu7
    fairyRepeat := pDelay
    static fairyToggle:=false
    global gameX,gameY
    global begin_x, begin_y
    fairyToggle:=!fairyToggle


    if !fairyToggle {
        showTip("")
        setTimer, fairyLoop,Off
        return
    }
    
    x:=round((gameX * menu7.x)+begin_x)
    y := round((gameY * menu7.y)+begin_y)
    PixelSearch, , , x, y, x, y, 0x001800 , 5
    ;;if menu button covers color
    if ! ErrorLevel
        return
    
    
    settimer, fairyLoop,%fairyRepeat%
    showTip("fairy farming")
    fairyLoop:
        Critical on
        BlockInput mousemove
        MouseGetPos vMouseMemoryX,vMouseMemoryY
        gClick(menu5,2,100)
        gclick(Alchemy_check_Box,2,100)
        gclick(alchemy_10L,2,50)
        gclick(alchOption_10,2,50)
        gclick(alchInv16,2,50)
        gclick(menu4,2,330)
        gclick(challenge4,3,300)
        gclick(challenge_start,2,100)
        mousemove vMouseMemory,vMouseMemoryY,0
        BlockInput mousemoveoff
        Critical off
    return
}
