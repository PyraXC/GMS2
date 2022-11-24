function show_status(){
	if status == "None"{exit;}
	if(status == "Break"){
		draw_sprite(s_break, 0, x, y - (sprite_height + 16));
	}
	if(status == "Topple"){
		draw_sprite(s_topple, 0, x, y - (sprite_height + 16));
	}
	if(status == "Bleed"){
		draw_sprite(s_bleed, 0, x, y - (sprite_height + 16));
	}
}