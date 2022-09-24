///@arg knockback_sprite
///@arg next_state
function knockback_state(argument0, argument1) {
	var knockback_sprite = argument0;
	var next_state = argument1;

	if image_xscale == 0 {image_xscale = 1;}
	if !place_meeting(x, y+vsp, o_wall)
		{
			vsp += grav;
		}
	if(place_meeting(x, y+vsp, o_wall))
		{
			while(!place_meeting(x, y+sign(vsp), o_wall))
			{
				y += sign(vsp); 
			}
			vsp = 0; 
		}
	if (vsp > 15) vsp = 15;

	set_state_sprite(knockback_sprite, 0, 0);
	image_xscale = -sign(knockback_speed);
	
	move_and_collide(knockback_speed, vsp+(knockback_speed_y));
	var knockback_friction = 0.75;
	var knockback_friction_y = 0.75;
	knockback_speed = approach(knockback_speed, 0 , knockback_friction);
	knockback_speed_y = approach(knockback_speed_y, 0, knockback_friction_y);
	if knockback_speed == 0
		{
			state = next_state;
		}


}
