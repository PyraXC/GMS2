if(other.id == target){	
	create_hitbox(x, y, creator, s_bone_damage, 0, 0, 1, damage, "None", 100, image_xscale);
	instance_destroy(self);
}
else{
	exit;
}