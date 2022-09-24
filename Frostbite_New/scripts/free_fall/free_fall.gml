function free_fall() {
		if global.pause == 1
		{
			exit;
		}
	
		move = -input.left + input.right; 
			air_speed += move/50;
			hsp += air_speed;
			if air_speed > 0.1 {air_speed = 0.1;}
			if air_speed < -0.1 {air_speed = -0.1;}
			if move == 0 {air_speed = 0;}
			if hsp >= 7 {hsp = 7;}
			if hsp <= -7 {hsp = -7;}
			move_and_collide(hsp, vsp);
		
			if input.down and vsp >= -0.5 and fast_fall_count == 0
			{
				vsp += 5;
				fast_fall_count++;
			}
		
	if (vsp < 15) vsp += grav;
	if (vsp > 15) vsp = 15;

	//Horizontal Collision 
	if(place_meeting(x+hsp, y, o_wall))
		{
			while(!place_meeting(x+sign(hsp), y, o_wall))
			{
				x += sign(hsp); 
			}
			hsp = 0;
		}
	//Verticle Collision

	if(place_meeting(x, y+vsp, o_wall)) and vsp > 0 and lag_count == 0
		{
			state = "Move";
		}
	
	if(place_meeting(x, y+vsp, o_wall))
		{
			while(!place_meeting(x, y+sign(vsp), o_wall))
			{
				y += sign(vsp); 
			}
			vsp = 0; 
		}


}
