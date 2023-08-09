var color = c_red;
if(crit){
	color = c_yellow;
}
switch(status){
	case "Fire":
	color = c_orange;
		break;
	case "Bleed":
	color = c_maroon;
		break;

}
draw_sprite_ext(s_damage_indicator, damage, x, y, 1, 1, 0, color, alpha);
