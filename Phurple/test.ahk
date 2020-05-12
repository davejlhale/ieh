; Recommended for performance and compatibility with future AutoHotkey releases.
; Recommended for new scripts due to its superior speed and reliability.
; Ensures a consistent starting directory.

;Made by Phurple/Stop_Sign
;
;This script runs on AutoHotkey (AHK), a free, low-size download
;for keyboard I/O
;If you want help setting up, ask

;global menu1,menu2,menu3,menu4,menu5,menu6,menu7,menu8,explore,explore_map1,explore_map2,explore_map3,explore_map4,explore_map5,explore_map6,explore_map7,explore_map8,explore_area1,explore_area2,explore_area3,explore_area4,explore_area5,explore_area6,explore_area7,explore_area8,dungeon1,dungeon2,dungeon3,dungeon4,dungeon5,dungeon6,dungeon7,dungeon8,explore_bestiary,bestiary_lootAll,bestiary_close,upgrade,upgrade_mining1,upgrade_mining2,upgrade_mining3,upgrade_gathering3,upgrade_pickaxe1,upgrade_pickaxe2,upgrade_pickaxe3,upgrade_pickaxe4,upgrade_synt1,upgrade_synt2,upgrade_synt3,upgrade_lab1,upgrade_lab2,upgrade_lab3,upgrade_lab4,upgrade_gathering1,upgrade_gathering2,upgrade_rake1,upgrade_rake2,upgrade_rake3,upgrade_rake4,upgrade_gold_bonus,upgrade_exp_bonus,upgrade_expand_equip,upgrade_stone_ritual,upgrade_crystal_ritual,upgrade_leaf_ritual,upgrade_mystery_box,upgrade_upgrade1,upgrade_upgrade10,upgrade_upgrade25,upgrade_upgradeMax,nitro,nitro_pixel_start,nitro_pixel_end,slime_bank,dark_ritual,sb_GoBack,sb_withdraw,sb_withdrawConfirm,sb_times1,sb_times10,sb_times25,sb_timesMax,sb_donate,sb_purifucation,sb_efficiency,sb_exchange,sb_interest,sb_cap,sb_et_stone,sb_et_crystal,sb_et_leaf,sb_strength,sb_mind,sb_healty_captue,sb_enhanced_capture,sb_monster_counter,sb_graduates,sb_ledger,sb_nitro_generators,sb_monster_taming,sb_powder_store,sb_explorers_capacity,sb21,sb22,sb23,sb24,sb25,sb26,sb27,sb28,sb29,sb30,sb31,sb32,craft_check_Box,Alchemy_check_Box,inventory_check_Box,alchemy_1ml,alchemy_10ml,alchemy_100ml,alchemy_1L,alchemy_10L,alchemy_100L,alchemy_1kL,alchemy_10kL,alchemy100kL,alchemy_1mill,alchemy_10mill,alchemy_100mill,alchemy_1BL,alchemy_10BL,alchemy_auto_button,alchemy_plus_button,alchemy_use_all,alchOption_1,alchOption_2,alchOption_3,alchOption_4,alchOption_5,alchOption_6,alchOption_7,alchOption_8,alchOption_9,alchOption_10,alchOption_11,alchOption_12,alchOption_13,alchOption_14,alchOption_15,alchOption_16,challenge1,challenge2,challenge3,challenge4,challenge5,challenge6,challenge7,challenge8,challenge_retryBox,challenge_start,challenge_quit,warrior,wizard,angel,st_slot_1,st_slot_2,st_slot_3,st_slot_4,st_slot_5,st_slot_6,st_slot_7,st_slot_8,st_slot_9,st_slot_10,skill_table_skill_1_stance,skill_table_skill_2_stance,skill_table_skill_3_stance,skill_table_skill_4_stance,skill_table_skill_5_stance,skill_table_skill_6_stance,skill_table_skill_7_stance,skill_table_skill_8_stance,skill_table_skill_9_stance,skill_table_skill_10_stance,skill_table_skill_1_chargeUp,skill_table_skill_2_chargeUp,skill_table_skill_3_chargeUp,skill_table_skill_4_chargeUp,skill_table_skill_5_chargeUp,skill_table_skill_6_chargeUp,skill_table_skill_7_chargeUp,skill_table_skill_8_chargeUp,skill_table_skill_9_chargeUp,skill_table_skill_10_chargeUp,skillbar_class_top_1,skillbar_class_top_2,skillbar_class_top_3,skillbar_class_bottom_1,skillbar_class_bottom_2,skillbar_class_bottom_3,skillbar_global_top_1,skillbar_global_top_2,skillbar_global_top_3,skillbar_global_top_4,skillbar_global_bottom_1,skillbar_global_bottom_2,skillbar_global_bottom_3,skillbar_global_bottom_4,skillbar_active_skill,skillbar_automove,alchInv1,alchInv2,alchInv3,alchInv4,alchInv5,alchInv6,alchInv7,alchInv8,alchInv9,alchInv10,alchInv11,alchInv12,alchInv13,alchInv14,alchInv15,alchInv16,equip1,equip2,equip3,equip4,equip5,equip6,equip7,equip8,equip9,equip10,equip1LevelUp,equip2LevelUp,equip3LevelUp,equip4LevelUp,equip5LevelUp,equip6LevelUp,equip7LevelUp,equip8LevelUp,equip9LevelUp,equip10LevelUp,EquipClassD,EquipClassC,EquipClassB,SC_ScanPoint,GB_ScanPoint
;lines 155
#include ..\Phurple/converted.ahk
#Include, ..\Phurple/convertedGScripts.ahk
#include ..\Phurple/convertedHK.ahk





