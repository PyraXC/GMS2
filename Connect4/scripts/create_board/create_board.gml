// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_board(){
	for(var i = 0; i < 6; i++){
		for(var j = 0; j < 7; j++){
			var but = instance_create_layer(x+ (84*j) + 4, y + (84*i) + 10, "Instances", o_button);
			but.xpos = j;
			but.ypos = i;
			global.board[j][i] = but;
		}
	}
}