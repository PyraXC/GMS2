if state == "Move" or state == "Jump" or state == "Up B" or state == "U Special" or state == "Free Fall" or state == "Alpha Form" or state == "Shield"
{
	pause_button();
}
switch (state)
{
	case "Move":
	#region Move State
	if global.pause == 1
		{
			exit;
		}
		jump_speed = i_jump_speed;
		air_speed = 0;
		fast_fall_count = 0;
		lag_count = 0;
		wall_jump_count = 0;
		idle_time = 0;
		i = 0;
		grav = i_grav;
		launch = 0;
		up_b_count = 0;
		if alpha_meter == 1
		{
			state = "Alpha Form";
		}
	if input.right and not input.left
		{
			move_and_collide(run_speed, 0);
			run_speed = approach(run_speed, max_run_speed, 0.2);
			image_xscale = 1;
			set_state_sprite(s_move, 0.6, 0);
			idle_time = 0;
			hsp = run_speed;
			if(place_meeting(x+run_speed, y, o_wall))
	{
		while(!place_meeting(x+sign(run_speed), y, o_wall))
		{
			x += sign(run_speed); 
		}
		run_speed = i_run_speed;
	}
		}
	if input.left and not input.right
		{
			move_and_collide(-run_speed, 0);
			run_speed = approach(run_speed, max_run_speed, 0.2);
			image_xscale = -1;
			set_state_sprite(s_move, 0.6, 0);
			idle_time = 0;
			hsp = -run_speed;
		if(place_meeting(x-run_speed, y, o_wall))
			{
			while(!place_meeting(x-sign(run_speed), y, o_wall))
				{
					x -= sign(run_speed); 
				}
			run_speed = i_run_speed;
			}
		}
	if not input.left and not input.right
		{
			if input.jump
				{
					state = "Jump";
				}
			idle_time++;
			run_speed = i_run_speed;
			set_state_sprite(s_idle, 0.25, 0);
			hsp = 0;
			if idle_time >= 120
				{
					state = "Idle2";
					run_speed = 0;
				}
		}
	
	if input.left and input.right
		{
			idle_time++;
			run_speed = i_run_speed;
			set_state_sprite(s_idle, 0.25, 0);
			if idle_time >= 120
				{
					state = "Idle2";
				}
		}
	
	if input.jump and not (input.left && input.right)
		{
		if run_speed == max_run_speed
			{
				jump_speed += 2;
			}
			jump_input = 1;
			state = "Jump";
		}
	
	if input.attack and not input.left and not input.right and not input.down and not input.up
		{
			state = "N Attack";
		}
		
	if input.attack and input.left and not input.right and not input.up and not input.down
		{
			state = "F Attack";
		}
		
	if input.attack and input.right and not input.left and not input.up and not input.down
		{
			state = "F Attack";
		}
		
	if input.attack and input.up and not input.down 
		{
			state = "U Attack";
		}
		
	if input.attack and input.down and not input.up
		{
			state = "D Attack";
		}
		
	if input.attack_alt and input.up and not input.down
		{
			state = "U Special";
		}
		
	if input.attack_alt and input.down and not input.up
		{
			state = "D Special";
		}
		
	if input.attack_alt and input.left and not input.down and not input.right and not input.up
		{
			state = "F Special";
		}
		
	if input.attack_alt and input.right and not input.down and not input.up and not input.left
		{
			state = "F Special";
		}
		
	if input.attack_alt and not input.up and not input.down and not input.right and not input.left
		{
			state = "N Special";
		}
		
	if input.shield and not input.up and not input.down and not input.right and not input.left
		{
			state = "Shield";
		}
		
		if !place_meeting(x, y+1, o_wall)
		{
			state = "Jump";
		}

	if animation_end()
		{
			state = "Move";
		}
	
	if input.buddy && o_player_2.input.buddy && point_distance(x, y, o_player_2.x, o_player_2.y) <= 64
	{
		state = "Buddy";
	}
	
	if keyboard_check_pressed(ord("R"))
	{
		state = "Alpha Form";
		alarm[1] = 1800;
	}
		
	#endregion	
		break;
#region Ground Attacks	
	case "N Attack":
	#region Jab One
	set_state_sprite(s_n_attack, 0.25, 0);
		
		if animation_end()
		{
			state = "Move";	
		}
		
	#endregion
		break;
		
	case "F Attack":
	#region F Tilt
	set_state_sprite(s_f_attack, 1, 0);
	
		if animation_hit_frame(3)
		{
			create_hitbox(x, y, self, s_f_attack_damage, 10, 2, 1, 30, image_xscale);
		}
		
		if animation_end()
		{
			state = "Move";	
		}
		
	#endregion
		break;
		
	case "D Attack":
	#region D Tilt
	set_state_sprite(s_d_attack, 0.25, 0);
	
		if animation_end()
		{
			state = "Move";	
		}
		
	#endregion
		break;
		
	case "U Attack":
	#region U Tilt
	set_state_sprite(s_u_attack, 0.25, 0);
	
		if animation_end()
		{
			state = "Move";	
		}
		
	#endregion
		break;
		#endregion
	case "Jump":
	#region Jump
	set_state_sprite(s_jump, 1, 0);
	if i == 0
	{
		grav = 0;
		i++;
	}
	else
	{
		grav = i_grav;
	}
	launch_speed_x = 0;
	launch_speed_y = 0;
	launch_coordinates = 0;
		air_movement();
		if global.pause == 1
			{
				exit;
			}
			#region attack inputs
	if input.attack and input.right and image_xscale == 1 and not input.left and not input.up and not input.down
		{
			state = "F Air Attack";	
		}
		
	if input.attack and input.right and image_xscale == -1 and not input.left and not input.up and not input.down
		{
			state = "B Air Attack";	
		}
	
	if input.attack and input.left and image_xscale == -1 and not input.right and not input.up and not input.down
		{
			state = "F Air Attack";	
		}
		
	if input.attack and input.left and image_xscale == 1 and not input.right and not input.up and not input.down
		{
			state = "B Air Attack";	
		}
		
	if input.attack and input.down and not input.up
		{
			state = "D Air Attack";	
		}
		
	if input.attack and input.up and not input.down
		{
			state = "U Air Attack";	
		}
		
	if input.attack and move = 0 and not input.up and not input.down
		{
			state = "N Air Attack";
		}
		
	if input.attack_alt and input.up and not input.down && up_b_count == 0
		{
			state = "U Special";
		}
		
	if input.attack_alt and input.down and not input.up
		{
			state = "D Special";
		}
		#endregion
	if input.attack_alt and input.left and not input.down and not input.right and not input.up
		{
	tether_point = instance_nearest(x, y, o_tether_point)
	{
		if point_distance(x, y, tether_point.x, tether_point.y) <= tether_range
			{
				state = "Tether";
			}
		else
			{
				state = "F Special Air";
			}
		}
	}
	if input.attack_alt and input.right and not input.down and not input.up and not input.left
		{
		tether_point = instance_nearest(x, y, o_tether_point)
		if point_distance(x, y, tether_point.x, tether_point.y) <= 256
			{
				state = "Tether";
			}
			else
				{
				state = "F Special Air";
				}
		}
		
	if input.attack_alt and not input.up and not input.down and not input.right and not input.left
		{
			state = "N Special";
		}
		
		#endregion
		break;
#region Air Attacks
	case "F Air Attack":
	#region Fair
	set_state_sprite(s_f_air_attack, 1, 0);
	air_movement();
	
	if animation_hit_frame(1)
		{
			create_hitbox(x, y, self, s_f_air_attack_damage, 5, 2, 4, 20, image_xscale);
		}
	
	if animation_end()
		{	
			landing_air_attack();
		}
	
	#endregion
		break;
		
	case "B Air Attack":
	#region Bair
	set_state_sprite(s_b_air_attack, 0.5, 0);
		air_movement();
	
	if animation_hit_frame(1)
		{
			create_hitbox(x, y, self, s_n_air_attack_damage, 5, 2, 4, 4, image_xscale);
		}
	
	if animation_end()
		{	
			landing_air_attack();
		}
	
	#endregion
		break;
		
	case "N Air Attack":
	#region Nair
	set_state_sprite(s_n_air_attack, 0.5, 0);
		air_movement();
	
	if animation_hit_frame(1)
		{
			create_hitbox(x, y, self, s_n_air_attack_damage, 5, 2, 4, 4, image_xscale);
		}
	
	if animation_end()
		{	
			landing_air_attack();
		}
	
	#endregion
		break;
		
	case "D Air Attack":
	#region Dair
	set_state_sprite(s_d_air_attack, 0.8, 0);
		air_movement();
	
	if animation_hit_frame(1)
		{
			create_hitbox(x, y, self, s_d_air_attack_damage, 5, 2, 4, 4, image_xscale);
		}
	
	if animation_end()
		{	
			landing_air_attack();	
		}
	
	#endregion
		break;
		
	case "U Air Attack":
	#region Uair
	set_state_sprite(s_u_air_attack, 0.5, 0);
		air_movement();
	
	if animation_hit_frame(1)
		{
			create_hitbox(x, y, self, s_u_air_attack_damage, 5, 2, 4, 4, image_xscale);
		}
	
	if animation_end()
		{	
			landing_air_attack();	
		}
	
	#endregion
		break;
#endregion
	case "Free Fall":
	#region Free Fall	
	set_state_sprite(s_free_fall, 1, 0);
	free_fall();
		#endregion
		break;
#region Specials
	case "U Special":
	#region Up B
	set_state_sprite(s_u_special_st, 1, 0);
		up_b_movement_st();
		
		vsp = -5;
		
		if animation_end()
		{
			state = "Up B";	
		}
		
	#endregion
		break;
			
	case "Up B":
	#region Up B
	set_state_sprite(s_u_special, 1, 0);
		up_b_movement();
		
		vsp = -15;
		
		if animation_end()
		{
			up_b_count++;
			landing_air_attack();
		}
		
	#endregion
		break;
		
	case "D Special":
	#region Up D
	set_state_sprite(s_d_special, 0.25, 0);
		air_movement();
		
		if animation_end()
		{
			state = "Move";	
		}
		
	#endregion
		break;
		
	case "F Special":
	#region F Special
	set_state_sprite(s_f_special, 0.25, 0);
		air_movement();
		
		if animation_end()
		{
			state = "Move";	
		}
		
	#endregion
		break;
		
	case "F Special Air":
	#region F Special Air
	set_state_sprite(s_whip, 1, 0);
		air_movement();
	
	#endregion
		break;
		
	case "Tether":
	#region Tether
		set_state_sprite(s_whip, 1, 0);
		tether_movement();
	#endregion
		break;
		
	case "Tether Launch":
	#region Tether
		set_state_sprite(s_whip_launch, 1, 0);
		move_and_collide(hsp, vsp); 
		if animation_end(){ state = "Jump";}
		launch_coordinates = 0;
	#endregion
		break;
		
	case "N Special":
	#region Up f
	set_state_sprite(s_n_special, 0.25, 0);
		air_movement();
		
		if animation_end()
		{
			landing_air_attack();
		}
		
	#endregion
		break;		
#endregion
	case "Shield":
	#region Shield
	set_state_sprite(s_shield, 1, 0);
		if keyboard_check_released(ord("I"))
		{
			state = "Move";	
		}
	#endregion
		break;	
		
	case "Aerial Lag":
	#region Landing Lag
	if alarm[0] <= 0
		{
			state = "Move";
		}
	set_state_sprite(s_landing_lag, 1, 0);
	hsp -= sign(hsp) * 0.5;
	move_and_collide(hsp, vsp);
	if !place_meeting(x, y+1, o_wall)
	{ state = "Jump";}
	#endregion
		break;
		
	case "Alpha Form":
	#region Alpha Form
	set_state_sprite(s_move_alpha, 1, 0);
	alpha_movement();
	pause_button();
	if alarm[1] = 0
	{
		landing_air_attack();
	}
	#endregion
		break;
		
	case "Buddy": 
	#region Buddy attack
	if instance_exists(o_lancer_k)
	{state = "Move";}
	
	#endregion
	break;
	
	case "Knockback":
	#region
	 knockback_state(s_knockback, "Jump");
	#endregion
		break;
	
	//case "Attack Three":
	//#region Attack Three State
	//set_state_sprite(s_skeleton_attack_three, 0.65, 0);
	
	//if animation_hit_frame(2)
	//{
	//	create_hitbox(x, y, self, s_skeleton_attack_three_damage, 10, 4, 8, image_xscale);
	//	audio_play_sound(a_swipe, 3, false);
	//	audio_play_sound(a_medium_hit, 3, false);
	//}
	
	//if input.roll and animation_hit_frame_range(1, 2)
	//	{
	//		state = "Roll";
	//	}
		
	//		if animation_end()
	//	{
	//		state = "Move";	
	//	}
	//#endregion
	//	break;
	
	//case "Knockback":
	//#region Knockback State
	//	idle_time = 0;
	//	knockback_state(s_skeleton_hitstun, "Move");
	//	#endregion
	//	break;
		
	//case "Alt Attack":
	//#region Attack Alt State
	//set_state_sprite(s_skeleton_attack_alt, 1, 0);
	
	//if animation_hit_frame(9)
	//{
	//	create_hitbox(x, y, self, s_alt_attack_damage, 4, 1, 1, image_xscale);
	//	audio_play_sound(a_swipe, 3, false);
	//}
	//if animation_hit_frame(10)
	//{
	//	create_hitbox(x, y, self, s_alt_attack_damage1, 4, 1, 1, image_xscale);
	//	audio_play_sound(a_swipe, 3, false);
	//}
	
	//if animation_hit_frame(11)
	//{
	//	create_hitbox(x, y, self, s_alt_attack_damage2, 4, 1, 1, image_xscale);
	//	audio_play_sound(a_swipe, 3, false);
	//}
	
	//if animation_hit_frame(12)
	//{
	//	create_hitbox(x, y, self, s_alt_attack_damage3, 4, 1, 1, image_xscale);
	//	audio_play_sound(a_swipe, 3, false);
	//}
	
	//if animation_hit_frame(13)
	//{
	//	create_hitbox(x, y, self, s_alt_attack_damage4, 4, 1, 1, image_xscale);
	//	audio_play_sound(a_swipe, 3, false);
	//}
	
	//if animation_hit_frame(14)
	//{
	//	create_hitbox(x, y, self, s_alt_attack_damage5, 12, 3, 10, image_xscale);
	//	audio_play_sound(a_medium_hit, 3, false);
	//}
	
	//		if animation_end()
	//	{
	//		state = "Move";	
	//	}
	//#endregion
	//	break;
	
	//case "Alt One":
	//#region 2
	//set_state_sprite(s_skeleton_attack_alt_two, 1.5, 0);
	//if animation_hit_frame(0)
	//{
	//	create_hitbox(x, y, self, s_skeleton_attack_alt_two_damage, 2, 2, 2, image_xscale);
	//	audio_play_sound(a_swipe, 3, false);
	//}
	
	//if input.roll and animation_hit_frame_range(1, 2)
	//	{
	//		state = "Roll";
	//	}
		
	//	if input.attack_alt and animation_hit_frame_range(1, 2)
	//	{
	//		state = "Alt Two";
	//	}
		
	//	if animation_end()
	//	{
	//		state = "Move";	
	//	}
	
	//#endregion
	//	break;
		
	//	case "Alt Two":
	//#region 2 2
	//	set_state_sprite(s_skeleton_attack_alt_two2, 1.5, 0);
	//if animation_hit_frame(0)
	//{
	//	create_hitbox(x, y, self, s_skeleton_attack_alt_two2_damage, 2, 2, 3, image_xscale);
	//	audio_play_sound(a_swipe, 3, false);
	//}
	
	//if input.roll and animation_hit_frame_range(1, 2)
	//	{
	//		state = "Roll";
	//	}
		
	//	if input.attack_alt and animation_hit_frame_range(0, 2)
	//	{
	//		state = "Alt Three";
	//	}
		
	//	if input.attack and animation_hit_frame_range(0, 2)
	//	{
	//		state = "Alt Normal";
	//	}
		
	//	if animation_end()
	//	{
	//		state = "Move";	
	//	}
	
	
	//#endregion
	//	break;
		
	//	case "Alt Three":
	//#region 2 2 2
	//set_state_sprite(s_skeleton_attack_alt_two3, 0.85, 0);
	//if animation_hit_frame(0)
	//{
	//	create_hitbox(x, y, self, s_skeleton_attack_alt_two3_damage, 2, 1, 1, image_xscale);
	//	audio_play_sound(a_swipe, 3, false);
	//}
	//if animation_hit_frame(1)
	//{
	//	create_hitbox(x, y, self, s_skeleton_attack_alt_two3_damage1, 2, 1, 1, image_xscale);
	//	audio_play_sound(a_swipe, 3, false);
	//}
	//if animation_hit_frame(2)
	//{
	//	create_hitbox(x, y, self, s_skeleton_attack_alt_two3_damage2, 2, 1, 1, image_xscale);
	//	audio_play_sound(a_swipe, 3, false);
	//}
	//if animation_hit_frame(3)
	//{
	//	create_hitbox(x, y, self, s_skeleton_attack_alt_two3_damage3, 2, 1, 1, image_xscale);
	//	audio_play_sound(a_swipe, 3, false);
	//}
	//if animation_hit_frame(4)
	//{
	//	create_hitbox(x, y, self, s_skeleton_attack_alt_two3_damage4, 2, 1, 1, image_xscale);
	//	audio_play_sound(a_swipe, 3, false);
	//}
	//if animation_hit_frame(5)
	//{
	//	create_hitbox(x, y, self, s_skeleton_attack_alt_two3_damage5, 2, 1, 1, image_xscale);
	//	audio_play_sound(a_swipe, 3, false);
	//}
	//if animation_hit_frame(8)
	//{
	//	create_hitbox(x, y, self, s_skeleton_attack_alt_two3_damage6, 14, 4, 9, image_xscale);
	//	audio_play_sound(a_swipe, 3, false);
	//	audio_play_sound(a_medium_hit, 3, false);
	//}
	//	if animation_end()
	//	{
	//		state = "Move";	
	//	}
	
	//#endregion
	//	break;
		
	//	case "Alt Normal":
	//	#region 2 2 1
	//	set_state_sprite(s_skeleton_attack_2_2_1, 1.2, 0);
	//	if animation_hit_frame(1)
	//	{
	//		create_hitbox(x, y, self, s_skeleton_attack_2_2_1_damage1, 1, 2, 3, image_xscale);
	//		audio_play_sound(a_swipe, 3, false);
	//	}
	//	if animation_hit_frame(3)
	//	{
	//		create_hitbox(x, y, self, s_skeleton_attack_2_2_1_damage2, -2, 2, 3, image_xscale);
	//		audio_play_sound(a_swipe, 3, false);
	//	}
	//	if animation_hit_frame(5)
	//	{
	//		create_hitbox(x, y, self, s_skeleton_attack_2_2_1_damage3, -1, 2, 3, image_xscale);
	//		audio_play_sound(a_swipe, 3, false);
	//	}
	//	if animation_hit_frame(7)
	//	{
	//		create_hitbox(x, y, self, s_skeleton_attack_2_2_1_damage4, 2, 2, 3, image_xscale);
		//	audio_play_sound(a_swipe, 3, false);
		//}
		//if animation_hit_frame(10)
		//{
		//	create_hitbox(x, y, self, s_skeleton_attack_2_2_1_damage5, 12, 2, 8, image_xscale);
		//	audio_play_sound(a_swipe, 3, false);
		//	audio_play_sound(a_medium_hit, 3, false);
		//}
		//if animation_end()
		//	{
		//		state = "Move"	
		//	}
		//#endregion
	//	break;
		case "Idle2":
		#region Idle2
		set_state_sprite(s_idle2, 0.33, 0);
		
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
	}
	if input.jump
		{
			state = "Jump";
			idle_time = 0;
		}
	#endregion
		break;		
		if hp >= max_hp
			{
				hp = max_hp;
			}
	}
if hp < current_hp
	{
		current_hp = hp;
		alpha_meter += 1/10;
	}
if hp > current_hp
	{
		current_hp = hp;
	}
	
//show_debug_message(alarm[0]);
//show_debug_message(state);
//show_debug_message(vsp);
//show_debug_message(hsp);
//show_debug_message(y);
//show_debug_message(o_game.a_attack);
//show_debug_message(global.pause);
//show_debug_message(global.game_fps);
//show_debug_message(run_speed);
//show_debug_message(jump_speed);
//show_debug_message(i_jump_speed);
//show_debug_message(wall_jump_count);
//show_debug_message(launch);
//show_debug_message(sign(x - o_tether_point.x));
//show_debug_message(launch_speed_x);
//show_debug_message(launch_speed_y);
//show_debug_message(tether_range);
show_debug_message(alpha_meter);
show_debug_message(hp);