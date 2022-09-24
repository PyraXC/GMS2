x = o_camera.x - 512;
y = o_camera.y - 224;
image_index = round(global.game_fps/3)-1;

if input.down
{
	set_state_sprite(s_s_pressed, 0.25, image_index);
}

if ! input.down
{
	set_state_sprite(s_s, 1, image_index);
}