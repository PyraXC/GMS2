function up_b_movement() {
	if global.pause == 1
	{
		exit;
	}
	
			move = -input.left + input.right; 
			air_speed += move/20;
			hsp += air_speed;
			if air_speed > 0.2 {air_speed = 0.2;}
			if air_speed < -0.2 {air_speed = -0.2;}
			if move == 0 {air_speed = 0;}
			if hsp >= 5 {hsp = 5;}
			if hsp <= -5 {hsp = -5;}
			move_and_collide(hsp, vsp);
		

	if (vsp < -15) vsp = -15;


	
	//Verticle Collision
	if(place_meeting(x, y+vsp, o_wall)) and vsp > 0 and lag_count == 0
		{
			{
				state = "Move";
			}

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
