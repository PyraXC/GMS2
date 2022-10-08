if creator == noone or creator == other or ds_list_find_index(hit_objects, other) != -1
	{
		exit;
	}

other.hp -= damage;
other.state = "Knockback";

if instance_exists(Player1)
{
	if creator.object_index == Player1 && other.hp <= 0 and other.state != "Death"
	{
		Player1.kills += 1;	
	}

	if other.object_index == Player1
	// Hit player
	{
		cout("Here");
		add_screen_shake(4, 10);
		o_gameState.turn = "Enemy";
	}

	if other.hp <= 0
	{
			//ini_open("save.ini")
			//ini_write_real("Scores", "Kills", other.kills);
			//var highscore = ini_read_real("Scores", "highscore", 0);
			//if other.kills > highscore
			//	{
			//		ini_write_real("Scores", "highscore", other.kills);
			//	}
			//ini_close();
		}
	else
	{
		other.alarm[0] = 120;
		add_screen_shake(2, 5)
	}	
}
	
ds_list_add(hit_objects, other);
if other.state != "Death" and other.object_index != o_boss
{
other.state = "Knockback";
}
other.knockback_speed = knockback * image_xscale;
other.knockback_speed_y = knockback_y;
