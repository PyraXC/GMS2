///@arg intensity
///@arg duration
function add_screen_shake(argument0, argument1) {

	var intensity = argument0;
	var duration = argument1;

	if !instance_exists(o_camera) exit;

	with (o_camera)
	{
		screenshake = intensity;
		alarm[0] = duration;
	}


}
