up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);
accept_key = keyboard_check_pressed(vk_enter);

op_length = array_length(option[menu_level]);

pos += down_key - up_key;
if pos >= op_length{pos = 0;}
if pos < 0 {pos = op_length - 1;}
if accept_key{
switch(menu_level){
	#region main menu
	case 0:
		switch(pos){
			//play
			case 0: room = rm_Graveyard; pos = 0; break;
			//Weapon
			case 1: menu_level = 1; pos = 0; break;
			//Settings
			case 2: menu_level = 2; pos = 0; break;
			//Quit Game
			case 3: game_end(); break;
		}
		break; #endregion
	#region Equip Menu
	case 1:
		switch(pos){
				//Slot 1
				case 0: pos = 0; break;
				//Slot 2
				case 1: pos = 0; break;
				//Slot 3
				case 2: pos = 0; break;
				//Return to mm
				case 3: menu_level = 0; pos = 0; break;
			}
		break; #endregion
	#region Settings Menu
	case 2:
		switch(pos){
	
				case 0: 
					break;
				case 1: pos = 0; break;
				case 2: pos = 0; break;
				case 3: menu_level = 0; pos = 0; break;
			}
		break; #endregion
	}
}
