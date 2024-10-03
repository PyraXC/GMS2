// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
///@arg Array
function find_self(argument0){
	var arry = argument0;
	for(var i = 0; i < array_length(arry); i++;){
		if(arry[i] == id){
			//cout("Here");
			//cout(i);
			return i;
		}
	}
	return -1;
}
///@arg object id
///@arg array
function find_other(argument0, argument1){
	with(argument0){
		return find_self(argument1);
	}
}