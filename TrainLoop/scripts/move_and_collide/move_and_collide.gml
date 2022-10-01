// Script assets have changed for v2.3.0 see
function move_and_collide(argument0, argument1) {
	///@arg xspeed
	///@arg yspeed

	var xspeed = argument0;
	var yspeed = argument1;

	if not place_meeting(x+xspeed, y, o_wall)
	{
		x += xspeed;
	}

	if not place_meeting(x, y+yspeed, o_wall)
	{
		y += yspeed;
	}


}
