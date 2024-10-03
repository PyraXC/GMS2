//draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_grey, 1);
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
	/*if(menu_level == 4)//Draw Something idk yet
	{
		var _c = c_ltgrey;
		if pos == i{_c = c_yellow;}
		draw_text_color(vx+op_border, vy+ op_space*i+op_border, "PLACEHOLDER", _c, _c, _c, _c, 1);
	}*/
	if(menu_level == 1)//Draw Weapons/allow equip
	{
		/*var drw = Player1.weapon_inventory[i];
		var str1 = drw.item + " " + string(drw.durability);
		var _c = c_ltgrey;
		if pos == i{_c = c_yellow;}
		draw_text_color(vx+op_border, vy + op_space*i+op_border, str1, _c, _c, _c, _c, 1);
		draw_sprite(Player1.weapon_inventory[i].icon, 0, vx+width+op_border+20, vy+24+op_space*i);*/
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
	if(menu_level == 2){//draw items/allow use
		var drw = Player1.item_inventory[i];
		var _c = c_ltgrey;
		if pos == i{_c = c_yellow;}
		draw_text_color(vx+op_border, vy + op_space*i+op_border, drw.item, _c, _c, _c, _c, 1); 
		draw_sprite(drw.icon, drw.durability, vx+width+op_border+16, vy+24+op_space*i);
	}
	if(menu_level == 3){//draw fish inv
		if(array_length(Player1.fish_inventory) != 0){
		var drw = Player1.fish_inventory[i];
		var _c = c_ltgrey;
		if pos == i{_c = c_yellow;}
		draw_text_color(vx+op_border, vy + op_space*i+op_border, drw.nme + " " + string(drw.size) + "in", _c, _c, _c, _c, 1); 
		}	
	}
	if(menu_level == 4){//draw enemy index
		instance_create_layer(o_camera.corner[0, 0], o_camera.corner[0, 1], "InstancesTop", o_enemy_index);
		Player1.state = "None";
		instance_destroy();
	}
}

//cout(width);