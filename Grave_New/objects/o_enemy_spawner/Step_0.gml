var enemy_count = instance_number(o_enemy_parent);
if instance_exists(obj_skeleton) && enemy_count - 1 <= obj_skeleton.kills/4
{
	if enemy_count > 8
	{
		exit;
	}
	var enemy = choose(o_knight, o_knight, o_crow, o_crow, o_crow);
	if obj_skeleton.kills >= 10 and !instance_exists(o_wizard)
	{
		enemy = choose(o_knight, o_knight, o_crow, o_crow, o_wizard);
	}
	if obj_skeleton.kills >= 25 and !instance_exists(o_boss)
	{
		enemy = choose(o_knight, o_knight, o_crow, o_boss);
	}
	var new_x = random_range(220, room_width - 220);
	while point_distance(new_x, 0, obj_skeleton.x, 0) < 200
	{
		new_x = random_range(220, room_width - 220);
	}
	if enemy == o_wizard
	{
		instance_create_layer(new_x, obj_skeleton.y, "Effects", enemy);
	}
	else
	{
		instance_create_layer(new_x, obj_skeleton.y, "Instances", enemy);
	}
}