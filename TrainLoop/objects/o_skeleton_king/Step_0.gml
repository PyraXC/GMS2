switch(state){
	case "Idle":
	set_state_sprite(s_skeleton_king_idle, 1, 0);
		if(distance_to_object(target) < 200){
			state = "Attack";
		}
		break;
		
	case "Attack":
		set_state_sprite(s_skeleton_king_default_attack, 1, 0);
		if(animation_hit_frame(2)){
			create_hitbox(x, y, self, s_skeleton_king_default_attack, 0, 0, 1, 2, 1);
		}
		if(animation_end()){
			state = "Move";
		}
		
		break;
}