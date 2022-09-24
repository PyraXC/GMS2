function boss_chase_state() {
	set_state_sprite(s_boss_walk, 0.3, 0);
	if not instance_exists(obj_skeleton) exit;

	var direction_facing = image_xscale;
	var distance_to_player = point_distance(x, y, obj_skeleton.x, obj_skeleton.y);
	
	if distance_to_player <= attack_range and distance_to_player > backup_range
			{
			image_xscale = sign(obj_skeleton.x - x);
			if image_xscale == 0
				{
						image_xscale = 1;
				}
				state = "Attack";	
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
	if distance_to_player <= backup_range
	{
		if direction_facing != sign(obj_skeleton.x - x)
		{
			image_xscale = sign(obj_skeleton.x - x);
			if image_xscale == 0
				{
					image_xscale = 1;
				}
		}
		move_and_collide(-direction_facing * chase_speed, 0);
	}


}
