//width = camera_get_view_width(view_camera[0]);
//height = camera_get_view_height(view_camera[0]);
#macro DEFAULT_VIEW 0
enum viewSize { smallWidth = 960, smallHeight = 540, bigWidth = 1920, bigHeight = 1080 };
width = display_get_width();
height = display_get_height();
view_enabled = true;
view_set_visible(DEFAULT_VIEW, true);
view_set_hport(DEFAULT_VIEW, height);
view_set_wport(DEFAULT_VIEW, width);
screenshake = 0;
player = Player1;
window_set_rectangle(150, 150, 1920, 1080);
surface_resize(application_surface, width, height);
camera = camera_create_view(0, 0, viewSize.smallWidth, viewSize.smallHeight);
view_set_camera(DEFAULT_VIEW, camera);