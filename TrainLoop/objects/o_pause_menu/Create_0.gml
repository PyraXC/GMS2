global.font_main = font_add_sprite(f_one, 32, true, 1);
pos = 0;
width = 100;
widthList = ds_list_create();
height = 60;
op_border = 10;
op_space = 20;
//pause
vy = -1000;
vx = -1000;
VW = camera_get_view_width(o_camera.camera);
VH = camera_get_view_height(o_camera.camera);
option[0,0] = "Somethin";
option[0, 1] = "Weaponry";
option[0, 2] = "Items";
option[0, 3] = "FISHH";

op_length = 0;
menu_level = 0;
lr = 0;