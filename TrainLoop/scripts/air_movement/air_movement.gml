// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function air_movement(){
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
		

	if (vsp < 15) vsp += grav;
	if (vsp > 15) vsp = 15;
	if(wall_jump_count > 1) wall_jump_count = 1;

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
	
			if state = "Jump" and input.jump and wall_jump_count < 1
			
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
	if(place_meeting(x, y+vsp, o_wall)) and vsp > 0 
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
			show_debug_message("Bonk");
		}
		grav = i_grav;
}
