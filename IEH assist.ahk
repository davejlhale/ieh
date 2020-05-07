;;autoexec
#NoEnv
SetBatchLines, -1
SetTitleMatchMode, 2
DetectHiddenWindows, On
CoordMode, Mouse, Client
CoordMode, Pixel, Client

;listvars

;(string to caputure gclick point names in intellisense woth code vs , notedpad etc
;toseeme:= [menu1 , menu2 , menu3 , menu4 , menu5 , menu6 , menu7 , menu8 , explore , explore_map1 , explore_map2 , explore_map3 , explore_map4 , explore_map5 , explore_map6 , explore_map7 , explore_map8 , explore_area1 , explore_area2 , explore_area3 , explore_area4 , explore_area5 , explore_area6 , explore_area7 , explore_area8 , dungeon1 , dungeon2 , dungeon3 , dungeon4 , dungeon5 , dungeon6 , dungeon7 , dungeon8 , explore_bestiary , bestiary_lootAll , bestiary_close , upgrade , upgrade_mining1 , upgrade_mining2 , upgrade_mining3 , upgrade_gathering3 , upgrade_pickaxe1 , upgrade_pickaxe2 , upgrade_pickaxe3 , upgrade_pickaxe4 , upgrade_synt1 , upgrade_synt2 , upgrade_synt3 , upgrade_lab1 , upgrade_lab2 , upgrade_lab3 , upgrade_lab4 , upgrade_gathering1 , upgrade_gathering2 , upgrade_rake1 , upgrade_rake2 , upgrade_rake3 , upgrade_rake4 , upgrade_gold_bonus , upgrade_exp_bonus , upgrade_expand_equip , upgrade_stone_ritual , upgrade_crystal_ritual , upgrade_leaf_ritual , upgrade_mystery_box , upgrade_upgrade1 , upgrade_upgrade10 , upgrade_upgrade25 , upgrade_upgradeMax , nitro , nitro_pixel_start , nitro_pixel_end , slime_bank , dark_ritual , sb_GoBack , sb_withdraw , sb_withdrawConfirm , sb_times1 , sb_times10 , sb_times25 , sb_timesMax , sb_donate , sb_purifucation , sb_efficiency , sb_exchange , sb_interest , sb_cap , sb_et_stone , sb_et_crystal , sb_et_leaf , sb_strength , sb_mind , sb_healty_captue , sb_enhanced_capture , sb_monster_counter , sb_graduates , sb_ledger , sb_nitro_generators , sb_monster_taming , sb_powder_store , sb_explorers_capacity , sb_21 , sb_22 , sb_23 , sb_24 , sb_25 , sb_26 , sb_27 , sb_28 , sb_29 , sb_30 , sb_31 , sb_32 , craft_check_Box , Alchemy_check_Box , inventory_check_Box , alchemy_1ml , alchemy_10ml , alchemy_100ml , alchemy_1L , alchemy_10L , alchemy_100L , alchemy_1kL , alchemy_10kL , alchemy100kL , alchemy_1mill , alchemy_10mill , alchemy_100mill , alchemy_1BL , alchemy_10BL , alchemy_auto_button , alchemy_plus_button , alchemy_use_all , alchemy_potion_option_1 , alchemy_potion_option_2 , alchemy_potion_option_3 , alchemy_potion_option_4 , alchemy_potion_option_5 , alchemy_potion_option_6 , alchemy_potion_option_7 , alchemy_potion_option_8 , alchemy_potion_option_9 , alchemy_potion_option_10 , alchemy_potion_option_11 , alchemy_potion_option_12 , alchemy_potion_option_13 , alchemy_potion_option_14 , alchemy_potion_option_15 , alchemy_potion_option_16 , challenge_1 , challenge_2 , challenge_3 , challenge_4 , challenge5 , challenge6 , challenge7 , challenge8 , challenge_retryBox , challenge_start , challenge_quit , warrior , wizard , angel , st_slot_1 , st_slot_2 , st_slot_3 , st_slot_4 , st_slot_5 , st_slot_6 , st_slot_7 , st_slot_8 , st_slot_9 , st_slot_10 , skill_table_skill_1_stance , skill_table_skill_2_stance , skill_table_skill_3_stance , skill_table_skill_4_stance , skill_table_skill_5_stance , skill_table_skill_6_stance , skill_table_skill_7_stance , skill_table_skill_8_stance , skill_table_skill_9_stance , skill_table_skill_10_stance , skill_table_skill_1_chargeUp , skill_table_skill_2_chargeUp , skill_table_skill_3_chargeUp , skill_table_skill_4_chargeUp , skill_table_skill_5_chargeUp , skill_table_skill_6_chargeUp , skill_table_skill_7_chargeUp , skill_table_skill_8_chargeUp , skill_table_skill_9_chargeUp , skill_table_skill_10_chargeUp , skillbar_class_top_1 , skillbar_class_top_2 , skillbar_class_top_3 , skillbar_class_bottom_1 , skillbar_class_bottom_2 , skillbar_class_bottom_3 , skillbar_global_top_1 , skillbar_global_top_2 , skillbar_global_top_3 , skillbar_global_top_4 , skillbar_global_bottom_1 , skillbar_global_bottom_2 , skillbar_global_bottom_3 , skillbar_global_bottom_4 , skillbar_active_skill , skillbar_automove , alchemy_potion_inventory_slot_1 , alchemy_potion_inventory_slot_2 , alchemy_potion_inventory_slot_3 , alchemy_potion_inventory_slot_4 , alchemy_potion_inventory_slot_5 , alchemy_potion_inventory_slot_6 , alchemy_potion_inventory_slot_7 , alchemy_potion_inventory_slot_8 , alchemy_potion_inventory_slot_9 , alchemy_potion_inventory_slot_10 , alchemy_potion_inventory_slot_11 , alchemy_potion_inventory_slot_12 , alchemy_potion_inventory_slot_13 , alchemy_potion_inventory_slot_14 , alchemy_potion_inventory_slot_15 , alchemy_potion_inventory_slot_16 , equip1 , equip2 , equip3 , equip4 , equip5 , equip6 , equip7 , equip8 , equip9 , equip10 , equip1_levelUp , equip2_levelUp , equip3_levelUp , equip4_levelUp , equip5_levelUp , equip6_levelUp , equip7_levelUp , equip8_levelUp , equip9_levelUp , equip10_levelUp , equip_classD , equip_classC , equip_classB , SC_ScanPoint , GB_ScanPoint]

global gWinTitle:="play incremental epic hero"

loadClickPoints()
While findKongGameContainer() { 
    if !startTime 
        startTime:= A_now
    else if (A_now-startTime > 10) {
        MsgBox,36,IEH Asist , Click the game window to start 
        ifmsgbox No
        ExitApp
        startTime:=A_now
    }
}

;;add menus and gui
menu := new GUIMenu("home")
BankCapBuyerIcon:=new gIcon("d",908,830,"BankCapBuyer")
buffCycleIcon := new gIcon("BuffCycle",760,830,"BuffCycle")
upgradeCycleIcon :=new gIcon("upgradeCycle",808,830,"upgradeCycle")
lootBestiaryIcon :=new gIcon("LootBestiary",856,830,"lootBestiary")

;;end of autoexec 
return

;KEEP INCLUDES BELOW autoexec

#include exampleActionScript.txt

#include lib
#include GUIMenu.ahk
#Include gIcon2.ahk
#include bankCapBuyer.txt

#include ..\scripts
#include lootBestiary.txt
#Include upgradeClicks.txt
#include genaral.txt
#include bankCapBuyer.txt

/*
**************************
*** hotkeys ***
**************************
*/

!p::
~RButton & LButton::
    pause()
return

Exit:
Escape::
    ExitApp
Return		

DevTools:
    menu.show("dev")
return	

F1::	
Home:
PlayerMenu:
    menu.show("home")
return

F3::
Wizard:
    menu.show("wizard")
return

F2::
Warrior:
    menu.show("warrior")
return

F4::
Angel:
    menu.show("angel")
return	

F5::
General:
    menu.show("general")
return

F7::
KingFarm:
    MouseGetPos vX,Vy
    BlockInput, On
    kfToggle:=!kfToggle
    if (kfToggle) { 
        showTip("Challenging Slime KIng")
        gClick(menu4)
        gClick(challenge1)
        gClick(challenge_start)
        send, {s down}
    }
    else{
        showTip("")
        send, {s up}
        gClick(menu4)
        gClick(challenge1)
        gClick(challenge_quit)
    }
    MouseMove, Vx,Vy
    BlockInput, Off 
Return

F8::
JustRun:
    jrToggle:=!jrToggle
    if (jrToggle){
        ShowTip("Run Forest, Run !!")
        send, {w down}
    }
    else {
        ShowTip("")
        send, {w up}
    } 
return

F9::
ScavangeChiili:
Chilli:
    scToggle:=!scToggle
    if scToggle{
        settimer, scavangetimerloop,10
        ShowTip("My Precious! if only someone would help me look !!")
        scavangetimerloop:
            Send, {w }
            Send, {d 1}{w 2} 
            Send, {d 1}{w 2} 
            Send, {w 2}
            Send, {d 1}{w 2} 
            Send, {d 1}{w 2} 
            Send, {w 2}
        return
    }
    else {
        ShowTip("")
        settimer, scavangetimerloop, delete 
    }
    return
    
    
    !F1::
    findGameWindow:
        findKongGameContainer()
        showBox(begin_x, begin_y, end_x, end_y) 
    return
    
    !F2::
        showGameWindow: 
        showBox(begin_x, begin_y, end_x, end_y) 
    return
    
    ;;adds basic info to onscreen tooltip
    ScreenInfo:
        showScreenInfo()
    return
    
    
    
    SetClickPoints:
        setClickPoints()
    return
    
    
    
    
    
    
    
    
    