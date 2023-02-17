if(other.id == target){	
	
	create_hitbox(x, y, creator, s_bone, 1, 1, 2, damage, "None", 0, image_xscale);
	instance_destroy(self);
}