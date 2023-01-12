// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function in_air(){
	move_and_collide(hsp, vsp);		
	if (vsp < 15) vsp += global.grav;
	if (vsp > 15) vsp = 15;

	if(place_meeting(x, y+vsp, o_wall))
		{
			while(!place_meeting(x, y+sign(vsp), o_wall))
			{
				y += sign(vsp); 
			}
			vsp = 0; 
		}
global.grav = global.i_grav;
}