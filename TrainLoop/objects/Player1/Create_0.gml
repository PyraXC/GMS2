#region Menus
enum item_inventory {bone = 3, health_potion = 2, };
weapon_inventory = [];
#endregion

hp = 100;
max_hp = hp;
current_hp = max_hp;
state = "Move";
defend = 1;
actions = 1;
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
wall_jump_count = 0
i = 0;
i2 = 0;
lag_count = 0;
i_grav = grav;
i_run_speed = run_speed;
i_jump_speed = jump_speed;
kills = 0;
//Dependencies
input = instance_create_layer(0, 0, "Instances", o_input);
