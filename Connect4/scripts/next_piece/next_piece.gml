///@arg xpos
function next_piece(xpos){
	for(var i = array_length(global.board[0])-1; i>=0;i--){
		if(global.board[xpos, i].picked == 0){
			cout(string(xpos) + " " + string(i));
			o_game.moves++;
			global.board[xpos, i].picked += o_game.player;
			check_win();
			flip_player();
			return true;
		}
	}
	return false;
}