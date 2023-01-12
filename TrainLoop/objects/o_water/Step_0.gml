switch(state){
	case "Not Fishing":
	//if(instance_exists(fish)){ instance_deactivate_object(fish);}
	alarm[0] = -1;
	alarm[1] = -1;
	if(abs(Player1.x - x) < 40 && abs(Player1.y - y) < 20){
		if(!instance_exists(o_interact)){
			instance_create_layer(x, y-64, "InstancesTop", o_interact);
		}
		if(Player1.input.jump && (Player1.state == "Move" or Player1.state == "Idle")){
			Player1.state = "Start Fishing";
			instance_destroy(o_interact);
			instance_destroy(fish);
			fish = noone;
			state = "Fishin";
			alarm[0] = irandom_range(60*1, 60*10);
			//alarm[0] = 180;
		}
	}
	else{ instance_destroy(o_interact);}
		break;
		
	case "Fishin":
	while(fish == noone){
		fish = drop_list[irandom(array_length(drop_list)-1)];
		fish = instance_create_layer(x, y+64, "InstancesTop", fish);
		//instance_deactivate_object(fish);
	}
	//make ripples randomly idk
		break;
		
	case "FISHHH":
	//show indicator
	
		break;
		
	case "Fish On":
	
		break;
}
//cout(abs(Player1.x - x));