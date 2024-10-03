///@arg return state??(Bool)
///@arg damage modifier(Normal damage = 2)
///@arg speed
function throw_bone(argument0, argument1, argument2){
	var bone = instance_create_layer(x, y-(sprite_height*0.75), "InstancesTop", o_bone_projectile);
	bone.creator = self.id;
	bone.target = target.id;
	bone.z = z;
	if(argument1 != undefined){
		bone.damage += argument1;
	}
	if(id == Player1.id){
		item.durability--;
	}
	if(argument0){state = "Projectile Wait";}
	if(argument2 > 0){bone.spd = argument2;}
}