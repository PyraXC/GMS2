if global.pause == 1
{
	draw_set_color(c_black);
	draw_set_alpha(0.5);
	draw_rectangle(o_camera.x - 576, o_camera.y - 288, o_camera.x + 576, o_camera.y + 288, 0);
	draw_set_halign(fa_center);
	draw_set_font(f_comic_sans);
	draw_set_color(c_blue);
	draw_set_alpha(1);
	draw_text(o_camera.x, o_camera.y - 32, "Game Paused");
	draw_set_color(c_black);
}