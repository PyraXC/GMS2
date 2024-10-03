event_inherited();
state = "Idle";
return_state = "Battle";
status = "None";
status_turns = 0;
instance = id;
hp = 2;
max_hp = hp;
defend = 1;
damage = 5;
facing = 1;
xp = 1;
run_speed = 6;
vsp = 0;
hsp = 0;
zsp = 0;
rng = irandom_range(1, 3);
index = 0;
ix = 0;
iy = 0;
iz = 0;
point = noone;
projectile = 0;
wait = 0;
focused = 0;
turn = "";
proj = noone;
target = Player1;
enemies = [o_A1_skeleton,
o_A1_skeleton, o_A1_skeleton, o_A1_skeleton
, o_A1_skeleton, o_A1_skeleton
];
drop_list = 
[o_bone, o_bone, o_bone];
print_drop_list = "Bone 100% 2-4";
attack_list = ["Stab", "Bone Throw"];
drops = irandom_range(1, 2);
enemy_index = 1;
create_shadow("medium", self, y, z);
wid = 16;