///@arg X
///@arg Y
///@arg Creator
///@arg Sprite
///@arg Duration
///@arg Xscale
///@arg Z
///@arg Width

function create_deflect(argument0, argument1,  argument2, argument3, argument4, argument5, argument6, argument7)
{
	var x_position = argument0;
	var y_position = argument1;
	var creator = argument2;
	var sprite = argument3;
	var lifespan = argument4;
	var xscale = argument5;
	var z = argument6;
	var width = argument7;

	var deflect = instance_create_layer(x_position, y_position, "InstancesTop", o_deflect);
	deflect.sprite_index = sprite;
	deflect.creator = creator;
	deflect.alarm[0] = lifespan;
	deflect.image_xscale = xscale;
	deflect.z = z;
	deflect.wid = width;
}