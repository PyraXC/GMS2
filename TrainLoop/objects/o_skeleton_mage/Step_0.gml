depth = z;
switch(state){
	case "Idle":
	set_state_sprite(s_mage_idle, 1, 0);
		break;
	case "Noone":
	set_state_sprite(s_mage_idle, 1, 0);
		break;
	
	case "Battle Debug":
		Player1.state = "Battle Debug";
		o_gameState.state = "P1";
		o_gameState.debug = 0;
		return_state = "Battle";
		state = "Battle";
		break;
		
	case "Battle":
	set_state_sprite(s_mage_idle, 1, 0);
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
			state = "Bolt";
			point = attack_point(600, 0, 0, 0);
			//cout("RNG 1");
		}
		if(rng == 2){
			state = "Summon";
			point = attack_point(600, 0, 0, 0);
		}
		if(rng == 3){
			state = "Bolt";
			point = attack_point(600, 0, 0, 0);
			}
		break;
		
	case "Bolt":
		if!(on_point(point, 1)){
			set_state_sprite(s_mage_idle, 1, 0);
			approach_point(point, 1, 1);
			
		}else{//Attack
			set_state_sprite(s_mage_bolt, 1, 0);
			//place_transition(sq_fade_out); Don't work
			if(animation_hit_frame(10)){
				for(var i = 0; i < 5; i++){
					var bolt = instance_create_layer(x, y-sprite_height * 0.5, "InstancesTop", o_lightning_bolt);
					bolt.target = Player1;
					bolt.z = z;
					bolt.creator = self;
				}
			}
			if(animation_hit_frame(11)){
				create_hitbox(Player1.x, Player1.y, self, s_move, 0, 0, 2, 4, "None", 100, 1, z, 12, 0);
			}
			if(animation_end()){
				point = attack_point(ix-Player1.ix, iz-Player1.iz, iy-Player1.iy);
				state = "Return";
			}
		}
		break;
		
	case "Projectile Wait":
		set_state_sprite(s_mage_idle, 1, 0);
		wait--;
		if(wait <= 0){
			state = "Return";
			projectile = 0;
		}
		
		break;
		
	case "Summon":
	set_state_sprite(s_mage_summon, 1, 0);
	if(animation_hit_frame(12)){
		add_enemy(o_A1_skeleton);
	}
	if(animation_end()){
		state = "Return";
		point = attack_point(ix-Player1.ix, iz-Player1.iz, iy-Player1.iy);
	}
		break;
	
	case "Return":
		if!(on_point(point, 0)){
			set_state_sprite(s_mage_idle, 1, 0);
			approach_point(point, 2, 0);
		}else{//Returned
			turn = "Over";
			state = return_state;
		}
		break;
		
		
	case "Invincibility":
	#region Player Ran
	set_state_sprite(s_mage_idle, 1, 0);
	if(alarm[1] == -1){alarm[1] = 300;}
	//image_alpha = alarm[1];
	#endregion
		break;
		
	case "Death":
	#region ded
	set_state_sprite(s_mage_idle, 1, 0);
	if(animation_hit_frame(0)){
		index = find_self(o_gameState.turnList);
		array_delete(o_gameState.turnList, index, 1);
		o_gameState.enemyLen--;
	}

	if(animation_end()){
		instance_destroy(self);
	}
	#endregion
	break;
	
	case "Defeated":
	#region ded
	set_state_sprite(s_mage_idle, 1, 0);
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
//cout(turn);