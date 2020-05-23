to use, download and install ahk https://www.autohotkey.com/ download and extract this project https://github.com/davejlhale/ieh.git start "ieh assist.ahk" by double clicking the file icon should work out the box

to confirm / refind your game you need to be past the initial 'click to start' screen press alt+f1 to refind and show the game container alt+f2 does a quick show only

Keys + top Menu / Icon Driven

	Alt + n = auto nitro
	alt + w = auto angel buff weave in global slot 1
	alt + u = auto upgrades resources etc
	alt + L = auto loot bestiary
	alt + b = auto buy slime bank upgrade
	alt + e = auto equip gear
	alt + s = auto equip hero skills
	alt + r = auto rebirth
	alt + c = auto capture
	F7 = king exp farm - kills minions
	F8 = holds run forward
	F9 = run toward chilli 
	Alt + p  = pause	
	holding right mouse down and left click also pause(there will be a dely on either pause if lots of scripts running)
	left click mouse on icons to turn on off thier scripts	
	hold right mouse and drag to move icons	
	
	other boss challenges use tinctures which MUST be availiable before running the scripts (top menu)
	kingexpfarm does not use tinctures
	
	
	
	
auto rebirth configurable in general.ini

rebirth numbers are in milliseconds - so your desired time in seconds *1000 
if the below is :=true or :=false to change it swap the true/false only

KingAfter:=350000 				will try gain exp from slime king minions after this delay from a rebirthing 
								you also need to ensure you can actually kill the minions so have it at a level you can do so

rebirthAfter:= 530000 			will try rebirth after this delay. 
								to have king exp farmed this number must be larger than KingAfter

kingEXPLoopTimer:=50000 		how often you will reenter king challenge while waiting on the rebirth delay
								increase to slow down rentry or set to negative number if want to reenter just 1 time

vAutoNitro:=true 				doenst auto alch so makes 1ml nitro only. 
								if you have low slimebank/rebirth purification this will be slow

vAutoEquip:=true 				equips the general equipment set (see below)

vAutoSkills:=true 				equips skills in scrips/autoSkills

vAutoBufGlobalAngels:=true 		buff weaves angels skills in global 1 if not on angel 

vAutoUgrade:=True 				clicks upgrade stuff, rituals first 

vAutoLootBestiary:=true 		auto loots bestiary interval set above 

vAutoBankBuy:=true 				auto check if slime bank is full and buy option from above 

vAutoKingChallange:=true 		auto try exp from king challange 

vReBirthWatchInterval:=8000 	** CAUTION ** 
								how often it checks if you are/have rebirthed 
								to big and it will miss you rebirthing to same hero 
								






auto nitro alt + n makes only the 1ml nitro fuel




auto buff weave alt + w buffs selected angel buffs in global slot one configurable in scripts\AngelWeave.ahk

	gClick(st_slot_4,2,20)
        	gClick(skillbar_global_top_1,2)
	
	st_slots are the heros skills menu slots. 1 is top left 2 is top right ie
							st_slot_1	st_slot_2
							st_slot_3	st_slot_4	
							st_slot_5	st_slot_6
							st_slot_7	st_slot_8
							st_slot_9	st_slot_10
	
	skillbar_global_top_1 can be changed to skillbar_global_top_2 or skillbar_global_top_3
	*be aware of the heros own auto skill being replaced unless you change the slots that script uses
	IGNORE the numbers after the commers but for info
	
	gClick(clickpoint_name , Number_of_times_to_click, delay_between_the_clicks)
	neither of the last two numbers are required and only used if needed and added
	
you could also change the hero mid flow and weave dps in the global slots or after
the line
		if vAddSkillToEndOfAngelWeave {	
select a dps skill or heal to leave in the global till buffs are due rebuffing





auto bank buy configurable in general.ini 
this buys your chosen option set in the above file 
only if the slime bank is full it takes two reads to confirm its full before buying




auto equip alt+e 
equips hero gear there are 4 possible sets useable. 
however general is the set name used by auto rebirth. 
To manually equip a different set, use the top meny and select the hero class. then equip. 
These sets need configuring as needed 

see configs\EquipmentSets.ini 
for ease just use (per line) USE TAB TO SEPERATE 
set_name equipment_class equipment_slot_number 

set names are: 			general		wizard		warrior		angel 
equipment_class: 		EquipClassD 	EquipClassC 	EquipClassB 
equipment_slot_number 	equip1 		.... 		equip10

eq a file with only the below equips the same 2 equips for each set 

angel EquipClassB equip6 
angel EquipClassB equip5 
wizard EquipClassB equip6 
wizard EquipClassB equip5 
warrior EquipClassB equip6 
warrior EquipClassB equip5 
general EquipClassB equip6 
general EquipClassB equip5





auto skill equip alt + s 
each hero class has its own file 
Angelskills.ini, warriorskills.ini and wizardskills.ini 

see AngelSkills.ini for commented file

gclick( st_slot_2 )						picks the skill form the heros menu 
gclick( skillbar_class_top_1) 			puts it in the corresponding skill slot

gclick( skill_table_skill_9_stance ) 	turns on the corresponding stance

gclick( warrior ) 						picks the hero class menu to select skills from 
gclick( st_slot_8 ) 					picks the skill 
gclick( skillbar_global_top_2 ) 		and adds to a global slot




auto upgrade alt +u 
see scripts\upgradeClicks.txt 
reorder is possible or add a ; to the beginning of any upgrade you dont want to have clicked




auto capture alt+c 
see configs\MonsterList.ahk 
add or remove the ; from any mobs you do or dont want to capture 
*** some mob colours might not be correct! sorry if they arnt and let me know 
you could have all on or off . 
there is no min or max number needed

also settings in general.ini for auto capture

vDoAutoNitroWhileCaputre:=true 			this tries to auto nitro (1mil only) 
vAutoConvertSCtoG:=true 				will use slimebank to make gold 
MobColorVariance:=2 					ncrease if cant capture mobs - 
										will select wrong ones + background more ie slower
										

;alch options ;alchemy_1ml , alchemy_10ml , alchemy_100ml 
;alchemy_1L , alchemy_10L , alchemy_100L ;alchemy_1kL , alchemy_10kL 
;alchemy100kL , alchemy_1mill , alchemy_10mill , alchemy_100mill ;alchemy_1BL , alchemy_10BL 

vAdvanceAlchToBottleSize=alchemy_10L 			will raise alch to this bottle size before making trap
												usefull to help speed up trap making by setting this ABOVE the 1L size 
vTrapColorVariance:=5 							make this bigger or smaller. 
												bigger if cant find traps 
												smaller if it finds the potions in 100ml and thinks they are traps