///@arg xp
function add_xp(argument0){
	var index = array_get_index(Player1.attack_list_n, Player1.attack_type);
	Player1.attack_list_xp[index] += argument0;
	//cout(Player1.attack_list_xp);
}