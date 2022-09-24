function alpha_movement() {
	if global.pause == 1
	{
		exit;
	}
	
	
		move_and_collide(run_speed, vsp);
	if input.right and not input.left
			{
				run_speed = lerp(4, 6, 0.05);
				image_xscale = 1;
				if(place_meeting(x+run_speed, y, o_wall))
		{
			while(!place_meeting(x+sign(run_speed), y, o_wall))
			{
				x += sign(run_speed); 
			}
			run_speed = 0;
		}
			}
		if input.left and not input.right
			{
				run_speed = lerp(-4, -6, 0.05);
				image_xscale = -1;
			if(place_meeting(x-run_speed, y, o_wall))
				{
				while(!place_meeting(x-sign(run_speed), y, o_wall))
					{
						x -= sign(run_speed); 
					}
				run_speed = 0;
				}
			}
		
			if not input.left and not input.right
				{
					run_speed = 0;
				}
		
			if input.down and vsp >= -0.5 and fast_fall_count == 0
			{
				vsp += 5;
				fast_fall_count++;
			}
		
	if (vsp < 15) vsp += (grav + 0.65);
	if (vsp > 15) vsp = 15;
	if(wall_jump_count > 5) wall_jump_count = 5;

	//Horizontal Collision 
	if(place_meeting(x+hsp, y, o_wall))
		{
			while(!place_meeting(x+sign(hsp), y, o_wall))
			{
				x += sign(hsp); 
			}
		}
	
	//Verticle Collision
	if(place_meeting(x, y+vsp, o_wall))
		{
			while(!place_meeting(x, y+sign(vsp), o_wall))
			{
				y += sign(vsp); 
			}
			vsp = 0; 
		}


}
