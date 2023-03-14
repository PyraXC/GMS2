if(other.id == target){	
	create_hitbox(x+(8 * -sign(x-target.x)), y, creator, s_bone_damage, 0, 0, 10, damage, "None", 100, image_xscale);
	instance_destroy(self);
}
else{
	exit;
}