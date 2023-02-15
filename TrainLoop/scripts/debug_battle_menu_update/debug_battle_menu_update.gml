// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function debug_battle_menu_update(){
	ds_list_clear(widthList)
for(var i = 0; i < array_length(option[menu_level]); i++){
	ds_list_add(widthList, string_width(option[menu_level][i]));
}
	ds_list_sort(widthList,0);
	
	var arry = [];/*
for(var i = 0; i < array_length(Player1.weapon_inventory);i++;){
	temp = Player1.weapon_inventory[i];
	instance_activate_object(temp);
	//instance_activate_object(temp);
	array_push(arry, temp.weapon);
	temp.index = i;
}
	option[1] = arry;
	arry = [];
//setting
for(var i = 0; i < array_length(Player1.item_inventory);i++;){
	temp = Player1.item_inventory[i];
	instance_activate_object(temp);
	//instance_activate_object(temp);
	array_push(arry, temp.item);
	temp.index = i;
}
	option[2] = arry;*/
	arry = [];
for(var i = 0; i < array_length(Player1.attack_list);i++;){
	option[6, i] = Player1.attack_list[i];
}
if(target != noone){
	arry = [];
	for(var i = 0; i < array_length(o_battle_debug_menu.target.attack_list);i++;){
		option[7, i] = o_battle_debug_menu.target.attack_list[i];
		//cout("attack " + string(i)); 
	}
	option[1,0]=("HP "+string(target.hp));
	option[1,1] = ("Def "+string(target.defend));
	option[1,2] =("Drops "+string(target.drop_list));
	option[1,3] =("Xp "+string(target.xp));
	option[1,4] =("Status Left "+string(target.status_turns));
}

}
