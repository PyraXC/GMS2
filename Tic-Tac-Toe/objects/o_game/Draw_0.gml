if moves == 9{
	draw_sprite(s_draw, 0, 0, 0);
	if(keyboard_check_pressed(vk_enter)){
		room_restart();
	}
}
if(winner == o_player1){
	with(o_button){
		picked = 1;
	}
	draw_sprite(s_p1_w, 0, 0, 0);
	if(keyboard_check_pressed(vk_enter)){
		room_restart();
		
	}
}else if(winner == o_player2){
	with(o_button){
		picked = 1;
	}
	draw_sprite(s_p2_w, 0, 0, 0);
	if(keyboard_check_pressed(vk_enter)){
		room_restart();
	}
}
