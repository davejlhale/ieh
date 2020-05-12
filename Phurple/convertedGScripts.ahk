

doUpgrades() {
    MovementBlock()
    gClick(menu2,2,100) ;skill table
    gClick(angel,2,100)
    gClick(st_slot_5) ;muscle
    gClick(skillbar_global_top_3) ;global slot 3 
    gClick(st_slot_4) ;god bless
    gClick(skillbar_global_top_3) ;global slot 3 
    gClick(st_slot_7) ;protect
    gClick(skillbar_global_top_3) ;global slot 3 
    gClick(st_slot_8) ;haste
    gClick(skillbar_global_top_3) ;global slot 3 
    gClick(st_slot_9) ;gold
    gClick(skillbar_global_top_3) ;global slot 3 
    ;MCS(2399, 773, t) ;skill
    ;MCS(2895, 880, t) ;global slot 3 
    gClick(st_slot_6) ;magic
    gClick(skillbar_global_top_3) ;global slot 3 
    gClick(st_slot_3) ;heal
    gClick(skillbar_global_top_3) ;global slot 3 
    UnblockMovement()
    traceLog("end ok") 
}

doUpgradesAsAngel() {
    MovementBlock() 
    gClick(menu2,2,100) ;skill table
    gClick(angel,2,100)
    
    gClick(st_slot_4) ;god bless
    gClick(skillbar_class_top_3,1,50) ;slot 3 
    gClick(st_slot_6) ;magic
    gClick(skillbar_class_top_3,1,50) ;slot 3 
    gClick(st_slot_5) ;skill
    gClick(skillbar_class_top_3,1,50) ;slot 3 
    gClick(st_slot_3) ;skill
    gClick(skillbar_class_top_3,1,50) ;slot 3 
    gClick(st_slot_10) ;skill
    gClick(skillbar_class_top_3,1,50) ;slot 
    
    gClick(st_slot_5) ;skill
    gClick(skillbar_class_top_3,1,50) ;slot 3 
    gClick(st_slot_7) ;protect
    gClick(skillbar_class_top_3,1,50) ;slot 3 
    gClick(st_slot_8) ;skill
    gClick(skillbar_class_top_3,1,50) ;slot 
    
    gClick(st_slot_9) ;gold
    gClick(skillbar_class_top_2,1,50) ;slot 
    gClick(skill_table_skill_9_stance)
    
    gClick(st_slot_2) ;wing shoot 
    gClick(skillbar_class_top_1,1,50) ;slot 3 
    
    
    UnblockMovement()
    traceLog("end ok") 
}
checkNitroOnUpgrade() {
    doNitro()
	return
}


doAlchemy() {
    MovementBlock() 
    gClick(menu5,2.100) ;craft 
    gClick(Alchemy_check_Box,2,100)
    gClick(alchemy_1ml,2,100)
    gClick(alchOption_1,30,20) ;monster energy
    gClick(alchemy_use_all,2,50)
    UnblockMovement()
    traceLog("end ok") 
    
}

doOvernightUpgrades() {
    MovementBlock() 
    gClick(menu1,2.300) ;upgrade extra sleep delay for lag ?
    gClick(sb_GoBack) ;incase on ritual
    gClick(slime_bank,2,300) ;slime bank
    gClick(sb_cap,1,100) ;bank cap *** 1 !! time
    ; *** MCS(2487, 529, t) ;sleep, 100 
    UnblockMovement()
    traceLog("end ok")
}

buyUpgrade() {
    MovementBlock()
    gClick(menu1,2,300)
    gClick(sb_GoBack,2,300)
    
    gClick(upgrade_upgradeMax,2)
    gClick(upgrade_crystal_ritual)
    gClick(upgrade_stone_ritual)
    gClick(upgrade_leaf_ritual)
    
    gClick(upgrade_rake4)
    gClick(upgrade_pickaxe4)
    gClick(upgrade_lab4)
    
    gClick(upgrade_rake3)
    gClick(upgrade_pickaxe3)
    gClick(upgrade_lab3)
    
    gClick(upgrade_rake2)
    gClick(upgrade_pickaxe2)
    gClick(upgrade_lab2)
    
    gClick(upgrade_rake1)
    gClick(upgrade_pickaxe1)
    gClick(upgrade_lab1)
    
    gClick(upgrade_exp_bonus) 
    gClick(upgrade_gold_bonus)
    
    gClick(upgrade_expand_equip)
    
    gClick(upgrade_upgrade1,2)
    gClick(upgrade_mystery_box)
    UnblockMovement() 
}

