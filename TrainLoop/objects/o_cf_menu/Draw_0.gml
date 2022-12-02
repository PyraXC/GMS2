//draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_grey, 1);
draw_sprite_ext(sprite_index, image_index, vx, vy, (width+op_border*5)/sprite_width, (height+op_space)/sprite_height, 0, c_grey, 1);
draw_sprite_ext(s_coinflip, lr, x + width/2 + 4, y-84, 2, 2, 0, c_white, 1);
draw_sprite_ext(s_coinflip, flip, x + width + 20, y-84, 2, 2, 0, c_white, 1);
draw_set_font(f_one);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
op_length = array_length(option[menu_level]);
for(var i = 0; i < op_length; i++)
{
	height = op_space * array_length(option[menu_level]) + op_space;
	if(menu_level == 0){//draw Option Select
		var _c = c_ltgrey;
		if pos == i{_c = c_yellow;}
		draw_text_color(vx+op_border, vy + op_space*i+op_border, option[menu_level, i], _c, _c, _c, _c, 1); 
	}
	if(menu_level == 1)//Draw Weapons/allow equip
	{
		var _c = c_ltgrey;
		if pos == i{_c = c_yellow;}
		draw_text_color(vx+op_border, vy + op_space*i+op_border, option[menu_level, i], _c, _c, _c, _c, 1);
	}
	if(menu_level == 2){//draw items/allow use
		var _c = c_ltgrey;
		if pos == i{_c = c_yellow;}
		draw_text_color(vx+op_border, vy + op_space*i+op_border, option[menu_level, i], _c, _c, _c, _c, 1);
	}
}

//cout(width);