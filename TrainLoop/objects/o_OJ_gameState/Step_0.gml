if(turn > 3){turn = 0;}
if(turn < 0){turn = 3;}
if(keyboard_check_pressed(vk_shift)){
	cout(board_print());
	cout("Turn: " + string(turn));
}
switch(state){
	
	case "Startup":
		for(var i = 0; i < 4; i++){
			players[i].player = i;
			players[i].tile = i*4;
		}
		state = "Game";
		break;
	
	case "Game":
		players[turn].state = "Turn";
		curr_player = players[turn];
		state = "Player";
		break;
	
	case "Player":
	
		break;
}