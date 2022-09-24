if keyboard_check_pressed(ord("R"))
{
	game_restart();
}
if global.game_fps >= 60
{
	global.game_fps = 0;
}
global.game_fps += 1;
