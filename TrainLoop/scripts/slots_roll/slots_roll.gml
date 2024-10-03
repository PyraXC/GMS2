function slots_roll(slots, lines, bet){
	randomize();
	var roll = "";
	var win;
	rand = irandom_range(1, 7);
	for(var i = 0; i < 15; i++){
		var slot = slots[i];
		slot.index = irandom_range(0, 7);
		slot.alarm[0] = 1 + (i%rand)*10;
	}
	for(var j = 0; j < 15; j++){
		roll += string(slots[j].index);
	}
	cout("Roll: " + roll);
	win = slots_calc(roll, lines, bet);
	return win;
}

function slots_calc(roll, lines, bet){
	cout("slots_calc");
	#region Lines
	LINES50 = [ 
		[2,2,2,2,2],[1,1,1,1,1],[3,3,3,3,3],
	    [1, 2, 3, 2, 1],[3, 2, 1, 2, 3],
	    [1, 1, 2, 1, 1],[3, 3, 2, 3, 3],
	    [2, 3, 3, 3, 2],[2, 1, 1, 1, 2],[1, 2, 2, 2, 1],[3, 2, 2, 2, 3],//Line 11
	    [1, 2, 1, 2, 1],[3, 2, 3, 2, 3],[2, 1, 2, 1, 2],[2, 3, 2, 3, 2],
	    [2, 2, 1, 2, 2],[2, 2, 3, 2, 2],
	    [1, 3, 1, 3, 1],[3, 1, 3, 1, 3],                                //Line 19
	    [2, 1, 3, 1, 2],[2, 3, 1, 3, 2],
	    [1, 1, 3, 1, 1],[3, 3, 1, 3, 3],
	    [1, 3, 3, 3, 1],[3, 1, 1, 1, 3],                                 //Line 25
	    [1, 3, 2, 3, 1],[3, 1, 2, 1, 3],
	    [1, 1, 1, 2, 1],[3, 3, 3, 2, 3], [2, 2, 2, 1, 2],				 //Line 30
	    [2, 1, 3, 2, 1],[2, 3, 1, 2, 3],
	    [1, 3, 2, 1, 3],[3, 1, 2, 3, 1],
	    [2, 1, 2, 3, 2],[2, 3, 2, 1, 2],
	    [1, 2, 1, 2, 3],[3, 2, 3, 2, 1],
	    [1, 1, 3, 3, 3],[3, 3, 1, 1, 1],                                 //Line 40
	    [2, 1, 2, 3, 3],[2, 3, 2, 1, 1],
	    [3, 2, 1, 3, 2],[1, 2, 3, 1, 2],
	    [2, 3, 3, 1, 1],[3, 1, 1, 2, 3],
	    [1, 1, 2, 2, 3],[3, 3, 2, 2, 1],
	    [1, 3, 2, 2, 1],[3, 1, 2, 2, 3]                                   //Line 50
	];
	#endregion
	var LINES;
	var win = 0;
	var line = "";
	var temp = 0;
	switch(lines){
		case 50:
		LINES = LINES50;
		break;
	}
	for(var i = 0; i < array_length(LINES); i++){
		for(var j = 0; j < 5; j++){
			line += string_char_at(roll, (LINES[i][j])+3*j);
		}
		//cout("Line " + string(i) + " " + line);
		line = calc_wild(line);
		temp = calc_val(line, bet);
		if(temp > 0){ cout("Line: " + string(i + 1) +  " " + string(temp));}
		win += temp;
		line = "";
	}
	return win;
}

function calc_val(line, bet){
	valList = [
	1,//0
	1,//1
	2,//2
	2,//3
	2,//4
	4,//5
	5,//6
	5 //7
	];	
	var mult = 5;
    for (var i = 1; i <= string_length(line); i++) {
        if (string_char_at(line, i) != "7") { 
            mult = valList[int64(string_char_at(line, i))]; 
            i = string_length(line)+1;
        }
    }
    //cout << mult << endl;
            if(string_char_at(line, 1) != string_char_at(line, 2) && string_char_at(line, 1) != "W" && string_char_at(line, 2) != "W") {
                return 0;
            }
            else if ((string_char_at(line, 1) == string_char_at(line, 3) || string_char_at(line, 3) == "W") && (string_char_at(line, 1) == string_char_at(line, 4) || string_char_at(line, 4) == "W") && (string_char_at(line, 1) == string_char_at(line, 5) || string_char_at(line, 5) == "W")) {
                return bet * mult * 4;
            }
            else if ((string_char_at(line, 1) == string_char_at(line, 3) || string_char_at(line, 3) == "W") && (string_char_at(line, 1) == string_char_at(line, 4) || string_char_at(line, 4) == "W")) {
                return bet * mult * 3;
            }
            else if (string_char_at(line, 1) == string_char_at(line, 3) || string_char_at(line, 3) == "W") {
                return bet * mult * 2;
            }
        return 0;
}

function calc_wild(line){
	//cout("CalcWild Before: " + line);
	if(string_char_at(line, 1) == "7"){
		var wildCount = 0;
		var temp = "";
		for (var j = 1; j <= string_length(line); j++) {
            temp = string_char_at(line, j);
            if(int64(temp) < 7){ 
                line = string_replace_at(line, 1, string_char_at(line, j));
                j = string_length(line);
                wildCount += 1;
            }
        }
		if(wildCount == 0){ string_replace_at(line, 1, "6");}
		
	}
	for(var i = 1; i <= string_length(line); i++){
		if(string_char_at(line, i) == "7"){
			if(string_char_at(line, i-1) != "7"){
				line = string_replace_at(line, i, string_char_at(line, i-1));
			}
		}
	}
	//cout("After: " + line);
	return line;
}