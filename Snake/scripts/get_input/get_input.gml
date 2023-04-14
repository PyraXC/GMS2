// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_input(){
	var temp = [];
	var ret = [];
	if(keyboard_check(vk_down)){
		array_push(temp, "d");
	}
	if(keyboard_check(vk_up)){
		array_push(temp, "u");
	}
	if(keyboard_check(vk_left)){
		array_push(temp, "l");
	}
	if(keyboard_check(vk_right)){
		array_push(temp, "r");
	}
	var move = array_pop(temp);
	if(move == "u" && dir != "d"){
		y-=27;
		dir = "u";
		ret[0] = x;
		ret[1] = y;
		return ret;
	}
	if(move == "d" && dir != "u"){
		y+=27;
		dir = "d";
		ret[0] = x;
		ret[1] = y;
		return ret;
	}
	if(move == "l" && dir != "r"){
		x-=27;
		dir = "l";
		ret[0] = x;
		ret[1] = y;
		return ret;
	}
	if(move == "r" && dir != "l"){
		x+=27;
		dir = "r";
		ret[0] = x;
		ret[1] = y;
		return ret;
	}
	if(dir == "u"){
		y-=27;
		ret[0] = x;
		ret[1] = y;
		return ret;
	}
	if(dir == "d"){
		y+=27;
		ret[0] = x;
		ret[1] = y;
		return ret;
	}
	if(dir == "l"){
		x-=27;
		ret[0] = x;
		ret[1] = y;
		return ret;
	}
	if(dir == "r"){
		x+=27;
		ret[0] = x;
		ret[1] = y;
		return ret;
	}
}