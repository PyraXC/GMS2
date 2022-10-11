switch(state){
	case "Overworld":
	
	
		break;
	
	case "Battle":
	#region Initialize Battle
		while(array_length(enemies) != 0){
			enemy = array_pop(enemies);
			array_push(turnList, enemy);
			instance_create_layer(Player1.x + 256 + 96 * array_length(enemies), Player1.y, "Instances", enemy);
		}
		with(enemy){
			ix = x;
			iy = y;
			state = "Battle";
			}
		Player1.state = "Battle";
		state = turn;
	#endregion
		break;
		
	case "P1":
	#region Player Turn
	cout("P1 Phase");
	//state = "Enemy";
	#endregion
		break;
		
	case "Enemy":
	//cout("Enemy Phase");
	#region Enemy Turn
	with(enemy){
		if(alarm[0] == -1){
			state = "Choose Attack";
			alarm[0] = 1300;
		}
		o_gameState.i++;
	}
	if(i == enemyLen){
		state = "P1";
	}
	#endregion
		break;
		
	case "Pause":
	
	
		break;
}
//cout(id);
//cout(state);