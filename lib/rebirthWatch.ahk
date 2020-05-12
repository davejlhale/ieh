

rebirthWatch()
{
    
    global rHero
    global vRebirthed:=true
    global vHwnd
    global vStartTime
    global vWinTitle
    static vCurrentHero 
    
    reBirthWatch:
        tracelog("rebirthWatch")
        ;if not over game winow
        MouseGetPos,,, hWinUnderMouse
        if (vHwnd != hWinUnderMouse){
            ;"client not main focus - hero id aborted currnetHero" . vCurrentHero
            tracelog("client not main focus - hero id aborted -  vCurrentHero: "  .  vCurrentHero)
            settimer, reBirthWatch, 1000
            return false
        } 
        
        vFoundHero:= identifyHero()
        
        if (%vFoundHero% = Rebirthing) {
            ShowTip("Rebirthing")
            vCurrentHero="Rebirthing"
            settimer forceOff,-500
            settimer, reBirthWatch, 500
            return false

        } else if (vCurrentHero != vFoundHero){

            vCurrentHero:=vFoundHero
            ShowTip("welcome to IEH Assist brave " . vCurrentHero)
            settimer forceOff,-5000 ;label in ShowTip 
            settimer, reBirthWatch, 5000
            tracelog("found " . vFoundHero)
            return true
        } else {
            settimer, reBirthWatch, 5000
        }
    return 
}