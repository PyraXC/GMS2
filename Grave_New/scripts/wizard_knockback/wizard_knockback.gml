function wizard_knockback() {
	move_and_collide(knockback_speed, 0);
	var knockback_friction = 1.5;
	knockback_speed = approach(knockback_speed, 0 , knockback_friction);
}
