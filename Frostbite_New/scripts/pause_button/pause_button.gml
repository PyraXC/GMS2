function pause_button() {
	if keyboard_check_pressed(vk_escape) 
	{
		if global.pause == 0
			{
				global.pause = 1;
			}
		else
			{
				global.pause = 0;
			}
	}


}
