
;;sets spider farming at interval
spiderFarmer() 
{
    global vSpiderRepeatInterval
    static spiderToggle:=false

    spiderToggle:=!spiderToggle
    if !spiderToggle {
        showTip("")
        setTimer, spiderLoop,Off
        return
    }
    x :=  menu7.x 
    y :=  menu7.y 
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
        
        gclick(alchOption_9,1,50)
        
        gclick(alchInv1,2,50)
        
        gclick(menu4,2,300)
        
        gclick(challenge3,3,300)
        
        gclick(challenge_start,2,100)
        
        UnblockMovement()
        Critical off
    return
}
