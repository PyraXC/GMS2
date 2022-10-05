// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function roll(){
    var roll = [];
    money -= getLines() * bet;
    spins++;
    BC = 0;
    bonus = 0;
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
        array_push(roll,temp);
		j++;
    }
    for (int i = 0; i < roll.size(); i++) {
        for (int j = 0; j < roll[i].size(); j++) {
            cout << roll[i][j] << " ";
        }
        cout << endl;
    }
    calcRoll(roll);
    if (bonus == 3) {
        BONUS++;
    }
    return roll;
}

}