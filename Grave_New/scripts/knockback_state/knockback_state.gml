///@arg knockback_sprite
///@arg next_state
function knockback_state(argument0, argument1) {
	var knockback_sprite = argument0;
	var next_state = argument1;

	set_state_sprite(knockback_sprite, 0, 0);
	image_xscale = -sign(knockback_speed);
	move_and_collide(knockback_speed, 0);
	var knockback_friction = 0.75;
	knockback_speed = approach(knockback_speed, 0 , knockback_friction);
	if knockback_speed == 0
				{
					state = next_state;
				}


}
