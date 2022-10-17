up_key = keyboard_check_pressed(ord("W"));
down_key = keyboard_check_pressed(ord("S"));
right_key =keyboard_check_pressed(ord("D")); 
left_key =keyboard_check_pressed(ord("A")); 
accept_key = keyboard_check_pressed(vk_space);
return_key = keyboard_check_pressed(vk_backspace);

pos += down_key - up_key;
if pos >= op_length{pos = 0;}
if pos < 0 {pos = op_length - 1;}

lr += right_key - left_key;
if lr >= array_length(o_gameState.turnList){lr = 0;}
if lr < 0 {lr = array_length(o_gameState.turnList) - 1;}
		
if(return_key){ 
	switch(menu_level){
		case 0:  break;
		case 1:  menu_level = 0; break;		
		case 2:  menu_level = 0; break;
		case 3:  menu_level = 0; break;
		case 4:  menu_level = 0; break;
	
	}
}
if accept_key{
switch(menu_level){
	#region main menu
	case 0:
		switch(pos){
			//play
			case 0: menu_level = 4; pos = 0; break;
			//Equipment
			case 1: menu_level = 1; pos = 0; break;
			//Settings
			case 2: menu_level = 2; pos = 0; break;
			//Quit Game
			case 3: cout("Running"); break;
		}
		break; #endregion
	#region Equip Menu
	case 1:
		Player1.equip = option[menu_level, pos];
		menu_level = 0;
		break; #endregion
	#region Items Menu
	case 2:
		switch(pos){
	
				case 0: 
					break;
				case 1: pos = 0; break;
				case 2: pos = 0; break;
				case 3: pos = 0; break;
			}
		break; #endregion
	#region Attack Menu
	case 4:
		Player1.state = option[menu_level, pos];
		Player1.target = o_gameState.turnList[lr];
		instance_destroy();
		break; #endregion
	}
}