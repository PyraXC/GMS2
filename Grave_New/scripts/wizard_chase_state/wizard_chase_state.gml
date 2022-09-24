function wizard_chase_state() {
	set_state_sprite(s_wizard_walk, 1, 0);
	if not instance_exists(obj_skeleton) exit;

	var direction_facing = image_xscale;
	var distance_to_player = point_distance(x, y, obj_skeleton.x, obj_skeleton.y);
	
	if hp < max_hp && distance_to_player >= healing_range
	{
		state = "Heal";
	}
	
	if distance_to_player <= fireball_attack_range and distance_to_player > attack_range
			{
			image_xscale = sign(obj_skeleton.x - x);
			if image_xscale == 0
				{
						image_xscale = 1;
				}
				state = "Fireball Attack";	
			}	
	if distance_to_player > attack_range
	{
		image_xscale = sign(obj_skeleton.x - x);
		if image_xscale == 0
			{
				image_xscale = 1;
		}
		move_and_collide(direction_facing * chase_speed, 0);
	}
	if distance_to_player <= attack_range
	{
		image_xscale = sign(obj_skeleton.x - x);
			if image_xscale == 0
				{
						image_xscale = 1;
				}
		state = "Stab Attack";
	}


}
