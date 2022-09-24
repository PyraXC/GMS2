function get_input2() {
	right2 = keyboard_check(vk_numpad6);
	left2 = keyboard_check(vk_numpad4);

	//Holding Roll or Attack
	roll2 = keyboard_check(vk_enter);
	attack2 = keyboard_check_pressed(vk_add);
	attack_alt2 = keyboard_check_pressed(vk_subtract);
	taunt2 = keyboard_check_pressed(vk_multiply);


}
