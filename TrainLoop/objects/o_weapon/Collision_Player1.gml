if(z_axis(Player1, 10)){
	state = "Idle";
	array_push(Player1.weapon_inventory, self);
	instance_deactivate_object(self);
	x = -1;
	y = -1;
}