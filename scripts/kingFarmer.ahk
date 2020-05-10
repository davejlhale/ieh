
;;sets golem farming at interval
kingFarmer(pDelay:=60000) 
{
    global Alchemy_check_Box, alchemy_10L, alchOption_7,alchInv16
    global challenge_start, challenge1
    global menu5,menu4
    kingRepeat := pDelay
    static kingToggle:=false
    global vGameContainerWidth,vGameContainerHeight
    global begin_x, begin_y
    
    kingToggle:=!kingToggle
    if !kingToggle {
        showTip("")
        setTimer, kingLoop,Off
        return
    }
    x:=round((vGameContainerWidth * menu7.x)+begin_x)
    y := round((vGameContainerHeight * menu7.y)+begin_y)
    PixelSearch, , , x, y, x, y, 0x001800 , 5
    ;;if menu button covers color
    if ! ErrorLevel
        return
    settimer, kingLoop,%kingRepeat%
    showTip("King farming")
    kingLoop:
        Critical on
        MovementBlock()
        gClick(menu5,2,100)
        
        gclick(Alchemy_check_Box,2,100)
        
        gclick(alchemy_10L,2,50)
        
        gclick(alchOption_7,2,50)
        
        gclick(alchInv16,2,50)
        
        gclick(menu4,2,300)
        
        gclick(challenge1,3,300)
        
        gclick(challenge_start,2,100)
        UnblockMovement()
        Critical off
    return
}
