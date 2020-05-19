;;advanced use only --- to remap clickpoints to offset file
setClickPoints(){
    Critical on
    
    global vGameContainerX1, vGameContainerY1
    global vGameContainerWidth, vGameContainerHeight
    global tt_msg
    checkPoints:=[]
    ; checkPoints.push( "menu1","menu2","menu3","menu4","menu5","menu6","menu7","menu8")
    ; checkPoints.push( "explore","explore_map1","explore_map2","explore_map3","explore_map4","explore_map5","explore_map6","explore_map7","explore_map8")
    ; checkPoints.push( "explore_area1","explore_area2","explore_area3","explore_area4","explore_area5","explore_area6","explore_area7","explore_area8")
    ; checkPoints.push( "dungeon1","dungeon2","dungeon3","dungeon4","dungeon5","dungeon6",,"dungeon7","dungeon8")
    ; checkPoints.push( "explore_bestiary","bestiary_lootAll","bestiary_close")
    ; checkPoints.push( "upgrade","upgrade_mining1","upgrade_mining2","upgrade_mining3","upgrade_gathering3","upgrade_pickaxe1","upgrade_pickaxe2","upgrade_pickaxe3","upgrade_pickaxe4")
    ; checkPoints.push( "upgrade_synt1","upgrade_synt2","upgrade_synt3","upgrade_lab1","upgrade_lab2","upgrade_lab3","upgrade_lab4")
    ; checkPoints.push( "upgrade_gathering1","upgrade_gathering2","upgrade_rake1","upgrade_rake2","upgrade_rake3","upgrade_rake4")
    ; checkPoints.push( "upgrade_gold_bonus","upgrade_exp_bonus","upgrade_expand_equip")
    ; checkPoints.push( "upgrade_stone_ritual","upgrade_crystal_ritual","upgrade_leaf_ritual","upgrade_mystery_box")
    ; checkPoints.push( "upgrade_upgrade1","upgrade_upgrade10","upgrade_upgrade25","upgrade_upgradeMax")
    ; checkPoints.push( "nitro","nitro_pixel_start","nitro_pixel_end")
    ; checkPoints.push( "slime_bank","dark_ritual")
    ; checkPoints.push( "sb_GoBack","sb_withdraw","sb_withdrawConfirm")
    ; checkPoints.push( "sb_times1","sb_times10","sb_times25","sb_timesMax")
    ; checkPoints.push( "sb_donate","sb_purifucation","sb_efficiency","sb_exchange","sb_interest","sb_cap","sb_et_stone","sb_et_crystal","sb_et_leaf","sb_strength","sb_mind","sb_healty_captue","sb_enhanced_capture","sb_monster_counter","sb_graduates","sb_ledger","sb_nitro_generators")
    ; checkPoints.push( "sb_monster_taming","sb_powder_store","sb_explorers_capacity","sb_21","sb_22","sb_23","sb_24","sb_25","sb_26","sb_27","sb_28","sb_29","sb_30","sb_31","sb_32")
    ; checkPoints.push( "craft_check_Box","Alchemy_check_Box","inventory_check_Box")
    ; checkPoints.push( "alchemy_1ml","alchemy_10ml","alchemy_100ml","alchemy_1L","alchemy_10L","alchemy_100L","alchemy_1kL","alchemy_10kL","alchemy100kL","alchemy_1mill","alchemy_10mill","alchemy_100mill","alchemy_1BL","alchemy_10BL")
    ; checkPoints.push( "alchemy_auto_button","alchemy_plus_button","alchemy_use_all")
    ; checkPoints.push( "alchemy_potion_option_1","alchemy_potion_option_2","alchemy_potion_option_3","alchemy_potion_option_4","alchemy_potion_option_5","alchemy_potion_option_6","alchemy_potion_option_7","alchemy_potion_option_8","alchemy_potion_option_9","alchemy_potion_option_10","alchemy_potion_option_11","alchemy_potion_option_12","alchemy_potion_option_13","alchemy_potion_option_14","alchemy_potion_option_15","alchemy_potion_option_16")
    ; checkPoints.push( "alchemy_potion_inventory_slot_1","alchemy_potion_inventory_slot_2","alchemy_potion_inventory_slot_3","alchemy_potion_inventory_slot_4","alchemy_potion_inventory_slot_5","alchemy_potion_inventory_slot_6","alchemy_potion_inventory_slot_7","alchemy_potion_inventory_slot_8","alchemy_potion_inventory_slot_9","alchemy_potion_inventory_slot_10","alchemy_potion_inventory_slot_11","alchemy_potion_inventory_slot_12","alchemy_potion_inventory_slot_13","alchemy_potion_inventory_slot_14","alchemy_potion_inventory_slot_15","alchemy_potion_inventory_slot_16")
    ; checkPoints.push( "challenge_1","challenge_2","challenge_3","challenge_4","challenge5","challenge6","challenge7","challenge8")
    ; checkPoints.push( "challenge_retryBox","challenge_start","challenge_quit")
    ; checkPoints.push( "warrior","wizard","angel")
    ; checkPoints.push( "st_slot_1","st_slot_2","st_slot_3","st_slot_4","st_slot_5","st_slot_6","st_slot_7","st_slot_8","st_slot_9","st_slot_10")
    ; checkPoints.push( "skill_table_skill_1_stance","skill_table_skill_2_stance","skill_table_skill_3_stance","skill_table_skill_4_stance","skill_table_skill_5_stance","skill_table_skill_6_stance","skill_table_skill_7_stance","skill_table_skill_8_stance","skill_table_skill_9_stance","skill_table_skill_10_stance")
    ; checkPoints.push( "skill_table_skill_1_chargeUp","skill_table_skill_2_chargeUp","skill_table_skill_3_chargeUp","skill_table_skill_4_chargeUp","skill_table_skill_5_chargeUp","skill_table_skill_6_chargeUp","skill_table_skill_7_chargeUp","skill_table_skill_8_chargeUp","skill_table_skill_9_chargeUp","skill_table_skill_10_chargeUp")
    ; checkPoints.push( "skillbar_class_top_1","skillbar_class_top_2","skillbar_class_top_3","skillbar_class_bottom_1","skillbar_class_bottom_2","skillbar_class_bottom_3")
    ; checkPoints.push( "skillbar_global_top_1","skillbar_global_top_2","skillbar_global_top_3","skillbar_global_top_4")
    ; checkPoints.push( "skillbar_global_bottom_1","skillbar_global_bottom_2","skillbar_global_bottom_3","skillbar_global_bottom_4")
    ; checkPoints.push( "skillbar_active_skill","skillbar_automove")
    ; checkPoints.push( "equip1","equip2","equip3","equip4","equip5","equip6","equip7","equip8","equip9","equip10")
    ; checkPoints.push( "equip1_levelUp","equip2_levelUp","equip3_levelUp","equip4_levelUp","equip5_levelUp","equip6_levelUp","equip7_levelUp","equip8_levelUp","equip9_levelUp","equip10_levelUp")
    ; checkPoints.push( "equip_classD","equip_classC","equip_classB")
    ; checkPoints.push("SC_ScanPoint","GB_ScanPoint")
    ;checkPoints.push( "warriorColorScanLocation", "angelColorScanLocation", "wizardColorScanLocation")
    ;checkPoints.push("trapAreaTL","trapAreaBR")

    ;checkPoints.push("rebirthSelect","rebirthConfirm")
   ; checkPoints.push("gameStart")
   checkPoints.push("ChilliScanPoint")
    msgbox, 49,,You will asked to right click points which will write them to the offsets.txt file. `neg. menu1 x y`n`nOnly use if you're sure you want this change!
        IfMsgBox, Cancel
    return
    
    Run Edit "configs\offsets.txt"
    For index, value in checkPoints
    { 
        msg= Right Click %value%
        ShowTip(msg , pos:="y35", color:="Red|00FFFF")
        
        KeyWait, RButton, D
        
        MouseGetPos, xpos, ypos
        clickXabs:=Abs(vGameContainerX1-xpos)
        clickYabs:=Abs(vGameContainerY1-ypos)
        xOffsetRation:=clickXabs/vGameContainerWidth
        yOffsetRation:=clickYabs/vGameContainerHeight
        
        SetTitleMatchMode, 2
        WinActivate, Notepad ;
        sleep 200
        
        Send {Enter}%value% %xOffsetRation% %yOffsetRation%		
    }
    showtip("")
    return
}
