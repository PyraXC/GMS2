//if(fram %global.gamespeed == 0){
	get_input();
	array_push(global.pos_list, [x, y]);
	game_set_speed(int64(size/20)+6, gamespeed_fps);
	cout(global.gamespeed);
	if(x < 0 or x > 19*27){
		o_board.win = -1;
	}
	if(y < 0 or y > 19*27){
		o_board.win = -1;
	}
//}