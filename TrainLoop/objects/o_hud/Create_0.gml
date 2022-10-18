var camera_id = o_camera.camera;
var view_width = camera_get_view_width(camera_id);
var view_height = camera_get_view_height(camera_id);
display_set_gui_size(view_width, view_height)


if not instance_exists(Player1) exit;
draw_hp = Player1.hp;
draw_max_hp = Player1.max_hp;
draw_set_font(f_one);


//audio_play_sound(a_music, 4, true);