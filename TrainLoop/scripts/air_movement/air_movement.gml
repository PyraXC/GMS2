function air_movement(){
	if state == "Aerial Lag" //Landing lag
		{
			exit;
		}
		#region Second Player Stat Resets And Such
		dash_count = 0;
		
		#endregion
		if input.left && alarm[9] == -1{hsp = -max_hsp;}
		if input.right && alarm[9] == -1{hsp = max_hsp;}
		if !input.left && !input.right && alarm[9] == -1{hsp = 0;}
			move_and_collide(hsp, vsp);
		
		
	if (vsp < 15) vsp += grav;
	if (vsp > 15) vsp = 15;
	if(wall_jump_count > 8) wall_jump_count = 8;

	if (place_meeting(x,y+1, o_wall)) and jump_input == 1
		{
			vsp =  1 * -jump_speed 
			jump_input = 0;
		}
	//Horizontal Collision 
	if(place_meeting(x+hsp, y, o_wall))
		{
			while(!place_meeting(x+sign(hsp), y, o_wall))
			{
				x += sign(hsp); 
			}
	
			if state = "Jump" and input.jump and wall_jump_count < 1 and input.left
			{
				vsp = -9.8-(jump_speed/(i_jump_speed-2)) + wall_jump_count/1.5;
				image_xscale = 1;
				wall_jump_count++;
				state = "Walljump";
			}
			if state = "Jump" and input.jump and wall_jump_count < 1 and input.right
			{
				vsp = -9.8-(jump_speed/(i_jump_speed-2)) + wall_jump_count/1.5;
				image_xscale = -1;
				wall_jump_count++;
				state = "Walljump";
			}
			else if alarm[9] == -1
				{
					hsp = 0;	
				}
		}
	
	//Verticle Collision
	if(place_meeting(x, y+vsp, o_wall)) and vsp > 0 and lag_count == 0
		{
			if state = "Jump"
			{
				run_speed = i_run_speed;
				state = "Move";
				//audio_play_sound(a_landing, 1, 0);
			}
			else
			{
				lag_count ++;
				alarm[0] = (sprite_get_number(sprite_index )- image_index) * 3;
				state = "Aerial Lag";
			}
		}
	
	if(place_meeting(x, y+vsp, o_wall))
		{
			while(!place_meeting(x, y+sign(vsp), o_wall))
			{
				y += sign(vsp); 
			}
			vsp = 0; 
		}
		grav = i_grav;
}