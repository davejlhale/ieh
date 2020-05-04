#NoEnv
SetBatchLines, -1
Thread, NoTimers
SetTitleMatchMode, 2
DetectHiddenWindows, On
;Sendmode Input
CoordMode, Mouse, Screen
;to_Make_clickpoint_name_visible_when_scripting_add_this_to_top_of_file
;cpNames:=["menu1","menu2","menu3","menu4","menu5","menu6","menu7","menu8","explore","explore_map1","explore_map2","explore_map3","explore_map4","explore_map5","explore_map6","explore_map7","explore_map8","explore_area1","explore_area2","explore_area3","explore_area4","explore_area5","explore_area6","explore_area7","explore_area8","explore_dungeon1","explore_dungeon2","explore_dungeon3","explore_dungeon4","explore_dungeon5","explore_bestiary","bestiary_lootAll","bestiary_close","upgrade","upgrade_mining1","upgrade_mining2","upgrade_mining3","upgrade_synt1","upgrade_synt2","upgrade_synt3","upgrade_gathering1","upgrade_gathering2","upgrade_gathering3","upgrade_pickaxe1","upgrade_pickaxe2","upgrade_pickaxe3","upgrade_pickaxe4","upgrade_lab1","upgrade_lab2","upgrade_lab3","upgrade_lab4","upgrade_rake1","upgrade_rake2","upgrade_rake3","upgrade_rake4","upgrade_gold_bonus","upgrade_exp_bonus","upgrade_expand_equip","upgrade_stone_ritual","upgrade_crystal_ritual","upgrade_leaf_ritual","upgrade_mystery_box","upgrade_8","upgrade_16","upgrade_24","upgrade_32","upgrade_upgrade1","upgrade_upgrade10","upgrade_upgrade25","upgrade_upgradeMax","upgrade_nitro","upgrade_nitro_pixel_start","upgrade_nitro_pixel_end","upgrade_slime_bank","upgrade_dark_ritual","sb_GoBack","sb_withdraw","sb_withdrawConfirm","sb_times1","sb_times10","sb_times25","sb_timesMax","sb_donate","sb_purifucation","sb_efficiency","sb_exchange","sb_interest","sb_cap","sb_et_stone","sb_et_crystal","sb_et_leaf","sb_strength","sb_mind","sb_healty_captue","sb_enhanced_capture","sb_monster_counter","sb_graduates","sb_ledger","sb_nitro_generators","sb_18","sb_19","sb_20","sb_21","sb_22","sb_23","sb_24","sb_25","sb_26","sb_27","sb_28","sb_29","sb_30","sb_31","sb_32","craft_equip_d_toggle","craft_equip_c_toggle","craft_equip_b_toggle","craft_equip1_level_button","craft_equip2_level_button","craft_equip3_level_button","craft_equip4_level_button","craft_equip5_level_button","craft_equip6_level_button","craft_equip7_level_button","craft_equip8_level_button","craft_craft_confirm_Box","craft_Alchemy_confirm_Box","craft_inventory_confirm_Box","alchemy_size_1ml","alchemy_size_10ml","alchemy_size_100ml","alchemy_size_1L","alchemy_size_10L","alchemy_size_100L","alchemy_size_1kL","alchemy_size_10kL","alchemy_size_100kL","alchemy_size_1mill","alchemy_size_10mill","alchemy_size_100mill","alchemy_size_1BL","alchemy_size_10BL","alchemy_auto","alchemy_plus_button","alchemy_use_all","alchemy_potion_option_1","alchemy_potion_option_2","alchemy_potion_option_3","alchemy_potion_option_4","alchemy_potion_option_5","alchemy_potion_option_6","alchemy_potion_option_7","alchemy_potion_option_8","alchemy_potion_option_9","alchemy_potion_option_10","alchemy_potion_option_11","alchemy_potion_option_12","alchemy_potion_option_13","alchemy_potion_option_14","alchemy_potion_option_15","alchemy_potion_option_16","alchemy_potion_inventory_slot_1","alchemy_potion_inventory_slot_2","alchemy_potion_inventory_slot_3","alchemy_potion_inventory_slot_4","alchemy_potion_inventory_slot_5","alchemy_potion_inventory_slot_6","alchemy_potion_inventory_slot_7","alchemy_potion_inventory_slot_8","alchemy_potion_inventory_slot_9","alchemy_potion_inventory_slot_10","alchemy_potion_inventory_slot_11","alchemy_potion_inventory_slot_12","alchemy_potion_inventory_slot_13","alchemy_potion_inventory_slot_14","alchemy_potion_inventory_slot_15","alchemy_potion_inventory_slot_16","challenge_1","challenge_2","challenge_3","challenge_4","challenge_5","challenge_retryBox","challenge_start","challenge_quit","st_warrior","st_wizard","st_angel","st_slot_1","st_slot_2","st_slot_3","st_slot_4","st_slot_5","st_slot_6","st_slot_7","st_slot_8","st_slot_9","st_slot_10","st_slot_1_stance","st_slot_2_stance","st_slot_3_stance","st_slot_4_stance","st_slot_5_stance","st_slot_6_stance","st_slot_7_stance","st_slot_8_stance","st_slot_9_stance","st_slot_10_stance","st_slot_1_chargeUp","st_slot_2_chargeUp","st_slot_3_chargeUp","st_slot_4_chargeUp","st_slot_5_chargeUp","st_slot_6_chargeUp","st_slot_7_chargeUp","st_slot_8_chargeUp","st_slot_9_chargeUp","st_slot_10_chargeUp","skillbar_class_top_1","skillbar_class_top_2","skillbar_class_top_3","skillbar_class_bottom_1","skillbar_class_bottom_2","skillbar_class_bottom_3","skillbar_global_top_1","skillbar_global_top_2","skillbar_global_top_3","skillbar_global_bottom_1","skillbar_global_bottom_2","skillbar_global_bottom_3","skillbar_active_skill","skillbar_automove"]

