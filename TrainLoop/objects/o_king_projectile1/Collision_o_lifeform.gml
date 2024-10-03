if(other.id == target.id){
	if(z_axis(other, 0)){
		create_hitbox(x-xspeed, y, creator, s_skeleton_king_projectile1_damage, 1, 1, 2, 3, "Fire", 40, image_xscale, z, 5, 0);
		audio_play_sound(a_medium_hit, 1, 0);
		creator.wait = 0;
		target.wait = 0;
		instance_destroy();
	}
}else{
	exit;	
}