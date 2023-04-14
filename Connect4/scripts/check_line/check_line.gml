///@arg0 line
function check_line(argument0){
	var line = argument0;
	for(var l = 2; l < 4; l++){
		if(string_char_at(line, l) != string_char_at(line, 0) || real(string_char_at(line, l)) == 0){
			return false;
		}
	}
	return true;
}