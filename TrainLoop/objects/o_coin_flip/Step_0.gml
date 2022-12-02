switch(state){
	case "Not Gambling":
	if(abs(Player1.x - x) < 40 && abs(Player1.y - y) < 100){
		if(!instance_exists(o_interact)){
			instance_create_layer(x, y, "InstancesTop", o_interact);
		}
		if(Player1.input.jump && (Player1.state == "Move" or Player1.state == "Idle")){
			Player1.state = "Coin Flip";
			instance_destroy(o_interact);
		}
	}
	else{		instance_destroy(o_interact);}
		break;
}
//cout(net_gain);