if(keyboard_check(vk_backspace)){ 
	transition_to_battle();
}
x = o_camera.corner[0, 0];
y = o_camera.corner[0, 1];
switch(state){
	case "Idle":
		if(keyboard_check_pressed(vk_space)){
			state = "Roll";
		}
		break;
	
	
	case "Roll":
		cout("ROLLING");
		win = slots_roll(slots, lines, bet);
		
		state = "Idle";
		break;
	
}