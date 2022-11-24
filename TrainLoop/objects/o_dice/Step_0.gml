switch(state){
	case "Not Gambling":
	if(abs(Player1.x - x) < 40 && abs(Player1.y - y) < 20){
		if(!instance_exists(o_interact)){
			instance_create_layer(x, y-64, "InstancesTop", o_interact);
		}
		if(Player1.input.jump && (Player1.state == "Move" or Player1.state == "Idle")){
			Player1.state = "Dice";
		}
	}
		break;
}