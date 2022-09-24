x = o_camera.x - 384;
y = o_camera.y - 224;
image_index = round(global.game_fps/3)-1;

if keyboard_check(vk_space)
{
	set_state_sprite(s_space_pressed, 0.25, image_index);
}

if ! keyboard_check(vk_space)
{
	set_state_sprite(s_space, 1, image_index);
}