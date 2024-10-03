///@arg Title
///@arg Text
///@arg Spr
///@arg Duration
function create_popup(argument0, argument1, argument2, argument3){
	var popup = [];
	array_insert(popup, 0, argument0, argument1, argument2, argument3);
	array_insert(Player1.popup_queue, 0, popup);
}