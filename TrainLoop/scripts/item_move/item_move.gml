// Script assets have changed for v2.3.0 see
function item_move(argument0, argument1) {
	///arg0 xspeed
	///arg1 yspeed
	if not place_meeting(x+argument0, y, o_wall)
	{
		x += xspeed;
	}

	if not place_meeting(x, y+argument1, o_wall)
	{
		y += yspeed;
	}
	if(place_meeting(x, y+1, o_wall)){
		state = "Collect";
	}
	xspeed += (0.2 * -sign(xspeed));
	yspeed += 0.2;
	if(xspeed < -8){xspeed = -8;}
	if(xspeed > 8){xspeed = 8;}
	if(yspeed > 5){yspeed = 5;}	
}
