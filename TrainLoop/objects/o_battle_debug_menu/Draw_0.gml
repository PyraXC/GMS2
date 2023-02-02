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
	if(menu_level == 1)//Check Enemy
	{
		var target = o_gameState.turnList[lr];
		cout(lr);
		var _c = c_ltgrey;
		if pos == i{_c = c_yellow;}
		draw_text_color(vx+op_border, vy + op_space*i+op_border, Player1.attack_list[i], _c, _c, _c, _c, 1); 
		
		draw_arrow(target.x, target.y-target.sprite_height-16, target.x, target.y-target.sprite_height, 16);
	}
	if(menu_level == 2){//Change Enemies
		var drw = Player1.item_inventory[i];
		var _c = c_ltgrey;
		if pos == i{_c = c_yellow;}
		draw_text_color(vx+op_border, vy + op_space*i+op_border, drw.item, _c, _c, _c, _c, 1); 
		draw_sprite(drw.icon, drw.durability, vx+width+op_border+16, vy+24+op_space*i);
	}
	if(menu_level == 3){//Give items
		
	}
	if(menu_level == 4){//Status Effects
		
	}
	if(menu_level == 5)//Draw Attacks/Target indicator
	{
		var target = Player1.target;
		var _c = c_ltgrey;
		if pos == i{_c = c_yellow;}
		draw_text_color(vx+op_border, vy + op_space*i+op_border, Player1.attack_list[i], _c, _c, _c, _c, 1); 
		draw_arrow(target.x, target.y-target.sprite_height-16, target.x, target.y-target.sprite_height, 16);
	}
}