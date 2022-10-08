switch(state){
	case "Overworld":
	
	
		break;
	
	case "Battle":
		while(array_length(enemies) != 0){
			instance_create_layer(Player1.x + 128 * array_length(enemies), Player1.y, "Instances", array_pop(enemies));
		}
		Player1.state = "Battle";
	
		break;
		
	case "Pause":
	
	
		break;
}