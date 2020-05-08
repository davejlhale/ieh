
;;sets fairy farming at interval
fairyFarmer(pDelay:=60000) 
{
    global Alchemy_check_Box, alchemy_10L, alchOption_10,alchInv16
    global challenge_start, challenge4
    global menu5,menu4
    fairyRepeat := pDelay
   static fairyToggle:=false

     fairyToggle:=!fairyToggle
    if !fairyToggle {
        showTip("")
        setTimer, fairyLoop,Off
        return
    }
    settimer, fairyLoop,%fairyRepeat%
    showTip("fairy farming")
    fairyLoop:
        Critical on
        BlockInput mousemove
        MouseGetPos tx, ty
        gClick(menu5,2,100)
      
        gclick(Alchemy_check_Box,2,100)
       
        gclick(alchemy_10L,2,50)
     
        gclick(alchOption_10,2,50)
    
        gclick(alchInv16,2,50)
     
        gclick(menu4,2,330)
      
        gclick(challenge4,3,300)
        
        gclick(challenge_start,2,100)
        
        
        mousemove tx,ty
        BlockInput mousemoveoff
        Critical off
    return
}
