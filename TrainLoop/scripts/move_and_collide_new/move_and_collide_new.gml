// Script assets have changed for v2.3.0 see
function move_and_collide_new(argument0, argument1) {
	///@arg xspeed
	///@arg yspeed

	var xspeed = argument0;
	var yspeed = argument1;

	if not place_meeting(x+xspeed, y, o_wall)
	{
		x += xspeed;
	}
	else if(place_meeting(x+xspeed, y, o_wall)){
		while(!place_meeting(x+sign(xspeed), y, o_wall))
		{
			x += sign(xspeed);	 
		}
	}

	if not place_meeting(x, y+yspeed, o_wall)
	{
		y += yspeed;
	}
	else if(place_meeting(x, y+yspeed, o_wall)){
		while(!place_meeting(x, y+sign(yspeed), o_wall))
		{
			y += sign(yspeed);	 
		}
	}
	
}
