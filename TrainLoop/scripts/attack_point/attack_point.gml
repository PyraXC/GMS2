///@arg x from player
///@arg z from player
///@arg y from player
///@arg player? 
function attack_point(argument0, argument1, argument2, argument3){

	var _x = argument0;
	var _z = argument1;
	var _y = argument2;
	if(instance_exists(point)){
		instance_destroy(point);	
	}
	if(argument3){//If 1 set to the coordinates provided not the distance from the player
		var _point =  instance_create_layer(_x, _y, "Instances", o_attack_point);
		_point.z = _z;
		//cout("PX: " + string(_point.x) + " PZ: " + string(_point.z) +  " PY: " + string(_point.y));
		return _point;		
	}
	var _point =  instance_create_layer(Player1.ix + _x, Player1.iy - _y, "Instances", o_attack_point);
	_point.z = Player1.iz + _z;
	//cout("PX: " + string(_point.x) + " PZ: " + string(_point.z) +  " PY: " + string(_point.y));
	return _point;
}
///@arg point
function on_point(argument0, argument1){
	var _point = argument0;
	if(argument1){
		return (x <= _point.x && z >= _point.z && y >= _point.y);
	}else{
		return (x == _point.x && z == _point.z && y == _point.y);
	}
}

function approach_point(argument0, argument1, argument2){
	var _point = argument0;
	var _speed = argument1;
	
	/*hsp = run_speed;
	ysp = run_speed/2;
	zsp = run_speed/2;
	x = max(x - hsp, _point.x);
	z = max(z - zsp, _point.z);
	y = min(y + ysp, _point.y);*/
	if(argument2){//Don't walk backwards if not necessary
		if(x > _point.x){
			x = approach(x, _point.x, run_speed * _speed);
		}
		if(z < _point.z){
			z = approach(z, _point.z, run_speed/2 * _speed);
		}
		if(y > _point.y){
			y = approach(y, _point.y, run_speed/2 * _speed);
		}
	}else{
		x = approach(x, _point.x, run_speed * _speed);
		z = approach(z, _point.z, run_speed/2 * _speed);
		y = approach(y, _point.y, run_speed/2 * _speed);
	}
	
}