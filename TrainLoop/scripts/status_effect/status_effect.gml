///@arg target
///@arg status
function status_effect(argument0, argument1){
	var target = argument0;
	var status = argument1;
	
	if status == "None"{exit;}
	if status == "Fire"{
		var dam = (1/5) * target.max_hp;
		target.hp -= dam;
		var indicator = instance_create_layer(x, y-sprite_height, "InstancesTop", o_damage_indicator);
		indicator.target = target;
		indicator.damage = dam;
		indicator.status = "Fire";
	}
	if(status == "Bleed"){
		var dam = (1/10) * target.max_hp;
		target.hp -= dam;
		var indicator = instance_create_layer(x, y-sprite_height, "InstancesTop", o_damage_indicator);
		indicator.target = target;
		indicator.damage = dam;
		indicator.status = "Bleed";
	}
	target.status_turns--;
}