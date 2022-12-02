///@arg target
///@arg status
function status_effect(argument0, argument1){
	var target = argument0;
	var status = argument1;
	
	if status == "None"{exit;}
	if status == "Fire"{
		target.hp -= (1/5) * target.max_hp;
	}
	if(status == "Bleed"){
		target.hp -= (1/10) * target.max_hp;
	}
	target.status_turns--;
}