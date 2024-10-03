set_state_sprite(sprite_index, 1, 0);

if(!queue){
	array_push(o_OJ_gameState.players, id);
	queue++;
}

switch(state){
	case "Turn":
	//cout("Player: " + string(player) + " State: " + state);
		if(!interactable){
			interact = instance_create_layer(x, y, "InstancesTop", o_interact);
			interact.depth = -1;
			interactable = 1;
		}
		if(input.jump){
			board = get_board();
			//cout(board);
			target_tile = OJ_roll() + tile;
			state = "Move";
			instance_destroy(interact);
			interactable = 0;
		}
	
		break;
		
	case "Move":
	target_tile = bounds(target_tile);
	tile = bounds(tile);
	//cout("Target: " + string(target_tile));
	var target = board[target_tile];
		var next = board[((tile+1)%array_length(board))];
		//cout(next);
		if(tile != target_tile && x != target.x && y != target.y){
			if(x != next.x && y != next.y){
				x = next.x;
				y = next.y;
			}else{
				tile++;
				cout("Count");
			}
		}else{
			tile++;
			cout(tile);
			state = "Tile";
			o_OJ_gameState.turn++;
			
		}
		break;
		
	case "Tile": 
		
		state = "Idle";
		o_OJ_gameState.state = "Game";
		break;
}
//cout(string(id) + " " + string(x)+ " " + string(y))