global debug:=0
global developer:=1
global begin_x, begin_y, end_x, end_y
global gameX:=0,gameY:=0
global startTime:=A_now
global winTitle:="play incremental epic hero"

loadClickPoints()
While mapGameContainer() {
    if (A_now-startTime > 10) {
        MsgBox Click the game window then press Alt + F1 to start `nor Escape to quit
        startTime:=A_now
    }
}
;showGameContainer()

menu := new GUIMenu("home")

; add persistant icons here
;gui1:=new gIcon("u",400,300,"test")
gui2:=new gIcon("d",450,300,"test2")

buffCycleIcon := new gIcon("BuffCycle",760,830,"BuffCycle")
upgradeIcon :=new gIcon("u",808,830,"upgradeClicks")

;MUST HAVE INCLUDES BELOW FLOW
;;so labeled routines arent in autoexc above
return
#Include lib/gIcon2.ahk
#Include scripts/upgradeClicks.txt
#include scripts/genaral.txt
#include gui.txt

/*
*****************************
*** testing hotkeys area ***

;*/
t::
    
    gClick(menu2)
    gClick(st_angel)
    gClick(st_slot_8)
    gClick(skillbar_class_top_1)
    gClick(st_slot_9)
    gClick(skillbar_class_bottom_1)
    gClick(st_slot_9_stance)
return

/*************************
*** home menu driven ***
*/

Exit:
Escape::
    ExitApp
Return		

DevTools:
    menu.change("dev")
return	

Wizard:
    menu.change("wizard")
return

Warrior:
    menu.change("warrior")
return

Angel:
    menu.change("angel")
return	

Nitro:
Return
Upgrades:
Return

/*
*****************************
*** developer menu driven ***
*/	
Home:
PlayerMenu:
    menu.change("home")
return

showGameWindow:
!F2::
    showGameContainer()
return

findGameWindow:
!F1::
    mapGameContainer()
    showGameContainer()
return

Coords:
    Coords()
return

KingFarm:
    if (kfToggle=1 or kfToggle=0)
        kfToggle:=!kfToggle
    else
        kfToggle:=1
    
    if (kfToggle){
        gClick(menu4)
        gClick(challenge_1)
        gClick(challenge_start)
        send, {s down}
    }
    else{
        send, {s up}
    }
    
Return

JustRun:
    if (jrToggle=1 or jrToggle=0)
        jrToggle:=!jrToggle
    else
        jrToggle:=1
    
    if (jrToggle){
        send, {w down}
    }
    else{
        send, {w up}
    }
    
return

/*****************************
*** wizard menu driven ***
*/	

/*****************************
*** warrior menu driven ***
*/

/*
*********************************
*** Home / Player menu driven ***
*/

/*
*********************************
*** end of hotkeys ***
*********************************
*/	

;dev tool help function
showGameContainer()
{
    global begin_x, begin_y, end_x, end_y
    mousemove, begin_x,begin_y,10
    mousemove, end_x,begin_y,10
    mousemove, end_x,end_y,10
    mousemove, begin_x,end_y,10
    mousemove, begin_x,begin_y,10
return
}

mapGameContainer()
{
    WinGetTitle, Title, A
    if ! instr(Title,winTitle,false)
        return 1
    WinGet _parentID,id,A
    global parentID  :=_parentID
    global begin_x:=0, begin_y:=0, end_x:=0, end_y:=0
    global gameX:=0,gameY:=0
    global winTitle 

    WinGetPos, xZero, yZero, winWidth, winHeight, A
    mid:=winHeight*0.5
    
    ;check for left game border
    PixelSearch, abegin_x, temp, 0, %mid%, %winWidth%, %mid%, 0xB5B5B5, 3, Fast
    if ErrorLevel 	
        return 1 
    
    ;find top left
    PixelSearch, abegin_x, abegin_y, %abegin_x%, %mid%, %abegin_x%, 0, 0x000000, 0, Fast
    if ErrorLevel 	
        return 1 
    abegin_y:=abegin_y+1
    ;check not run offscreen
    PixelSearch, abegin_x, abegin_y, %abegin_x%, %abegin_y%, %abegin_x%, %abegin_y%, 0xB5B5B5, 10, Fast
    if ErrorLevel 	
        return 1
    
    ;find top right
    PixelSearch, aend_x, abegin_y, %abegin_x%, %abegin_y%, %winWidth%, abegin_y, 0x000000, 0, Fast
    if ErrorLevel 	
        return 1 
    aend_x:=aend_x-1
    ;check not run offscreen
    PixelSearch, aend_x, abegin_y, %aend_x%, %abegin_y%, %aend_x%, %abegin_y%, 0xB5B5B5, 10, Fast
    if ErrorLevel 	
        return 1
    
    ;find bottom right
    PixelSearch, aend_x, aend_y, %aend_x%, %abegin_y%, %aend_x%, winHeight, 0x000000, 0, Fast
    if ErrorLevel 	
        return 1 
    aend_y:=aend_y-1
    ;check not run offscreen
    PixelSearch, aend_x, aend_y, %aend_x%, %aend_y%, %aend_x%, %aend_y%, 0xB5B5B5, 10, Fast
    if ErrorLevel 	
        return 1
    
    end_x:=aend_x
    end_y:=aend_y
    begin_y:=abegin_y
    begin_x:=abegin_x
    
    ;game resolution
    gameX:=Abs(begin_x-end_x)
    gameY:=Abs(begin_y-end_y)
    
return 0
}

/*
*** function loadClickPoints()
*** load offset.txt into a key paired array - clickPoints 
*** (name (name,x,y) )
***
*** creates dynamicly named objects with the object named the same as the offest name in file
*** offsetname.name
*** offsetname.x
*** offsetname.y
***
*** objects used as
*** gClick(upgrade_nitro_pixel_start.x,upgrade_nitro_pixel_start.y)
***
*** checkPoints array for ease of itterating in app changes and writing back to file
    */
loadClickPoints()
{
    clickPoints := {}
    Loop, read, offsets.txt 
    {
        Loop, parse, A_LoopReadLine, %A_Tab%
        {
            Switch A_Index
            {
                Case "1":
                    name:= A_LoopField	
                Case "2":
                    x:= A_LoopField	
                Case "3":
                    y:= A_LoopField	
                    Default:							
                }
            }
            
            %name% :=new ClickPoint(name,x,y)
            clickPoints.insert(name, {name:name, x:x, y:y})
        }
        return
    }
    
    
    class ClickPoint{
        name := none
        x:=0
        y:=0
        
        __New(aname,ax,ay)
        {
            this.name:=aname
            this.x:=ax
            this.y:=ay
        }
        __Get(class)
        {
            return "ClickPoint"
        }
    }
    
    ;calcualtes games clickpoint cords with respect to the clients resolution
    gClick(aClickPoint){ 
        if ! isObject(aClickPoint) && aClickPoint.class!="ClickPoint"{
            eClickPoint:= aClickPoint.name
            msgbox error finding objects %eClickPoint%
            return
        }
        vClickPoint =aClickPoint.name
        
        global winTitle
        global gameX,gameY
        CoordMode, Mouse, screen 
        
        WinGetTitle, Title, A
        if ! instr(Title,winTitle,false)
            return 1
        
        gameClickX :=round( (gameX * aClickPoint.x)+begin_x)
        gameClickY := round((gameY * aClickPoint.y)+begin_y)
        Send {click, %gameClickX%, %gameClickY%}
        sleep 50
        return
    }
    
    WatchCursor:
        {
            global CoordsToggle
            if (CoordsToggle)
            { 
                MouseGetPos, xpos, ypos
                PixelGetColor, OutputVar, xpos, ypos
                tt_msg = x: %xpos% y: %ypos% `ncolor: %OutputVar% 
            }
            
            return
        }
        
        ;toggles x,y,pixel color
        Coords(){
            global CoordsToggle 
            CoordsToggle := !CoordsToggle
            if (CoordsToggle)
                SetTimer, WatchCursor, 100
            else
            {
                
                SetTimer, WatchCursor, Delete
            }
            return
        }
        
    test:
        msgbox test hotkey subroutine down bottom of source triggered this
        gui1.toggle()
        ;gui1.Stop()
        ;gui1.start()
    return
    test2:
        msgbox test2 hotkey subroutine down bottom of source triggered this
        gui2.toggle()
        ;gui1.Stop()
        ;gui1.start()
    return 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    