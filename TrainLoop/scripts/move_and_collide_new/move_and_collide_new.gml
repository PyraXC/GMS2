// Script assets have changed for v2.3.0 see
function move_and_collide_new(argument0, argument1, argument2) {
	///@arg xspeed
	///@arg zspeed
	///@arg yspeed
	var xspeed = argument0;
	var zspeed = argument1;	
	var yspeed = argument2;	
	var wall = instance_place(x+xspeed, y, o_wall);
	var back = instance_nearest(x, y, o_backwall);
	var back_wall = instance_place(x, y, o_wall);
	//var air_wall = instance_place(x, y+yspeed, o_wall);
	instance_place_list(x, y+yspeed, o_wall, air_walls, true);
	var air_wall = ds_list_find_value(air_walls, ds_list_size(air_walls)-1);
	ds_list_clear(air_walls);
	instance_place_list(x, y+1, o_wall, ground, true);
	var grd = ds_list_find_value(ground, ds_list_size(ground)-1);
	ds_list_clear(ground);
	//var grd = Player1.grd;
	if(instance_exists(grd)){
		grd.col = c_black;
	}
	if(instance_exists(wall)){
		wall.col = c_aqua;
	}
	if(instance_exists(air_wall)){
		air_wall.col = c_green;
	}
	if(instance_exists(back_wall)){
		back_wall.col = c_ltgray;
	}


	


	//var flr = collision_line(x,y-10,x,y+1000*(-sign(zspeed)), o_wall, false, true);
	/*var flr = instance_place(x, y + 1, o_wall);
	if(place_meeting(x, y-1, o_wall)){
		flr = instance_place(x, y-1, o_wall);
	}*/

//X collision
	if!(place_meeting(x+xspeed, y, o_wall)){ //Move LR stop before wall
		x+= xspeed;
	}
	else if(place_meeting(x+xspeed, y, o_wall)){//If move inside wall
		if(z >= wall.z + wall.wid || z+wid <= wall.z){ //if z does not collide
			x += xspeed;//lr pass through
		}
		while(!place_meeting(x+sign(xspeed), y, o_wall))
		{
			x += sign(xspeed);	//pixel collision
		}
	}
//Y collision
if(instance_exists(air_wall)){//On ground or passing through
	//cout("GRD state");
	if!(place_meeting(x, y+yspeed, o_wall)){ //Move jump stop before wall with y collision
		y+= yspeed;
	}
	else if(place_meeting(x, y+yspeed, o_wall)){//If move inside wall
			//cout(z);
			//cout(grd.z);
			if(z >= air_wall.z + air_wall.wid || z+wid <= air_wall.z){ //if z does not collide

				y += yspeed;//ud pass through
				//cout("pass through" + string(grd));
				/*if(y+yspeed > grd.y){
					while!(y +sign(yspeed) > grd.y){
						y+=sign(yspeed);
					}	
				}*/
			}else{
				//cout("Z Collide");
				while(!place_meeting(x, y+sign(yspeed), air_wall)){
					y+=sign(yspeed);
					cout("PP collision");
				}
				if(place_meeting(x, y-1, o_wall)){vsp = 0;}

				if(state = "Jump" and vsp >= 0 and jump_input == 0){
					run_speed = i_run_speed;
					state = "Move";
					vsp = 0;
					cout("land");
				}
			}
	}
}else{
	//cout("Not GRD state")
	if!(place_meeting(x, y+yspeed, o_wall)){ //Move jump stop before wall with y collision
		y+= yspeed;
	}else{
		while(!place_meeting(x, y+sign(yspeed), o_wall)){

			y+=sign(yspeed);
		}
	}
}

	
//front/back wall collision
	if(instance_exists(back)){
		if!(z-zspeed > back.z || z - zspeed < 0){//if not hitting global back wall or front wall
			
			
			if(place_meeting(x, y, back_wall)){//if passing through o_wall
				if!(z-zspeed <= back_wall.z+back_wall.wid and z + wid-zspeed >= back_wall.z) //if not inside wall
				{
					//cout("Back Wall Not Collide");
					z -= zspeed;
				}else{
					/*while!((z+wid + sign(zspeed) < back_wall.z) || (z + sign(zspeed) > back_wall.z + back_wall.wid)){
						z+=sign(zspeed);
					}*/
					if!(z+wid - sign(zspeed) > back_wall.z){
						z-=sign(zspeed);
					}else if!(z-sign(zspeed) < back_wall.z+back_wall.wid){
						z-=sign(zspeed);
					}
				}
				
			}else{
				
				//cout("NOT BACK WALL");
				z-= zspeed;
				if(z -zspeed < 0 || z -zspeed > back.z){
					while!(z - sign(zspeed) < 0 || z - sign(zspeed) > back.z){
						z-= sign(zspeed);
						//cout("PP");
					}
				}
			}
		
		
		}else{
			if(z < 0) {z = 0;}
			if(z > back.z) {z = back.z;}
		}//Put pixel collision here
	}
		/*if(z-zspeed + wid >= flr.z)
			{
				cout("Below, Stop:" + string(flr.z));
				z -= zspeed;
				//exit;
			}*/
		/*}else{
			if!(place_meeting(x, y-z+zspeed, o_wall)){
				z -= zspeed;
			}
			else if(place_meeting(x, y-z+zspeed, o_wall)){	
				while(!place_meeting(x, y-z+sign(zspeed), o_wall)){
					z -= sign(zspeed);	 
				}
			}
		}*/
/*	if(xspeed!=0){
		image_xscale = sign(xspeed);
	}*/
//cout(back.z);
//cout(vsp);
//cout("Z:" +string(z)+" Y:" +string(y-608));
	if(instance_exists(grd)){
	if(z >= grd.z + grd.wid || z + wid <= grd.z){
		state = "Jump";	
		//cout("Walkoff Z");
	}}
	
	if(!place_meeting(x, y+1, o_wall)){
		//cout("Walkoff");
		state = "Jump";
	}
	//cout("Y: " + string(y));
	//cout("Z: " + string(z));
}

