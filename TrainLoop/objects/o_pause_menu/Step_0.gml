up_key = keyboard_check_pressed(ord("W"));
down_key = keyboard_check_pressed(ord("S"));
right_key =keyboard_check_pressed(ord("D")); 
left_key =keyboard_check_pressed(ord("A")); 
accept_key = keyboard_check_pressed(vk_space);
return_key = keyboard_check_pressed(vk_backspace);
vx = Player1.x-32;
vy = Player1.y-160;
pos += down_key - up_key;
if pos >= op_length{pos = 0;}
if pos < 0 {pos = op_length - 1;}


if(return_key){ 
	switch(menu_level){
		case 0:  
			Player1.state = "Move";
			instance_destroy();
		break;
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

			case 0: menu_level = 4; pos = 0; break;

			case 1: menu_level = 1; pos = 0; break;

			case 2: menu_level = 2; pos = 0; break;
			
			case 3: 
				menu_level = 3;
				pos = 0;
				lr = 0;
			break;
		}
		break; #endregion
	#region Equip Menu
	case 1:
	if(array_length(Player1.weapon_inventory) > 0){
		Player1.equip = Player1.weapon_inventory[pos];
	}
		break; #endregion
	#region Items Menu
	case 2:
	if(array_length(Player1.item_inventory) > 0){
		with(Player1){
			item = item_inventory[o_pause_menu.pos];
			state = o_pause_menu.option[o_pause_menu.menu_level, o_pause_menu.pos];
		}
		menu_level = 0;
		pos = 0;
		lr = 0;
		instance_destroy();
	}
		break; #endregion
	#region Attack Menu
	
	case 3:
	
		break;
	case 4:

		break; #endregion
	}
}
//cout(option[menu_level]);
cout(menu_level);