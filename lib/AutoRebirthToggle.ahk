AutoRebirthToggle(){
    global AutoRebirthIcon, rebirthAfter
    AutoRebirthIcon.toggle()
  
    if AutoRebirthIcon.isactive {
        showtip("Auto Rebirth is On every (ms) "rebirthAfter)
        settimer, AutoRebirth, %rebirthAfter%
    } else {
        showtip("Auto Rebirth is Off")
        settimer, AutoRebirth, off
    }
    tracelog("auto rebirth :" AutoRebirthIcon.isactive)
    settimer, forceOff,5000
}