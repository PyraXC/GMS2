if not instance_exists(obj_skeleton) exit;
var dir = point_direction(x, y, obj_skeleton.x, obj_skeleton.y);
var acceleration = 0.25;
motion_add(dir, acceleration);

var max_speed = 3;
if speed >= max_speed 
{ 
	speed = max_speed;
}