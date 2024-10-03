if(z_axis(other, 0)){
	state = "Reflected";
	target = creator;
	creator = Player1;
	xspeed = -xspeed * 1.5;
	image_xscale = -image_xscale;
	other.state = "Reflected";
}