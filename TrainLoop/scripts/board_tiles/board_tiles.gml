///
function board_tiles(argument0){
	var tile = argument0;
	switch(tile){
		case "Blank":
		cout("Nothing happens");
			break;

		case "Home":
		#region Home Space
		cout("HOME FREE");
		hp+=1;
		switch(win_con){
			case "STARS":
				if(stars >= STARS[level]){
					level++;
					exit;
				}
				break;
				
			case "WINS":
				if(wins >= WINS[level]){
					level++;
					exit;
				}
				break;
		}
			
			break;
			#endregion

		case "Green":
		#region Draw Card
		
			break;
			#endregion
			
		case "Red":
		
			break;			

		case "Yellow":
		
			break;
			
		case "Blue":
		
			break;
	}
}