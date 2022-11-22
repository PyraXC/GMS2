event_inherited();
//cout("exists");
switch(state){
	case "Idle":
	set_state_sprite(s_empty, 0, 0);
		break;
		
	case "Collect":
	set_state_sprite(sprite, 1, 0);
	x = approach(x, Player1.x, 2);
	y = approach(y, Player1.y-16, 2);
		break;
}
