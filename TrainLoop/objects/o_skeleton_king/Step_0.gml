switch(state){
	case "Idle":
	
	image_xscale = sign(distance_to_object(Player1));
	set_state_sprite(s_skeleton_king_idle, 1, 0);
		if(abs(distance_to_object(Player1)) < 200){
			
			state = "Attack";
		}
		break;
		
	case "Attack":
		set_state_sprite(s_skeleton_king_default_attack, 1, 0);
		if(animation_hit_frame(6)){
			create_hitbox(x, y, self, s_skeleton_king_default_attack_damage, 1, 1, 1, 0, "None", 0, image_xscale, z, 15);
			audio_play_sound(a_medium_hit, 1, 0, 0.5);
		}
		if(animation_end()){
			state = "Idle";
		}
		break;
		
	case "Noone":
	set_state_sprite(s_skeleton_king_idle, 1, 0);
		break;
	
	case "Battle Debug":
		Player1.state = "Battle Debug";
		o_gameState.state = "P1";
		o_gameState.debug = 0;
		return_state = "Battle";
		state = "Battle";
		break;
		
	case "Battle":
	set_state_sprite(s_skeleton_king_idle, 1, 0);
	in_air();
	//cout(instance);
		
		break;
		
	case "Choose Attack":
	rng = irandom_range(1,3);
	//projectile = 0;
		if(rng == 1){
			state = "Overhead Swing";
			rng = irandom_range(1,3);
			//cout("RNG 1");
		}
		if(rng == 2){
			state = "Ranged Attack";
			//cout("RNG 2");
		}
		if(rng == 3){
			state = "Overhead Swing";
			//cout("RNG 3");
			}
		break;
		
	case "Overhead Swing":
		if(abs(x - Player1.x) <= 96){
			set_state_sprite(s_skeleton_king_default_attack, 1, 0);
		if(animation_hit_frame(6)){
			create_hitbox(x, y, self, s_skeleton_king_default_attack_damage, 1, 1, 2, 6, "Bleed", 0, image_xscale, z, 15);
			audio_play_sound(a_medium_hit, 1, 0);
		}
		if(animation_end()){
			//cout("Here");
			state = "Return";
		}
		}
		else{
			set_state_sprite(s_skeleton_king_idle, 1, 0);
			approach_target(Player1);
		}
		break;
		
	case "Ranged Attack":
		if(abs(x - Player1.x) <= 600){
			set_state_sprite(s_skeleton_king_ranged_attack, 1, 0);
			if(animation_hit_frame(6) and projectile = 0){
				proj = instance_create_layer(x, y, "Instances", o_king_projectile1);
				proj.creator = self;
				proj.z = z;
				audio_play_sound(a_swipe, 1, 0);
				rng = irandom_range(1,2);
				if rng == 1{
					state = "Projectile Wait";
					alarm[9] = 90;
				}else{
					//state = "Ranged Follow Up";
					state = "Projectile Wait";
					alarm[9] = 90;
				}
			}/*else if(projectile != 0){
				set_state_sprite(s_skeleton_king_idle, 1, 0);
			}
			else if(!object_exists(proj)){
				set_state_sprite(s_skeleton_king_idle, 1, 0);
				if(!object_exists(o_king_projectile1)){
					
				}
			}
		}
		else{
			set_state_sprite(s_skeleton_king_idle, 1, 0);
			approach_target(Player1);*/
		}
		break;
		
	case "Projectile Wait":
		set_state_sprite(s_skeleton_king_idle, 1, 0);
		if(alarm[9] == -1){
			state = "Return";
				projectile = 0;
		}
		
		break;
		
	case "Return":
		set_state_sprite(s_skeleton_king_idle, 1, 0);
		var dir = sign(distance_to_object(Player1));
		if(x != ix){
			move_and_collide(dir*run_speed*2, 0);
			if(abs(ix-x) < run_speed*2){
				x += (ix-x);
			}
		}
		else{
			state = return_state;
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
	set_state_sprite(s_skeleton_king_die, 1, 0);
	if(animation_hit_frame(0)){
		index = find_self(o_gameState.turnList);
		array_delete(o_gameState.turnList, index, 1);
		o_gameState.enemyLen--;
	}
	if(animation_hit_frame(7)){	instance_create_layer(x-98*image_xscale, y-12, "Instances", o_crown);}
	if(animation_hit_frame(10)){
	drop_item(drop_list, drops);
	}
	if(animation_end()){
		instance_destroy(self);
	}
	#endregion
	break;
	
	case "Defeated":
	#region ded
	set_state_sprite(s_skeleton_king_die, 1, 0);
	if(animation_hit_frame(7)){	instance_create_layer(x-98*image_xscale, y-12, "Instances", o_crown);}
	if animation_end(){
		instance_destroy(self);
	}
	#endregion
	break;
}

if(image_xscale != 1 or image_xscale != 0){image_xscale = 1; }
//if state != "Battle"{
	//cout(state);
//}
//cout(proj);
//cout(ix);
//cout(x);
//cout(id);
//cout(alarm[7]);
//cout(z);
//cout("King:" + string(depth));