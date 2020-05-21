
;;sets golem farming at interval
golemFarmer() 
{
   
    global vGolemRepeatEntryInterval
    static golemToggle:=false
    
       if (CheckAllMenuaAreActive()) 
        return ;found bk col

    golemToggle:=!golemToggle
    if !golemToggle {
        showTip("")
        setTimer, golemLoop,Off
        return
    }
    x :=  menu7.x 
    y :=  menu7.y 
    PixelSearch, , , x, y, x, y, 0x001800 , 5
    ;;if menu button covers color
    if ! ErrorLevel
        return
    
    settimer, golemLoop,%vGolemRepeatEntryInterval%
    showTip("Golem farming")
    golemLoop:
        Critical on
        MovementBlock()
        gClick(menu5,2,100)
        
        gclick(Alchemy_check_Box,2,100)
        
        gclick(alchemy_10L,2,50)
        
        gclick(alchOption_8,1,50)
        
        gclick(alchInv1,2,50)
        
        gclick(menu4,2,300)
        
        gclick(challenge2,3,300)
        
        gclick(challenge_start,2,100)
        UnblockMovement()
  
        Critical off
    return
}
