global.weapon_list = [o_katana, o_knife, o_unarmed];
global.item_list = [o_bone, o_health_potion, o_extra_action];
///@arg drop list
///@arg drops
function drop_item(argument0, argument1){
	drop_list = argument0;
	drops = argument1;
	for(var i = 0; i < drops; i++){
		rng = irandom_range(0, array_length(drop_list)-1);
//		drop += drop_list[rng];
		drop = instance_create_layer(x, y, "Instances", drop_list[rng]);
		drop.state = "Drop";
		drop.alarm[0] = 60;
		array_delete(drop_list, rng, 1);
	}	
}
///@arg drop list
///@arg pos
///@arg delete??
function drop_specific_item(argument0, argument1, argument2){
	drop_list = argument0;
	pos = argument1;
	del = argument2;
	drop = instance_create_layer(x, y, "Instances", drop_list[pos]);
	drop.state = "Drop";
	if(del){
		array_delete(drop_list, pos, 1);
	}
}