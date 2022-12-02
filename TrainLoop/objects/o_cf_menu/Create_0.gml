global.font_main = font_add_sprite(f_one, 32, true, 1);
pos = 0;
flip = 0;
width = 100;
widthList = ds_list_create();
height = 60;
op_border = 20;
op_space = 20;
//pause
vy =0;
vx=0;
option[0,0] = "1";
option[0, 1] = "10";
option[0, 2] = "50";
option[0, 3] = "250";
option[0, 4] = "2X";
option[0, 5] = "All"

option[1,0] = "2";
option[1, 1] = "20";
option[1, 2] = "100";
option[1, 3] = "500";
option[1, 4] = "4X";
option[1, 5] = "All"

option[2,0] = "4";
option[2, 1] = "40";
option[2, 2] = "200";
option[2, 3] = "1000";
option[2, 4] = "All"

op_length = 0;
menu_level = 0;
lr = 0;