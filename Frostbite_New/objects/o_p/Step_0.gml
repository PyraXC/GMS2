x = o_camera.x - 192;
y = o_camera.y - 288;
image_index = round(global.game_fps/3)-1;

if keyboard_check(ord("P"))
{
	set_state_sprite(s_p_pressed, 0.25, image_index);
}

if ! keyboard_check(ord("P"))
{
	set_state_sprite(s_p, 1, image_index);
}