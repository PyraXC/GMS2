function up_b_movement_st() {
	if global.pause == 1
	{
		exit;
	}
	
			move = -input.left + input.right; 
			air_speed += move/100;
			hsp += air_speed;
			if air_speed > 0.1 {air_speed = 0.1;}
			if air_speed < -0.1 {air_speed = -0.1;}
			if move == 0 {air_speed = 0;}
			if hsp >= 7 {hsp = 7;}
			if hsp <= -7 {hsp = -7;}
			move_and_collide(hsp, vsp);

	if (vsp < -5) vsp = -5;

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
