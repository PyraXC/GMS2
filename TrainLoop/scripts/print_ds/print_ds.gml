// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function print_ds(argument0){
///@arg1 ds list
var txt = "";
	for(var i = 0; i < ds_list_size(argument0); i++){
		txt += string(ds_list_find_value(argument0, i)) + " ";
	}
	cout(txt);
}