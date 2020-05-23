
AngelWeave:
    {
        Critical on
        global AngelWeaveInterval, vAddBlizardToEndOfAngelWeave
        buffCycleIcon.toggle()
        if !(buffCycleIcon.isactive) {
            SetTimer, AngelWeaveLoop, off
            return
        } else {
            ;call this label on interval
            SetTimer, AngelWeaveLoop, %AngelWeaveInterval%
            tracelog("AngelWeaveLoop started :" AngelWeaveInterval )
        } 
        
        AngelWeaveLoop:
            MovementBlock()
            gClick(menu2,2,100)
            gClick(angel,2,220)
            gClick(st_slot_4,2,20)
            gClick(skillbar_global_top_1,2)
            gClick(st_slot_5,2,20)
            gClick(skillbar_global_top_1,2)
            gClick(st_slot_6,2,20)
            gClick(skillbar_global_top_1,2)
            gClick(st_slot_7,2,20)
            gClick(skillbar_global_top_1,2)
            gClick(st_slot_8,2,20)
            gClick(skillbar_global_top_1,2)
            gClick(st_slot_9,2,20)
            gClick(skillbar_global_top_1,2)
            gClick(st_slot_10,2,20)
            gClick(skillbar_global_top_1,2)
            if vAddSkillToEndOfAngelWeave {
            gClick(angel,2,150)
            gclick( st_slot_3 ,1,100)
            gclick( skillbar_global_top_1 ,2,50)
            }
            
            UnblockMovement()
        return	
    }