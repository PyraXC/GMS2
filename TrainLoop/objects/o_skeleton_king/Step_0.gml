switch(state){
	case "Idle":
	image_alpha = 100;
	image_xscale = sign(distance_to_object(Player1));
	set_state_sprite(s_skeleton_king_idle, 1, 0);
		if(abs(distance_to_object(Player1)) < 200){
			
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
			rng = irandom_range(1,3);
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
		if(abs(x - Player1.x) <= 96){
			set_state_sprite(s_skeleton_king_default_attack, 1, 0);
		if(animation_hit_frame(6)){
			create_hitbox(x, y, self, s_skeleton_king_default_attack_damage, 1, 1, 2, 40, image_xscale);
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
			move_and_collide(dir*run_speed*2, 0);
			if(abs(ix-x) < run_speed*2){
				x += (ix-x);
			}
		}
		else{
			state = "Battle";
		}
		break;
		
	case "Invincibility":
	#region Player Ran
	set_state_sprite(s_skeleton_king_inv, 1, 0);
	if(alarm[1] == -1){alarm[1] = 300;}
	//image_alpha = alarm[1];
	#endregion
		break;
		
	case "Death":
	#region ded
	drop_item(drop_list, drops);
	index = find_self(o_gameState.turnList);
	array_delete(o_gameState.turnList, index, 1);
	o_gameState.enemyLen--;
	instance_destroy(self);
	#endregion
	break;
	
	case "Defeated":
	#region ded
	set_state_sprite(s_skeleton_king_die, 1, 0);
	if animation_end(){
		instance_destroy(self);
	}
	#endregion
	break;
}
if(image_xscale != 1 or image_xscale != 0){image_xscale = 1; }
//cout(state);
//cout(ix);
//cout(x);
//cout(id);