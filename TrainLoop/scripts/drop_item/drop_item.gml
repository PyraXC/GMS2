global.weapon_list = [o_katana, o_knife, o_unarmed, o_king_sword];
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
		o_gameState.drop_onscreen += 1;
		drop.alarm[0] = 40;
		array_delete(drop_list, rng, 1);
	}	
}

///@arg item
///@arg delete??
function drop_specific_item(argument0, argument1){
	search = argument0;
	del = argument1;
	index = array_get_index(drop_list, search);
	drop = instance_create_layer(x, y, "Instances", drop_list[index]);
	drop.state = "Drop";
	o_gameState.drop_onscreen += 1;
	drop.alarm[0] = 60;
	if(del){
		array_delete(drop_list, index, 1);
	}
}