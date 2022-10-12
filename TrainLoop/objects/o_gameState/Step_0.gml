switch(state){
	case "Overworld":
	
	
		break;
	
	case "Battle":
	#region Initialize Battle
		while(array_length(enemies) != 0){
			enemy = array_pop(enemies);
			instance_create_layer(Player1.x + 256 + 96 * array_length(enemies), Player1.y, "Instances", enemy);
		}
		with(enemy){
			ix = x;
			iy = y;
			state = "Battle";
			array_push(o_gameState.turnList, id);
			}
		Player1.state = "Battle";
		state = turn;
	#endregion
		break;
		
	case "P1":
	#region Player Turn
	//cout("P1 Phase");
	//state = "Enemy";
	#endregion
		break;
		
	case "Enemy":
	//cout("Enemy Phase");
	#region Enemy Turn
	while(alarm[0] = -1){
		alarm[0] = 6000;
		turnList[i].state = "Choose Attack";
	}
	if(turnList[i].state == "Battle"){
		alarm[0] = -1;
		i++;
	}
	if(i >= enemyLen){
		i=0;
		state = "P1";
	}
	#endregion
		break;
		
	case "Pause":
	
	
		break;
}
//cout(id);

;