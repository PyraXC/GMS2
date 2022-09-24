x += random_range(-screenshake, screenshake)
y += random_range(-screenshake, screenshake)

if !instance_exists(obj_skeleton) exit;

var target_x = obj_skeleton.x;
var target_y= obj_skeleton.y - 48;

x = lerp(x, target_x + 32*obj_skeleton.image_xscale, 0.1);
y = lerp(y, target_y, 0.15);

camera_set_view_pos(view_camera[0], x - width/2, y - height/2);