if(z_axis(Player1, 0)){
	state = "Idle";
	if(spr == s_coins){
		Player1.money += damage;
	}else{
		array_push(Player1.item_inventory, self);
		create_popup("ITEM - " + item, flavor_txt, spr, 200);
	}
	if(o_gameState.state != "Overworld"){
		o_gameState.drop_onscreen--;	
	}
	instance_deactivate_object(self);
	x = -1;
	y = -1;
	audio_play_sound(a_item_get, 5, 0);
}