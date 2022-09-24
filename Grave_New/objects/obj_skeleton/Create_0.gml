event_inherited();
image_speed = 0.25;
state = "Move";
run_speed = 6;
roll_speed = 6;
kills = 0;
level = 1;
experience = 0;
max_experience = 10;
strength = 25;
idle_time = 0;
store_state = "Move";
i = 0;
store_adv = 0;
ini_open("save.ini");
unlockables = ini_read_real("Scores", "unlockables", 0);
ini_close();

//Dependencies
input = instance_create_layer(0, 0, "Instances", o_input);