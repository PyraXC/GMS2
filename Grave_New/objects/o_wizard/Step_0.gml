switch(state)
{
	case "Chase":
		wizard_chase_state();
		wizard_knockback();
		break;
	
	case "Fireball Attack":
	#region Fireball
		set_state_sprite(s_wizard_fireball, 0.6, 0);
		if animation_hit_frame(7)
		{
			create_hitbox(x, y, self, s_wizard_fireball_damage, 4, 1, 0.25, image_xscale);
		}
		if animation_hit_frame(8)
		{
			create_hitbox(x, y, self, s_wizard_fireball_damage2, 4, 1, 0.25, image_xscale);
		}
		if animation_hit_frame(9)
		{
			create_hitbox(x, y, self, s_wizard_fireball_damage3, 4, 1, 0.25, image_xscale);
		}
		if animation_hit_frame(10)
		{
			create_hitbox(x, y, self, s_wizard_fireball_damage4, 4, 1, 0.25, image_xscale);
		}
		if animation_hit_frame(11)
		{
			create_hitbox(x, y, self, s_wizard_fireball_damage5, 4, 1, 0.25, image_xscale);
		}
		if animation_hit_frame(12)
		{
			create_hitbox(x, y, self, s_wizard_fireball_damage6, 4, 1, 0.25, image_xscale);
		}
		if animation_hit_frame(13)
		{
			create_hitbox(x, y, self, s_wizard_fireball_damage7, 4, 1, 0.25, image_xscale);
		}
		if animation_hit_frame(14)
		{
			create_hitbox(x, y, self, s_wizard_fireball_damage8, 4, 1, 0.25, image_xscale);
		}
		if animation_hit_frame(15)
		{
			create_hitbox(x, y, self, s_wizard_fireball_damage9, 12, 1, 8, image_xscale);
		}
		if animation_end()
		{ 
			state = "Stall";
			alarm[1] = 30;
		}
		wizard_knockback();
		#endregion
		break;
		
	case "Death":
		death_state(s_wizard_die);
		wizard_knockback();
		break;
		
	case "Stab Attack":
	#region Stab Attack
		set_state_sprite(s_wizard_stab, 0.5, 0);
		
		if animation_hit_frame(2)
		{
			create_hitbox(x, y, self, s_wizard_stab_damage, 4, 2, 2, image_xscale);
		}
		if animation_hit_frame(4)
		{
			create_hitbox(x, y, self, s_wizard_stab_damage, 10, 2, 5, image_xscale);
		}
		if animation_end()
		{
			state = "Chase";
		}
		wizard_knockback();
		#endregion
		break;
		
	case "Heal":
	#region healing
	set_state_sprite(s_wizard_heal, 1, 0)
	wizard_knockback();
	if animation_end()
	{
		state = "Healing";
	}
		#endregion
		break;
		
	case "Healing":
	#region healing
	set_state_sprite(s_wizard_healing, 1, 0)
	instance_create_layer(x,y,"Effects", o_healing);
	if animation_hit_frame(10) {hp += 5;}
	if animation_hit_frame(12) {hp += 5;}
	if animation_end()
	{
	if hp == max_hp
	{
		state = "Chase";
		instance_destroy(o_healing);
	}
	else
	{
		state = "Healing";
		instance_destroy(o_healing);
	}
	}
		#endregion
		break;
		
		case "Stall":
	set_state_sprite(s_wizard_walk, 0.3, 0);
		if alarm[1] <= 0
		{
			state = "Chase";	
		}
		wizard_knockback();
		break;		
}
if hp >= max_hp {hp = max_hp;}