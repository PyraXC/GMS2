
function transition_to_battle(target){
	TransitionsStart(target, sq_fade_black, sq_fade_in);
	state = "Noone";
	Player1.state = "Noone";
	alarm[7] = 25;
}