x = mouse_x;
y = mouse_y;
if(last_pos[0] == x and last_pos[1] == y){
	i++;
}else{
	i = 0;
}
if(i >= 300){
	instance_destroy();
}
last_pos = [x, y];