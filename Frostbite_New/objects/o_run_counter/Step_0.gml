if !instance_exists(o_frostbite) exit;
x = o_camera.x - 560;
y = o_camera.y - 256;
var i = o_frostbite.run_speed;
//switch(i)
//{
//	case 0:
//	set_state_sprite(s_run_counter, 0, 0);
//	break;
//	case 6:
//	set_state_sprite(s_run_counter1, 0, 0);
//	break;
//	case 10:
//	set_state_sprite(s_run_counter2, 0, 0);
//	break;
//	case 12:
//	set_state_sprite(s_run_counter3, 0, 0);
//	break;
//}
if i <= 6 set_state_sprite(s_run_counter, 0, 0);
if i > 6 && i < 8 set_state_sprite(s_run_counter1, 0, 0);
if i >= 8 && i < 12 set_state_sprite(s_run_counter2, 0, 0);
if i == 12 set_state_sprite(s_run_counter3, 0, 0);