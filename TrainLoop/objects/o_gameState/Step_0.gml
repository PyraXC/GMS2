switch(state){
	case "Overworld":
	
	
		break;
	
	case "Battle":
	#region Initialize Battle
		while(array_length(enemies) != 0){
			enemy = array_pop(enemies);
			instance_create_layer(Player1.x + 256 + 96 * array_length(enemies), Player1.y, "Instances", enemy);
			enemy.state = "Battle";
		}
		Player1.state = "Battle";
		state = turn;
	#endregion
		break;
		
	case "P1":
	#region Player Turn
	state = "Enemy";
	#endregion
		break;
		
	case "Enemy":
	#region Enemy Turn
	#endregion
		break;
		
	case "Pause":
	
	
		break;
}
//cout(state);