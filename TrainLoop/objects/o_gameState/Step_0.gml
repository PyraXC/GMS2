switch(state){
	case "Overworld":
	turnList = [];
	i = 0;
	enemyLen = 0;
	alarm[0] = -1;

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
	//Player
	//test_run_all();
	if effects == 0{
		status_effect(Player1, Player1.status);
		effects++;
		if Player1.hp <= 0{Player1.state = "Death";}
		if Player1.status_turns == 0{
			Player1.status = "None";
		}
	}
	if(!instance_exists(o_hud)){
		instance_create_layer(Player1.x, Player1.y, "Instances", o_hud);	
	}
	if(enemyLen == 0){
		alarm[1] = 300;
		state = "End Battle";
	}
	#endregion
		break;

	case "Enemy":
	if(!instance_exists(o_hud)){
		instance_create_layer(Player1.x, Player1.y, "Instances", o_hud);	
	}
	if(enemyLen == 0){
		alarm[1] = 300;
		state = "End Battle";
		break;
	}
	//cout("Enemy Phase");
	#region Enemy Turn
	Player1.actions = 0;
	Player1.item_actions = 0;
	effects = 0;
	if(turnList[i].state != "Death"){
		while(alarm[0] = -1){
			alarm[0] = 6000;
			turnList[i].index = i;
			if turnList[i].status_turns == 0{
				turnList[i].status = "None";
			}
			status_effect(turnList[i], turnList[i].status);
			if(turnList[i].hp <= 0){
				turnList[i].state = "Death";
			}
			if(turnList[i].status != "Topple"){
				turnList[i].state = "Choose Attack";
			}
			else{
				alarm[0] = -1;
				i++;
				if(i >= enemyLen){
					i=0;
					state = "P1";
					Player1.actions++;
					Player1.item_actions++;
					exit;
				}
			}
		}
	}
	if(turnList[i].state == "Battle"){
		alarm[0] = -1;
		i++;
	}
	if(i >= enemyLen){
		i=0;
		state = "P1";
		Player1.actions++;
		Player1.item_actions++;
	}
	#endregion
		break;
		
	case "End Battle":
	if(alarm[1] = -1){
		win_battle();
		mainEnemy.state = "Defeated";
		//cout("Won");
	}
		break;
	
	case "Pause":
	
	
		break;
}
//cout(id);
//cout(state);
//cout(mainEnemy);
//cout(enemyLen);
//cout(i);