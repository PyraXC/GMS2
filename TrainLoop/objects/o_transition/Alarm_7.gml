start_battle(creator, turn);
array_push(global.obj_list, creator);
instance_deactivate_object(creator);
place_transition(sq_fade_in);