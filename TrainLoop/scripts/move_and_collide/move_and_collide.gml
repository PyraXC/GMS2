// Script assets have changed for v2.3.0 see
function move_and_collide(argument0, argument1, argument2) {
		///@arg xspeed
	///@arg zspeed
	///@arg yspeed
	var xspeed = argument0;
	var zspeed = argument1;	
	var yspeed = argument2;	
	var xpass = false;
	var zpass = true;
	var ypass = false;
	var collided = [];
	var collide = ds_list_create();
	var point = instance_create_layer(x + xspeed, y+yspeed, "InstancesTop", o_point);
	point.z = z-zspeed;
	point.wid = wid;
	point.sprite_index = self.sprite_index;
	cout("NX: " + string(point.x) + " NZ: " + string(point.z) + " NY: " + string(point.y));
	with(point){
		instance_place_list(x, y, o_wall, collide, true);
	}
	for(var i = 0; i < ds_list_size(collide); i++){
		collide[| i].col = c_red;
		cout(collide[| i]);
		var wall = collide[| i];
	//X collision
	with(point){
		
		//Z Collision
		if(z_axis(wall, 0)){
			array_push(collided, wall);
			zpass = false;
		}
	
	//Y Collision
	
	//Diagonal Collisions??
	}
	cout(collided);
	}
	for(var i = 0; i <= array_length(collided); i++){
		
	}
	if(ds_list_size(collide) == 0){
		xpass = true;
		ypass = true;
	}
	if(xpass){x+= xspeed};
	if(zpass){z-= zspeed};
	if(ypass){y+= yspeed};
	ds_list_destroy(collide);
}

