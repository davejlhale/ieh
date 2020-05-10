;;autoexec
global menu1,menu2,menu3,menu4,menu5,menu6,menu7,menu8,explore,explore_map1,explore_map2,explore_map3,explore_map4,explore_map5,explore_map6,explore_map7,explore_map8,explore_area1,explore_area2,explore_area3,explore_area4,explore_area5,explore_area6,explore_area7,explore_area8,dungeon1,dungeon2,dungeon3,dungeon4,dungeon5,dungeon6,dungeon7,dungeon8,explore_bestiary,bestiary_lootAll,bestiary_close,upgrade,upgrade_mining1,upgrade_mining2,upgrade_mining3,upgrade_gathering3,upgrade_pickaxe1,upgrade_pickaxe2,upgrade_pickaxe3,upgrade_pickaxe4,upgrade_synt1,upgrade_synt2,upgrade_synt3,upgrade_lab1,upgrade_lab2,upgrade_lab3,upgrade_lab4,upgrade_gathering1,upgrade_gathering2,upgrade_rake1,upgrade_rake2,upgrade_rake3,upgrade_rake4,upgrade_gold_bonus,upgrade_exp_bonus,upgrade_expand_equip,upgrade_stone_ritual,upgrade_crystal_ritual,upgrade_leaf_ritual,upgrade_mystery_box,upgrade_upgrade1,upgrade_upgrade10,upgrade_upgrade25,upgrade_upgradeMax,nitro,nitro_pixel_start,nitro_pixel_end,slime_bank,dark_ritual,sb_GoBack,sb_withdraw,sb_withdrawConfirm,sb_times1,sb_times10,sb_times25,sb_timesMax,sb_donate,sb_purifucation,sb_efficiency,sb_exchange,sb_interest,sb_cap,sb_et_stone,sb_et_crystal,sb_et_leaf,sb_strength,sb_mind,sb_healty_captue,sb_enhanced_capture,sb_monster_counter,sb_graduates,sb_ledger,sb_nitro_generators,sb_monster_taming,sb_powder_store,sb_explorers_capacity,sb21,sb22,sb23,sb24,sb25,sb26,sb27,sb28,sb29,sb30,sb31,sb32,craft_check_Box,Alchemy_check_Box,inventory_check_Box,alchemy_1ml,alchemy_10ml,alchemy_100ml,alchemy_1L,alchemy_10L,alchemy_100L,alchemy_1kL,alchemy_10kL,alchemy100kL,alchemy_1mill,alchemy_10mill,alchemy_100mill,alchemy_1BL,alchemy_10BL,alchemy_auto_button,alchemy_plus_button,alchemy_use_all,alchOption_1,alchOption_2,alchOption_3,alchOption_4,alchOption_5,alchOption_6,alchOption_7,alchOption_8,alchOption_9,alchOption_10,alchOption_11,alchOption_12,alchOption_13,alchOption_14,alchOption_15,alchOption_16,challenge1,challenge2,challenge3,challenge4,challenge5,challenge6,challenge7,challenge8,challenge_retryBox,challenge_start,challenge_quit,warrior,wizard,angel,st_slot_1,st_slot_2,st_slot_3,st_slot_4,st_slot_5,st_slot_6,st_slot_7,st_slot_8,st_slot_9,st_slot_10,skill_table_skill_1_stance,skill_table_skill_2_stance,skill_table_skill_3_stance,skill_table_skill_4_stance,skill_table_skill_5_stance,skill_table_skill_6_stance,skill_table_skill_7_stance,skill_table_skill_8_stance,skill_table_skill_9_stance,skill_table_skill_10_stance,skill_table_skill_1_chargeUp,skill_table_skill_2_chargeUp,skill_table_skill_3_chargeUp,skill_table_skill_4_chargeUp,skill_table_skill_5_chargeUp,skill_table_skill_6_chargeUp,skill_table_skill_7_chargeUp,skill_table_skill_8_chargeUp,skill_table_skill_9_chargeUp,skill_table_skill_10_chargeUp,skillbar_class_top_1,skillbar_class_top_2,skillbar_class_top_3,skillbar_class_bottom_1,skillbar_class_bottom_2,skillbar_class_bottom_3,skillbar_global_top_1,skillbar_global_top_2,skillbar_global_top_3,skillbar_global_top_4,skillbar_global_bottom_1,skillbar_global_bottom_2,skillbar_global_bottom_3,skillbar_global_bottom_4,skillbar_active_skill,skillbar_automove,alchInv1,alchInv2,alchInv3,alchInv4,alchInv5,alchInv6,alchInv7,alchInv8,alchInv9,alchInv10,alchInv11,alchInv12,alchInv13,alchInv14,alchInv15,alchInv16,equip1,equip2,equip3,equip4,equip5,equip6,equip7,equip8,equip9,equip10,equip1LevelUp,equip2LevelUp,equip3LevelUp,equip4LevelUp,equip5LevelUp,equip6LevelUp,equip7LevelUp,equip8LevelUp,equip9LevelUp,equip10LevelUp,EquipClassD,EquipClassC,EquipClassB,SC_ScanPoint,GB_ScanPoint
#NoEnv
SetBatchLines, -1
SetTitleMatchMode, 2
DetectHiddenWindows, On
coordMode, Mouse, client
coordMode, Pixel, Client
global vWinTitle:="Incremental Epic Hero"
global vStartTime:= A_TickCount
 FileOpen("logs\traceLog.txt", "w `n")
