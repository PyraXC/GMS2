///@arg xspeed
///@arg yspeed
function move_and_collide(argument0, argument1) {

	var xspeed = argument0;
	var yspeed = argument1;

	if not place_meeting(x+xspeed, y, obj_wall)
	{
		x += xspeed;
	}

	if not place_meeting(x, y+yspeed, obj_wall)
	{
		y += yspeed;
	}


}
