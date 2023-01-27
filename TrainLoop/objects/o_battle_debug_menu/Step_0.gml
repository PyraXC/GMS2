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

lr += right_key - left_key;
if lr >= array_length(o_gameState.turnList){lr = 0;}
if lr < 0 {lr = array_length(o_gameState.turnList) - 1;}
Player1.target = o_gameState.turnList[lr];

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
			//Check Enemy
			case 0: menu_level = 1; pos = 0; break;
			//Replace Eemy
			case 1: menu_level = 2; pos = 0; break;
			//Drop Items
			case 2: menu_level = 3; pos = 0; break;
			//Change Status
			case 3: menu_level = 4; pos = 0; break; 
			//Choose Attack
			case 4: menu_level = 5; pos = 0; break;
			//Enemy Attack
			case 5: menu_level = 6; pos = 0; break;
			//Exit
			case 6: menu_level = 7; pos = 0; break;
			break;
		}
		break; #endregion
	#region Check Enemy
	case 1:
	target = o_gameState.turnList[o_battle_debug_menu.lr];
	cout("HP"+target.hp);
	cout("Def"+target.defend);
	cout("Drops"+target.drop_list);
	cout("Xp"+target.xp);
	cout("Status Left"+target.status_turns);
	
	if(array_length(Player1.weapon_inventory) > 0){
		Player1.equip =  Player1.weapon_inventory[pos];
		menu_level = 0;
		pos = 0;
	}
	
		break; #endregion
	#region Items Menu
	case 2:
	if(Player1.item_actions > 0){
		if(array_length(Player1.item_inventory) > 0){
			with(Player1){
				item = item_inventory[o_battle_menu.pos];
				state = o_battle_menu.option[o_battle_menu.menu_level, o_battle_menu.pos];
				prev_state = "Battle";
				item_actions--;
			}
			menu_level = 0;
			pos = 0;
			lr = 0;
			instance_destroy();
		}
	}else{
		menu_level = 0;
		pos = 0;
		lr = 0;
		cout("No Actions");
	}
		break; #endregion
	#region Attack Menu
	case 6:
		with(Player1){
		state = o_battle_debug_menu.option[o_battle_debug_menu.menu_level, o_battle_debug_menu.pos];
		target = o_gameState.turnList[o_battle_menu.lr];
		actions--;
		}
		menu_level = 0;
		pos = 0;
		lr = 0;
		//instance_deactivate_object(self);
		instance_destroy();
		break; #endregion
		
	
	}
}
//cout(option[menu_level]);
//cout(menu_level);