
;;sets spider farming at interval
spiderFarmer(pDelay:=60000) 
{
    global Alchemy_check_Box, alchemy_10L, alchOption_9,alchInv16
    global challenge_start, challenge3
    global menu5,menu4
    spiderRepeat := pDelay
   static spiderToggle:=false

    spiderToggle:=!spiderToggle
    if !spiderToggle {
        showTip("")
        setTimer, spiderLoop,Off
        return
    }
    settimer, spiderLoop,%spiderRepeat%
    showTip("spider farming")
    spiderLoop:
        Critical on
        BlockInput mousemove
        MouseGetPos tx, ty
        gClick(menu5,2,100)
      
        gclick(Alchemy_check_Box,2,100)
       
        gclick(alchemy_10L,2,50)
     
        gclick(alchOption_9,2,50)
    
        gclick(alchInv16,2,50)
     
        gclick(menu4,2,300)
      
        gclick(challenge3,3,300)
        
        gclick(challenge_start,2,100)
        
        
        mousemove tx,ty
        BlockInput mousemoveoff
        Critical off
    return
}
