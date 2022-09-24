switch (state)
{
	case "Move":
		#region Move State
	if input2.right2
		{
			move_and_collide(run_speed,0);
			image_xscale = 1;
			set_state_sprite(s_skeleton_run, 0.6, 0);
			idle_time = 0;
		}
	if input2.left2
		{
			move_and_collide(-run_speed,0);
			image_xscale = -1;
			set_state_sprite(s_skeleton_run, 0.6, 0);
			idle_time = 0;
		}
	if not input2.left2 and not input2.right2
		{
			idle_time++;
			set_state_sprite(s_skeleton_idle, 0.25, 0);
			if idle_time >= 120
				{
					state = "Idle2";
				}
		}
		else
		{
			if animation_hit_frame(2) or animation_hit_frame(5)
			{
				audio_play_sound(a_footstep, 2, false);
			}
		}
	if input2.roll2 
		{
			state = "Roll";
		}
	if input2.attack2
		{
			state = "Attack One";
		}
	if input2.attack_alt2
		{
			state = "Alt One";
		}
	if input2.taunt2
		{
			state = "Idle2";	
		}
		
		#endregion
		break;
		
	case "Roll":
	#region Roll State
	set_state_sprite(s_skeleton_roll, 0.9, 0);
	
		if image_xscale == 1
	{
		move_and_collide(roll_speed, 0);
	}
	
		if image_xscale == -1 
	{
		move_and_collide(-roll_speed, 0);
	}
	
	if animation_end()
	{
		state = "Move";
	}
	#endregion	
		break;
		
	case "Attack One":
	#region Attack One State
	set_state_sprite(s_skeleton_attack_one, 0.55, 0);
	if animation_hit_frame(0)
	{
		create_hitbox(x, y, self, s_skeleton_attack_one_damage, 5, 4, 3, image_xscale);
		audio_play_sound(a_swipe, 3, false);
	}
	
	if input2.roll2 and animation_hit_frame_range(2, 4)
		{
			state = "Roll";
		}
		
		if input2.attack2 and animation_hit_frame_range(2, 4)
		{
			state = "Attack Two";
		}
		
		if animation_end()
		{
			state = "Move";	
		}
		
	#endregion
		break;
		
	case "Attack Two":
	#region Attack Two State
	
	set_state_sprite(s_skeleton_attack_two, 0.55, 0);
	
	if animation_hit_frame(1)
	{
		create_hitbox(x, y, self, s_skeleton_attack_two_damage, 5, 4, 4, image_xscale);
		audio_play_sound(a_swipe, 3, false);
	}
	
	if input2.roll2 and animation_hit_frame_range(2, 4)
		{
			state = "Roll";
		}
		
			if input2.attack2 and animation_hit_frame_range(2, 4)
		{	
			state = "Attack Three";
		}
		
			if input2.attack_alt2 and animation_hit_frame_range(2, 4) and not input2.attack2
		{
			state = "Alt Attack";
		}
		
			if animation_end()
		{
			state = "Move";	
		}
	
	#endregion
		break;
	
	case "Attack Three":
	#region Attack Three State
	set_state_sprite(s_skeleton_attack_three, 0.65, 0);
	
	if animation_hit_frame(2)
	{
		create_hitbox(x, y, self, s_skeleton_attack_three_damage, 10, 4, 8, image_xscale);
		audio_play_sound(a_swipe, 3, false);
		audio_play_sound(a_medium_hit, 3, false);
	}
	
	if input2.roll2 and animation_hit_frame_range(1, 2)
		{
			state = "Roll";
		}
		
			if animation_end()
		{
			state = "Move";	
		}
	#endregion
		break;
	
	case "Knockback":
	#region Knockback State
		idle_time = 0;
		knockback_state(s_skeleton_hitstun, "Move");
		#endregion
		break;
		
	case "Alt Attack":
	#region Attack Alt State
	set_state_sprite(s_skeleton_attack_alt, 1, 0);
	
	if animation_hit_frame(9)
	{
		create_hitbox(x, y, self, s_alt_attack_damage, 4, 1, 1, image_xscale);
		audio_play_sound(a_swipe, 3, false);
	}
	if animation_hit_frame(10)
	{
		create_hitbox(x, y, self, s_alt_attack_damage1, 4, 1, 1, image_xscale);
		audio_play_sound(a_swipe, 3, false);
	}
	
	if animation_hit_frame(11)
	{
		create_hitbox(x, y, self, s_alt_attack_damage2, 4, 1, 1, image_xscale);
		audio_play_sound(a_swipe, 3, false);
	}
	
	if animation_hit_frame(12)
	{
		create_hitbox(x, y, self, s_alt_attack_damage3, 4, 1, 1, image_xscale);
		audio_play_sound(a_swipe, 3, false);
	}
	
	if animation_hit_frame(13)
	{
		create_hitbox(x, y, self, s_alt_attack_damage4, 4, 1, 1, image_xscale);
		audio_play_sound(a_swipe, 3, false);
	}
	
	if animation_hit_frame(14)
	{
		create_hitbox(x, y, self, s_alt_attack_damage5, 12, 3, 10, image_xscale);
		audio_play_sound(a_medium_hit, 3, false);
	}
	
			if animation_end()
		{
			state = "Move";	
		}
	#endregion
		break;
	
	case "Alt One":
	#region 2
	set_state_sprite(s_skeleton_attack_alt_two, 1.5, 0);
	if animation_hit_frame(0)
	{
		create_hitbox(x, y, self, s_skeleton_attack_alt_two_damage, 2, 2, 2, image_xscale);
		audio_play_sound(a_swipe, 3, false);
	}
	
	if input2.roll2 and animation_hit_frame_range(1, 2)
		{
			state = "Roll";
		}
		
		if input2.attack_alt2 and animation_hit_frame_range(1, 2)
		{
			state = "Alt Two";
		}
		
		if animation_end()
		{
			state = "Move";	
		}
	
	#endregion
		break;
		
		case "Alt Two":
	#region 2 2
		set_state_sprite(s_skeleton_attack_alt_two2, 1.5, 0);
	if animation_hit_frame(0)
	{
		create_hitbox(x, y, self, s_skeleton_attack_alt_two2_damage, 2, 2, 3, image_xscale);
		audio_play_sound(a_swipe, 3, false);
	}
	
	if input2.roll2 and animation_hit_frame_range(1, 2)
		{
			state = "Roll";
		}
		
		if input2.attack_alt2 and animation_hit_frame_range(0, 2)
		{
			state = "Alt Three";
		}
		
		if input2.attack2 and animation_hit_frame_range(0, 2)
		{
			state = "Alt Normal";
		}
		
		if animation_end()
		{
			state = "Move";	
		}
	
	
	#endregion
		break;
		
		case "Alt Three":
	#region 2 2 2
	set_state_sprite(s_skeleton_attack_alt_two3, 0.85, 0);
	if animation_hit_frame(0)
	{
		create_hitbox(x, y, self, s_skeleton_attack_alt_two3_damage, 2, 1, 1, image_xscale);
		audio_play_sound(a_swipe, 3, false);
	}
	if animation_hit_frame(1)
	{
		create_hitbox(x, y, self, s_skeleton_attack_alt_two3_damage1, 2, 1, 1, image_xscale);
		audio_play_sound(a_swipe, 3, false);
	}
	if animation_hit_frame(2)
	{
		create_hitbox(x, y, self, s_skeleton_attack_alt_two3_damage2, 2, 1, 1, image_xscale);
		audio_play_sound(a_swipe, 3, false);
	}
	if animation_hit_frame(3)
	{
		create_hitbox(x, y, self, s_skeleton_attack_alt_two3_damage3, 2, 1, 1, image_xscale);
		audio_play_sound(a_swipe, 3, false);
	}
	if animation_hit_frame(4)
	{
		create_hitbox(x, y, self, s_skeleton_attack_alt_two3_damage4, 2, 1, 1, image_xscale);
		audio_play_sound(a_swipe, 3, false);
	}
	if animation_hit_frame(5)
	{
		create_hitbox(x, y, self, s_skeleton_attack_alt_two3_damage5, 2, 1, 1, image_xscale);
		audio_play_sound(a_swipe, 3, false);
	}
	if animation_hit_frame(8)
	{
		create_hitbox(x, y, self, s_skeleton_attack_alt_two3_damage6, 14, 4, 9, image_xscale);
		audio_play_sound(a_swipe, 3, false);
		audio_play_sound(a_medium_hit, 3, false);
	}
		if animation_end()
		{
			state = "Move";	
		}
	
	#endregion
		break;
		
		case "Alt Normal":
		#region 2 2 1
		set_state_sprite(s_skeleton_attack_2_2_1, 1.2, 0);
		if animation_hit_frame(1)
		{
			create_hitbox(x, y, self, s_skeleton_attack_2_2_1_damage1, 1, 2, 3, image_xscale);
			audio_play_sound(a_swipe, 3, false);
		}
		if animation_hit_frame(3)
		{
			create_hitbox(x, y, self, s_skeleton_attack_2_2_1_damage2, -2, 2, 3, image_xscale);
			audio_play_sound(a_swipe, 3, false);
		}
		if animation_hit_frame(5)
		{
			create_hitbox(x, y, self, s_skeleton_attack_2_2_1_damage3, -1, 2, 3, image_xscale);
			audio_play_sound(a_swipe, 3, false);
		}
		if animation_hit_frame(7)
		{
			create_hitbox(x, y, self, s_skeleton_attack_2_2_1_damage4, 2, 2, 3, image_xscale);
			audio_play_sound(a_swipe, 3, false);
		}
		if animation_hit_frame(10)
		{
			create_hitbox(x, y, self, s_skeleton_attack_2_2_1_damage5, 12, 2, 8, image_xscale);
			audio_play_sound(a_swipe, 3, false);
			audio_play_sound(a_medium_hit, 3, false);
		}
		if animation_end()
			{
				state = "Move"	
			}
		#endregion
		break;
		case "Idle2":
		#region Idle2
		set_state_sprite(s_skeleton_idle_2, 0.33, 0);
		
	if input2.right2 or input2.left2
		{
			state= "Move";
			idle_time = 0;
		}
		if input2.attack2
		{
			state = "Attack One";
			idle_time = 0;
		}
	if input2.attack_alt2
		{
			state = "Alt One";
			idle_time = 0;
		}
	if animation_end()
	{
		state = "Move"
		idle_time = 0;
		repeat (10)
		{
			instance_create_layer(other.x, other.y-20, "Instances", o_experience);
		}
	}
	if input2.roll2
		{
			state = "Roll";
			idle_time = 0;
		}
	#endregion
		break;		
		case "Death":
		death_state(s_skeleton_hitstun);
		break;
		if hp >= max_hp
			{
				hp = max_hp;
			}
	}
