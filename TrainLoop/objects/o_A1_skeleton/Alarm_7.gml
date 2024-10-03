	start_battle(self, "P1");
	array_push(global.obj_list, self);
	instance_deactivate_object(self);
	place_transition(sq_fade_in);