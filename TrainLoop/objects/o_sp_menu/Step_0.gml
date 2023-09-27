if (!select){
	if keyboard_check_pressed(ord("A")){lr--;}
	if keyboard_check_pressed(ord("D")){lr++;}
	if keyboard_check_pressed(vk_space){select = 1;}
	if keyboard_check_pressed(vk_backspace){
		Player1.state = "Move";
		instance_destroy();
	}
}else{
	if keyboard_check_pressed(vk_backspace){select = 0; state = "None";}
}

if(lr > 5){lr = 0;}
if(lr < 0){lr = 5;}
state = statelist[lr];

cout(state);
cout(height);