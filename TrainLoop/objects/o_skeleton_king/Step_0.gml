switch(state){
	case "Idle":
	set_state_sprite(s_skeleton_king_idle, 1, 0);
		if(distance_to_object(target) < 100){
			state = "Attack";
		}
		break;
		
	case "Attack":
		set_state_sprite(s_skeleton_king_idle, 1, 10);
		break;
}