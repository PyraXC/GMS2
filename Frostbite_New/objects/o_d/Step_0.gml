x = o_camera.x - 448;
y = o_camera.y - 224;
image_index = round(global.game_fps/3)-1;

if input.right
{
	set_state_sprite(s_d_pressed, 0.25, image_index);

}

if ! input.right
{
	set_state_sprite(s_d, 1, image_index);
}