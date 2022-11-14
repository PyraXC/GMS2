switch(state){
	case "Drop":
	item_move(xspeed, yspeed);
	image_angle += rot;
		break;
		
	case "Collect":
		if(o_gameState.state == "End Battle"){
		}
		break;
}