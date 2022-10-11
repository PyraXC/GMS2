switch(state){
	case "Idle":
	set_state_sprite(s_skeleton_king_idle, 1, 0);
		if(distance_to_object(target) < 200){
			state = "Attack";
		}
		break;
		
	case "Attack":
		set_state_sprite(s_skeleton_king_default_attack, 1, 0);
		if(animation_hit_frame(6)){
			create_hitbox(x, y, self, s_skeleton_king_default_attack_damage, 1, 1, 1, 1, image_xscale);
		}
		if(animation_end()){
			state = "Idle";
		}
		break;
		
	case "Battle":
	set_state_sprite(s_skeleton_king_idle, 1, 0);
	//cout(instance);
		
		break;
		
	case "Choose Attack":
		if(rng == 1){
			state = "Battle Attack";
			//cout("RNG 1");
		}
		if(rng == 2){
			state = "Battle Attack";
			//cout("RNG 2");
		}
		else{
			state = "Battle Attack";
			//cout("RNG 3");
			}
		break;
		
	case "Battle Attack":
		if(distance_to_object(Player1) <= 100){
			set_state_sprite(s_skeleton_king_default_attack, 1, 0);
		if(animation_hit_frame(6)){
			create_hitbox(x, y, self, s_skeleton_king_default_attack_damage, 1, 1, 2, 1, image_xscale);
		}
		if(animation_end()){
			//cout("Here");
			state = "Return";
		}
		}
		else{
			set_state_sprite(s_skeleton_king_walk, 1, 0);
			approach_target(Player1);
		}
		break;
		
	case "Return":
		set_state_sprite(s_skeleton_king_walk, 1, 0);
		var dir = sign(distance_to_object(Player1));
		if(x != ix){
			move_and_collide(dir*run_speed, 0);
			if(abs(ix-x) < run_speed){
				x += (ix-x);
			}
		}
		else{
			state = "Battle";
		}
		break;
}
//cout(state);
//cout(ix);
//cout(x);
//cout(id);