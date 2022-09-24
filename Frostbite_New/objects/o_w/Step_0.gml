x = o_camera.x - 512;
y = o_camera.y - 288;
image_index = round(global.game_fps/3)-1;

if input.up
{
	set_state_sprite(s_w_pressed, 0.25, image_index);
}

if ! input.up
{
	set_state_sprite(s_w, 1, image_index);
}
