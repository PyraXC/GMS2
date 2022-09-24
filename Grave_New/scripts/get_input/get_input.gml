function get_input() {
	right = keyboard_check(vk_right);
	left = keyboard_check(vk_left);

	//Holding Roll or Attack
	roll = keyboard_check(vk_space);
	attack = keyboard_check_pressed(ord("T"));
	attack_alt = keyboard_check_pressed(ord("R"));
	heal = keyboard_check_pressed(ord("S"));
	die = keyboard_check_pressed(ord("Q"));

}
