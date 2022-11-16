switch(state){
	case "Not Fishing":
	if(abs(Player1.x - x) < 40 && abs(Player1.y - y) < 20){
	if(!instance_exists(o_interact)){
		instance_create_layer(x, y-64, "InstancesTop", o_interact);
	}
	if(Player1.input.jump){
		Player1.state = "Fishing";
		instance_destroy(o_interact)
		state = "Fishin";
		alarm[0] = irandom_range(60*20, 60*120);
	}
	}
	else{		instance_destroy(o_interact);}
		break;
		
	case "Fishin":
	with(Player1){
		if(input.left or input.right or input.jump or input.attack){
			state = "Move";
		}
	}
		break;
		
	case "FISHHH":
	
		break;
}
//cout(abs(Player1.x - x));