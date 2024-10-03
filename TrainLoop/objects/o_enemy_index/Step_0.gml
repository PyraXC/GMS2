//identified = array_contains(index_list, page*2)
if(max_page > 5){ page = 5;}
if(page < 0){ page = 0;}
image_index = page*2 + identified;
draw_sprite(sprite_index, image_index, x, y);
image_speed = 0;
if(keyboard_check_pressed(vk_left) and page !=0){
	page--;
	ini_open("enemyIndex.ini");
	identified = ini_read_real("enemies", page, 0);
	ini_close();
}
if(keyboard_check_pressed(vk_right) and page != max_page){
	page++;
	ini_open("enemyIndex.ini");
	identified = ini_read_real("enemies", page, 0);
	ini_close();
}

if(keyboard_check_pressed(vk_delete)){
	cout("EMPTY INDEX");
	ini_open("enemyIndex.ini");
	ini_section_delete("enemies");
	ini_close();
}
if(keyboard_check_pressed(vk_backspace)){
	instance_destroy();
	Player1.state = "Move";
}
cout("Page: " + string(page));