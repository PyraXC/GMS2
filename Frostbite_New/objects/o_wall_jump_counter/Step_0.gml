if !instance_exists(o_frostbite) exit;
x = o_camera.x - 576;
y = o_camera.y - 256;
var i = o_frostbite.wall_jump_count;
switch(i)
{
	case 0:
	set_state_sprite(s_walljump_counter, 0, 0);
	break;
	case 1:
	set_state_sprite(s_walljump_counter1, 0, i);
	break;
	case 2:
	set_state_sprite(s_walljump_counter2, 0, i);
	break;
	case 3:
	set_state_sprite(s_walljump_counter3, 0, i);
	break;
	case 4:
	set_state_sprite(s_walljump_counter4, 0, i);
	break;
	case 5:
	set_state_sprite(s_walljump_counter5, 0, i);
	break;
	case 6:
	set_state_sprite(s_walljump_counter6, 0, i);
	break;
	case 7:
	set_state_sprite(s_walljump_counter7, 0, i);
	break;
	case 8:
	set_state_sprite(s_walljump_counter8, 0, i);
	break;
}