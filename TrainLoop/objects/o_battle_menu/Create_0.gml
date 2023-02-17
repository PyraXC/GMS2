global.font_main = font_add_sprite(f_one, 32, true, 1);
pos = 0;
width = 100;
widthList = ds_list_create();
height = 60;
op_border = 10;
op_space = 20;
target = Player1.target;
//pause
vy = 0;
vx=0;
option[0,0] = "Attack";
option[0, 1] = "Equipment";
option[0, 2] = "Items";
option[0, 3] = "Run";
//equip
/*
for(var i = 0; i < array_length(Player1.weapon_inventory);i++;){
	//temp = instance_create_layer(x, y, "Instances", Player1.weapon_inventory[i]);
	temp = Player1.weapon_inventory[i];
	option[1, i] = temp.weapon;
	temp.index = i;
}
//setting
for(var i = 0; i < array_length(Player1.item_inventory);i++;){
	//instance_create_layer(x, y, "Instances", Player1.item_inventory[i]);
	option[2, i] = Player1.item_inventory[i].item;
}
//Run
option[3,0] = "Running";
//Attacks
for(var i = 0; i < array_length(Player1.attack_list);i++;){
	option[4, i] = Player1.attack_list[i];
}


	menu[0, 0] = "AD/Left Right To Move";
	menu[0, 1] = "J/Space To Roll";
	menu[0, 2] = "S/Down To Heal";
	menu[0, 3] = "K To Attack";
	menu[0, 4] = "L To Attack Alt";
	menu[0, 5] = "ESC To Pause";
	menu[0, 6] = "Advanced";
	menu[0, 7] = "   vvv";
	
	menu[1, 0] = "   ^^^";
	menu[1, 1] = "Mechanics:";
	menu[1, 2] = "Turnaround: Change Direction";
	menu[1, 3] = "Before Final String Hit";
	menu[1, 4] = "Roll Cancel: Attacks Can Be";
	menu[1, 5] = "Canceled At The Startup/End";
	menu[1, 6] = "Roll Cancel -> Finisher:";
	menu[1, 7] = "The Second Attack String Can";
	menu[1, 8] = "Be Roll Canceled, Attacking";
	menu[1, 9] = "After Roll Finishes String";
	menu[1, 10] = "   vvv";

	
	controls[0] = "Attack Strings:";
	controls[1] = " 1-> 1-> 1";
	//controls[2] = "1-> 2-> 1";
	controls[3] = "1-> 1-> 2";
	controls[4] = "2-> 2-> 2";
	controls[5] = "2-> 1-> 2";
	controls[6] = "2-> 2-> 1";
*/
op_length = 0;
menu_level = 0;
lr = 0;