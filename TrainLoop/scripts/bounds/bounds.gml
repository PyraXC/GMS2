// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function bounds(argument0){
	var bound = argument0;
	if(bound >= array_length(board)){
		bound -= array_length(board);
	}
	if(bound < 0){
		bound += array_length(board);
	}
	return bound;
}