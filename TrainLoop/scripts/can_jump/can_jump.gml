// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function can_jump(){
	if input.jump
		{
		if run_speed == max_run_speed
			{
				jump_speed += 2;
			}
			jump_input = 1;
			state = "Jump";
		}
}