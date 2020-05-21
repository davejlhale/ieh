
global trapAreaTL,trapAreaBR,menu1,menu2,menu3,menu4,menu5,menu6,menu7,menu8,explore,explore_map1,explore_map2,explore_map3,explore_map4,explore_map5,explore_map6,explore_map7,explore_map8,explore_area1,explore_area2,explore_area3,explore_area4,explore_area5,explore_area6,explore_area7,explore_area8,dungeon1,dungeon2,dungeon3,dungeon4,dungeon5,dungeon6,dungeon7,dungeon8,explore_bestiary,bestiary_lootAll,bestiary_close,upgrade,upgrade_mining1,upgrade_mining2,upgrade_mining3,upgrade_gathering3,upgrade_pickaxe1,upgrade_pickaxe2,upgrade_pickaxe3,upgrade_pickaxe4,upgrade_synt1,upgrade_synt2,upgrade_synt3,upgrade_lab1,upgrade_lab2,upgrade_lab3,upgrade_lab4,upgrade_gathering1,upgrade_gathering2,upgrade_rake1,upgrade_rake2,upgrade_rake3,upgrade_rake4,upgrade_gold_bonus,upgrade_exp_bonus,upgrade_expand_equip,upgrade_stone_ritual,upgrade_crystal_ritual,upgrade_leaf_ritual,upgrade_mystery_box,upgrade_upgrade1,upgrade_upgrade10,upgrade_upgrade25,upgrade_upgradeMax,nitro,nitro_pixel_start,nitro_pixel_end,slime_bank,dark_ritual,sb_GoBack,sb_withdraw,sb_withdrawConfirm,sb_times1,sb_times10,sb_times25,sb_timesMax,sb_donate,sb_purifucation,sb_efficiency,sb_exchange,sb_interest,sb_cap,sb_et_stone,sb_et_crystal,sb_et_leaf,sb_strength,sb_mind,sb_healty_captue,sb_enhanced_capture,sb_monster_counter,sb_graduates,sb_ledger,sb_nitro_generators,sb_monster_taming,sb_powder_store,sb_explorers_capacity,sb21,sb22,sb23,sb24,sb25,sb26,sb27,sb28,sb29,sb30,sb31,sb32,craft_check_Box,Alchemy_check_Box,inventory_check_Box,alchemy_1ml,alchemy_10ml,alchemy_100ml,alchemy_1L,alchemy_10L,alchemy_100L,alchemy_1kL,alchemy_10kL,alchemy100kL,alchemy_1mill,alchemy_10mill,alchemy_100mill,alchemy_1BL,alchemy_10BL,alchemy_auto_button,alchemy_plus_button,alchemy_use_all,alchOption_1,alchOption_2,alchOption_3,alchOption_4,alchOption_5,alchOption_6,alchOption_7,alchOption_8,alchOption_9,alchOption_10,alchOption_11,alchOption_12,alchOption_13,alchOption_14,alchOption_15,alchOption_16,challenge1,challenge2,challenge3,challenge4,challenge5,challenge6,challenge7,challenge8,challenge_retryBox,challenge_start,challenge_quit,warrior,wizard,angel,st_slot_1,st_slot_2,st_slot_3,st_slot_4,st_slot_5,st_slot_6,st_slot_7,st_slot_8,st_slot_9,st_slot_10,skill_table_skill_1_stance,skill_table_skill_2_stance,skill_table_skill_3_stance,skill_table_skill_4_stance,skill_table_skill_5_stance,skill_table_skill_6_stance,skill_table_skill_7_stance,skill_table_skill_8_stance,skill_table_skill_9_stance,skill_table_skill_10_stance,skill_table_skill_1_chargeUp,skill_table_skill_2_chargeUp,skill_table_skill_3_chargeUp,skill_table_skill_4_chargeUp,skill_table_skill_5_chargeUp,skill_table_skill_6_chargeUp,skill_table_skill_7_chargeUp,skill_table_skill_8_chargeUp,skill_table_skill_9_chargeUp,skill_table_skill_10_chargeUp,skillbar_class_top_1,skillbar_class_top_2,skillbar_class_top_3,skillbar_class_bottom_1,skillbar_class_bottom_2,skillbar_class_bottom_3,skillbar_global_top_1,skillbar_global_top_2,skillbar_global_top_3,skillbar_global_top_4,skillbar_global_bottom_1,skillbar_global_bottom_2,skillbar_global_bottom_3,skillbar_global_bottom_4,skillbar_active_skill,skillbar_automove,alchInv1,alchInv2,alchInv3,alchInv4,alchInv5,alchInv6,alchInv7,alchInv8,alchInv9,alchInv10,alchInv11,alchInv12,alchInv13,alchInv14,alchInv15,alchInv16,equip1,equip2,equip3,equip4,equip5,equip6,equip7,equip8,equip9,equip10,equip1LevelUp,equip2LevelUp,equip3LevelUp,equip4LevelUp,equip5LevelUp,equip6LevelUp,equip7LevelUp,equip8LevelUp,equip9LevelUp,equip10LevelUp,EquipClassD,EquipClassC,EquipClassB,SC_ScanPoint,GB_ScanPoint

