x = o_camera.x - 384;
y = o_camera.y - 288;
image_index = round(global.game_fps/3)-1;

if keyboard_check(ord("O"))
{
	set_state_sprite(s_o_pressed, 0.25, image_index);
}

if ! keyboard_check(ord("O"))
{
	set_state_sprite(s_o, 1, image_index);
}