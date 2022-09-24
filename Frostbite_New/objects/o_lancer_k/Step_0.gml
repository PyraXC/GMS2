switch(state)
{
	case "Move":
	#region
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
	if input.right and not input.left
		{
			dash_count++;
			move_and_collide(run_speed, 0);
			run_speed = approach(run_speed, max_run_speed, 0.25);
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
			dash_count++;
			move_and_collide(-run_speed, 0);
			run_speed = approach(run_speed, max_run_speed, 0.25);
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
			set_state_sprite(s_idle_lancer, 0, 0);
			if input.jump
				{
					state = "Jump";
				}
			run_speed = i_run_speed;
			hsp = 0;
			dash_count = 0;
		}
	
	if input.left and input.right
		{
			set_state_sprite(s_idle_lancer, 0, 0);
			if input.jump
				{
					state = "Jump";
				}
			run_speed = i_run_speed;
			hsp = 0;
			dash_count = 0;
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
	if dash_count >= 80
		{
			state = "Charge";
		}
		
	if !place_meeting(x, y+1, o_wall)
		{
			state = "Jump";
		}
	if input.buddy && o_frostbite.input.buddy && point_distance(x, y, o_frostbite.x, o_frostbite.y) <= 64
		{
			state = "Buddy";
		}
	
	#endregion
		break;
		
	case "Jump":
	#region
	air_movement();
	set_state_sprite(s_jump_lancer, 1, 0);
	#endregion
		break;
		
	case "Charge":
	#region
	set_state_sprite(s_lance_charge, 1, 0);
	move_and_collide(run_speed * image_xscale, 0);
	create_hitbox(x+10, y, self, s_lance_charge, 1, 1, 1, 1, image_xscale);
	if input.attack state = "Jump";
	if !place_meeting(x, y+1, o_wall)
		{
			state = "Jump";
		}
	if place_meeting(x+1, y, o_wall)
		{
			state = "Wall Bounce";
		}
	#endregion
		break;
	
	case "Wall Bounce":
	#region
	set_state_sprite(s_lance_wall, 1, 0);
	if animation_end()
	{
		if !place_meeting(x, y+1, o_wall)
			{
				state = "Jump";
			}
		else
			{
				state = "Move";
			}
	}
	#endregion
		break;
		
	case "Buddy": 
	#region Buddy Attack
	x = o_frostbite.x;
	y = o_frostbite.y;
		if input.jump
		{
			state = "Jump";
		}
	
	#endregion
		break;
	
	//case "Jump":
	//#region
	
	//#endregion
	//break;
	//case "Jump":
	//#region
	
	//#endregion
	//break;
}
//show_debug_message(dash_count);