#region Menus
attack_list = ["Stab", "Thrust", "Sweep", "Overhead"];
var stabList = ds_map_create();
s_stab_katana = stabList[? "Katana"];
s_stab_knife = stabList[? "Knife"];
s_stab_short_sword = stabList[? "Short Sword"];
s_stab_unarmed = stabList[? "Unarmed"];
ds_map_secure_save(stabList, "savefile");
ds_map_destroy(stabList);
item_inventory = [];
weapon_inventory = [];
fish_inventory = [];
equip = o_unarmed;
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
prev_state = "Move";
hp = 100;
money = 0;
max_hp = hp;
current_hp = max_hp;
state = "Move";
ix = 0;
iy = 0;
defend = 1;
iDefend = defend;
actions = 1;
delay = 15;
#region Move stuff
run_speed = 6;
max_run_speed = 10;
jump_speed = 12;
jump_input = 0;
idle_time = 0;
air_speed = 0;
grav = 0.5;
hsp = 0;
max_hsp = 6;
vsp = 0;
move = 0;
wall_jump_count = 0;
i_grav = grav;
i_run_speed = run_speed;
i_jump_speed = jump_speed;
#endregion
i = 0;
i2 = 0;
lag_count = 0;
kills = 0;
//Dependencies
input = instance_create_layer(0, 0, "Instances", o_input);
global.obj_list = [];