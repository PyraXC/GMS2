// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
//arg0
function run_battle(){
	for(var i = 0; i < array_length(o_gameState.turnList); i++;){
		instance_destroy(o_gameState.turnList[i]);
	}
	Player1.state = "Move";
	Player1.x = Player1.returnx;
	Player1.y = Player1.returny;
	o_gameState.state = "Overworld";
	o_gameState.i = 0;
	for(var j = 0; j < array_length(global.obj_list); j++;){
		instance_activate_object(global.obj_list[j]);
	}
}