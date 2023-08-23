///@arg Category "Stabs"...
function attack_sprite(argument0){
	ini_open("attack_spritemaps.ini");
	var map = ds_map_create();
	ds_map_read(map, ini_read_string(argument0, argument0, "UNDEFINED"));
	ini_close();
	var spr =ds_map_find_value(map, weapon.item);
	ds_map_destroy(map);
	return spr;
	
}