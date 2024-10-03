if!(queue){
	array_push(o_OJ_gameState.board, id);
	queue++;
}
sprI = array_get_index(o_OJ_gameState.tile_list, type);
spr = o_OJ_gameState.spr_list[sprI];
set_state_sprite(spr, -1, 0);
switch(type){
	case "Blank": //0
	
		break;
	
	case "Home"://1
	
		break;

	case "Green"://2
	
		break;

	case "Red"://3
	
		break;
	case "Blue"://4
	
		break;
		
	case "Yellow"://5
	
		break;
}
//cout("Tile " + string(id) + ": " + string(sprite_index));