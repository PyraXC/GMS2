x = o_camera.x - 576;
y = o_camera.y - 224;
image_index = round(global.game_fps/3)-1;

if input.left
{
	set_state_sprite(s_a_pressed, 0.25, image_index);
}

if ! input.left
{
	set_state_sprite(s_a, 1, image_index);
}