;capture white fox 
;!8::
t := 100 
while(!GetKeyState("Left")) { 
    MCSHR(2634, 891, t) ; remove blizzard 
    MCSHR(2868, 887, t) ; remove fan swing 
    
    MCS(2413, 929, t) ;explore 
    sleep, 200 
    MCS(2247, 585, t) ;5 
    sleep, 100 
    Send {a down} 
    sleep, 300 
    Send { a up} 
    MCS(2401, 648, t) ;5-4 
    
    MCS(2261, 950, t) ;click craft 
    sleep, 100 
    MCS(2372, 559, t) ;1L
    sleep, 100 
    while(clickOn(2503, 689, 2510, 695, 0xA5A9A9) && !GetKeyState("left")) {
        MouseMove, 2768, 703, 0 
        Sleep, 50 
        loop, 3 {
            MCSHR(2768, 703, 50)
        }
        MCS(2413, 929, t) ;explore 
        sleep, 200 
        MCS(2401, 648, t) ;5-4 
        MCS(2261, 950, t) ;click craft 
        sleep, 100 
        sleep, 200
        UnblockMovement()
        traceLog("end ok") 
    }
    
    MCS(2413, 929, t) ;explore 
    sleep, 200 
    MCS(2403, 558, t) ;4 
    sleep, 100 
    MCS(2304, 655, t) ;4-2
    
    MCS(2624, 838, t) ;auto move 
    
    MCS(2328, 925, t) ;skill table 
    sleep, 100 
    MCS(2317, 830, t) ;warrior 
    sleep, 100 
    MCS(2405, 718, t) ;fan swing 
    MCS(2873, 893, t) ;gslot 2 
    MCS(2298, 865, t) ;wizard 
    sleep, 100 
    MCS(2248, 715, t) ;blizzard 
    MCS(2634, 887, t) ;slot 1 
    
    sleep, 25000
    UnblockMovement()
    traceLog("end ok") 
}

return 

