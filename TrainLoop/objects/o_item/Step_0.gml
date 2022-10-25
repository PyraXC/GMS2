event_inherited();
if durability <= 0{
	array_delete(Player1.item_inventory, index, 1);
	instance_destroy(self);
	//Player1.item = Player1.item_inventory[0];
	cout(item + " Broke");
}
switch(state){
	case "Drop":
	item_move(xspeed, yspeed);
		break;
		
	case "Collect":
	approach(x, Player1.x, 4);
	approach(y, Player1.y, 4);
		break;
}