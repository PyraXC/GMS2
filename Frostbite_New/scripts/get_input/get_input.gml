function get_input() {
	right = keyboard_check(ord("D"));
	left = keyboard_check(ord("A"));
	down = keyboard_check(ord("S"));
	up = keyboard_check(ord("W"));
	run = keyboard_check(vk_shift);
	shield = keyboard_check(ord("I"));
	jump = keyboard_check_pressed(vk_space);
	grab = keyboard_check_pressed(ord("U"));
	ability = keyboard_check_pressed(ord("O"));
	buddy = keyboard_check(ord("P"));
	slash = keyboard_check_pressed(ord("K"));
	kick = keyboard_check_pressed(ord("J"));
	punch = keyboard_check_pressed(ord("H"));
	heavy = keyboard_check_pressed(ord("L"));
	
	r = keyboard_check_pressed(ord("D"));
	l = keyboard_check_pressed(ord("A"));
	d = keyboard_check_pressed(ord("S"));
	u = keyboard_check_pressed(ord("W"));
}
