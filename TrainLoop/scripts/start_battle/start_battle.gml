// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
//arg0
function start_battle(argument0){
	o_gameState.enemies = argument0.enemies;
	o_gameState.mainEnemy = other;
	o_gameState.state = "Battle";
	o_gameState.enemyLen = array_length(argument0.enemies);
	room_goto(rm_battle1);
}