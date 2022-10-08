if(state == "Move" or state == "Attack"){
	o_gameState.enemies = enemies;
	o_gameState.mainEnemy = o_skeleton_king;
	o_gameState.state = "Battle";
	o_gameState.enemyLen = array_length(enemies);
	room_goto(rm_battle1);
}