setupGearAfterRebirth() {
    global t 
    gClick(menu5,2,200)
    
    gclick(EquipClassD,2,100)
    MCS(576, 607, t) ;
    MCS(329, 675, t) ;
    MCS(397, 680, t) ;
    MCS(510, 676, t) ;
    MCS(577, 682, t) ;
    MCS(458, 677, t) ;
    MCS(511, 681, t) ;
    sleep, 100
    
    gclick(EquipClassC,2,100)
    MCS(517, 605, t) ;
    MCS(579, 606, t) ;
    MCS(333, 677, t) ;
    MCS(387, 680, t) ;
    MCS(576, 681, t) ;
    MCS(579, 683, t) ;
    sleep, 100
    
    gclick(EquipClassB,2,100)
    MCS(331, 608, t) ;
    MCS(389, 602, t) ;
    MCS(454, 610, t) ;
    MCS(517, 611, t) ;
    MCS(329, 674, t) ;
    MCS(509, 673, t) ;
    MCS(573, 678, t) ;
    MCS(516, 681, t) ;
    UnblockMovement()
    traceLog("end ok") 
}

setupSkillsForWarrior() {
    global t
    gclick(menu2,2,200) ;skill 
    
    MCS(399, 897, t) ;angel 
    MCS(482, 720, t) ;speed 
    MCS(974, 887, t) ;slot 3 
    MCS(328, 773, t) ;gold 
    MCS(1009, 884, t) ;slot 4
    MCS(325, 676, t) ;muscle 
    MCS(907, 915, t) ;slot 5 
    MCS(476, 620, t) ;god bless 
    MCS(942, 916, t) ;slot 6 
    
    MCS(389, 865, t) ;wizard 
    MCS(324, 778, t) ;double thunder ball 
    MCS(910, 885, t) ;slot 1
    MCS(327, 722, t) ;blizzard
    MCS(942, 884, t) ;slot 2 
    
    MCS(383, 832, t) ;warrior 
    MCS(331, 780, t) ;shield attack 
    MCS(713, 887, t) ;slot 1 
    MCS(479, 722, t) ;fan swing 
    MCS(753, 889, t) ;slot 2 
    MCS(479, 567, t) ;slash 
    MCS(789, 891, t) ;slot 3 
    MCS(337, 718, t) ;charge swing 
    MCS(709, 932, t) ;slot 4
    
    UnblockMovement()
    traceLog("end ok") 
}

setupSkillsForWizard() {
    MovementBlock()
    gclick(menu2,2,200)
    
    gClick(warrior,2,100) ;warrior 
    MCS(331, 780, t) ;shield attack 
    MCS(910, 885, t) ;slot 1
    MCS(479, 722, t) ;fan swing 
    MCS(942, 884, t) ;slot 2 
    MCS(337, 718, t) ;charge swing 
    MCS(1009, 884, t) ;slot 4
    
    MCS(399, 897, t) ;angel 
    MCS(482, 720, t) ;speed 
    MCS(974, 887, t) ;slot 3 
    MCS(325, 676, t) ;muscle 
    MCS(907, 915, t) ;slot 5 
    MCS(476, 620, t) ;god bless 
    MCS(942, 916, t) ;slot 6 
    
    gClick(wizard,2,100) ;wizard 
    MCS(330, 626, t) ;firestorm 
    MCS(713, 887, t) ;slot 1 
    MCS(485, 571, t) ;fireball 
    MCS(753, 889, t) ;slot 2 
    MCS(324, 778, t) ;double thunder ball 
    MCS(789, 891, t) ;slot 3 
    MCS(327, 722, t) ;blizzard
    MCS(709, 932, t) ;slot 4
    MCS(483, 772, t) ;lightning thunder 
    MCS(755, 929, t) ;slot 5 
    MCS(591, 567, t) ;fire stance on 
    UnblockMovement()
    traceLog("end ok") 
}

