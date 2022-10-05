// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
///arg0
///arg1
function regexMatch(argument0, argument1){
	var item = argument0;
	var list = argument1;
	
	for(var i = 0; i < list.length(); i++){
		if(item == list[i]){
			return true;
		}
	}
}