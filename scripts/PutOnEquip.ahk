global equip1 , equip2 , equip3 , equip4 , equip5 , equip6 , equip7 , equip8 , equip9 , equip10 
global equipClassD , equipClassC , equipClassB ,menu5,craft_check_Box2
PutOnEquip(aEquipmeentSet:="general")
{
    global EquipIcon
    static vputOnToggle:=False
    
    EquipIcon.Toggle()
    if !(EquipIcon.isactive) {
        SetTimer, putOnEquipAction, off
        return
    }
    
    ;call this label on interval -600000 = 1mins
    SetTimer, putOnEquipAction, 30000
    vEquipmentSet:= checkEquipConfig(aEquipmeentSet)
    
    
    putOnEquipAction:
        gClick(menu5,2,100)
        gClick(craft_check_Box2,100)
        sleep 10
        
        Loop, read, configs/EquipmentSets.ini
        {
            Critical, on
            MouseGetPos tx, ty
            BlockInput mousemove

            Loop, parse, A_LoopReadLine, %A_Tab%
            { 
                if (A_index==1) && (A_loopfield != vEquipmentSet) 
                    Break
 
                if Mod(A_index,2) ;equipment class
                    gClick(A_loopfield,2,50)
                else ;equipment slot
                    gClick(A_loopfield,2,50)  
            }

            mousemove tx,ty
            BlockInput mousemoveoff
            critical off
        }   
    return
}