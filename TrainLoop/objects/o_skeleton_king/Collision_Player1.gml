if(z_axis(Player1, 10)){
	if(state == "Idle" or state == "Attack"){
		//cout("Here" + string(state));
		//transition_to_battle(rm_battle1);
	
		transition_to_battle();
	
	/*	start_battle(self);
		array_push(global.obj_list, self);
		instance_deactivate_object(self);*/
	}
}