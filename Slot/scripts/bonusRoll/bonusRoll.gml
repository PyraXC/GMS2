// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

///arg0
///arg1
///arg2

function bonusRoll(){
	rollNum = argument0;
	rolls = argument1;
	rng = argument2;
	rll = [];
	BC = 0;
    bonus = 0;
    if (rng == rollNum) {
        rng = random_range(0, rolls);
        show_debug_message("SPECIAL ROLL");
        for (var j = 0; j < 5; j++) {
            temp = [];
            BC = 0;
            for (var i = 0; i < 3; i++) {
                array_push(temp, LIST[j][random_range(0, array_length(BONUSLIST[j])-sin(BC))]);
                if (temp[i] == "B") {
                    BC++;
                    bonus++;
                }
            }
            array_push(rll, temp);
        }
    }
    else {
        for (var j = 0; j < 5; j++) {
            temp = [];
            BC = 0;
            for (var i = 0; i < 3; i++) {
                array_push(temp, LIST[j][random_range(0, array_length(LIST[j])-sin(BC))]);
                if (temp[i] == "B") {
                    BC++;
                    bonus++;
                }
            }
            array_push(rll, temp);
        }
    }
    for (var i = 0; i < array_length(rll); i++) {
        for (var j = 0; j < array_length(rll[i]); j++) {
            show_debug_message(rll[i][j]);
        }
       show_debug_message("");
    }
    calcRoll(rll);
    //calcRoll(roll);
    //spins++;
    if (bonus == 3) {
        show_debug_message("RETRIGGER");
        BONUS++;
    }
    return roll;
}