
function transition_from_battle(target){
	TransitionsStart(target, sq_fade_black, sq_fade_in);
	state = "Noone";
	Player1.state = "Noone";
	alarm[8] = 25;
}