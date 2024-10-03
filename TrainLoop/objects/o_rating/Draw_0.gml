var color = c_white;
switch(rating){
	case 0: //Perfect
		color = c_yellow;
		break;
	case 1: // Good
		color = c_teal;
		break;
	case 2: //Miss
		color = c_red;
		break;
}

draw_sprite_ext(s_rating, rating, x, y, 1, 1, 0, color, alpha);
