draw_sprite_ext(sprite_index, 0, x, y-draw_z(), image_xscale, image_yscale, 0, c_white, 1);
if(state == "Battle" or state == "Defend" or state == "Dodge" or state == "Reflect"){
	show_status();
}