var hp_x = 16;
var hp_y = 16;
draw_sprite_ext(s_health_bar_full, 20 - Player1.hp, hp_x, hp_y, 1, 1, 0, c_white, 100);
var equip_x = hp_x + 16;
var equip_y = hp_y + 29;
var equip_icon_x = equip_x + 6*16;
var equip_icon_y = equip_y + 8;
var draw_equip_x = equip_x + 24;
var draw_equip_y = equip_y + 8;
var equip = string(Player1.weapon.item);
draw_sprite_ext(s_equip_bar, 0, equip_x, equip_y, 1, 1, 0, c_white, 100);
draw_text(draw_equip_x, draw_equip_y, equip);
var eqp_icon = Player1.weapon.icon;
draw_sprite_ext(eqp_icon, 0, equip_icon_x, equip_icon_y, 1, 1, 0, c_white, 100)
draw_rectangle(equip_icon_x, equip_icon_y, equip_icon_x+sprite_get_width(eqp_icon), equip_icon_y+sprite_get_height(eqp_icon), true);
/*
if instance_exists(Player1)
{
	draw_hp = lerp(draw_hp, Player1.hp, 0.2);
	draw_max_hp = Player1.max_hp;
} else {
	draw_hp = lerp(draw_hp, 0, 0.2);
}

var hp_percent = draw_hp / draw_max_hp;
draw_rectangle_color(hp_x, hp_y, hp_x + (hp_width * hp_percent), hp_y + hp_height, c_maroon, c_maroon, c_maroon, c_maroon, false);
draw_line_width_color(hp_x-1, hp_y-1, hp_x + hp_width, hp_y-1, 1, c_white, c_white);
draw_line_width_color(hp_x-1, hp_y + hp_height, hp_x + hp_width, hp_y + hp_height, 1, c_white, c_white);
draw_line_width_color(hp_x-1, hp_y-1, hp_x-1, hp_y + hp_height, 1, c_white, c_white);
draw_line_width_color(hp_x + hp_width, hp_y-1, hp_x + hp_width, hp_y + hp_height, 1, c_white, c_white);
*/

/*if not instance_exists(Player1) exit;
var text = "Actions: " + string(Player1.actions);
var text_width = string_width(text);
var text_height = string_height(text);
var start_x = 8;
var start_y = 40;
var padding_x = 8;
var padding_y = 8;
draw_rectangle_color(start_x, start_y, start_x +text_width + padding_x, start_y + text_height + padding_y, c_black, c_black, c_black, c_black, false); 
draw_text(start_x + padding_x/2, start_y + padding_y, text);

var start_x2 = text_width + start_x*2;
text_width = string_width(equip);
draw_rectangle_color(start_x2, start_y, start_x2 +text_width + padding_x, start_y + text_height + padding_y, c_black, c_black, c_black, c_black, false); 
*/
/*
var text = "Level: " + string(Player1.level);
start_x += text_width + padding_x*3;
var text_width = string_width(text);
var text_height = string_height(text);

draw_rectangle_color(start_x, start_y, start_x +  text_width + padding_x, start_y + text_height + padding_y, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false); 
draw_text(start_x + padding_x/2, start_y + padding_y, text);
*/