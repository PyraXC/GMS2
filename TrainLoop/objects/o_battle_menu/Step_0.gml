if(array_length(o_gameState.turnList) > 0 && state != "Noone"){
up_key = keyboard_check_pressed(ord("W"));
down_key = keyboard_check_pressed(ord("S"));
right_key =keyboard_check_pressed(ord("D")); 
left_key =keyboard_check_pressed(ord("A")); 
accept_key = keyboard_check_pressed(vk_space);
return_key = keyboard_check_pressed(vk_backspace);
pause = keyboard_check_pressed(vk_escape);
	
vx = camera_get_view_x(o_camera.camera) + (20);
vy = camera_get_view_y(o_camera.camera)+(80);
pos += down_key - up_key;
if(up_key || down_key){
	audio_play_sound(a_menu_move, 0.5, 0);
}
if pos >= op_length{pos = 0;}
if pos < 0 {pos = op_length - 1;}

lr += right_key - left_key;
if lr >= array_length(o_gameState.turnList){lr = 0;}
if lr < 0 {lr = array_length(o_gameState.turnList) - 1;}
Player1.target = o_gameState.turnList[lr];

if(return_key){ 
	switch(menu_level){
		case 0:  audio_play_sound(a_menu_back_1, 1, 0); break;
		case 1:  menu_level = 0; audio_play_sound(a_menu_back_1, 1, 0); break;		
		case 2:  menu_level = 0; audio_play_sound(a_menu_back_1, 1, 0); break;
		case 3:  menu_level = 0; audio_play_sound(a_menu_back_1, 1, 0); break;
		case 4:  menu_level = 0; audio_play_sound(a_menu_back_1, 1, 0); break;
	
	}
}
if accept_key{
switch(menu_level){
	#region main menu
	case 0:
	cout( o_input.queue);
	if array_equals(o_input.queue, ["u","u","d","d","l","r","l","r","a","df","j"]){
		Player1.state = "Battle Debug";
		instance_destroy();
		exit;
	}
		switch(pos){
			//play
			case 0: menu_level = 4; pos = 0; audio_play_sound(a_menu_select, 0.75, 0);  mouse_orig_x = mouse_x;break;
			//Equipment
			case 1: menu_level = 1; pos = 0; audio_play_sound(a_menu_select, 0.75, 0); break;
			//Settings
			case 2: menu_level = 2; pos = 0; audio_play_sound(a_menu_select, 0.75, 0); break;
			//Identify
			case 3: 
				audio_play_sound(a_menu_select, 0.75, 0);
				//cout("here");
				var data = o_gameState.turnList[lr].enemy_index;
				ini_open("enemyIndex.ini");
				ini_write_real("enemies", data, 1);
				//cout(ini_read_real("enemies", data, 0));
				ini_close();
				Player1.actions--;
				Player1.return_state = "Battle";
				Player1.state = "Read";
				instance_destroy();
			break;
			//Run battle
			case 4: 
			audio_play_sound(a_menu_select, 0.75, 0);
			transition_to_battle();
			break;
		}
		break; #endregion
	#region Equip Menu
	case 1:
	audio_play_sound(a_menu_select, 0.75, 0);
	if(array_length(Player1.weapon_inventory) > 0){
		Player1.weapon =  Player1.weapon_inventory[pos];
		menu_level = 0;
		pos = 0;
	}
		break; #endregion
	#region Items Menu
	case 2:
	audio_play_sound(a_menu_select, 0.75, 0);
	if(Player1.item_actions > 0){
		if(array_length(Player1.item_inventory) > 0){
			with(Player1){
				item = item_inventory[o_battle_menu.pos];
				state = o_battle_menu.option[o_battle_menu.menu_level, o_battle_menu.pos];
				return_state = "Battle";
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
	
	case 3:

	
		
	#region Attack Menu
	case 4:
	audio_play_sound(a_menu_select, 0.75, 0);
	instance_destroy(cursor);
		with(Player1){
		state = "Approach";
		next_state = o_battle_menu.option[o_battle_menu.menu_level, o_battle_menu.pos];
		target = o_gameState.turnList[o_battle_menu.lr];
		distance = weapon.distance;
		if!(instance_exists(o_battle_menu.point)){
			point = attack_point(target.x - distance, target.z, target.y, 1);
		}else{
			point = o_battle_menu.point;
			point.x -= distance;
		}
		return_state = "Battle";
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
}

//cout(option[menu_level]);
//cout(menu_level);
//cout(lr);
