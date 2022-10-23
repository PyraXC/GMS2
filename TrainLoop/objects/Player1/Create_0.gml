#region Menus
attack_list = ["Stab", "Thrust", "Sweep", "Overhead"];
item_inventory = [
//o_bone, o_bone, o_health_potion, o_health_potion
];
weapon_inventory = [];
equip = o_unarmed;
item = noone;
#endregion
target = noone;
hp = 100;
max_hp = hp;
current_hp = max_hp;
state = "Move";
ix = 0;
iy = 0;
defend = 1;
actions = 1;
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