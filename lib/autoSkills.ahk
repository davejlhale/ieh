!S::
!s::
    autoSkills(){
        critical on
        global vCurrentHero
        tracelog("autoskills started for: " vCurrentHero)
        global menu2,warrior,wizard,angel
        ;skill tags
        global st_slot_1,st_slot_2,st_slot_3,st_slot_4,st_slot_5,st_slot_6,st_slot_7,st_slot_8,st_slot_9,st_slot_10
        ;stance tags
        global skill_table_skill_1_stance,skill_table_skill_2_stance,skill_table_skill_3_stance,skill_table_skill_4_stance,skill_table_skill_5_stance,skill_table_skill_6_stance,skill_table_skill_7_stance,skill_table_skill_8_stance,skill_table_skill_9_stance,skill_table_skill_10_stance
        ;level up skill tags
        global skill_table_skill_1_chargeUp,skill_table_skill_2_chargeUp,skill_table_skill_3_chargeUp,skill_table_skill_4_chargeUp,skill_table_skill_5_chargeUp,skill_table_skill_6_chargeUp,skill_table_skill_7_chargeUp,skill_table_skill_8_chargeUp,skill_table_skill_9_chargeUp,skill_table_skill_10_chargeUp
        ;left hotbar tabs tags
        global skillbar_class_top_1,skillbar_class_top_2,skillbar_class_top_3
        global skillbar_class_bottom_1,skillbar_class_bottom_2,skillbar_class_bottom_3
        ;global hotbar tags 
        global skillbar_global_top_1,skillbar_global_top_2,skillbar_global_top_3,skillbar_global_top_4
        global skillbar_global_bottom_1,skillbar_global_bottom_2,skillbar_global_bottom_3,skillbar_global_bottom_4
        ;misc hotbar tags
        global skillbar_active_skill,skillbar_automove
        
        MovementBlock()
        gclick(menu2,2,150)
        
        
        /*
        *** warriors skills setup ***
        */
        if (vCurrentHero=="warrior") {
            gclick(warrior,2,150) ; <- do not change
            tracelog("Setting warrior skills")
            #include ..\configs\WarriorSkills.ini
        }
        
        /*
        *** wizards skills setup ***
        */
        if (vCurrentHero=="wizard") {
            gclick(wizard,2,150) ; <- do not change
            tracelog("Setting wizard skills")
            #include ..\configs\WizardSkills.ini
        }
        
        /*
        *** angels skills setup ***
        */
        if (vCurrentHero=="angel") {
            gclick(angel,2,150) ; <- do not change
            tracelog("Setting angel skills")
            #include ..\configs\AngelSkills.ini
        }
    
        UnblockMovement()    
        return
    }