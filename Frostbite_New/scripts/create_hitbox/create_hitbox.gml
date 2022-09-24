///@arg x
///@arg y
///@arg creator
///@arg sprite
///@arg knockback
///@arg knockback_y
///@arg lifespan
///@arg damage
///@arg xscale
function create_hitbox(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) {

	var x_position = argument0;
	var y_position = argument1;
	var creator = argument2;
	var sprite = argument3;
	var knockback = argument4;
	var knockback_y = argument5;
	var lifespan = argument6;
	var damage = argument7;
	var xscale = argument8;

	var hitbox = instance_create_layer(x_position, y_position, "Instances", o_hitbox);
	hitbox.sprite_index = sprite;
	hitbox.creator = creator;
	hitbox.knockback = knockback;
	hitbox.knockback_y = knockback_y;
	hitbox.alarm[0] = lifespan;
	hitbox.damage = damage;
	hitbox.image_xscale = xscale;


}
