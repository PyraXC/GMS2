function chase_state() {
	if not instance_exists(obj_skeleton) exit;

		image_xscale = sign(obj_skeleton.x - x);
		if image_xscale == 0
			{
				image_xscale = 1;
			}

		var direction_facing = image_xscale;
		var distance_to_player = point_distance(x, y, obj_skeleton.x, obj_skeleton.y);
		if distance_to_player <= attack_range
			{
				state = "Attack";	
			}
		else
			{
				move_and_collide(direction_facing * chase_speed, 0);
			}


}
