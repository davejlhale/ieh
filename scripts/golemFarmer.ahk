
;;sets golem farming at interval
golemFarmer(pDelay:=60000) 
{
    global Alchemy_check_Box, alchemy_10L, alchOption_8,alchInv16
    global challenge_start, challenge2
    global menu5,menu4
    golemRepeat := pDelay
   static golemToggle:=false

    golemToggle:=!golemToggle
    if !golemToggle {
        showTip("")
        setTimer, golemLoop,Off
        return
    }
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
