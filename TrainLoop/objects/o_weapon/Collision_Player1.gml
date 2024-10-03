if(z_axis(Player1, 0)){
	state = "Idle";
	array_push(Player1.weapon_inventory, self);
	if(spr != 0){
		create_popup("WEAPON - " + item + " (" + type+ ")", flavor_txt, spr, 200);
	}
	instance_deactivate_object(self);
	x = -1;
	y = -1;
	audio_play_sound(a_item_get, 5, 0);
}