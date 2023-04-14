// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_board(){
	for(var i = 0; i < 3; i++){
		for(var j = 0; j < 3; j++){
			var but = instance_create_layer(x+28 + (room_width/3) * j, y+ 12 + (room_height/3 + 16) * i, "Instances", o_button);
			but.xpos = j;
			but.ypos = i;
		}
	}
}