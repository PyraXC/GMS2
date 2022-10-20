function dodge(){
	move_and_collide(0, vsp);		
	if (vsp < 15) vsp += grav;
	if (vsp > 15) vsp = 15;

	if (place_meeting(x,y+1, o_wall)) and jump_input == 0
		{
			vsp =  1 * -jump_speed 
			jump_input = 1;
		}
	//Verticle Collision
	if(place_meeting(x, y+vsp, o_wall)) and vsp > 0 && lag_count == 0
		{
			if state = "Dodge"
			{
				jump_input = 0;
				state = "Battle";
				//audio_play_sound(a_landing, 1, 0);
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