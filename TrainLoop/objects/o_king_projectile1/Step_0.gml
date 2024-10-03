switch(state){
	case "Moving":
		x -= xspeed;
		break;
		
	case "Reflected":
		x -= xspeed;
		/*if(place_meeting(x-xspeed, y, target)){
			if(z_axis(other, 0)){
				create_hitbox(x-xspeed, y, creator, s_skeleton_king_projectile1_damage, 1, 1, 2, 3, "Fire", 40, image_xscale, z, 5, 0);
				audio_play_sound(a_medium_hit, 1, 0);
				target.wait = 0;
				instance_destroy();
			}
		}*/
		break;
}
if(x <= Player1.x - 256){instance_destroy(); creator.wait = 0;}//missed and didn't hit a wall