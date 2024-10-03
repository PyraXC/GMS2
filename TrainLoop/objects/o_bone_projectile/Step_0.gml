if instance_exists(target){
	if(signal){
		signal = 0;
		hsp = hsp * creator.facing * spd;
		target_y = target.iy - target.sprite_height/2;
		var distX = abs(x - target.ix);
		var distY = -abs(y - target_y);
		var distZ = z - target.z;
		vsp = distY / (distX/-abs(hsp));
		zsp = distZ / (distX/-abs(hsp));
		//cout(zsp);
	}
	y += vsp;
	x += hsp;
	z += zsp;
}
image_speed = spd;
image_xscale = creator.facing;