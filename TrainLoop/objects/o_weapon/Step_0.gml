event_inherited();
if durability <= 0{
	array_delete(Player1.weapon_inventory, index, 1);
	instance_destroy(self);
	Player1.weapon = Player1.weapon_inventory[0];
	cout(weapon + " Broke");
}
switch(state){
	case "Drop":
	item_move(xspeed, yspeed);
		break;
		
	case "Idle":
	set_state_sprite(s_empty, 1, 0);
	break;
		
	case "Collect":
	x = approach(x, Player1.x, 10);
	y = approach(y, Player1.y-16, 10);
		break;
}
//cout(state);