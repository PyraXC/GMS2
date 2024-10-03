/*#macro DEFAULT_VIEWOJ 0
enum viewSizeOJ { smallWidth = 960, smallHeight = 540, bigWidth = 1920, bigHeight = 1080 };
width = display_get_width();
height = display_get_height();
view_enabled = true;
view_set_visible(DEFAULT_VIEWOJ, true);
view_set_hport(DEFAULT_VIEWOJ, height);
view_set_wport(DEFAULT_VIEWOJ, width);
screenshake = 0;
playerList = [o_oj_character];
window_set_rectangle(150, 150, 1920, 1080);
surface_resize(application_surface, width, height);
camera = camera_create_view(0, 0, viewSizeOJ.smallWidth, viewSizeOJ.smallHeight);
view_set_camera(DEFAULT_VIEWOJ, camera);
camera_set_view_angle(camera, 45);
transition = noone;
state = "Game";
//screenshake = 30;
corner = [0,0];
freeze = 0;
turn = 0;
x = o_rm_center.x;
y = o_rm_center.y;*/

/// @description 
// Camera
camera	= view_camera[0];

// Set up 3D camera
camDist	= -300; // Distance
camFov	= 90; // Field of view
camAsp	= camera_get_view_width(camera) / camera_get_view_height(camera); // Aspect ratio

camDistRaw = camDist; // Raw value, used as interpolation target
camDistFar = camDist; // Far distance
camDistFoc = camDist / 4; // Focused distance
camFocused = false; // Is it focused on the player?

// Rotation
camSensitivityX = 1;
camSensitivityY = 1;

camAngleXRaw = 90;
camAngleYRaw = 0;
camAngleX = camAngleXRaw;
camAngleY = camAngleYRaw;

// Vars
mouse_x_prev = 0;
mouse_y_prev = 0;