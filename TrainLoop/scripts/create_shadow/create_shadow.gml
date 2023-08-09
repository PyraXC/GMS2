///@arg size
///@arg owner
///@arg y
///@arg z
function create_shadow(argument0, argument1, argument2, argument3){
	var shadow = instance_create_layer(x, argument2, "Instances", o_shadow);
	shadow.sz = argument0;
	shadow.owner = argument1;
	shadow.z = argument3;
}