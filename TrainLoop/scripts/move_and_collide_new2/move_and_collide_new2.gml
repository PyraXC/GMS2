// Script assets have changed for v2.3.0 see
function move_and_collide_new2(argument0, argument1) {
	///@arg xspeed
	///@arg yspeed
	var xspeed = argument0;
	var yspeed = argument1;	
	if not place_meeting(x+xspeed, y, o_wall) and not place_meeting(x+xspeed,y,o_wall){
		x += xspeed;
	}
	else if(place_meeting(x+xspeed, y, o_wall)){
		while(!place_meeting(x+sign(xspeed), y, o_wall))
		{
			x += sign(xspeed);	
		}
	}

	//if!(y-z+yspeed > o_wall.y){
	if not place_meeting(x, y-z+yspeed, o_wall)
	{
		z -= yspeed;

	}
	//else if(y-z+yspeed <= o_wall.y){
	else if(place_meeting(x, y-z+yspeed, o_wall)){
	//while(!y-z+yspeed <= o_wall.y)
		while(!place_meeting(x, y-z+sign(yspeed), o_wall))
		{
			z -= sign(yspeed);	 
		}
	}
	
}
