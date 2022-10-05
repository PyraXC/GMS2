// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
///arg0
function calcVal(argument0){
	var str = argument0;
	var mult = array_get(VALUES, ("W"));
    for (var i = 0; i < str.length(); i++) {
        if (str[i] != "W") { 
            mult = array_get(VALUES, str[i]); 
            i = str.length()+1;
        }
    }
    //cout << mult << endl;
            if(str[0] != str[1] && str[0] != "W" && str[1] != "W") {
                return 0;
            }
            else if ((str[0] == str[2] || str[2] == "W") && (str[0] == str[3] || str[3] == "W") && (str[0] == str[4] || str[4] == "W")) {
                return bet * mult * 5;
            }
            else if ((str[0] == str[2] || str[2] == "W") && (str[0] == str[3] || str[3] == "W")) {
                return bet * mult * 3;
            }
            else if (str[0] == str[2] || str[2] == "W") {
                return bet * mult * 2;
            }
        return 0;
}