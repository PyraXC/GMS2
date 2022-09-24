/////@arg sprite
/////@arg xscale
/////@arg hsp
/////@arg vsp
function in_air() {

	//var sprite = argument0;
	//var xscale = argument1;
	//var hsp = argument2;
	//var vsp = argument3;



	//		move_and_collide(hsp, 0);
	//		move_and_collide(0, vsp);
		
	//		set_state_sprite(s_jump, 0.9, 0);
	//		move = -input.left + input.right; 
	//		air_speed += move/10;
	//		hsp += air_speed;
	//		if move == 0 {air_speed = 0;}
	//		if hsp >= 10 {hsp = 10;}
	//		if hsp <= -10 {hsp = -10;}

		
	//if (vsp < 15) vsp += grav;
	//if (vsp > 15) vsp = 15;

	//if (place_meeting(x,y+1, o_wall))
	//	{
	//		vsp = input.jump * -jump_speed 
	//		run_speed = 6;
	//	}
	////Horizontal Collision 
	//if(place_meeting(x+hsp, y, o_wall))
	//	{
	//		while(!place_meeting(x+sign(hsp), y, o_wall))
	//		{
	//			x += sign(hsp); 
	//		}
	//		//hsp = 0;
		
	//	}
	
	//	if place_meeting(x - abs(hsp), y, o_wall) and input.right
	//		{
	//			show_debug_message("Left Wall");
	//			vsp = -8;
	//			hsp = 6;
	//			air_speed = 0;
	//		}
	//	if place_meeting(x + abs(hsp), y, o_wall) and input.left
	//		{
	//			show_debug_message("Right Wall")
	//			vsp = -8;
	//			hsp = -6;
	//			air_speed = 0;
	//		}
	////Verticle Collision
	//if(place_meeting(x, y+vsp, o_wall))
	//	{
	//		while(!place_meeting(x, y+sign(vsp), o_wall))
	//		{
	//			y += sign(vsp); 
	//		}
	//		vsp = 0;
	//		state = "Move"; 
	//	}


}
