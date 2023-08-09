// Script assets have changed for v2.3.0 see
function move_and_collide_jump(argument0, argument1) {
	///@arg xspeed
	///@arg yspeed

	var xspeed = argument0;
	var yspeed = argument1;
	var ground = instance_nearest(x, y, o_ground);

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


	if z > ground.z{
		z+= yspeed;
		y+= yspeed;
	}
	else if(z + yspeed <= ground.z){
		while(!z+sign(yspeed) == ground.z){
			y += sign(yspeed);	
		}
	}
	else{
		state = "Move";
	}

}
