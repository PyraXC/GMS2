// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
///argument0
///argument1
function drop_item(argument0, argument1){
	drop_list = argument0;
	drops = argument1;
//	drop = [];
	rng = irandom_range(0, array_length(drop_list));
	for(var i = 0; i < drops; i++){
//		drop += drop_list[rng];
		drop = instance_create_layer(x, y, "Instances", drop_list[rng]);
		drop.state = "Drop";
		array_delete(drop_list, rng, 1);	
	}	
}