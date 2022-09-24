function tether_movement() {
	if launch == 1 
	{
		state = "Jump";
		exit;
	}
	if point_distance(x, y, tether_point.x, tether_point.y) > tether_range {state = "Jump";}

	if launch_coordinates == 0
	{
		hsp = -(1/8) * (x - tether_point.x);
		vsp = -(1/8) * (y - tether_point.y);
		launch_coordinates++;
	}

	
	if point_distance(x, y, tether_point.x, tether_point.y) <= 32
	{
		state = "Tether Launch";
		launch = 1;
	}
	
	move_and_collide(hsp, vsp);
		if hsp > 12 {hsp = 12;}
		if vsp > 12 {vsp = 12;}
		if hsp < -12 {hsp = -12;}
		if vsp < -12 {vsp = -12;}
		
	//if point_distance(x, y, tether_point.x, tether_point.y) <= tether_range &&  point_distance(x, y, tether_point.x, tether_point.y) > (1/2)*tether_range
	//{
	//	move_and_collide(-(1/16 * (x - tether_point.x)), -(1/16) * (y - tether_point.y));
	//} 

	//if point_distance(x, y, tether_point.x, tether_point.y) <= (1/2)*tether_range && point_distance(x, y, tether_point.x, tether_point.y) > 20
	//{
	//	move_and_collide(-(1/4) * (x - tether_point.x), -(1/4) * (y - tether_point.y));
	//}

	//if point_distance(x, y, tether_point.x, tether_point.y) <= 20
	//{
	//	launch = 1;
	//	state = "Tether Launch";
	//}

	////Horizontal Collision 
	//if(place_meeting(x+hsp, y, o_wall))
	//	{
	//		hsp = 0;	
	//	}
	
	////Verticle Collision

	//if(place_meeting(x, y+vsp, o_wall))
	//	{
	//		vsp = 0; 
	//	}
	//show_debug_message(hsp);
	//show_debug_message(launch_speed_x);



}
