// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function battle_menu_update(){
	ds_list_clear(widthList)
for(var i = 0; i < array_length(option[menu_level]); i++){
	ds_list_add(widthList, string_width(option[menu_level][i]));
}
	ds_list_sort(widthList,0);
	
	var arry = [];
for(var i = 0; i < array_length(Player1.weapon_inventory);i++;){
	temp = Player1.weapon_inventory[i];
	//instance_activate_object(temp);
	//instance_activate_object(temp);
	array_push(arry, temp.item);
	temp.index = i;
}
	option[1] = arry;
	arry = [];
//setting
for(var i = 0; i < array_length(Player1.item_inventory);i++;){
	temp = Player1.item_inventory[i];
	//instance_activate_object(temp);
	//instance_activate_object(temp);
	array_push(arry, temp.item);
	temp.index = i;
}
	option[2] = arry;
	arry = [];
for(var i = 0; i < array_length(Player1.fish_inventory); i++;){
	option[3, i] = Player1.fish_inventory[i].nme;
}
//for(var i = 0; i < array_length(Player1.attack_list);i++;){
	array_resize(option[4], 0);
	var type = Player1.weapon.type;
	//cout("Type " + type);
	var val = array_get_index(Player1.attack_list_n, type);
	for(var i = 0; i < array_length(Player1.attack_list[val]); i++){
		//cout("Val " + string(val) + " i " + string(i));
		//cout(Player1.attack_list[val][i]);
		array_set(option[4], i, Player1.attack_list[val][i]);
	}

//}

}