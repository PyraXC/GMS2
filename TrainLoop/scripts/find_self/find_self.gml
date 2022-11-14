// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
///arg0 Array
function find_self(argument0){
	var arry = argument0;
	for(var i = 0; i < array_length(arry); i++;){
		if(arry[i] == instance){
			//cout("Here");
			//cout(i);
			return i;
		}
	}
}