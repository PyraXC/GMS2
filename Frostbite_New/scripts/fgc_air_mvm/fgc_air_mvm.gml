function fgc_air_mvm(){
if global.pause == 1
	{
		exit;
	}
	if state == "Aerial Lag" //Landing lag
		{
			exit;
		}
		#region Second Player Stat Resets And Such
			dash_count = 0;
		
		#endregion
		var dir = noone;
		if(hsp > 0 && dir == noone) {dir = "r";}
		else {dir = "l";}
		if dir == "r" {
			if input.left{hsp -= 0.125;}
		}
		if dir == "l" { 
			if input.right{hsp += 0.125;}
			}
			move_and_collide(hsp, vsp);
		
			if keyboard_check_pressed(ord("S")) and vsp >= -0.5 and fast_fall_count == 0
			{
				vsp += 8;
				fast_fall_count++;
			}
		
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
	
			if state = "Jump" and input.jump and wall_jump_count < 8
			{
				vsp = -9.8-(jump_speed/(i_jump_speed-2)) + wall_jump_count/1.5;
				hsp = -sign(hsp) * 7;
				wall_jump_count++;
				image_xscale = sign(hsp);
			}
			else
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
				audio_play_sound(a_landing, 1, 0);
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