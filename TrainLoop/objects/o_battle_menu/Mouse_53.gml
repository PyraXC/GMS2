if(cursor_state == "Cursor"){
	click = 1;
	if(!instance_exists(point)){
		point = instance_create_layer(cursor.x, cursor.y, "InstancesTop", o_attack_point);
	}
}