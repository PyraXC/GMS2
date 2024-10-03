function slots_array(slots){
	var xpos = 192;
	var ypos = 60;
	for(i = 0; i < 15; i++){
		slot = instance_create_layer(x, y, "InstancesTop", slots[i]);
		slot.depth = -1;
		slot.parent = self;
		slot.x = x+xpos;
		slot.y = y+ypos;
		slots[i] = slot;
		ypos+= 144;
		if(i%3 == 2){
			xpos += 144;
			ypos = 60;
		}
	}
}