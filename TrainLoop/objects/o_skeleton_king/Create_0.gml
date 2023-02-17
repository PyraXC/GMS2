state = "Idle";
return_state = "Battle";
status = "None";
status_turns = 0;
instance = id;
hp = 20;
max_hp = hp;
defend = 1;
damage = 5;
xp = 10;
run_speed = 6;
vsp = 0;
hsp = 0;
rng = irandom_range(1, 3);
index = 0;
ix = 0;
iy = 0;
projectile = 0;
proj = noone;
target = Player1;
enemies = [o_skeleton_king,
o_skeleton_king,o_skeleton_king, o_skeleton_king
];
drop_list = [o_health_potion, o_health_potion, 
o_health_potion, o_knife, o_extra_action
];
attack_list = ["Overhead Swing", "Ranged Attack"];
drops = 1;
