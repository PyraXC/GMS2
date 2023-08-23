var cam = camera;
var target_x = player.x;
var target_y = player.y;
var VW = camera_get_view_width(cam);
var VH = camera_get_view_height(cam);
switch(state){
case "Overworld":
#region Normal Cam
	
	transition = layer_get_id("transition");
	if(keyboard_check(vk_alt)){
		camera_set_view_size(cam, viewSize.smallWidth, viewSize.smallHeight);
	}else if(keyboard_check(vk_control)){
		camera_set_view_size(cam, room_width, room_height);
	}else {
		camera_set_view_size(cam, viewSize.smallWidth, viewSize.smallHeight);
	}
	
	
	x = lerp(x, target_x + 128 * player.image_xscale, 0.115);
	y = lerp(y, target_y, 0.15);
	camera_set_view_pos(cam, x- VW/2 + 192, y - VH/2 - 160);
	
	//camera_set_view_pos(cam, player.x - VW/2 + 192, player.y - VH/2 - 160);
	if(layer_get_id("transition")){
		//layer_x(transition, player.x - VW/2 + 192);
		//layer_y(transition, player.y - VH/2 - 160);
	}
	break;
	#endregion
	
case "Battle":
#region Battle Cam
	target_x = player.ix;
	target_y= player.iy;
	camera_set_view_pos(cam, target_x - 136, target_y - VH/2 - 160);
	camera_set_view_size(cam, viewSize.smallWidth, viewSize.smallHeight);
	break;
	#endregion
}