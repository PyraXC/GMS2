if(!picked){
picked += o_game.player;
o_game.moves++;
global.board[xpos,ypos] = picked;
check_win(o_game.player);
flip_player();
}
else{}