
!s::
    autoSkills(){
        critical on
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
        
        tracelog("auto skills on") 
        MovementBlock()
        
        ;skill menu click
        gclick(menu2,2,150)
        
        ;globals slot 1 is buff weave
        gclick(warrior,2,150) ;try put slot 7 war skills in global 2+3
        gclick(st_slot_7,2,100)
        gclick(skillbar_global_top_2,2,100)
        gclick(st_slot_8,2,100)
        gclick(skillbar_global_top_3,2,100)
        
        /* 
        *** class skills *** 
        */
        gclick(warrior,2,150) ; try put war slot 7 +8 9 war skills in class 1+2
        gclick( st_slot_7 ,2,100)
        gclick( skillbar_class_top_2 ,2,50)
        gclick( st_slot_8 ,2,100)
        gclick( skillbar_class_top_3 ,2,50)
        gclick( st_slot_9 ,2,100)
        gclick( skillbar_class_top_3 ,2,50)
        gclick( st_slot_6 ,2,100)
        gclick( skillbar_class_bottom_1 ,2,50)
        gclick( st_slot_5 ,2,100)
        gclick( skillbar_class_bottom_2 ,2,50)
        gclick( skill_table_skill_1_stance ,1,150)
        
        
        
        gclick(wizard,2,150) ;try put wiz slot skills in class 
        gclick( st_slot_2 ,2,100)
        gclick( skillbar_class_top_1 ,2,50)
        gclick( st_slot_7 ,2,100)
        gclick( skillbar_class_top_2 ,2,50)
        gclick( st_slot_9 ,2,100)
        gclick( skillbar_class_top_3 ,2,50)
        gclick( st_slot_5 ,2,100)
        gclick( skillbar_class_bottom_1 ,2,50)
        gclick( st_slot_10 ,2,100)
        gclick( skillbar_class_bottom_2 ,2,50)
        gclick( skill_table_skill_2_stance ,1,150)
        
        
        gclick(angel,2,150) ;try put angel slot skills in class 
        gclick( st_slot_2 ,2,100)
        gclick( skillbar_class_top_1 ,2,50)
        gclick( st_slot_5 ,2,100)
        gclick( skillbar_class_top_2 ,2,50)
        gclick( st_slot_8 ,2,100)
        gclick( skillbar_class_top_3 ,2,50)
        gclick( st_slot_9 ,2,100)
        gclick( skillbar_class_bottom_1 ,2,50)
        gclick( skill_table_skill_9_stance ,1,150)
        gclick( st_slot_7 ,2,100)
        gclick( skillbar_class_bottom_2 ,2,50)
        gclick(wizard,2,150)
        gclick( st_slot_7 ,2,100)
        gclick( skillbar_global_top_1 ,2,50)
        
        
        
        
        
        
        UnblockMovement()
        
        return
        
    }