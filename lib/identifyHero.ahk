identifyHero()
{ 
    global warriorColorScanLocation,cWarrior
    global angelColorScanLocation,cWizard
    global wizardColorScanLocation,cAngel
    global vFoundHero
    global vHwnd
  
    
    MouseGetPos,,, hWinUnderInstance
    if (vHwnd != hWinUnderMouse && vMonitorCount ==1 ) {
        tracelog("identifyHero aborted - no focus")
        return 1
    } 
    WinActivate ahk_id %vHwnd%
    
    tracelog("attempting hero id")
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