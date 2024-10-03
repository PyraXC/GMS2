function card_builder(){
	switch(size){
		case "large":
			draw_set_font(f_one_card);
			//Draw card
			draw_sprite_ext(s_oj_card_back, 0, x, y, image_xscale, image_yscale, 0, col, 1);
			//Draw Name
			draw_text_color(x+12, y+12, name, col, col, col, col, 1);
			//Draw Flavor Text
			draw_text_color(x+12, y+188, txt, col, col, col, col, 1);
			break;
			
		case "small":
			draw_set_font(f_one_tiny);
			//Draw card
			draw_sprite_ext(s_oj_card_back_sm, 0, x, y, image_xscale, image_yscale, 0, col, 1);
			//Draw Name
			draw_text_color(x+3, y+3, name, col, col, col, col, 1);
			//Draw Flavor Text
			draw_text_color(x+3, y+47, txt, col, col, col, col, 1);
			break;
		
		
		
	}
	
}