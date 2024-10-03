///@arg Velocity
///@arg Distance
///@arg Width
///@arg Range
///@arg Freeze
function chase_player(argument0, argument1, argument2, argument3, argument4){
	var _vel = argument0;
	var _dist = argument1;
	var _width = argument2;
	var _range = argument3;
	var _freeze = argument4;
	
	if(!_freeze){
		//hsp = run_speed * -sign(x-Player1.x);
		hsp += _vel * -sign(x-Player1.x);
		if hsp > run_speed{hsp = run_speed;} if hsp < -run_speed{hsp = -run_speed;}
		image_xscale = -sign(hsp);
		if(image_xscale == 0){
			image_xscale = 1;
		}
		zsp += (_vel/2) * sign(z - Player1.z);
		if zsp > run_speed/2{zsp = run_speed/2;} if zsp < -run_speed/2{zsp = -run_speed/2;}
	}
		move_and_collide_new(hsp, zsp, vsp);
		if(abs(distance_to_object(Player1)) <= _dist && z_axis(Player1, _width)){
			state = "Attack";
		}else if(abs(distance_to_object(Player1)) > _range){
			state = "Idle";
		}
}