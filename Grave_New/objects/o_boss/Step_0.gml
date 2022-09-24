if !instance_exists(obj_skeleton) exit;
switch(state)
{
	case "Chase":
		set_state_sprite(s_boss_walk, 0.25, 0);
		boss_chase_state();
		boss_knockback();
		break;	
		
	case "Attack":
	#region Attack
		set_state_sprite(s_boss_attack, 0.5, 0);
		if animation_hit_frame(6)
		{
			create_hitbox(x, y, self, s_boss_attack_foot_damage, 10, 1, 3, image_xscale);
		}
		if animation_hit_frame(7)
		{
			add_screen_shake(2,2);
			create_hitbox(x, y, self, s_boss_attack_damage, 20, 3, 10 + (0.25 * (obj_skeleton.max_hp)), image_xscale);
			audio_play_sound(a_big_hit, 5, false);
			audio_play_sound(a_medium_hit, 3, false);
		}
		if animation_end()
		{
			state = "Stall";
			alarm[1] = 30;
		}
		boss_knockback();
		#endregion
		break;
		
	
	case "Death":
		death_state(s_boss_die);
		boss_knockback();
		break;
		
	case "Stall":
	set_state_sprite(s_boss_idle, 0.3, 0);
		if alarm[1] <= 0
		{
			state = "Chase";	
		}
		boss_knockback();
		break;
}