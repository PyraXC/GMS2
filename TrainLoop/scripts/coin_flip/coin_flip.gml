///@arg value
///@arg h/t
function coin_flip(argument0, argument1){
	if(Player1.money < argument0){
		cout("BROKE ALERT");
		exit;
	}
	var rng = choose(0, 1);
	Player1.money -= argument0;
	if rng == 0{
		cout("HEADS");
		if argument1 == 0{
			Player1.money +=  (2 * argument0);
		}
		else{o_coin_flip.net_gain += argument0;}
	}
	if rng == 1{
		cout("TAILS");
		if argument1 == 1{
			Player1.money += (2 * argument0);
		}
		else{o_coin_flip.net_gain += argument0;}
	}
	cout(Player1.money);
}