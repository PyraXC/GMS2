function get_input() {
	right = keyboard_check(ord("D"));
	left = keyboard_check(ord("A"));
	down = keyboard_check(ord("S"));
	up = keyboard_check(ord("W"));
	attack = keyboard_check_pressed(ord("J"));
	defend = keyboard_check_pressed(ord("K"));
	run = keyboard_check(vk_shift);
	jump = keyboard_check_pressed(vk_space);
	pause = keyboard_check_pressed(vk_escape);

	
	/*r = keyboard_check_pressed(ord("D"));
	l = keyboard_check_pressed(ord("A"));
	d = keyboard_check_pressed(ord("S"));
	u = keyboard_check_pressed(ord("W"));
	j = keyboard_check_pressed(vk_space);
	a = keyboard_check_pressed(ord("J"));
	rn = keyboard_check_pressed(vk_shift);
	df = keyboard_check_pressed(ord("K"));*/
}
