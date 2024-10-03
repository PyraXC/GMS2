function place_enemies(){
	for(var j = 0; j <= array_length(enemies)-1 ; j++;){
		var _enemy = enemy_pos(j);
		with(_enemy){
			ix = x;
			iy = y;
			state = "Battle";
			array_push(o_gameState.turnList, id);
			//index = o_gameState.i;
			//o_gameState.i++;
			}
	}
}

function enemy_pos(argument0){
	var _pos = argument0;
	var _width = o_gameState.enemyLen*96;
	var _margin = 384;
	var _enemy = o_gameState.enemies[_pos];
	//cout("enemy " + string(_enemy));
	if(o_gameState.enemyLen == 1){
		enemy_place(instance_create_layer(Player1.x + _margin, Player1.y, "Instances", _enemy), 0);//set enemy spawns
	}else if(o_gameState.enemyLen <= 4){
		enemy_place(instance_create_layer(Player1.x + _margin + _pos*96, Player1.y, "Instances", _enemy), 0);
	}else{
		var _step = floor(_pos / 3);
		if(_step%2==0){
			enemy_place(instance_create_layer(Player1.x + _margin + (_pos%3) * 96, Player1.y, "Instances", _enemy), _step);
		}else{
			enemy_place(instance_create_layer(Player1.x + _margin + (_pos%3) * 96 + 48, Player1.y, "Instances", _enemy), _step);
		}
	}
}
///@arg enemy
///@arg Depth Pos
function enemy_place(argument0, argument1){
	var _enemy = argument0;
	with(_enemy){
		ix = x;
		iy = y;
		if(argument1 > 0){
			iz = argument1*64;
			z = argument1*64;
		}else{
			iz = Player1.z;	
			z = Player1.z;
		}
		state = "Battle";
		array_push(o_gameState.turnList, id);
		//index = o_gameState.i;
		//o_gameState.i++;
	}
}

function add_enemy(argument0){
	array_push(o_gameState.enemies, argument0);
	o_gameState.enemyLen++;
	enemy_pos(array_length(o_gameState.turnList));
	/*
	var _enemy = instance_create_layer(x, y, "Instances", argument0);
	var len = array_length(o_gameState.enemies);
	array_push(o_gameState.turnList, _enemy.id);*/
	
}