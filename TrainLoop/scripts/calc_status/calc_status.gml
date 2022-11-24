///@arg obj getting hit
///@arg status
///@arg chance
function calc_status(argument0, argument1, argument2){
	var target = argument0;
	var stat = argument1;
	var chance = argument2;
	if target.status == "None" && status != "Topple"{
		if(irandom_range(1,100) <= chance){
			target.status = stat;
			target.status_turns = 3;
		}
	}
	else if target.status == "Break" && stat == "Topple"{
			if(irandom_range(1,100) <= chance){
			target.status = stat;
			target.status_turns = 1;
		}
	}
}