identifyHero()
{
    CoordMode, Mouse, Client 
    global gWinTitle
    global warriorColorScanLocation
    global angelColorScanLocation
    global wizardColorScanLocation
    global vFoundHero
      
    cWarrior:=0x8A624A
    cWizard:=0x21485A
    cAngel:=0xCBCBC9
    vFoundHero:="ERROR"
    
    if ! checkPixel(warriorColorScanLocation,cWarrior){
        vFoundHero:="warrior"
       ; msgbox war
    }else if ! checkPixel(wizardColorScanLocation,cWizard){
        vFoundHero:="wizard"
       ; msgbox wiz
    }
    else if ! checkPixel(angelColorScanLocation,cAngel){
        vFoundHero:="angel"
      ;  msgbox angl
    }
    Else {
        vFoundHero:="Rebirthing"
    }
    return 
}