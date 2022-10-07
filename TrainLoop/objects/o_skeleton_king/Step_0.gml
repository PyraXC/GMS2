switch(state){
	case "Idle":
	set_state_sprite(s_skeleton_king_idle, 1, 0);
		if(distance_to_object(target) < 200){
			state = "Attack";
		}
		break;
		
	case "Attack":
		set_state_sprite(s_skeleton_king_idle, 1, 0);
		show_debug_message("Here");
		
		break;
}