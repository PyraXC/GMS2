// Script assets have changed for v2.3.0 see
function move_and_collide_new(argument0, argument1) {
	///@arg xspeed
	///@arg yspeed
	var xspeed = argument0;
	var yspeed = argument1;	
	var wall = instance_place(x+xspeed, y, o_wall);
	//var flr = collision_line(x,y-10,x,y+1000*(-sign(yspeed)), o_wall, false, true);
	/*var flr = instance_place(x, y + 1, o_wall);
	if(place_meeting(x, y-1, o_wall)){
		flr = instance_place(x, y-1, o_wall);
	}*/
	if!(place_meeting(x+xspeed, y, o_wall)){
		x+= xspeed;
	}
	else if(place_meeting(x+xspeed, y, o_wall)){
		//cout("Zwid:" + string(z-wid) + " " + string(wall.wid + wall.z));
		if(z > wall.z + wall.wid || z+wid < wall.z){
			x += xspeed;
		}
		while(!place_meeting(x+sign(xspeed), y, o_wall))
		{
			x += sign(xspeed);	
		}
	}
		var flr = instance_place(x, y-1, o_wall);
		if(flr){
			if!(
			z-yspeed <= flr.z+flr.wid
			//||
			//z-yspeed + wid > flr.z
			)
			{
				//cout("Above, Stop:" + string(flr.z+flr.wid));
				z -= yspeed;
				//exit;
			}
		if!(z-yspeed + wid >= flr.z)
			{
				//cout("Below, Stop:" + string(flr.z));
				z -= yspeed;
				//exit;
			}
		}else{
		if!(place_meeting(x, y-z+yspeed, o_wall)){
			z -= yspeed;
		}
		else if(place_meeting(x, y-z+yspeed, o_wall)){	
			while(!place_meeting(x, y-z+sign(yspeed), o_wall)){
				z -= sign(yspeed);	 
			}
		}
		}
/*	if(xspeed!=0){
		image_xscale = sign(xspeed);
	}*/
}
