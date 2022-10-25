switch(state){
	case "Overworld":
	turnList = [];
	i = 0;
	enemyLen = 0;
	alarm[0] = -1;
	while!instance_exists(o_hud){
		instance_create_layer(Player1.x, Player1.y, "Instances", o_hud);
	}

	//instance_deactivate_object(o_battle_menu);
		break;
	
	case "Battle":
	#region Initialize Battle
	//instance_create_layer(Player1.x-16, Player1.y-128, "Instances", o_battle_menu);
		//instance_activate_object(o_battle_menu);
		//if(instance_exists(o_battle_menu)){instance_deactivate_object(o_battle_menu);}
		for(var j = array_length(enemies)-1; j >= 0 ; j--;){
			enemy = enemies[j];
			instance_create_layer(Player1.x + 256 + 96 * j, Player1.y, "Instances", enemy);
		}
		with(enemy){
			ix = x;
			iy = y;
			state = "Battle";
			array_push(o_gameState.turnList, id);
			index = o_gameState.i;
			o_gameState.i++;
			}
			i=0;
		with(Player1){
			state = "Battle";
			ix = x;
			iy = y;
			for(var j = 0; j < array_length(weapon_inventory); j++;){
				instance_activate_object(weapon_inventory[j]);
			}
			for(var j = 0; j < array_length(item_inventory); j++;){
				instance_activate_object(item_inventory[j]);
			}
		}
		cout(turnList);
		state = turn;
	#endregion
		break;
		
	case "P1":
	#region Player Turn
	//Player wins
	if(turnList == []){
		state = "End Battle";
	}
	#endregion
		break;

	case "Enemy":
	//cout("Enemy Phase");
	#region Enemy Turn
	Player1.actions = 0;
	while(alarm[0] = -1){
		alarm[0] = 6000;
		turnList[i].index = i;
		turnList[i].state = "Choose Attack";
	}
	if(turnList[i].state == "Battle"){
		alarm[0] = -1;
		i++;
	}
	if(i >= enemyLen){
		i=0;
		state = "P1";
		Player1.actions++;
	}
	#endregion
		break;
		
	case "End Battle":
		mainEnemy.state = "Defeated";
	
		break;
	
	case "Pause":
	
	
		break;
}
//cout(id);
//cout(state);
//cout(mainEnemy);