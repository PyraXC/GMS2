// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function in_air(){
	move_and_collide(hsp, vsp);		
	if (vsp < 15) vsp += grav;
	if (vsp > 15) vsp = 15;


	//Verticle Collision
	if(place_meeting(x, y+vsp, o_wall)) and vsp > 0 && lag_count == 0
		{
			if state = "Dodge"
			{
				jump_input = 1;
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