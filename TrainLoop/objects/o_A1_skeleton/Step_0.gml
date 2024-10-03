depth = z;
switch(state){
	case "Idle":
		hsp = 0;
		zsp = 0; 
		vsp = 0;
		image_xscale = sign(distance_to_object(Player1));
		set_state_sprite(s_skeleton_idle, 1, 0);
		if(abs(distance_to_object(Player1)) < 200){
			state = "Chase";
		}
		break;
		
	case "Chase":
		set_state_sprite(s_skeleton_move, 1, 0);
		//var target_x = Player1.x;
		//var target_z = Player1.z;
		chase_player(0.25, 32, 4, 300, false);
		/*hsp = run_speed * -sign(x-Player1.x);
		zsp = (0.5*run_speed) * sign(z-Player1.z);
		image_xscale = -sign(hsp);
		move_and_collide_new(hsp, zsp, vsp);
		if(abs(distance_to_object(Player1)) < 32 && z_axis(Player1, 16)){
			state = "Attack";
		}else if(abs(distance_to_object(Player1)) > 300){
			state = "Idle";
		}*/
	
		break;
	
	case "Attack":
		set_state_sprite(s_skeleton_bone_rush, 0.5, 0);
		chase_player(0.25, 32, 4, 300, true);
		if(animation_hit_frame(5)){
			create_hitbox(x, y, self, s_skeleton_bone_rush_damage, 1, 1, 1, 0, "None", 0, image_xscale, z, 24);
			audio_play_sound(a_swipe, 1, 0, 0.5);
		}
		if(animation_end()){
			state = "Chase";
		}
		break;
		
	case "Noone":
	set_state_sprite(s_idle, 1, 0);
		break;
	
	case "Battle Debug":
		Player1.state = "Battle Debug";
		o_gameState.state = "P1";
		o_gameState.debug = 0;
		return_state = "Battle";
		state = "Battle";
		break;
		
	case "Battle":
		hsp = 0;
		zsp = 0; 
		vsp = 0;
	set_state_sprite(s_skeleton_idle, 1, 0);
	//image_xscale = facing;
	in_air();
	//cout(instance);
		
		break;
		
	case "Turn":
		state = "Choose Attack";
		break;
		
	case "Choose Attack":
	rng = irandom_range(1,3);
	//projectile = 0;
		if(rng == 1){
			state = "Bone Rush";
			point = attack_point(96, 0, 0, 0);
			//cout("RNG 1");
		}
		if(rng == 2){
			state = "Bone Throw";
			point = attack_point(600, 0, 0, 0);
			//cout("RNG 2");
		}
		if(rng == 3){
			state = "Bone Rush";
			point = attack_point(96, 0, 0, 0);
			//cout("RNG 3");
			}
		break;
		
	case "Bone Rush":
		if!(on_point(point, 0)){
			set_state_sprite(s_skeleton_move, 1, 0);
			approach_point(point, 1, 0);
		}else{//Attack
			set_state_sprite(s_skeleton_bone_rush, 0.5, 0);
			if(animation_hit_frame(5)){
				create_hitbox(x, y, self, s_skeleton_bone_rush_damage, 1, 1, 2, 2, "None", 0, image_xscale, z, 16);
				audio_play_sound(a_swipe, 1, 0);
			}
			if(animation_end()){
				state = "Return";
				point = attack_point(ix-Player1.ix, iz-Player1.iz, iy-Player1.iy, 0);
			}
		}
		/*if(abs(x - Player1.x) <= 96){
			set_state_sprite(s_skeleton_bone_rush, 0.5, 0);
			if(animation_hit_frame(5)){
				create_hitbox(x, y, self, s_skeleton_bone_rush_damage, 1, 1, 2, 2, "None", 0, image_xscale, z, 16);
				audio_play_sound(a_swipe, 1, 0);
			}
			if(animation_end()){
				state = "Return";
			}
		}
		else{
			set_state_sprite(s_skeleton_move, 1, 0);
			approach_target(Player1);
		}*/
		break;
		
	case "Bone Throw":
		if!(on_point(point, 1)){
			set_state_sprite(s_skeleton_move, 1, 0);
			approach_point(point, 1, 1);
		}else{//Attack
			set_state_sprite(s_skeleton_bone_throw, 0.25, 0);
			if(animation_hit_frame(4)){
				throw_bone(false, -1, random_range(1, 2));
			}
			if(animation_end()){
				state = "Projectile Wait";
				wait = 90;
				point = attack_point(ix-Player1.ix, iz-Player1.iz, iy-Player1.iy, 0);
			}
		}
		/*if(abs(x - Player1.x) <= 600){
			set_state_sprite(s_skeleton_bone_throw, 0.25, 0);
			if(animation_hit_frame(4)){
				throw_bone(false, -1, random_range(1, 2));
			}
			if(animation_end()){
				state = "Projectile Wait";
				wait = 90;
			}

		}else{
			set_state_sprite(s_skeleton_move, 1, 0);
			approach_target(Player1);
		}*/
		break;
		
	case "Projectile Wait":
		set_state_sprite(s_skeleton_idle, 1, 0);
		wait--;
		if(wait <= 0){
			state = "Return";
			projectile = 0;
		}
		
		break;
		
	case "Return":
		if!(on_point(point, 0)){
			set_state_sprite(s_skeleton_move, 1, 0);
			approach_point(point, 2, 0);
		}else{//Returned
			state = return_state;
			turn = "Over";
		}
	
	/*
		set_state_sprite(s_skeleton_move, 1, 0);
		var dir = sign(distance_to_object(Player1));
		if(x != ix){
			move_and_collide_new(dir*run_speed*2, 0, 0);
			if(abs(ix-x) < run_speed*2){
				x += (ix-x);
			}
		}
		else{
			state = return_state;
			turn = "Over";
		}*/
		break;
		
	case "Invincibility":
	#region Player Ran
	set_state_sprite(s_skeleton_idle, 1, 0);
	if(alarm[1] == -1){alarm[1] = 120;}
	//image_alpha = alarm[1];
	#endregion
		break;
		
	case "Death":
	#region ded
	set_state_sprite(s_bone, 1, 0);
	if(animation_hit_frame(0)){
		index = find_self(o_gameState.turnList);
		array_delete(o_gameState.turnList, index, 1);
		o_gameState.enemyLen--;
	}
	if(animation_hit_frame(1)){	drop_specific_item(o_bone, 0);}
	if(animation_hit_frame(2)){
	drop_item(drop_list, drops);
	}
	if(animation_end()){
		instance_destroy(self);
	}
	#endregion
	break;
	
	case "Defeated":
	#region ded
	set_state_sprite(s_bone, 1, 0);
	//if(animation_hit_frame(2)){	instance_create_layer(x-98*image_xscale, y-12, "Instances", o_crown);}
	if animation_end(){
		instance_destroy(self);
	}
	#endregion
	break;
}
//cout(y);
//cout("Skele " + string(depth));
//cout(turn);
//cout(state);