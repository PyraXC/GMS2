event_inherited();
if durability <= 0{
	array_delete(Player1.weapon_inventory, index, 1);
	instance_destroy(self);
	Player1.equip = Player1.weapon_inventory[0];
}
cout("exists");