#include configs
#include general.ini

loadClickPoints()
While findKongGameContainer() { 
    if (A_TickCount-vStartTime > 10000) {
        MsgBox,36,IEH Asist , Click the game window to start 
        ifmsgbox No
        ExitApp
        vStartTime:=A_TickCount
    }
}
;not fully tested / implemented
;rebirthWatch()

;;add menus and gui
menu := new GUIMenu("home")
EquipIcon :=new gIcon("EquipIcon",956,830,"Equip","Equip Hero Gear")
BankCapBuyerIcon:=new gIcon("d",908,830,"BankCapBuyer","Buy Slime Bank item when Full")
buffCycleIcon := new gIcon("BuffCycle",760,830,"BuffCycle","Weave Angels buffs in global slot 1")
upgradeCycleIcon :=new gIcon("upgradeCycle",808,830,"upgradeCycle","Clicks your upgrades for you")
lootBestiaryIcon :=new gIcon("LootBestiary",856,830,"lootBestiary","Auto Loots Bestiary every so often")

;;end of autoexec 
return

;;KEEP INCLUDES BELOW autoexec
#include ..\lib
#include GUIMenu.ahk
#Include gIcon.ahk
#include BankBalanceScanner.ahk

#include ..\scripts
#include lootBestiary.txt
#Include upgradeClicks.txt
#include genaral.txt
#include bankCapBuyer.txt
#include PutOnEquip.ahk
#include golemFarmer.ahk
#include kingFarmer.ahk
#include spiderFarmer.ahk
#include fairyFarmer.ahk
#Include kingExpFarm.ahk
#include ChilliScavanger.ahk

;;general hotkeys
!p::
~RButton & LButton::
    pause()
return

Exit:
Escape::
    ExitApp
Return		

;;menu swappers
DevTools:
    currentMenu:= menu.show("dev")
return	
F1::	
Home:
PlayerMenu:
    currentMenu:= menu.show("home")
return
F3::
Wizard:
    currentMenu:= menu.show("wizard")
return
F2::
Warrior:
    currentMenu:= menu.show("warrior")
return
F4::
Angel:
    currentMenu:= menu.show("angel")
return	
F5::
General:
    currentMenu:= menu.show("general")
return

;;challenge farmers
F6::
ChallengeFarmers:
    currentMenu:= menu.show("farmers")
return

KingFarm:
    kingFarmer(50000)
return
GolemFarm:
    golemFarmer(50000)
return
SpiderFarm:
    spiderFarmer(50000)
return
FairyFarm:
    fairyFarmer(50000)
return

F7::
KingExpFarm:
    kingExpFarm()
Return

;; misc hero hotkey

ReturnFromRebirth:
    gosub Equip
    ;rebirth()
return
!e::
Equip: 
    ;supplying a named equipment set here will put that on over default war/angel/wiz/general setups
    PutOnEquip()
return

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

ScavangeChiili:
F9::
Chilli:
    ChilliScavanger()
return

;;dev hotkeys
!F1::
findGameWindow:
    findKongGameContainer()
    showBox(begin_x, begin_y, end_x, end_y) 
return

!F2::
    showGameWindow: 
    showBox(begin_x, begin_y, end_x, end_y) 
return

ScreenInfo:
    showScreenInfo()
    
return

SetClickPoints:
    setClickPoints()
return

