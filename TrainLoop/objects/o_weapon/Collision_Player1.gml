if(z_axis(Player1, width)){
	state = "Idle";
	array_push(Player1.weapon_inventory, self);
	instance_deactivate_object(self);
	x = -1;
	y = -1;
	audio_play_sound(a_item_get, 5, 0);
}