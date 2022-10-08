var cam = camera;
if(keyboard_check(vk_alt)){
	camera_set_view_size(cam, viewSize.bigWidth, viewSize.bigHeight);
}else if(keyboard_check(vk_control)){
	camera_set_view_size(cam, room_width, room_height);
}else {
	camera_set_view_size(cam, viewSize.smallWidth, viewSize.smallHeight);
}
var VW = camera_get_view_width(cam);
var VH = camera_get_view_height(cam);
camera_set_view_pos(cam, player.x - VW/2 + 192, player.y - VH/2 - 160);