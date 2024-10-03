/// @description string_replace_at(str, pos, insert)
/// @param str
/// @param pos
/// @param insert

function string_replace_at(argument0, argument1, argument2){
	return string_copy(argument0, 1, argument1-1) + argument2 + string_delete(argument0, 1, argument1);
}