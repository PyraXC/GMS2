if global.pause == 1 exit;
if vsp >= 8 vsp = 8;
if vsp <= -4 vsp = -4;
if image_xscale == 0 {image_xscale = 1}
switch(state)
{
	case "Docile":
	#region
	if point_distance(x, y, o_frostbite.x, o_frostbite.y) <=640 or detect >= 1
	{
		detect = 1;
		set_state_sprite(s_glacial_stomper, 0.75, 0);
		if animation_end() 
		{
		state = "Move";
		}
	}

	#endregion
		break;
	case "Move":
	#region
	set_state_sprite(s_glacial_stomper_walk, 1, 0);
			hsp = (3*-sign(x-o_frostbite.x));
			image_xscale = -sign(hsp);
	move_and_collide(hsp, vsp);
	if point_distance(x, y, o_frostbite.x, o_frostbite.y) <= 512
		{
			randomize();
			i = choose(1,2,3);
			state = "Attack";
		}
	#endregion
		break;
	
	case "Attack":
	#region
		hsp = 0;
		vsp = 0;
	if i == 1			
		{
			set_state_sprite(s_glacial_jump1, 0.25, 0);
			if animation_end() state = "Jump";
		}		
	if i == 2
		{
			set_state_sprite(s_glacial_stomp, 0.75, 0);
			if animation_hit_frame(4){create_hitbox(x, y, self, s_glacial_jump_damage, 5, 2, 2, 20, image_xscale);}
			if animation_hit_frame(8){create_hitbox(x, y, self, s_glacial_jump_damage, 5, 2, 2, 20, image_xscale);}
			if animation_hit_frame(12){create_hitbox(x, y, self, s_glacial_jump_damage, 5, 2, 2, 20, image_xscale);}
			if animation_hit_frame(16){create_hitbox(x, y, self, s_glacial_jump_damage, 5, 2, 2, 20, image_xscale);}
			if animation_end() state = "Bite Charge";
		}
	if i == 3
		{
			set_state_sprite(s_glacial_stomp, 0.75, 0);
			if animation_hit_frame(4){create_hitbox(x, y, self, s_glacial_jump_damage, 5, 2, 2, 20, image_xscale);}
			if animation_hit_frame(8){create_hitbox(x, y, self, s_glacial_jump_damage, 5, 2, 2, 20, image_xscale);}
			if animation_hit_frame(12){create_hitbox(x, y, self, s_glacial_jump_damage, 5, 2, 2, 20, image_xscale);}
			if animation_hit_frame(16){create_hitbox(x, y, self, s_glacial_jump_damage, 5, 2, 2, 20, image_xscale);}
			if animation_end() state = "Charge";
		}
	if i == 4
		{
			set_state_sprite(s_glacial_jump1, 0.25, 0);
			if animation_end() state = "Jump";
		}
	if i == 5
		{
			set_state_sprite(s_glacial_jump1, 0.25, 0);
			if animation_end() state = "Jump";
		}
		move_and_collide(hsp, vsp);
	#endregion
		break;
		
	case "Jump": 
	#region
	set_state_sprite(s_glacial_jump2, 0.5, 0);
	if animation_hit_frame_range(1, 20)
		{
			y -= 24;
		} 
	
	if animation_hit_frame(30)
		{
			x = o_frostbite.x;
		}
	
	if animation_hit_frame_range(31, 41)
		{
			y += 32
		}
		
	if animation_hit_frame_range(42,50)
		{
			vsp = 64;
			move_and_collide(hsp, vsp);
		if(place_meeting(x, y+vsp, o_wall))
			{
				while(!place_meeting(x, y+sign(vsp), o_wall))
					{
						y += sign(vsp); 
						create_hitbox(x, y-16, self, s_glacial_jump_damage, -sign(o_frostbite.x - x) * 2, 2, 2, 5, image_xscale);
					}
				vsp = 0; 
				set_state_sprite(s_glacial_jump2, 1, 59);
				add_screen_shake(10, 6);
				//instance_destroy(o_hitbox.creator == o_stomper);
			}
		}		
		
	if animation_hit_frame(59) 
		{
			state = "Pause";
			alarm[0] = 150;
			jump_hitbox = 0;
		}
	#endregion
		break;
		
	case "Charge":
	#region
		set_state_sprite(s_glacial_closed_charge, 1, 0);
		move_and_collide(hsp, vsp);
		if animation_hit_frame(5){hsp = 25 * -image_xscale;}
		if animation_hit_frame_range(5, 20)
			{
				create_hitbox(x, y, self, s_glacial_closed_charge_damage, -20, -15, 1, 5, image_xscale);
			}
	if(place_meeting(x+hsp, y, o_wall))
		{
			while(!place_meeting(x+sign(hsp), y, o_wall))
			{
				x += sign(hsp); 
			}
			hsp = 0;
			state = "Bounce";
		}
		
		
	#endregion
		break;
		
	case "Bite Charge":
	#region
		set_state_sprite(s_glacial_closed_charge, 1, 0);
		move_and_collide(hsp, vsp);
		if animation_hit_frame(5){hsp = 15 * -image_xscale;}
		if animation_hit_frame_range(5, 20)
			{
				create_hitbox(x, y, self, s_glacial_closed_charge_damage, -10, 20, 1, 30, image_xscale);
			}
	if(place_meeting(x+hsp, y, o_wall))
		{
			while(!place_meeting(x+sign(hsp), y, o_wall))
			{
				x += sign(hsp); 
			}
			hsp = 0;
			state = "Bounce";
		}
		
	#endregion
		break;
		
	case "Hit Charge":
	#region
	set_state_sprite(s_glacial_stomper_bite, 1, 0);
		hsp = 0;
		vsp = 0;
		move_and_collide(hsp, vsp);
		if animation_end()
		{
			state = "Move";
		}
		
	#endregion
		break;
		
	case "Bounce":
	#region
	set_state_sprite(s_glacial_hit_wall, 1, 0);
	if animation_end()
		{
			alarm[0] = 90;
			state = "Pause";
		}
	#endregion
		break;
		
	case "Pause":
	#region
	set_state_sprite(s_glacial_jump1, 1, 0);
	#endregion
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
//show_debug_message(state);