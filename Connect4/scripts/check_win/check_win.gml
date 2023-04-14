///@arg0 player
function check_win(argument0){
	var w = 0;
	var h = 5;
	var temp = 0;
	var win = 1;
	var count = 0;
	while(win){
		//cout("loop");
		if(w > 6){
			//cout("height");
			w = 0;
			h--;
		}
		if(h < 0){
			//cout("No Win");
			return;
		}
		var curr = global.board[w,h].picked;
		if(curr == 2 || curr == 3){
			temp = curr;
		}else{
			w++;
			continue;
			}
		win -= check_up(w, h, curr);
		win -= check_lr(w, h, curr);
		win -= check_diag(w, h, curr);
		w++;
	}
	o_game.winner = curr;
}
function check_up(w, h, curr){
	if(h <= 3) return 0;
	for(var i = 1; i < 4; i++){
		if(curr != global.board[w,h-i].picked){
			return 0;
		}
	}
	return 1;
}
function check_lr(w, h, curr){
	if(w >= 4) return 0;
	for(var i = 1; i < 4; i++){
		if(curr != global.board[w+i,h].picked){
			return 0;
		}
	}
	return 1;
}
function check_diag(w, h, curr){
	if(h <= 3) return 0;
	if(w <= 3){
		for(var i = 1; i < 4; i++){
			if(curr != global.board[w+i,h-i].picked){
				return 0;
			}
		}
	}
	if(w >= 3){
		for(var i = 1; i < 4; i++){
			if(curr != global.board[w-i,h-i].picked){
				return 0;
			}
		}
	}
	return 1;
}

