if(!picked){
	draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, 1);
}
if(picked == 2){
	draw_sprite(o_player1.tic, 0, x, y);
}
if(picked == 3){
	draw_sprite(o_player2.tic, 0, x, y);
}