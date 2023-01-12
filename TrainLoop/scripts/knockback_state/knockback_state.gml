///@arg knockback_sprite
///@arg next_state
function knockback_state(argument0, argument1) {
	var knockback_sprite = argument0;
	var next_state = argument1;
	dodge();
	set_state_sprite(knockback_sprite, 1, 0);
	if animation_end()
		{
			state = next_state;
		}
}
