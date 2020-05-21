
;;sets fairy farming at interval
fairyFarmer() 
{
    global Alchemy_check_Box, alchemy_10L, alchOption_10,alchInv16
    global challenge_start, challenge4
    global menu5,menu4,menu7
    global vFairyRepeatInterval 
    static fairyToggle:=false
    global vGameContainerWidth,vGameContainerHeight
    global vGameContainerX1, vGameContainerY1
    
    if (CheckAllMenuaAreActive()) ;found bk col
        return
    fairyToggle:=!fairyToggle
    
    
    if !fairyToggle {
        showTip("")
        setTimer, fairyLoop,Off
        return
    }
    
    x := menu7.x 
    y := menu7.y 
    PixelSearch, , , x, y, x, y, 0x001800 , 5
    ;;if menu button covers color
    if ! ErrorLevel
        return
    
    
    settimer, fairyLoop,%vFairyRepeatInterval%
    showTip("fairy farming")
    fairyLoop:
        Critical on
        MovementBlock()
        gClick(menu5,2,100)
        gclick(Alchemy_check_Box,2,100)
        gclick(alchemy_10L,2,50)
        gclick(alchOption_10,1,50)
        gclick(alchInv1,1,50)
        gclick(menu4,2,330)
        gclick(challenge4,3,300)
        gclick(challenge_start,2,100)
        UnblockMovement()
        Critical off
    return
}
