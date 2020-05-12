doNitro() { ;+- offsets allowing for slight error in other clients
critical on
    nsx:=nitro_pixel_start.x -2
    nsy:=nitro_pixel_start.y -8
    nsx2:=nitro_pixel_start.x +2
    nsy2:=nitro_pixel_start.y +8
    MovementBlock()
    gclick(menu1,2,100)
    gClick(sb_GoBack,2,100)

    PixelSearch, , , %nsx%, %nsy%, %nsx2%, %nsy2%, %color%, 8, Fast 
    if ErrorLevel { ;not found     
        gClick(menu5,2.100) ;craft 
        gClick(Alchemy_check_Box,2,100)
        
        gClick(alchemy_1ml,2,100)
        gClick(alchOption_5,20,10) ;nitro gen 
        
        gClick(alchemy_use_all,2,50)
        UnblockMovement()
        traceLog("end ok") 
        return 1
    }
    return
}