setupSkillsForAngel() {
    MovementBlock()
    gClick(menu2,2,200)
    
    gClick(wizard,2,100) ;wizard 
    MCS(483, 772, t) ;lightning thunder 
    MCS(910, 885, t) ;gslot 1
    MCS(327, 722, t) ;blizzard
    MCS(942, 884, t) ;gslot 2 
    MCS(324, 778, t) ;double thunder ball 
    MCS(974, 887, t) ;gslot 3 
    
    gClick(warrior,2,100) ;warrior 
    MCS(331, 780, t) ;shield attack 
    MCS(1009, 884, t) ;gslot 4
    MCS(479, 722, t) ;fan swing 
    MCS(907, 915, t) ;gslot 5 
    MCS(337, 718, t) ;charge swing 
    MCS(942, 916, t) ;gslot 6 
    
    MCS(399, 897, t) ;angel 
    MCS(482, 720, t) ;speed 
    MCS(713, 887, t) ;slot 1 
    MCS(328, 773, t) ;gold 
    MCS(753, 889, t) ;slot 2 
    MCS(325, 676, t) ;muscle 
    MCS(789, 891, t) ;slot 3 
    MCS(476, 620, t) ;god bless 
    MCS(709, 932, t) ;slot 4
    MCS(483, 669, t) ;magic 
    MCS(749, 924, t) ;slot 5 
    UnblockMovement()
    traceLog("end ok") 
}

!9::
    MovementBlock()
    t := 100
    rebirthType := 2 ;0-warrior, 1-wizard, 2-angel 
    
    
    while(!GetKeyState("Left")) {
        
        MCS(573, 948, t) ;system 
        sleep, 100 
        clickOn(308, 664, 311, 668, 0x202020) ;autoprogress on 
        sleep, 100 
        if(colorIsNotVisible(694, 846, 696, 851, 0xFFFFFF)) { ;am toggle
            MCS(699, 842, t) ;automove on 
        }
        
        MCS(500, 950, t) ;rebirth
        sleep, 100 
        if(rebirthType == 0) {
            MCS(380, 559, t) ;warrior
        } else if(rebirthType == 1) {
            MCS(371, 588, t) ;wizard
        } else {
            MCS(376, 615, t) ;angel
        }
        sleep, 100 
        MCS(413, 902, t) ;rebirth 
        sleep, 300 
        MCS(675, 834, t) ;OK
        sleep, 4000 
        MCS(675, 834, t) ;OK
        sleep, 4000 
        
        
        MCS(321, 927, t) ;upgrade 
        sleep, 100 
        MCS(331, 880, t) ;nitro on 
        
        setupGearAfterRebirth()
        if(rebirthType == 0) {
            setupSkillsForWarrior()
        } else if(rebirthType == 1) {
            setupSkillsForWizard()
        } else {
            setupSkillsForAngel()
        }
        
        
        MCS(321, 927, t) ;upgrade 
        sleep, 100 
        MCS(488, 889, t) ;slime bank 
        sleep, 100 
        MCSHR(474, 771, t) ;SC cap 
        
        MCS(571, 529, t) ;go back 
        sleep, 100
        
        loop, 10 {
            MCS(430, 733, t) ;1-1
            MCS(431, 769, t) ;2-1
            MCS(433, 811, t) ;3-1
            sleep, 400
        }
        
        z := 0
        while(!GetKeyState("Left")) {
            z++
            checkUpgrades() ;buy things 
            Tooltip, %z%, 64, 693
            if(colorIsVisibleQuick(521, 944, 0x919C9F)) { ;until challenge is available
                break
            }
        }
        
        if(rebirthType == 1) { ;wizard needs extra HP
            sleep, 5000 
            
            MCS(398, 846, t) ;buy equipment
            MCS(398, 846, t) ;
            MCS(321, 951, t) ;craft 
            sleep, 100 
            MCS(395, 680, t) ;equip fox coat 
        }
        
        
        MCS(321, 927, t) ;upgrade 
        sleep, 100 
        checkNitroOnUpgrade()
        
        
        ;clickOn(2227, 681, 2231, 685, 0xFFF0C1) ;autoprogress off
        
        MCS(490, 928, t) ;explore
        sleep, 100 
        MCS(380, 563, t) ;2 
        sleep, 100 
        loop, 6 { ;prevent challenge not starting because in result screen
            MCS(325, 649, t) ;2-1
            sleep, 500 
        }
        
        MCS(579, 930, t) ;challenge
        sleep, 100 
        MCS(323, 574, t) ;select slime boss 
        sleep, 100 
        MCS(382, 883, t) ;start 
        sleep, 100 
        
        Send {S down}
        sleep, 500 
        Send {S up}
        
        if(rebirthType == 0 || rebirthType == 2) {
            MCSHR(945, 884, t) ;remove blizzard (gslot 2)
        } else if(rebirthType == 1) { ;slow slimes work better for wizard
            ;MCSHR(712, 930, t)
        }
        
        safeSpot()
        loop, 10 {
            if(colorIsVisibleQuick(403, 878, 0x24AAD5)) { ;check if died in challenge to restart it 
                MCS(364, 883, t) ;start
                Send {S down}
                sleep, 500 
                Send {S up}
                MCS(655, 826, t) ;use special attack 
            }
            sleep, 1000
        }
        
        ;do more nitro in the middle 
        gClick(menu1,2,200) ;upgrade 
        checkNitroOnUpgrade()
        gClick(menu4,2,200) ;challenge
        
        
        loop, 10 {
            if(colorIsVisibleQuick(403, 878, 0x24AAD5)) {
                gClick(challenge_start,2,100) ;start
                Send {S down}
                gClick(skillbar_active_skill,2,50) ;use special attack 
            }
            sleep, 1000
            Send {S up}
        }
        
        gClick(menu1,2,200) ;upgrade 
        checkNitroOnUpgrade()
        
        gClick(skillbar_automove,1,200) ;auto move back on 
        Tooltip, 
        
        rebirthType++ ;cycle between all 3 rebirths 
        if(rebirthType == 3) {
            rebirthType = 0
        }
    }
    
