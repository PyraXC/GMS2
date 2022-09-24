if creator == noone or creator == other or ds_list_find_index(hit_objects, other) != -1
{
	exit;
}

if creator.object_index == obj_skeleton && other.object_index == obj_skeleton2 exit;
if creator.object_index == obj_skeleton2 && other.object_index == obj_skeleton exit;

if creator.object_index == o_wizard && o_wizard.state == "Fireball Attack"
{
	if obj_skeleton.state == "Roll" {exit;}
}

other.hp -= damage;
audio_play_sound(a_medium_hit, 4, false);

repeat (10)
{
	instance_create_layer(other.x, other.y-20, "Effects", o_hit_effect);
}

if instance_exists(obj_skeleton)
{
	if creator.object_index == obj_skeleton && other.hp <= 0 and other.state != "Death"
	{
		obj_skeleton.kills += 2;	
	}
	
	if other.object_index == obj_skeleton or other.object_index == obj_skeleton2
	// Hit player
	{
		add_screen_shake(4, 10);
	
	if other.hp <= 0
		{
		var number = sprite_get_number(s_skeleton_bones);
		for(var i=0; i<number; i++) 
		{
			var bx = other.x + random_range(-8,8);
			var by = other.y + random_range(-24,8);
			var bone = instance_create_layer(bx, by, "Instances", o_skeleton_bone);
			bone.direction = 90 - (image_xscale * random_range(30, 60));
			bone.speed = random_range(3, 10);
			bone.image_index = i;
			if i == 5 bone.image_angle = 130;
		}
			
			ini_open("save.ini")
			ini_write_real("Scores", "Kills", other.kills);
			var highscore = ini_read_real("Scores", "highscore", 0);
			if other.kills > highscore
				{
					ini_write_real("Scores", "highscore", other.kills);
				}
			ini_close();
		}
	}
	else
	{
		other.alarm[0] = 120;
		add_screen_shake(2, 5);
	}	
}
ds_list_add(hit_objects, other);
if other.state != "Death" and other.object_index != o_boss and other.object_index != o_wizard
{
other.state = "Knockback";
}
other.knockback_speed = knockback * image_xscale;
