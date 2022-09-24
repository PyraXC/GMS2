event_inherited();

if global.pause == 1 exit;
if vsp >= 8 vsp = 8;
if vsp <= -4 vsp = -4;
switch(state)
{
	case "Docile":
	#region
	if point_distance(x, y, o_frostbite.x, o_frostbite.y) <=160 or detect >= 1
	{
		detect = 1;
		set_state_sprite(s_scuttler, 0.75, 0);
		if animation_end() 
		{
		state = "Move";
		}
	}

	#endregion
		break;
	case "Move":
	#region
	set_state_sprite(s_scuttler_move, 1, 0);
		if !place_meeting(x, y+1, o_wall)
			{
				vsp += approach(4, 6, 0.2);
			}
			else
			{
				vsp = 0;
			}
			hsp = (6*-sign(x-o_frostbite.x));
			image_xscale = sign(hsp);
	move_and_collide(hsp, vsp);
	if point_distance(x, y, o_frostbite.x, o_frostbite.y) <= 150
		{
			state = "Attack";
		}
	#endregion
		break;
	
	case "Attack":
	#region
		//hsp = 6 * -sign(x-o_frostbite.x);
		//vsp += grav;
		//move_and_collide(hsp, vsp);
		//if point_distance(x, y, o_frostbite.x, o_frostbite.y) <= 12
		//	{
		//		state = "Cling";
		//	}
		//if place_meeting(x, y+1, o_wall) and jump == 6
		//{
		//	state = "Move";
		//	jump = 0;
		//}
		//jump++;
		set_state_sprite(s_scuttler_attack, 1.25, 0);
		if animation_end() state = "Move";
		hsp = 3 * image_xscale;
		move_and_collide(hsp, vsp);
	#endregion
		break;
		
	case "Cling":
		state = "Move";
		break;
		
	case "Death":
	#region
	set_state_sprite(s_scuttler_death, 1, 0);
	if animation_end()
	{
		instance_destroy();
	}
	
	#endregion
		break;
}
//show_debug_message(image_xscale);
//show_debug_message(state);