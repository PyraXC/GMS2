
x += random_range(-screenshake, screenshake)
y += random_range(-screenshake, screenshake)


var target_x = player.x;
var target_y= player.y;

x = lerp(x, target_x + 128 * player.image_xscale, 0.115);
y = lerp(y, target_y, 0.15);

//camera_set_view_pos(camera, x - width/2, y - height/2);