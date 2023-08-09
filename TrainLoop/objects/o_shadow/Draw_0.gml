switch(sz){
	case "small":
	set_state_sprite(s_sm_shadow, 1, 0);
		break;
	case "medium":
	set_state_sprite(s_md_shadow, 1, 0);
		break;
	case "large":
	set_state_sprite(s_lg_shadow, 1, 0);
		break;
}
if(instance_exists(owner)){
	x = owner.x;
	z = owner.z;
	depth = owner.depth + 1;
	//y = collision_line(x, y, x, y+1000, o_wall, true, true).y-64;
}else{
	instance_destroy(self);
}

draw_sprite_ext(sprite_index, -1, x, y-z, 1, 1, 0, c_white, 1);