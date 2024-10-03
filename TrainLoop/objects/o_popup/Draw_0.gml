draw_set_font(f_one_card);
max_width = string_width(title);
//cout(max_width);
target_x = o_camera.corner[1, 0];
if(duration > 20){
	target_y = o_camera.corner[1, 1] - sprite_height;
}else{
	target_y = o_camera.corner[1, 1] + sprite_height;
	if(signal){
		Player1.POPUP_ONSCREEN = 0;
		signal--;
	}
}
var diff = (sprite_width-max_width) - (16+border);
x = target_x + diff;
y = approach(y, target_y, 19.2);

draw_sprite(sprite_index, 0, x, y);
draw_text_ext_color(x-sprite_width+16, y-sprite_height+4, title, 14, max_width, c_white, c_white, c_white, c_white, 1);
draw_text_ext_color(x-sprite_width+6, y-sprite_height+24, txt, 14, max_width+16, c_white, c_white, c_white, c_white, 1);
draw_line(x-diff-48-border/2, y-8, x-diff-border/2, y-8);
draw_sprite(spr, 0, x-diff-24-border/2, y-10);
duration--;
if(duration <= 0){
	instance_destroy(self);
}