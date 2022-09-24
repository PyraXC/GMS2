function get_input_2() {
	right = keyboard_check(vk_right);
	left = keyboard_check(vk_left);
	down = keyboard_check(vk_down);
	up = keyboard_check(vk_up);
	shield = keyboard_check(ord("I"));
	jump = keyboard_check_pressed(vk_numpad0);
	attack = keyboard_check_pressed(vk_add);
	attack_alt = keyboard_check_pressed(vk_enter);
	buddy = keyboard_check(ord("G"));


}
