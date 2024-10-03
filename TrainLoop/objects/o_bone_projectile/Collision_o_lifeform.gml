//cout("Collision: " + string(other.id));
if(other.id == target.id){
	if(z_axis(other, 0)){
		create_hitbox(x+(8 * -sign(x-target.x)), y, creator, s_bone_damage, 0, 0, 10, damage, "None", 100, image_xscale, z, 5, 1);
		audio_play_sound(a_swipe, 1, 0);
		creator.wait = 0;
		instance_destroy(self);
	}
}else{
	exit;
}