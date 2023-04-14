draw_self();
if(win){
	draw_sprite(s_win, 0, 0, 0);
}
else if win == -1{
	draw_sprite(s_lose, 0, 0, 0);
	instance_destroy(o_snake);
	if(keyboard_check_pressed(vk_enter)){
		room_restart();
	}
}
while(!instance_exists(o_fruit)){
	instance_create_layer(-1, -1, "Instances", o_fruit);
}