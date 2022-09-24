function air_attack() {
	if input.attack and input.right and image_xscale == 1 and not input.left and not input.up and not input.down
			{
				state = "F Air Attack";	
			}
		
		if input.attack and input.right and image_xscale == -1 and not input.left and not input.up and not input.down
			{
				state = "B Air Attack";	
			}
	
		if input.attack and input.left and image_xscale == -1 and not input.right and not input.up and not input.down
			{
				state = "F Air Attack";	
			}
		
		if input.attack and input.left and image_xscale == 1 and not input.right and not input.up and not input.down
			{
				state = "B Air Attack";	
			}
		
		if input.attack and input.down and not input.up
			{
				state = "D Air Attack";	
			}
		
		if input.attack and input.up and not input.down
			{
				state = "U Air Attack";	
			}
		
		if input.attack and move = 0 and not input.up and not input.down
			{
				state = "N Air Attack";
			}
		
		if input.attack_alt and input.up and not input.down
			{
				state = "U Special";
			}
		
		if input.attack_alt and input.down and not input.up
			{
				state = "D Special";
			}
		
		if input.attack_alt and input.left and not input.down and not input.right and not input.up
			{
			if point_distance(x, y, o_tether_point.x, o_tether_point.y) <= 256
				{
					state = "Tether";
				}
				else
					{
					state = "F Special Air";
					}
			}
		
		if input.attack_alt and input.right and not input.down and not input.up and not input.left and state != "Tether"
			{
			if point_distance(x, y, o_tether_point.x, o_tether_point.y) <= 256
				{
					state = "Tether";
				}
				else
					{
					state = "F Special Air";
					}
			}
		
		if input.attack_alt and not input.up and not input.down and not input.right and not input.left
			{
				state = "N Special";
			}
		
			//state == "F Air Attack" and not state == "B Air Attack"	and not state == "D Air Attack" and not	state == "U Air Attack" and not	state == "N Air Attack" and not state == "D Special" and not state == "Tether" and not state == "F Special Air" and not state == "N Special"


}
