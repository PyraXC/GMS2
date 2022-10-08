switch (state)
{
	case "Move":
	#region Move State
	#region Stuff
		jump_speed = i_jump_speed;
		air_speed = 0;
		lag_count = 0;
		wall_jump_count = 0;
		idle_time = 0;
		i = 0;
		grav = i_grav;
	#endregion
	if input.run
	{
		run_speed = max_run_speed;
	}
	else
	{ 
		run_speed = i_run_speed;
	}
	
	if input.right and not input.left
		{
			move_and_collide(run_speed, 0);
			//run_speed = run_speed
			image_xscale = 1;
			if !input.run{set_state_sprite(s_move, 0 + run_speed/10, 0);}
			else{set_state_sprite(s_run, 0 + run_speed/10, 0);}
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
	//if animation_hit_frame(1){audio_play_sound(footstep_reverb, 1, 0);}
		}
	if input.left and not input.right
		{
			move_and_collide(-run_speed, 0);
			//run_speed = approach(run_speed, max_run_speed, 0.2);
			image_xscale = -1;
			if !input.run{set_state_sprite(s_move, 0 + run_speed/10, 0);}
			else{set_state_sprite(s_run, 0 + run_speed/10, 0);}
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
		//	if animation_hit_frame(1){audio_play_sound(footstep_reverb, 1, 0);}
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
		
	if !place_meeting(x, y+1, o_wall)
		{
			state = "Jump";
		}
	
	if animation_end()
		{
			state = "Move";
		}
	break;
#endregion

	case "Jump":
	#region Jump
	#region stuff
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
		air_movement();
			#endregion
			break;
			#endregion
	
	case "Battle":
	#region Battle Start
	if(o_gameState.state == "P1"){
	}
	else if(o_gameState.state == "Enemy"){
		if(input.defend){
			state = "Defend";
		}
		else if(input.attack){
			state = "Reflect";
		}
		else if(input.jump){
			state = "Dodge";
		}
	}
		#endregion
		break;
		
	case "Defend":
	#region Defend In Enemy Turn
	set_state_sprite(s_defend, 1, 0);
	if(animation_end){
		state = "Battle";
	}
	#endregion
		break;
		
	case "Reflect":
	#region Attack In Enemy Turn
	set_state_sprite(s_attack, 1, 0);
	if(animation_end){
		state = "Battle";
	}
	#endregion
		break;
		
	case "Dodge":
	#region Evade/Jump In Enemy Turn
	set_state_sprite(s_jump, 1, 0);
	if(animation_end){
		state = "Battle";
	}
	#endregion
		break;

	case "Knockback":
	#region
	 knockback_state(s_knockback, "Jump");
	#endregion
		break;

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
	if input.jump
		{
			state = "Jump";
			idle_time = 0;
		}
	if animation_end()
	{
		state = "Move";
		idle_time = 0;
	}
	#endregion
		break;	
}
if hp >= max_hp
	{
		hp = max_hp;
	}

if hp < current_hp
	{
		current_hp = hp;
		zero_degree_meter += 1/10;
	}
if hp > current_hp
	{
		current_hp = hp;
	}
//show_debug_message(image_xscale);
//show_debug_message(alarm[9]);
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
//show_debug_message(zero_degree_meter);
//show_debug_message(hp);

