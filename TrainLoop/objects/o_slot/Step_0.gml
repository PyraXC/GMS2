switch(state){
	case "None":
		//set_state_sprite(s_slot_back_to_front, 1, 0);
	break;
	
	case "Flip":
		if(back){
			set_state_sprite(s_slot_front_to_back, 1, 1);
			if(animation_end()){
				back = 0;
			}
		}else{
			set_state_sprite(s_slot_back_to_front, 1, 0);
			if(animation_end()){
				state = "Flipped";
			}
		}
	break;
	
	case "Flipped":
	back = 1;
		set_state_sprite(s_slots, 0, index);
	break;

}
if(!instance_exists(parent)){
	instance_destroy();
}
//cout(image_number);