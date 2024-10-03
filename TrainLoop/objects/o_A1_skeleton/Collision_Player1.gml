if(z_axis(Player1, 0)){
	if(state == "Idle" or state == "Chase" or state == "Attack"){
		transition_to_battle();
	}
}