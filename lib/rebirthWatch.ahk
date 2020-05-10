

rebirthWatch()
{
    
    
    global vHero
    global vRebirthed:=true
    global rHero
    global vFoundHero
    global vStartTime
    global vWinTitle
    
    settimer, reBirthWatch, 120000
    
    reBirthWatch:
        WinGetTitle, Title, A
        if ! instr(Title,vWinTitle,false){
            lostFocus:=true
            return
        }
        
        identifyHero()
        if ! lostFocus {
            if (vFoundHero = "Rebirthing" ) {
                ShowTip("Rebirthing")
                settimer forceOff,-200
                vRebirthed:=true
                return
            }
            
            if (vHero != vFoundHero){
                vHero:=vFoundHero
                vRebirthed:=true
                ShowTip("welcome to IEH Assist brave " . vHero)
                settimer forceOff,-5000 ;label in ShowTip 
            } else if vRebirthed { ;check rebirthTime
                
                if (A_TickCount-vStartTime < 900000) { ;;15mins life before potential rebirth to same hero
                    vStartTime:=A_TickCount
                    vRebirthed:=false
                } else {
                    showtip("Hey where did you go!")
                    settimer forceOff,-5000 ;label in ShowTip
                    vRebirthed :=true
                    tooltip ( %vHero% )( %vFoundHero% ) 3
                }
            }
        } else {
            
                        lostFocus:=false 
                      
        }
        if vRebirthed {
            vRebirthed:=false
              ;;deal with rebirth scripts
                        ;send to sub in main page so can be one off toggle and a timeed afk rebirth hunt
                        gosub ReturnFromRebirth
            
        }
    return 
    
    
}