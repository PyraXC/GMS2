// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function battle_menu_update(){
	var arry = [];
for(var i = 0; i < array_length(Player1.weapon_inventory);i++;){
	temp = Player1.weapon_inventory[i];
	array_push(arry, temp.weapon);
	temp.index = i;
}
	option[1] = arry;
	arry = [];
//setting
for(var i = 0; i < array_length(Player1.item_inventory);i++;){
	temp = Player1.item_inventory[i];
	array_push(arry, temp.item);
	temp.index = i;
}
	option[2] = arry;
	arry = [];
for(var i = 0; i < array_length(Player1.attack_list);i++;){
	option[4, i] = Player1.attack_list[i];
}
}