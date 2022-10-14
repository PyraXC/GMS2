draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_grey, 1);
draw_set_font(f_one);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
op_length = array_length(option[menu_level]);
for(var i = 0; i < op_length; i++)
{
	var _c = c_ltgrey;
	if pos == i{_c = c_yellow;}
	draw_text_color(x+op_border, y + op_space*i, option[menu_level, i], _c, _c, _c, _c, 1); 
}
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