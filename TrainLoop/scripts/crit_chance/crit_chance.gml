// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
///arg0 crit chance
function crit_chance(argument0){
	if(irandom_range(0, 100) < argument0){
		cout("CRIT");
		return 2;
	}
	else{
		return 1;
	}
}