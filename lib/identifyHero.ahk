identifyHero()
{ 
    global warriorColorScanLocation
    global angelColorScanLocation
    global wizardColorScanLocation
    global vFoundHero
    global vHwnd
  
    
    MouseGetPos,,, hWinUnderInstance
    if (vHwnd != hWinUnderMouse && vMonitorCount ==1 ) {
        tracelog("identifyHero aborted - no focus")
        return 1
    } 
    WinActivate ahk_id %vHwnd%
    
    
    cWarrior:=0x73685D
    cWizard:=0x7683B1
    cAngel:=0xCCD0C7
    
    tracelog("hero id attempt")
    if ! checkPixel(warriorColorScanLocation,cWarrior,4,4){
        return "warrior"
    }else if ! checkPixel(wizardColorScanLocation,cWizard,7,7){
        return "wizard"
    }
    else if ! checkPixel(angelColorScanLocation,cAngel,4,4){
        return "angel"
    }
    Else {
        return "Rebirthing"
    } 
}