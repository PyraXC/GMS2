///Prints Board Types
function board_print(){
	var txt = "Board: ";
	for(var i = 0; i < array_length(board); i++){
		txt += string(i) + ":";
		txt += board[i].type;
		txt+=" ";
	}
	return txt;
}