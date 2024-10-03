//draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_grey, 1);
if(array_length(o_gameState.turnList) > 0 && state != "Noone"){
draw_sprite_ext(sprite_index, image_index, vx, vy, (width+op_border*5)/sprite_width, (height+op_space)/sprite_height, 0, c_grey, 1);
draw_set_font(f_one);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
battle_menu_update();
op_length = array_length(option[menu_level]);

for(var i = 0; i < op_length; i++)
{
	height = op_space * array_length(option[menu_level]);
	width = ds_list_find_value(widthList, 0);
	if(menu_level == 0){//draw Option Select
		var _c = c_ltgrey;
		if pos == i{_c = c_yellow;}
		draw_text_color(vx+op_border, vy + op_space*i+op_border, option[menu_level, i], _c, _c, _c, _c, 1); 
	}
	if(menu_level ==0){
		if(pos == 3){
			target = Player1.target;
			draw_arrow(target.x, (target.y-target.sprite_height-16) - target.z, target.x, target.y-target.sprite_height - target.z, 16);
		}
	}
	if(menu_level == 1)//Draw Weapons
	{
		var drw = Player1.weapon_inventory[i];
		var drw_i = drw.icon;
		var drw_x = vx+width+op_border+16;
		var drw_y = vy+8+op_space*i;
		var _c = c_ltgrey;
		if pos == i{_c = c_yellow;}
		draw_text_color(vx+op_border, vy + op_space*i+op_border, drw.item, _c, _c, _c, _c, 1); 
		draw_sprite(drw_i, 0, drw_x, drw_y);
		draw_rectangle(drw_x - 1, drw_y - 1, drw_x+sprite_get_width(drw_i), drw_y+sprite_get_height(drw_i), true);
	}
	if(menu_level == 2){//draw items
		var drw = Player1.item_inventory[i];
		var drw_i = drw.icon;
		var drw_x = vx+width+op_border+16;
		var drw_y = vy+8+op_space*i;
		var _c = c_ltgrey;
		target = Player1.target;
		if pos == i{_c = c_yellow;}
		draw_text_color(vx+op_border, vy + op_space*i+op_border, drw.item, _c, _c, _c, _c, 1); 
		draw_sprite(drw_i, drw.durability, drw_x, drw_y);
		draw_rectangle(drw_x - 1, drw_y -1, drw_x + sprite_get_width(drw_i), drw_y + sprite_get_height(drw_i), true);
		draw_arrow(target.x, (target.y-target.sprite_height-16) - target.z, target.x, target.y-target.sprite_height - target.z, 16);
	}
	if(menu_level == 4)//Draw Attacks/Target indicator
	{
		if(left_key || right_key){
			if(instance_exists(o_cursor)){
				instance_destroy(o_cursor);	
				instance_destroy(point);
			}
		}
						target = Player1.target;
		var _c = c_ltgrey;
		if pos == i{_c = c_yellow;}
		switch(cursor_state){
			case "Cursor":
				if(!instance_exists(o_cursor)){
					cursor_state = "No Cursor";
					mouse_orig_x = mouse_x;
					exit;
				}
				draw_text_color(vx+op_border, vy + op_space*i+op_border , option[4, i], _c, _c, _c, _c, 1);
				if(click){	
					point.x = cursor.x;
					point.z = o_arena.y - cursor.y;
					point.y = Player1.y;
					cout("PointX: " + string(point.x) + "Z: " + string(point.z)); 
				}
				break;
				
			case "No Cursor":
				draw_arrow(target.x, (target.y-target.sprite_height-16) - target.z, target.x, target.y-target.sprite_height - target.z, 16);
				draw_text_color(vx+op_border, vy + op_space*i+op_border , option[4, i], _c, _c, _c, _c, 1); 
				if(mouse_x != mouse_orig_x && !instance_exists(o_cursor)){
					cursor = instance_create_layer(mouse_x, mouse_y, "CURSOR", o_cursor);
					mouse_orig_x = mouse_x;
					cursor_state = "Cursor";
				}
				break;
				
		}
	}
}

}
/*
if (menu_level == 2 && pos == 1){
	c = c_white;
	draw_set_font(f_one_sm);
	draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_dkgray, 1);
	draw_text_color(x + op_border, y, "   ^^^", c, c, c, c, 1);
	for(var i = 0; i < array_length(menu[0]); i++){
		draw_text_color(x+op_border, y + 8 + (10)*i, menu[0, i], c, c, c, c, 1);
	}
}
if (menu_level == 2 && pos == 2){
	c = c_white;
	draw_set_font(f_one_smaller);
	draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_dkgray, 1);
	for(var i = 0; i < array_length(menu[1]); i++){
		draw_text_color(x + 3, y - 5 + (9)*i, menu[1, i], c, c, c, c, 1);
	}
}
*/
//cout(width);