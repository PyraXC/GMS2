switch(state)
{
	case("Chase"):
		#region Chase
	if not instance_exists(obj_skeleton) break;
	
	if place_meeting(x, y, obj_skeleton) and obj_skeleton.state != "Roll" and attacked == false or place_meeting(x, y, obj_skeleton2) and obj_skeleton2.state != "Roll" and attacked == false {
			create_hitbox(x, y, self, sprite_index, knockback, 1, damage, image_xscale);
			attacked = true;
		}
		
	if attacked == true {
			vspeed = -1;
		}
		#endregion
		break;
		
	case ("Death"):
	#region Death
	repeat(6)
		{
			instance_create_layer(x+random_range(-4, 4), y-16+random_range(-4,4),"Effects", o_feather);
		}
		instance_destroy();
	#endregion
	break;
}