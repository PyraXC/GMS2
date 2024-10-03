switch(state){
	case "Not Gambling":
		if(abs(Player1.x - x) < 40 && abs(Player1.y - y) < 64 && abs(Player1.z - z) < 40){
			if(!interactable){
				interact = instance_create_layer(Player1.x + Player1.image_xscale*48, Player1.y-Player1.z-32, "InstancesTop", o_interact);
				interact.depth = -1;
				interactable = 1;
			}
			if(Player1.input.jump && Player1.state != "Slots"){
				Player1.state = "Slots";
				transition_to_battle();
				o_camera.state = "Gambling";
				instance_destroy(interact);
				interactable = 0;
			}
		}else{		
			instance_destroy(interact);
			interactable = 0;
		}
		break;

		
	case "GAMBLING":
		//view_set_camera(0, slots_cam);
		game = instance_create_layer(o_camera.corner[0, 0], o_camera.corner[0, 1], "InstancesTop", o_slot_machine);
		game.depth = -1;
		game.creator = self.id;
		state = "Count";
		
		
		break;
}