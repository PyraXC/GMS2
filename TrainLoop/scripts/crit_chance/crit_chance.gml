// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
///arg0 crit chance
function crit_chance(argument0){
	if(irandom_range(0, 100) < argument0){
		instance_create_layer(x, y-sprite_height, "InstancesTop", o_crit);
		return 1;
	}
	else{
		return 0;
	}
}