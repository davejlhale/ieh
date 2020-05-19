
;;sets spider farming at interval
spiderFarmer() 
{
    global Alchemy_check_Box, alchemy_10L, alchOption_9,alchInv16
    global challenge_start, challenge3
    global menu5,menu4
    global vSpiderRepeatInterval
    static spiderToggle:=false
    global vGameContainerWidth,vGameContainerHeight
    global vGameContainerX1, vGameContainerY1

    spiderToggle:=!spiderToggle
    if !spiderToggle {
        showTip("")
        setTimer, spiderLoop,Off
        return
    }
    x:=round((vGameContainerWidth * menu7.x)+vGameContainerX1)
    y := round((vGameContainerHeight * menu7.y)+vGameContainerY1)
    PixelSearch, , , x, y, x, y, 0x001800 , 5
    ;;if menu button covers color
    if ! ErrorLevel
        return
        
    settimer, spiderLoop,%vSpiderRepeatInterval%
    showTip("spider farming")
    spiderLoop:
        Critical on
        MovementBlock()
        gClick(menu5,2,100)
        
        gclick(Alchemy_check_Box,2,100)
        
        gclick(alchemy_10L,2,50)
        
        gclick(alchOption_9,2,50)
        
        gclick(alchInv16,2,50)
        
        gclick(menu4,2,300)
        
        gclick(challenge3,3,300)
        
        gclick(challenge_start,2,100)
        
        UnblockMovement()
        Critical off
    return
}
