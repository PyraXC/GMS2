if(state == "Idle" or state == "Attack"){
	start_battle(self);
	array_push(global.obj_list, self);
	instance_deactivate_object(self);
}