return 

checkUpgrades() {
    global t
    clickOn(310, 840, 320, 850, 0x01FFFF) ;gold 
    clickOn(438, 849, 443, 855, 0xB5B6FF) ;ore ritual 
    clickOn(478, 848, 482, 854, 0x7788FF) ;c ritual 
    clickOn(515, 848, 520, 855, 0x0E0FE8) ;l ritual 
    
    clickOn(461, 732, 466, 738, 0x89BBBB) ;1-2 
    clickOn(470, 776, 476, 781, 0xADFFF7) ;2-2 
    clickOn(467, 805, 473, 810, 0x007D00) ;3-2 
    clickOn(500, 733, 506, 739, 0x79A5A6) ;3-3
    clickOn(508, 776, 513, 781, 0xBCFFFD) ;2-3 
    clickOn(507, 805, 512, 811, 0x007D00) ;3-3 
    clickOn(544, 732, 549, 738, 0xAAD4D3) ;3-4 
    clickOn(549, 769, 554, 774, 0xD1D1D1) ;2-4 
    clickOn(549, 799, 557, 805, 0x6C9695) ;3-4
    
}
!6::
    
    t := 100
    z := 0
    x := 0 
    
    MCS(581, 891, t) ;challenge
    sleep, 100 
    
    ;doUpgrades()
    while(!GetKeyState("Left")) {
        if(colorIsVisibleQuick(406, 841, 0x20A7D3)) {
            if(z > 150) {
                MCS(322, 912, t) ;craft 
                sleep, 100 
                MCS(500, 526, t) ;10L
                sleep, 100 
                if(colorIsNotVisibleQuick(311, 807, 0x98D6D6)) {
                    ;MCS(311, 660, t) ;craft golem tincture 
                    ;MCS(364, 662, t) ;deathpider tincture 
                    MCS(408, 664, t) ;fairy tincture 
                }
                MCS(320, 815, t) ;use
                ;doUpgrades()
                MCS(581, 891, t) ;challenge
                sleep, 100 
            }
            MCS(378, 841, t) ;start
            safeSpot()
            z := 0
        } else {
            z++
        }
        Tooltip, %z%, 87, 611
        UnblockMovement()
        traceLog("end ok") 
    }
    
return
