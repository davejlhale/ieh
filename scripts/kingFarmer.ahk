
;;sets golem farming at interval
kingFarmer(pDelay:=60000) 
{
    global Alchemy_check_Box, alchemy_10L, alchOption_7,alchInv16
    global challenge_start, challenge1
    global menu5,menu4
    kingRepeat := pDelay
   static kingToggle:=false

    kingToggle:=!kingToggle
    if !kingToggle {
        showTip("")
        setTimer, kingLoop,Off
        return
    }
    settimer, kingLoop,%kingRepeat%
    showTip("King farming")
   kingLoop:
        Critical on
        BlockInput mousemove
        MouseGetPos tx, ty
        gClick(menu5,2,100)
      
        gclick(Alchemy_check_Box,2,100)
       
        gclick(alchemy_10L,2,50)
     
        gclick(alchOption_7,2,50)
    
        gclick(alchInv16,2,50)
     
        gclick(menu4,2,300)
      
        gclick(challenge1,3,300)
        
        gclick(challenge_start,2,100)
        
        
        mousemove tx,ty
        BlockInput mousemoveoff
        Critical off
    return
}
