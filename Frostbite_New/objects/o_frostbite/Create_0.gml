hp = 100;
max_hp = hp;
current_hp = max_hp;
state = "Move";
run_speed = 6;
max_run_speed = 12;
jump_speed = 12;
jump_input = 0;
idle_time = 0;
air_speed = 0;
grav = 0.5;
hsp = 0;
vsp = 0;
fast_fall_count = 0;
lag_count = 0
wall_jump_count = 0;
move = 0;
i = 0;
i2 = 0;
i_grav = grav;
i_run_speed = run_speed;
i_jump_speed = jump_speed;
zero_degree_meter = 0;
tether_range = 192;
launch = 0;
launch_coordinates = 0;
launch_speed_x = 0;
launch_speed_y = 0;
buddy_state = 0;
up_b_count = 0;
kills = 0;
//Dependencies
input = instance_create_layer(0, 0, "Instances", o_input);