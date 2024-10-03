var c_gold = make_color_rgb(255, 225, 50);
if(array_length(points) > 0 && signal == 2){
	draw_line_width_color(creator.x-12, creator.y-creator.sprite_height*0.8, points[0][0], points[0][1], 4, c_yellow, c_yellow);
	for(var i = 0; i < array_length(points); i++){
		if(i < array_length(points)-1){
			draw_line_width_color(points[i][0], points[i][1],points[i+1][0],points[i+1][1], 4, c_yellow, c_yellow);
		}else{
			draw_line_width_color(points[i][0], points[i][1], Player1.x, Player1.y-Player1.sprite_height/2, 4, c_yellow, c_yellow);
			signal++;
		}
	}
}