identifyHero()
{ 
    global warriorColorScanLocation
    global angelColorScanLocation
    global wizardColorScanLocation
    global vFoundHero
    global vHwnd

    MouseGetPos,,, hWinUnderInstance
    if (vHwnd != hWinUnderInstance){
        tracelog("identifyHero aborted - no focus")
        return 1
    } 
    
    cWarrior:=0x73685D
    cWizard:=0x7683B1
    cAngel:=0xCCD0C7
    
    tracelog("hero id attempt")
    if ! checkPixel(warriorColorScanLocation,cWarrior,3,3){
        return "warrior"
    }else if ! checkPixel(wizardColorScanLocation,cWizard,3,3){
        return "wizard"
    }
    else if ! checkPixel(angelColorScanLocation,cAngel,3,3){
        return "angel"
    }
    Else {
        return "Rebirthing"
    } 
}