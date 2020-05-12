TrapMaker() {
    
    global alchemy_use_all
    static skipAlchProgress:=false
    global alchInv1_x ,alchInv1_y ,alchInv1_x2 ,alchInv1_y2
    global alchOption_14_x , alchOption_14_y , alchOption_14_x2 , alchOption_14_y2
    global vTrapColor
    
    critical on
    MovementBlock()
   
    gClick(menu5,1,100)
    gClick(Alchemy_check_Box ,1,10) 
    
    gClick(alchemy_use_all,1,100) ; clear junk from any miss clicks
    if skipAlchProgress {
        gclick(alchemy_1L,1,88) 
        MouseClick, Right , alchOption_14_x,alchOption_14_y ,2,0	   
    }
    else {
        gClick(alchemy_10ml,1,88) 			; we wont trap till 1L alch
        gClick(alchemy_100ml,1,88)			;
        gclick(alchemy_1L,1,88)             ;
        gClick(alchemy_plus_button,1,50) 	;stuck on below 1L will raise
        
        PixelSearch, , , %alchOption_14_x%, %alchOption_14_y%, %alchOption_14_x2%, %alchOption_14_y2%, %vTrapColor% ,6 
        if ! errorlevel { ; 0= found = trap at option 14 ie 1L
            MouseClick, Right , alchOption_14_x,alchOption_14_y ,2,0
            skipAlchProgress:=true ;can make these now so speed up by skipping steps above
        } 
        
    }
    unblockmovement()
    return 
}
