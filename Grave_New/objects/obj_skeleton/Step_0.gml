//ini_open("save.ini");
//ini_write_real("Scores", "highscore", 0);
//ini_write_real("Scores", "unlockables", 0);
//ini_close();
switch (state)
{
	case "Move":
	#region Move State
		i = 0;
		store_state = "Move";
		store_adv = 0;
	if input.right
		{
			move_and_collide(run_speed,0);
			image_xscale = 1;
			set_state_sprite(s_skeleton_run, 0.6, 0);
			idle_time = 0;
		}
	if input.left
		{
			move_and_collide(-run_speed,0);
			image_xscale = -1;
			set_state_sprite(s_skeleton_run, 0.6, 0);
			idle_time = 0;
		}
	if not input.left and not input.right
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
	if input.roll 
		{
			state = "Roll";
		}
	if input.attack
		{
			state = "Attack One";
		}
	if input.attack_alt
		{
			state = "Alt One";
		}
	if input.heal && unlockables >= 2 && alarm[0] <= 0
		{
			state = "Heal";	
		}
	if input.die 
		{
			create_hitbox(obj_skeleton.x,obj_skeleton.y, o_enemy_parent, s_heal_particle, 100, 1, 999, obj_skeleton.image_xscale);
		}
		#endregion
		break;
		
	case "Roll":
	#region Roll State
	if unlockables >= 1
	{
	set_state_sprite(s_skeleton_roll, 0.9, 0);
	
	if !input.left && !input.right && i == 0
	{
		move_and_collide(roll_speed * image_xscale, 0);
	}
	
		if input.right && i == 0 {i++;}
		if i > 0
	{
		image_xscale = 1;
		move_and_collide(roll_speed, 0);
	}
	
		if input.left && i == 0 {i--;}
		if i < 0
	{
		image_xscale = -1;
		move_and_collide(-roll_speed, 0);
	}
		if animation_hit_frame_range(4,6) && input.attack && store_state != "Move"  
		{
			state = store_state;
			i = 0;
		}
		if animation_hit_frame_range(4,6) && input.attack_alt && store_state != "Move"  
		{
			state = store_state;
			i = 0;
		}
	
	if animation_end()
	{
		state = "Move";
	}
	}
	else
	{
		state = "Move";
	}
	#endregion	
		break;
		
	case "Heal":
	#region
		set_state_sprite(s_skeleton_heal, 1, 0);
		alarm[0] = 300;
		if animation_hit_frame(6)
		{
			instance_create_layer(x+irandom_range(-6,6), y, "Effects", o_heal_particle);
			hp += 2;
		}
		
		if animation_hit_frame(7)
		{
			instance_create_layer(x+irandom_range(-6,6), y, "Effects", o_heal_particle);
			hp += 2;
		}
	if animation_hit_frame(8)
		{
			instance_create_layer(x+irandom_range(-6,6), y, "Effects", o_heal_particle);
			hp += 2;
		}
		
		if animation_hit_frame(9)
		{
			instance_create_layer(x+irandom_range(-6,6), y, "Effects", o_heal_particle);
			hp += 2;
		}
		
		
		if animation_end() {state = "Move";}
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
	
	if input.roll and animation_hit_frame_range(2, 4)
		{
			state = "Roll";
		}
		
		if input.attack and animation_hit_frame_range(2, 4)
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
	
	if input.roll and animation_hit_frame_range(3, 4)
		{
			state = "Roll";
			store_state = "Attack Three";
		}
		
			if input.attack and animation_hit_frame_range(3, 4)
		{	
			state = "Attack Three";
		}
		
			if input.attack_alt and animation_hit_frame_range(3, 4) and not input.attack
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
	if input.left && i == 0 {image_xscale = -1; i++;}
	if input.right && i == 0 {image_xscale = 1; i++;}
	if animation_hit_frame(2)
	{
		create_hitbox(x, y, self, s_skeleton_attack_three_damage, 10, 4, 8, image_xscale);
		audio_play_sound(a_swipe, 3, false);
		audio_play_sound(a_medium_hit, 3, false);
	}
	
	if input.roll and animation_hit_frame_range(1, 2)
		{
			state = "Roll";
			store_state = "Attack Three";
			i = 0;
		}
		
			if animation_end()
		{
			state = "Move";	
			store_state = "Move";
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
	set_state_sprite(s_skeleton_attack_alt, 1.5, 0 + store_adv);
	if input.left && i == 0 {image_xscale = -1; i++;}
	if input.right && i == 0 {image_xscale = 1; i++;}
	if animation_hit_frame_range(1,7) && input.roll
	{
		state = "Roll";
		store_state = "Alt Attack";
		store_adv = 3;
		i = 0;
	}
	if animation_hit_frame(6)
	{
		create_hitbox(x, y, self, s_alt_attack_damage, 4, 1, 2, image_xscale);
		audio_play_sound(a_swipe, 3, false);
	}
	if animation_hit_frame(7)
	{
		create_hitbox(x, y, self, s_alt_attack_damage1, 4, 1, 2, image_xscale);
		audio_play_sound(a_swipe, 3, false);
	}
	
	if animation_hit_frame(8)
	{
		create_hitbox(x, y, self, s_alt_attack_damage2, 4, 1, 2, image_xscale);
		audio_play_sound(a_swipe, 3, false);
	}
	
	if animation_hit_frame(9)
	{
		create_hitbox(x, y, self, s_alt_attack_damage3, 4, 1, 2, image_xscale);
		audio_play_sound(a_swipe, 3, false);
	}
	
	if animation_hit_frame(10)
	{
		create_hitbox(x, y, self, s_alt_attack_damage4, 4, 1, 2, image_xscale);
		audio_play_sound(a_swipe, 3, false);
	}
	
	if animation_hit_frame(11)
	{
		create_hitbox(x, y, self, s_alt_attack_damage5, 16, 3, 10, image_xscale);
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
	set_state_sprite(s_skeleton_attack_alt_two, 1.2, 0);
	if animation_hit_frame(5)
	{
		create_hitbox(x, y, self, s_skeleton_attack_alt_two_damage, 4, 2, 8, image_xscale);
		audio_play_sound(a_medium_hit, 3, false);
	}
	
	if input.roll and animation_hit_frame_range(0, 2)
		{
			state = "Roll";
		}
		
		if input.attack_alt and animation_hit_frame_range(6, 8)
		{
			state = "Alt Two";
		}
		
		if input.attack and animation_hit_frame_range(6, 8)
		{
			state = "Alt 1";
		}
		
		if animation_end()
		{
			state = "Move";	
		}
	
	#endregion
		break;
		
	case "Alt 1":
	#region 2 1
	set_state_sprite(s_skeleton_attack_two, 0.55, 0);
	
	if animation_hit_frame(1)
	{
		create_hitbox(x, y, self, s_skeleton_attack_two_damage, 5, 4, 4, image_xscale);
		audio_play_sound(a_swipe, 3, false);
	}
	
	if input.roll and animation_hit_frame_range(3, 4)
		{
			state = "Roll";
			store_state = "Alt Normal Alt";
		}
		
	if input.attack_alt and animation_hit_frame_range(3, 4)
		{	
			state = "Alt Normal Alt";
		}
		
	if animation_end()
		{
			state = "Move";	
			store_state = "Move";
		}
		#endregion
		break;
		
	case "Alt Two":
	#region 2 2
		set_state_sprite(s_skeleton_attack_alt_two2, 1.5, 0);
	if animation_hit_frame(4)
	{
		create_hitbox(x, y, self, s_skeleton_attack_alt_two2_damage, 6, 2, 10, image_xscale);
		audio_play_sound(a_medium_hit, 3, false);
	}
	
	if input.roll and animation_hit_frame_range(1, 2)
		{
			state = "Roll";
		}
		
		if input.attack_alt and animation_hit_frame_range(5, 9)
		{
			state = "Alt Three";
		}
		
		if input.attack and animation_hit_frame_range(5, 9)
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
	set_state_sprite(s_skeleton_attack_alt_two3, 0.75, 0);
	
	if animation_hit_frame_range(0,2) && input.roll
	{
		state = "Roll";
		store_state = "Alt Three";
		store_adv = 3;
		i = 0;
	}

	if animation_hit_frame(9)
	{
		create_hitbox(x, y, self, s_skeleton_attack_alt_two3_damage, 15, 3, 12, image_xscale);
		audio_play_sound(a_big_hit, 3, false);
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
		if input.left && i == 0 {image_xscale = -1; i++;}
		if input.right && i == 0 {image_xscale = 1; i++;}
		if animation_hit_frame(1)
		{
			create_hitbox(x, y, self, s_skeleton_attack_2_2_1_damage1, 1, 2, 3, image_xscale);
			audio_play_sound(a_swipe, 3, false);
		}
		if animation_hit_frame(2)
		{
			create_hitbox(x, y, self, s_skeleton_attack_2_2_1_damage2, -2, 2, 3, image_xscale);
			audio_play_sound(a_swipe, 3, false);
		}
		if animation_hit_frame(3)
		{
			create_hitbox(x, y, self, s_skeleton_attack_2_2_1_damage3, -1, 2, 3, image_xscale);
			audio_play_sound(a_swipe, 3, false);
		}
		if animation_hit_frame(4)
		{
			create_hitbox(x, y, self, s_skeleton_attack_2_2_1_damage4, 2, 2, 3, image_xscale);
			audio_play_sound(a_swipe, 3, false);
		}
		if animation_hit_frame(5)
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
		
	case "Alt Normal Alt":
	#region 2 1 2
	set_state_sprite(s_skeleton_attack_2_1_2, 1, 0);
	if input.left && i == 0 {image_xscale = -1; i++;}
	if input.right && i == 0 {image_xscale = 1; i++;}
	if animation_hit_frame(5)
	{
		create_hitbox(x, y, self, s_skeleton_attack_2_1_2_damage, 15, 4, 12, image_xscale);
		audio_play_sound(a_medium_hit, 3, false);
		audio_play_sound(a_medium_hit, 3, false);
	}
	
	if input.roll and animation_hit_frame_range(1, 2)
		{
			state = "Roll";
			store_state = "Alt Normal Alt";
			i = 0;
		}
		
			if animation_end()
		{
			state = "Move";	
			store_state = "Move";
		}
	#endregion
		break;
		
	case "Idle2":
	#region Idle2
		set_state_sprite(s_skeleton_idle_2, 0.33, 0);
		
	if input.right or input.left
		{
			state= "Move";
			idle_time = 0;
		}
		if input.attack
		{
			state = "Attack One";
			idle_time = 0;
		}
	if input.attack_alt
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
	if input.roll 
		{
			state = "Roll";
			idle_time = 0;
		}
	#endregion
		break;		
	}
	if hp >= max_hp
			{
				hp = max_hp;
			}
//show_debug_message(store_state);
show_debug_message(alarm[0]);