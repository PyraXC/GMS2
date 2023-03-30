if(z_axis(Player1, 10)){
	state = "Idle";
	if(spr == s_coins){
	Player1.money += damage;
	}else{
	array_push(Player1.item_inventory, self);
	}
	instance_deactivate_object(self);
	x = -1;
	y = -1;
}