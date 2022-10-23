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
	//instance_create_layer(Player1.x-16, Player1.y-128, "Instances", o_battle_menu);
}