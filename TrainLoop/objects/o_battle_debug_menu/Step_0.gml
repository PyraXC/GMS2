up_key = keyboard_check_pressed(ord("W"));
down_key = keyboard_check_pressed(ord("S"));
right_key =keyboard_check_pressed(ord("D")); 
left_key =keyboard_check_pressed(ord("A")); 
accept_key = keyboard_check_pressed(vk_space);
return_key = keyboard_check_pressed(vk_backspace);
var VW = camera_get_view_width(o_camera.camera);
var VH = camera_get_view_height(o_camera.camera);
vx = Player1.x - VW/2 + 192;
vy = Player1.y - VH/2 - 96;
pos += down_key - up_key;
if pos >= op_length{pos = 0;}
if pos < 0 {pos = op_length - 1;}

lr += right_key - left_key;
if lr >= array_length(o_gameState.turnList){lr = 0;}
if lr < 0 {lr = array_length(o_gameState.turnList) - 1;}
Player1.target = o_gameState.turnList[lr];
target = o_gameState.turnList[lr];

if(return_key){ 
	switch(menu_level){
		case 0:  
		Player1.state = "Battle";
		Player1.return_state = "Battle";
		instance_create_layer(x, y, "Instances", o_battle_menu);
		instance_destroy();
			break;
		case 1:  menu_level = 0; break;		
		case 2:  menu_level = 0; break;
		case 3:  menu_level = 0; break;
		case 4:  menu_level = 0; break;
		case 5:  menu_level = 0; break;		
		case 6:  menu_level = 0; break;
		case 7:  menu_level = 0; break;
		case 8:  menu_level = 0; break;
	
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
			//Drop Weapons
			case 3: menu_level = 4; pos = 0; break; 
			//Choose Status
			case 4: menu_level = 5; pos = 0; break;
			//Choose Attack
			case 5: menu_level = 6; pos = 0; break;
			//Enemy Attack
			case 6: menu_level = 7; pos = 0; break;
			//Exit
			case 7: 
				Player1.state = "Battle";
				Player1.return_state = "Battle";
				instance_create_layer(x, y, "Instances", o_battle_menu);
				instance_destroy();
			
			break;
			break;
		}
		break; #endregion
	#region Check Enemy
	case 1:
	target = o_gameState.turnList[lr];
	cout("HP"+string(target.hp));
	cout("Def"+string(target.defend));
	cout("Drops"+string(target.drop_list));
	cout("Xp"+string(target.xp));
	cout("Status Left"+string(target.status_turns));
	
		break; #endregion
	#region Change Enemies
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
	
	case 3:
	#region Give Items
	drop_specific_item(global.item_list, pos, 0);
	break;
	#endregion
	
	case 4:
	#region Give Weapons
	drop_specific_item(global.weapon_list, pos, 0);
	break;
	#endregion
	
	case 6:
	#region attack enemy
	with(Player1){
		state = o_battle_debug_menu.option[o_battle_debug_menu.menu_level, o_battle_debug_menu.pos];
		return_state = "Battle Debug";
		target = o_gameState.turnList[o_battle_debug_menu.lr];
	}
		instance_destroy();
	
	
	break;
	#endregion
	case 7:
	with(target){
		state = o_battle_debug_menu.option[o_battle_debug_menu.menu_level, o_battle_debug_menu.pos];
		return_state = "Battle Debug";
	}
	with(o_gameState){
		state = "Enemy";
		debug = 1;
	}
	with(Player1){
		state = "Battle";
		return_state = "Battle Debug";
	}
		instance_destroy();
		break; #endregion
		
	
	}
}
//cout(option[menu_level]);

//cout(menu_level);