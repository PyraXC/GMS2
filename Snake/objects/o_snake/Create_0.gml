size = 0;
start_size = size;
lr = 0;
ud = 1;
dir = "d";
global.pos_list = [];
for(var i =0; i<start_size; i++){
	var seg = instance_create_layer(x-i, y, "Instances", o_segment);
	seg.pos = size;
	size += 1;
}