rebirthWatch(){
    global vHwnd, vCurrentHero , AutoRebirthIcon , vReBirthWatchInterval,vHero,vMonitorCount
    tracelog("reBirthWatch started")
    winactivate, ahk_id %vHwnd%


    reBirthWatch:
        critical on
        MouseGetPos,,, hWinUnderMouse
        if (vHwnd != hWinUnderMouse && vMonitorCount ==2 ) {
            ;"client not main focus - hero id aborted currnetHero" . vCurrentHero
            tracelog("client not main focus - hero id aborted ")
            settimer, reBirthWatch, 3000
            return false
        } 
        winactivate, ahk_id %vHwnd%

        
        tracelog ("current hero " vHero.CurrentHero.Class)
        if ! vHero.CheckActive(){ ;current hero not set or found
            vRebirthd:=true
            if ! vHero.Indentify() {
                
                settimer, reBirthWatch, 500
                return
            }
        } else { ;vHero.CheckActive found currentHero
            settimer, reBirthWatch, 5000
            
        }
        if vRebirthd
            tracelog("rebirthed ? " vHero.CurrentHero.Class)
        ;do rebirthstuff
        vRebirthd:=false
        
        
        
        
    return


    ;if not over game winowsss
    MouseGetPos,,, hWinUnderMouse
    if (vHwnd != hWinUnderMouse && vMonitorCount ==1 ) {
        ;"client not main focus - hero id aborted currnetHero" . vCurrentHero
        tracelog("client not main focus - hero id aborted - vCurrentHero: " . vCurrentHero)
        settimer, reBirthWatch, 1000
    return false
} 


vFoundHero:= identifyHero()

if (%vFoundHero% = Rebirthing) {
    ShowTip("Rebirthing")
    vCurrentHero:="Rebirthing"
    settimer forceOff,-500
    settimer, reBirthWatch, 500
    return false
    
} else if (vCurrentHero != vFoundHero){
    vCurrentHero:=vFoundHero
    tracelog("found " . vFoundHero)
    ShowTip("welcome to IEH Assist brave " . vCurrentHero)
    settimer forceOff,-5000 ;label in ShowTip 
    settimer, reBirthWatch, 5000
    
    if AutoRebirthIcon.isactive {
        tracelog("vAutoRebirth script options started")
        global EquipIcon,BankCapBuyerIcon,buffCycleIcon,upgradeCycleIcon,lootBestiaryIcon,NitroIcon 
        global vCurrentUpgradCycleInterval 
        global vAutoNitro,vAutoEquip,vAutoSkills,vAutoBufGlobalAngels,vAutoUgrade,vAutoLootBestiary,vAutoBankBuy,vAutoKingChallange
        
        if vAutoEquip{
            tracelog("turning on PutOnEquipToggle")
            SetTimer, PutOnEquipToggle, -1000
        }
        
        if vAutoSkills{
            tracelog("turning on autosKills")
            settimer, autosKills, -2000
        }
        
        if vAutoBufGlobalAngels {
            if (! vCurrentHero=="angel") {
                tracelog("turning on AngelWeave")
                SetTimer, AngelWeave, -3000
            }
        }
        
        if vAutoUgrade {
            tracelog("turning on upgradeCycle")
            vCurrentUpgradCycleInterval:=""
            SetTimer, upgradeCycle, -4000
        }
        
        if vAutoLootBestiary{
            tracelog("turning on lootBestiary")
            SetTimer, lootBestiary, -5000
        }
        
        if vAutoBankBuy{
            tracelog("turning on BankCapBuyer")
            SetTimer, BankCapBuyer, -6000 
        }
        
        if vAutoNitro{
            tracelog("turning on doNitro")
            SetTimer, doNitro, -1000
        }
        
        if vAutoKingChallange {
            tracelog("turning on kingExpFarm")
            kfToggle:=""
            global KingAfter
            SetTimer, kingExpFarm,-%KingAfter%
        }
    return true
} 
} else {
    tracelog("staying on current " vCurrentHero)
    settimer, reBirthWatch, %vReBirthWatchInterval%
}
return 
}