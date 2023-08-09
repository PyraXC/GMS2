//draw floor/walls and set depths
//floor
instance_create_layer(0, room_height, "InstancesTop", o_wall,
{
	z : 0,
	image_xscale : 10
});
//back wall
instance_create_layer(0, room_height-256, "InstancesTop", o_wall,
{
	z : 0,
	image_xscale : 10
});

//jump floor
instance_create_layer(624+0, room_height, "InstancesTop", o_wall,
{
	z : 0,
	image_xscale : 10
});
//jump back wall
instance_create_layer(640+128, room_height-256, "InstancesTop", o_wall,
{
	z : 0,
	image_xscale : 10
});
//player
instance_create_layer(0, room_height, "InstancesTop", Player1,
{
	z : 0,
});
