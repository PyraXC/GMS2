
switch(state)
{
	case "Chase":
		#region Chase State
		set_state_sprite(s_knight_walk, 0.4, 0);
		if not instance_exists(obj_skeleton) break;

		image_xscale = sign(obj_skeleton.x - x);
		if image_xscale == 0
		{
			image_xscale = 1;
		}

		var direction_facing = image_xscale;
		var distance_to_player = point_distance(x, y, obj_skeleton.x, obj_skeleton.y);
		if distance_to_player <= attack_range
		{
			randomize()
			statecounter = irandom_range(1, 2);
			
			if statecounter == 1
				{
					state = "Attack";	
				}
			if statecounter == 2
				{
					state = "Attack Two";
				}
		}
		else
		{
			move_and_collide(direction_facing * chase_speed, 0);
		}
		#endregion
		break;

	case "Attack":
		#region Attack State
		set_state_sprite(s_knight_attack, 0.6, 0);
		
		statecounter = 0;
		
		if animation_hit_frame(4)
		{
			create_hitbox(x, y, self, s_knight_attack_hitbox, 8, 4, 10, image_xscale);
			audio_play_sound(a_swipe, 3, false);
		}
		
		if animation_end()
		{
			state = "Chase";	
		}
		#endregion
		break;
		
	case "Attack Two":
		#region Attack Two State
		set_state_sprite(s_knight_attack_two, 0.6, 0);
		
		statecounter = 0;
		
		if animation_hit_frame(9)
		{
			create_hitbox(x, y, self, s_knight_attack_two_hitbox, -4, 2, 2, image_xscale);
			audio_play_sound(a_swipe, 3, false);
		}
		
		if animation_hit_frame(11)
		{
			create_hitbox(x, y, self, s_knight_attack_two_hitbox_two, -14, 2, 13, image_xscale);
			audio_play_sound(a_swipe, 3, false);
		}
		
		if animation_end()
		{
			state = "Chase";	
		}
		#endregion
		break;
		
	case "Knockback":
		#region Knockback State
		knockback_state(s_knight_hitstun, "Chase");
		#endregion
		break;
	case "Death": 
		death_state(s_knight_die);
		break;
		
		default:
		show_debug_message("State "+state+" does not exists");
		state = "Chase";
		break;
}