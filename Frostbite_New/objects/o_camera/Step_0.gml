x += random_range(-screenshake, screenshake)
y += random_range(-screenshake, screenshake)


if !instance_exists(o_frostbite)
{
	player = o_lancer_k;
}

var target_x = player.x;
var target_y= player.y - 48;

x = lerp(x, target_x + 128 * player.image_xscale, 0.115);
y = lerp(y, target_y, 0.15);

camera_set_view_pos(view_camera[0], x - width/2, y - height/2);
