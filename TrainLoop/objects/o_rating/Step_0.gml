if(i==0){
	x = target.x - sprite_width/2;
	y = target.y-64-sprite_height;
	fy = y -128;
	i++;
}
alpha -= 0.03;
y = lerp(y, fy, 0.05);