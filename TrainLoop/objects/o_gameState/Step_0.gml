if(keyboard_check(vk_enter)){
	game_set_speed(6, gamespeed_fps);
}else{
	game_set_speed(60, gamespeed_fps)
}


switch(state){
	case "Overworld":
	turnList = [];
	turn = noone;
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
		o_camera.state = "Battle";
		/*for(var j = array_length(enemies)-1; j >= 0 ; j--;){
			enemy = enemies[j];
			instance_create_layer(Player1.x +384 + 96*j, Player1.y, "Instances", enemy);//set enemy spawns
		}
		with(enemy){
			ix = x;
			iy = y;
			state = "Battle";
			array_push(o_gameState.turnList, id);
			index = o_gameState.i;
			o_gameState.i++;
			}*/
			place_enemies();
			i=0;
		with(Player1){
			state = "Battle";
			ix = x;
			iy = y;
			iz = z;
			for(var j = 0; j < array_length(weapon_inventory); j++;){
				instance_activate_object(weapon_inventory[j]);
			}
			for(var j = 0; j < array_length(item_inventory); j++;){
				instance_activate_object(item_inventory[j]);
			}
		}
		//cout(turnList);
		if(turn == "Enemy"){//Enemy Initiates
			alarm[1] = 45;//Delay before attacking player
			state = "Noone";
		}
		else{//Player Initiates
			state = turn;
		}
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
		alarm[2] = 200;
		state = "End Battle";
	}
	#endregion
		break;

	case "Enemy":
	if(!debug){
	if(!instance_exists(o_hud)){
		instance_create_layer(Player1.x, Player1.y, "Instances", o_hud);	
	}
	if(enemyLen == 0){//All enemies dead end battle
		alarm[2] = 200;
		state = "End Battle";
	}
	#region Enemy Turn
	Player1.actions = 0;
	Player1.item_actions = 0;
	effects = 0;

	if(turnList[i].state != "Death"){
		while(enemyturn == 0 && drop_onscreen == 0){//Loop through enemies
			enemyturn = 1;//Enemy turn begins
			turnList[i].index = i;//Set index of enemy to match order of Gamestate
			if turnList[i].status_turns == 0{//Clear status if wears off
				turnList[i].status = "None";
			}
			status_effect(turnList[i], turnList[i].status);//Afflict status effects
			if(turnList[i].hp <= 0){
				turnList[i].state = "Death";
			}
			if(turnList[i].status != "Topple"){//Skip if toppled
				turnList[i].state = "Turn"; //Set enemy turn
				//cout(string(turnList[i]) + " turn");
				turnList[i].turn = "Turn";
			}
			else{//go next
				enemyturn = 0;
				i++;
				if(i >= enemyLen){//if no more enemies in list P1 turn
					i=0;
					state = "P1";
					Player1.actions++;
					Player1.item_actions++;
					exit;
				}
			}
		}
	}
	if(turnList[i].turn == "Over"){
		//cout(string(turnList[i]) + " turn ended");
		enemyturn = 0;
		turnList[i].turn = "";
		i++;
		if(i >= enemyLen){//if no more enemies in list P1 turn
					i=0;
					state = "P1";
					Player1.actions++;
					Player1.item_actions++;
					exit;
				}
	}

	/*if(turnList[i].state == "Battle"){//If enemy has finished turn go next
		alarm[0] = -1;
		i++;
	}
	if(i >= enemyLen){
		i=0;
		state = "P1";
		Player1.actions++;
		Player1.item_actions++;
	}*/
	}
	#endregion
		break;
		
	case "End Battle":
	if(alarm[2] == -1){
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
//cout(mainEnemy.state);
//cout(enemyLen);
//cout(enemyturn);
//cout("Drop " + string(drop_onscreen));
//cout(state);
//cout(turnList);
//cout(i);