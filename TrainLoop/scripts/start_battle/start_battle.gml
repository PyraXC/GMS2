// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
//arg0
function start_battle(argument0){
	//array_push(global.obj_list, self);
	Player1.returnx = Player1.x;
	Player1.returny = Player1.y;
	o_gameState.enemies = argument0.enemies;
	o_gameState.mainEnemy = argument0;
	o_gameState.enemyLen = array_length(argument0.enemies);
	//room_goto(rm_battle1);
	Player1.x = o_arena.x;
	Player1.y = o_arena.y;
	o_gameState.state = "Battle";
	//instance_create_layer(Player1.x-16, Player1.y-128, "Instances", o_battle_menu);
}