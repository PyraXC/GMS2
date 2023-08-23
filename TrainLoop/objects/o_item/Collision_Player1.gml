if(z_axis(Player1, width)){
	state = "Idle";
	if(spr == s_coins){
	Player1.money += damage;
	}else{
	array_push(Player1.item_inventory, self);
	}
	instance_deactivate_object(self);
	x = -1;
	y = -1;
	audio_play_sound(a_item_get, 5, 0);
}