if creator == noone or creator == other or ds_list_find_index(hit_objects, other) != -1
	{
		exit;
	}
if creator.object_index == o_stomper && creator.state == "Bite Charge"
	{
		creator.state = "Hit Charge";
	}

if creator.object_index == o_frostbite && other.object_index == o_player_2 exit;
if creator.object_index == o_player_2 && other.object_index == o_frostbite exit;

other.hp -= damage;
other.state = "Knockback";

if instance_exists(o_frostbite)
{
	if creator.object_index == o_frostbite && other.hp <= 0 and other.state != "Death"
	{
		o_frostbite.kills += 1;	
	}

	if other.object_index == o_frostbite or other.object_index == o_player_2
	// Hit player
	{
		add_screen_shake(4, 10);
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
