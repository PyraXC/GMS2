event_inherited();
state = "Chase";
hp = 1;
max_hp = hp;
image_speed = 0.5;
hspeed = random_range(2,3);
if instance_exists(obj_skeleton)
{
	hspeed *= sign(obj_skeleton.x - x);
}
image_xscale = sign(hspeed);
damage = 5;
attacked = false;
experience = 2;
knockback = 4;