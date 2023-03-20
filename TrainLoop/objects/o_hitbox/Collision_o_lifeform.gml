if creator == noone or creator == other or ds_list_find_index(hit_objects, other) != -1
	{
		exit;
	}
if creator.object_index == Player1{
	cout("hit");
	other.hp -= floor((damage*crit_chance(creator.weapon.crit)) * other.defend);
	if creator.status == "Fire" && status == "None"{
		calc_status(other, "Fire", 50);
	}else{calc_status(other, status, statrng);}
}
else{
	other.hp -= ceil(damage * other.defend);
	if creator.status == "Fire" && status == "None"{
		calc_status(other, "Fire", 50);
	}else{calc_status(other, status, statrng);}
}
if(other.state != "Defend"){
	other.state = "Knockback";
}
if instance_exists(Player1)
{
	if creator.object_index == Player1{
		Player1.weapon.durability -= 1;
	}
	if creator.object_index == Player1 && other.hp <= 0 and other.state != "Death"
	{
		Player1.kills += 1;	
		other.state = "Death";
	}

	if other.object_index == Player1 && o_gameState.state == "Overworld"
	// Hit player
	{
		add_screen_shake(4, 10);
		o_gameState.turn = "Enemy";
		var transition = instance_create_layer(0, 0, "Instances", o_transition);
		transition.creator = creator; 
		transition.turn = "Enemy";
		/*start_battle(creator);
		array_push(global.obj_list, creator);
		instance_deactivate_object(creator);*/
	}
	if other.object_index == Player1 && (o_gameState.state == "Battle" or o_gameState.state == "Enemy" or o_gameState.state == "P1")
	{
		if other.hp == 0
		{
			other.xp *= 1.5;
			other.state = "Death";
		
			//ini_open("save.ini")
			//ini_write_real("Scores", "Kills", other.kills);
			//var highscore = ini_read_real("Scores", "highscore", 0);
			//if other.kills > highscore
			//	{
			//		ini_write_real("Scores", "highscore", other.kills);
			//	}
			//ini_close();
		}
		else if other.hp < 0{
			other.state = "Death";
		}
		else
		{
			other.alarm[0] = 120;
			add_screen_shake(2, 5)
		}	
	}
}
	
ds_list_add(hit_objects, other);
if other.state != "Death" and other.object_index != o_miniboss
{
other.state = "Knockback";
}
//other.knockback_speed = knockback * image_xscale;
//other.knockback_speed_y = knockback_y;
