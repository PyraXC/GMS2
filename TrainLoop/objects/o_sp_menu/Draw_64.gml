draw_sprite_ext(s_skill_menu_backdrop, 0, 0, 0, 1, 1, 0, c_white, 1);
switch(state){
	case "Blunt":
		draw_sprite_ext(s_skilltree_blunt, pos, width, height, 1, 1, 0, c_white, 1);
		break;
		
	case "Short":
		draw_sprite_ext(s_skilltree_blunt, pos, width, height, 1, 1, 0, c_white, 1);
		break;
	
	case "Long":
		draw_sprite_ext(s_skilltree_blunt, pos, width, height, 1, 1, 0, c_white, 1);
		break;
		
	case "Slicing":
		draw_sprite_ext(s_skilltree_blunt, pos, width, height, 1, 1, 0, c_white, 1);
		break;
		
	case "Polearm":
		draw_sprite_ext(s_skilltree_blunt, pos, width, height, 1, 1, 0, c_white, 1);
		break;

	case "Ranged":
		draw_sprite_ext(s_skilltree_blunt, pos, width, height, 1, 1, 0, c_white, 1);
		break;
}
if(select){
switch(state){
	case "Blunt":
		switch(pos){
		case 0:
		height = 96;
		draw_sprite_ext(s_popup_hit, unlocked[lr, pos], 528 + width, 16 + height, 1, 1, 0, c_white, 1);
			if keyboard_check_pressed(ord("S")){pos = last;	}
			break;
			
		case 1:
		draw_sprite_ext(s_popup_bash, unlocked[lr, pos], 144 + width, 208 + height, 1, 1, 0, c_white, 1);
			if keyboard_check_pressed(ord("S")){last = pos; pos = 2;	}
			if keyboard_check_pressed(ord("W")){last = pos; pos = 0;	}
			if keyboard_check_pressed(ord("D")){pos = 4;	}
			if keyboard_check_pressed(vk_space){unlocked[lr, pos] = 1;}
			break;
			
		case 2:
		height = -96;
		draw_sprite_ext(s_popup_smash, unlocked[lr, pos], 144 + width, 368 + height, 1, 1, 0, c_white, 1);
			if keyboard_check_pressed(ord("S")){pos = 3;	}
			if keyboard_check_pressed(ord("W")){pos = 1;	}
			if keyboard_check_pressed(vk_space){unlocked[lr, pos] = 1;}
			break;
			
		case 3:
		height = -128;
		draw_sprite_ext(s_popup_pummel, unlocked[lr, pos], 144 + width, 528 + height, 1, 1, 0, c_white, 1);
			if keyboard_check_pressed(ord("S")){last = pos; pos = 9;	}
			if keyboard_check_pressed(ord("W")){pos = 2;	}
			if keyboard_check_pressed(vk_space){unlocked[lr, pos] = 1;}
			break;			
			
		case 4:
		draw_sprite_ext(s_popup_hit, unlocked[lr, pos], 528 + width, 16 + height, 1, 1, 0, c_white, 1);
			if keyboard_check_pressed(ord("D")){pos = 5;	}
			if keyboard_check_pressed(ord("A")){pos = 1;	}
			if keyboard_check_pressed(ord("S")){last = pos; pos = 6;	}
			if keyboard_check_pressed(ord("W")){last = pos; pos = 0;	}
			if keyboard_check_pressed(vk_space){unlocked[lr, pos] = 1;}
			break;
			
		case 5:
		draw_sprite_ext(s_popup_hit, unlocked[lr, pos], 528 + width, 16 + height, 1, 1, 0, c_white, 1);
			if keyboard_check_pressed(ord("S")){last = pos; pos = 6;	}
			if keyboard_check_pressed(ord("A")){pos = 4;	}
			if keyboard_check_pressed(ord("D")){pos = 7;	}
			if keyboard_check_pressed(ord("W")){last = pos; pos = 0;	}
			if keyboard_check_pressed(vk_space){unlocked[lr, pos] = 1;}			
			break;		
			
		case 6:
		draw_sprite_ext(s_popup_hit, unlocked[lr, pos], 528 + width, 16 + height, 1, 1, 0, c_white, 1);
		height = -128;
			if keyboard_check_pressed(ord("S")){last = pos; pos = 9;	}
			if keyboard_check_pressed(ord("W")){
				if(last != pos){
					pos = last;	
				}else{pos = 4;}
			}
			if keyboard_check_pressed(vk_space){unlocked[lr, pos] = 1;}
			break;		
			
		case 7:
		draw_sprite_ext(s_popup_hit, unlocked[lr, pos], 528 + width, 16 + height, 1, 1, 0, c_white, 1);
			if keyboard_check_pressed(ord("S")){pos = 8;	}
			if keyboard_check_pressed(ord("W")){last = pos; pos = 0;	}
			if keyboard_check_pressed(ord("A")){pos = 5;	}
			if keyboard_check_pressed(vk_space){unlocked[lr, pos] = 1;}
			break;

		case 8:
		draw_sprite_ext(s_popup_hit, unlocked[lr, pos], 528 + width, 16 + height, 1, 1, 0, c_white, 1);
		height = -128;
			if keyboard_check_pressed(ord("S")){last = pos; pos = 9;	}
			if keyboard_check_pressed(ord("W")){pos = 7;	}
			if keyboard_check_pressed(vk_space){unlocked[lr, pos] = 1;}
			break;
			
		case 9:
		draw_sprite_ext(s_popup_hit, unlocked[lr, pos], 528 + width, 16 + height, 1, 1, 0, c_white, 1);
		height = -352;
			if keyboard_check_pressed(ord("W")){pos = last;	}
			if keyboard_check_pressed(vk_space){unlocked[lr, pos] = 1;}
			break;
		}
	break;
		
	case "Short":
	draw_sprite_ext(s_skilltree_blunt, pos, width, height, 1, 1, 0, c_white, 1);
		height = 96;
		break;
	
	case "Long":
	draw_sprite_ext(s_skilltree_blunt, pos, width, height, 1, 1, 0, c_white, 1);
		height = 96;
		break;
		
	case "Slicing":
		draw_sprite_ext(s_skilltree_blunt, pos, width, height, 1, 1, 0, c_white, 1);
		height = 96;
		break;
		
	case "Polearm":
		draw_sprite_ext(s_skilltree_blunt, pos, width, height, 1, 1, 0, c_white, 1);
		height = 96;
		break;

	case "Ranged":
		draw_sprite_ext(s_skilltree_blunt, pos, width, height, 1, 1, 0, c_white, 1);
		height = 96;	
		break;
}
}

draw_sprite_ext(sprite_index, lr, 0, 0, 1, 1, 0, c_white, 1);