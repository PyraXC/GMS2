switch(state){
	case "Not Gambling":
		if(abs(Player1.x - x) < 40 && abs(Player1.y - y) < 40){
		if(!interactable){
			interact = instance_create_layer(x, y, "InstancesTop", o_interact);
			interact.depth = -1;
			interactable = 1;
		}
		if(Player1.input.jump && (Player1.state == "Move" or Player1.state == "Idle")){
			Player1.state = "Coin Flip";
			state = "GAMBLING";
			instance_destroy(interact);
			interactable = 0;
		}
	}
	else{		
		instance_destroy(interact);
		interactable = 0;
		}
		break;
		
	case "GAMBLING":
		break;
}
//cout(net_gain);