// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
///arg0
function calcRoll(argument0){
	var rll = argument0;
    amount = 0;
    line = "";
    temp = "";
    var temp2;
    for(var i = 0; i < array_length(LINES); i++) {
        line = "";
        for (var j = 0; j < array_length(LINES[i]); j++) {
            line += rll[j][real(LINES[i][j])];
        }
        temp = calcWild(line);
        temp2 = calcVal(temp);
        if (temp2 > 0) {
            show_debug_message("Line " + (i + 1) + ": " +  temp + " Worth " + temp2);
			
            amount += temp2;
        }
    }
    if (amount / (bet * lines) > 5) {
        show_debug_message("MASSIVE WIN");
        MW++;
    }
    show_debug_message("Total Win For This Spin:" + amount);
    money += amount;
    total += amount;
    if (amount >= max) { max = amount; }
}