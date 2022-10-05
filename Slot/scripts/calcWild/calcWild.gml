// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
///arg0
function calcWild(argument0){
	var str = argument0
    if (str[0] == "W") {
        wildCount = 0;
        temp = "";
        for (var j = 0; j < str.length(); j++) {
            temp = str[j];
            if (regexMatch(temp, rList)) { 
                str[0] = str[j]; 
                j = str.length();
                wildCount += 1;
            }
        }
        if (wildCount == 0) { //Only Wild or Bonus
            str[0] = "S";
        }
    }
    for (var i = 0; i < str.length(); i++) {
        if (str[i] == "W") {
            if (str[i-1] != "W") {
                str[i] = str[i-1];
            }
        }
    }
    return str;
}