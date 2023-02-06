
switch(state){
case "Overworld":
#region Normal Cam
	var cam = camera;
	transition = layer_get_id("transition");
	if(keyboard_check(vk_alt)){
		camera_set_view_size(cam, viewSize.bigWidth, viewSize.bigHeight);
	}else if(keyboard_check(vk_control)){
		camera_set_view_size(cam, room_width, room_height);
	}else {
		camera_set_view_size(cam, viewSize.smallWidth, viewSize.smallHeight);
	}
	
	var target_x = player.x;
	var target_y= player.y;
	x = lerp(x, target_x + 128 * player.image_xscale, 0.115);
	y = lerp(y, target_y, 0.15);

	var VW = camera_get_view_width(cam);
	var VH = camera_get_view_height(cam);
	camera_set_view_pos(cam, player.x - VW/2 + 192, player.y - VH/2 - 160);
	if(layer_get_id("transition")){
		//layer_x(transition, player.x - VW/2 + 192);
		//layer_y(transition, player.y - VH/2 - 160);
	}
	break;
	#endregion
	
case "Battle":
#region Battle Cam

	break;
	#endregion
}
cout(player.x);