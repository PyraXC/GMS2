#region Menus
	#region ATTACKS
	ini_open("attackList.ini");
	attack_list_n = ["Blunt", "Short", "Long", "Slicing", "Polearm", "Ranged"];
	attack_list_xp = [0,0,0,0,0,0];
	attack_list = [
	["Hit"],//Blunt 0
	["Stab", "Throw"],//Short 1
	["Stab", "Sweep"],//Long 2
	["Slice", "Overhead"],//Slicing 3
	["Sweep", "Thrust"],//Polearm 4
	["Shot"]//Ranged 5
	];
	for(var i = 0; i < array_length(attack_list); i++){
		for(var j = 0; j < array_length(attack_list[i]); j++){
			ini_write_real(attack_list_n[i], attack_list[i,j], 1);
		}
	}
	ini_close();
	ini_open("attack_spritemaps.ini");
		#region STABS
		var stabList = ds_map_create();
		stabList[? "Katana"] = s_stab_katana;
		stabList[? "Knife"] = s_stab_knife;
		stabList[? "Short Sword"] = s_stab_short_sword;
		stabList[? "King Sword"] = s_stab_king_sword;
		var stab_str = ds_map_write(stabList);
		ds_map_destroy(stabList);
		#endregion
		#region SWEEPS
		var sweepList = ds_map_create();
		sweepList[? "Katana"] = s_sweep_katana;
		sweepList[? "King Sword"] = s_sweep_king_sword;
		var sweep_str = ds_map_write(sweepList);
		ds_map_destroy(sweepList);
		#endregion
		
		ini_write_string("Stabs", "Stabs", stab_str);
		ini_write_string("Sweeps", "Sweeps", sweep_str);
		ini_close();
	#endregion
item_inventory = [];
weapon_inventory = [];
equip_inventory = [];
fish_inventory = [];
weapon = noone;
attack_type = noone;
item = noone;
#endregion
#region Fishing
fish = noone;
lr = 0;
inputs = 0;
k = 0;
rng = 0;
#endregion
target = noone;
//prev_state = "Move";
hp = 20;
money = 1000;
max_hp = hp;
current_hp = max_hp;
state = "Move";
return_state = "Move";
next_state = "Move";
status = "None";
status_turns = 0;
ix = 0;
iy = 0;
defend = 1;
iDefend = defend;
actions = 1;
item_actions = 1;
delay = 15;
#region Move stuff
run_speed = 6;
max_run_speed = 10;
jump_speed = 12;
jump_input = 0;
idle_time = 0;
air_speed = 0;
grav = global.grav;
hsp = 0;
max_hsp = 6;
vsp = 0;
z = 0;
width = 32;
wid = 32;
move = 0;
wall_jump_count = 0;
i_grav = grav;
i_run_speed = run_speed;
i_jump_speed = jump_speed;
#endregion
i = 0;
lag_count = 0;
kills = 0;
//Dependencies
input = instance_create_layer(0, 0, "Instances", o_input);
global.obj_list = [];
create_shadow("large", self, y, z);