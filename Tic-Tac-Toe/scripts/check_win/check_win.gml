///@arg0 player
function check_win(argument0){
	//var llines = ["000", "111", "222", "012", "210"];
	var lines = [
	[[0,0],[0,1],[0,2]],
	[[1,0],[1,1],[1,2]],
	[[2,0],[2,1],[2,2]],
	[[0,0],[1,0],[2,0]],
	[[0,1],[1,1],[2,1]],
	[[0,2],[1,2],[2,2]],
	[[0,0],[1,1],[2,2]],
	[[0,2],[1,1],[2,0]]
	]
	var temp = "";
	//cout(string_char_at(llines[0], 0));
	for(var i = 0; i<array_length(lines); i++){
		for(var j =0;j<3;j++){
			//if(global.board[j][real(string_char_at(llines[i], j))] == 3){
				//cout(string(j) + " " + string(i) + " P1"); 
				//temp += string(global.board[j][real(string_char_at(llines[i], j))]);
				temp += string(global.board[lines[i][j][0],lines[i][j][1]]);
		}
		cout(temp);
		if(check_line(temp)){
			cout("Win " + argument0.name);
			o_game.winner = argument0;
		}
		temp = "";
	}
}