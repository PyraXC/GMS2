function landing_air_attack() {
	if place_meeting(x, y+1, o_wall)
				{
					state = "Move";	
				}
				else
				{
					state = "Jump";
				}


}
