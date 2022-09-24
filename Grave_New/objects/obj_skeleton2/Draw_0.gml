draw_self();

if state = "Death" exit;
if instance_exists(obj_skeleton2)
{
	var height = sprite_height;
	draw_rectangle_color(x - 12, y - height, x - 12 +(hp/max_hp)*24,y - (height - 2), c_white, c_white, c_white, c_white, false);
	draw_sprite(s_enemy_healthbar, 0, x-12, y-height);
	draw_text_transformed(obj_skeleton2.x-12, obj_skeleton2.y, "Level " + string(level), 0.5, 0.5, 0);
}