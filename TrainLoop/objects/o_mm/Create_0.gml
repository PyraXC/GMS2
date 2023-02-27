global.font_main = font_add_sprite(f_one, 32, true, 1);
pos = 0;
width = 60;
height = 50;
op_border = 12;
op_space = 18
//pause
option[0,0] = "Start Game";
option[0, 1] = "Weapons";
option[0, 2] = "Settings";
option[0, 3] = "Quit Game";
//equip
option[1,0] = "Slot One";
option[1,1] = "Slot Two";
option[1,2] = "Slot Three";
option[1,3] = "Back";
//setting
option[2,0] = "Brightness";
option[2,1] = "Controls";
option[2,2] = "????";
option[2,3] = "Back";

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

op_length = 0;
menu_level = 0;
