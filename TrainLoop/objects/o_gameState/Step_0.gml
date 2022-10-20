switch(state){
	case "Overworld":
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
		while(array_length(enemies) != 0){
			enemy = array_pop(enemies);
			instance_create_layer(Player1.x + 256 + 96 * array_length(enemies), Player1.y, "Instances", enemy);
		}
		with(enemy){
			ix = x;
			iy = y;
			state = "Battle";
			array_push(o_gameState.turnList, id);
			}
		with(Player1){
			state = "Battle";
			ix = x;
			iy = y;
			for(var j = 0; j < array_length(weapon_inventory); j++;){
				instance_activate_object(weapon_inventory[j]);
			}
		}
		state = turn;
	#endregion
		break;
		
	case "P1":
	#region Player Turn
	#endregion
		break;
		
	case "Enemy":
	//cout("Enemy Phase");
	#region Enemy Turn
	Player1.actions = 0;
	while(alarm[0] = -1){
		alarm[0] = 6000;
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
		
	case "Pause":
	
	
		break;
}
//cout(id);

;