// Slots.cpp : This file contains the "main" function. Program execution begins and ends there.
// Gamba

LIST =  [["A", "a", "K", "k", "Q", "q", "J", "j", "S", "s", "W"],//Reel 1
    ["A", "a", "K", "k", "Q", "q", "J", "j", "S", "s", "W"], 
    [ "A", "a", "K", "k", "Q", "q", "J", "j", "S", "s", "W", "B"],
    [ "A", "a", "K", "k", "Q", "q", "J", "j", "S", "s", "W", "B"],
    [ "A", "a", "K", "k", "Q", "q", "J", "j", "S", "s", "W", "B"]
	]; //Reel 5
BONUSLIST = [
    [ "A", "a", "K", "k", "Q", "q", "J", "j", "S", "s", "W", "W"],//Reel 1
    [ "W"],
    [ "A", "a", "K", "k", "Q", "q", "J", "j", "S", "s", "W", "W"],
    [ "W"],
    [ "A", "a", "K", "k", "Q", "q", "J", "j", "S", "s", "W", "W"] //Reel 5
];

//const vector<char> LIST[ "A", "K", "Q", "J", "A", "K", "Q", "J","A", "K", "Q", "J", "S", "S", "s", "s", "W" ];
//const vector<char> LIST[ "A", "K", "Q", "J", "S", "W" ];
//const vector<char> LIST[ "W", "W" ];
VALUES = [ ["A", 6],["K", 6],["Q", 5],["J", 5],["S", 10],["B", 10], ["W", 10],["s", 8], ["a", 4], ["k", 4], ["q", 4], ["j", 4] ];

LINES15 = [  ["2","2","2","2","2"], ["1","1","1","1","1"], ["3","3","3","3","3"],
    ["1", "2", "3", "2", "1"], ["3", "2", "1", "2", "3"],
    ["1", "1", "3", "1", "1"],["3", "3", "1", "3", "3"],
    ["1", "1", "2", "3", "3"],["3", "3", "2", "1", "1"],
    ["1", "2", "1", "2", "1"],["3", "2", "3", "2", "3"],["2", "1", "2", "1", "2"],["2", "3", "2", "3", "2"],
    ["2", "1", "2", "3", "2"],["2", "3", "2", "1", "2"] 
];
LINES30 = [ ["2","2","2","2","2"],["1","1","1","1","1"],["3","3","3","3","3"], 
    ["1", "2", "3", "2", "1"],["3", "2", "1", "2", "3"],
    ["1", "1", "2", "1", "1"],["3", "3", "2", "3", "3"],
    ["2", "3", "3", "3", "2"],["2", "1", "1", "1", "2"],["1", "2", "2", "2", "1"],["3", "2", "2", "2", "3"],//11
    ["1", "2", "1", "2", "1"],["3", "2", "3", "2", "3"],["2", "1", "2", "1", "2"],["2", "3", "2", "3", "2"],
    ["2", "2", "1", "2", "2"],["2", "2", "3", "2", "2"],
    ["1", "3", "1", "3", "1"],["3", "1", "3", "1", "3"],//19
    ["2", "1", "3", "1", "2"],["2", "3", "1", "3", "2"],
    ["1", "1", "3", "1", "1"],["3", "3", "1", "3", "3"],
    ["1", "3", "3", "3", "1"],["3", "1", "1", "1", "3"],//25
    ["1", "3", "2", "3", "1"],["3", "1", "2", "1", "3"],
    ["1", "1", "1", "2", "1"],["3", "3", "3", "2", "3"], ["2", "2", "2", "1", "2"]
];
LINES50 = [ ["2","2","2","2","2"],["1","1","1","1","1"],["3","3","3","3","3"],
    ["1", "2", "3", "2", "1"],["3", "2", "1", "2", "3"],
    ["1", "1", "2", "1", "1"],["3", "3", "2", "3", "3"],
    ["2", "3", "3", "3", "2"],["2", "1", "1", "1", "2"],["1", "2", "2", "2", "1"],["3", "2", "2", "2", "3"],//11
    ["1", "2", "1", "2", "1"],["3", "2", "3", "2", "3"],["2", "1", "2", "1", "2"],["2", "3", "2", "3", "2"],
    ["2", "2", "1", "2", "2"],["2", "2", "3", "2", "2"],
    ["1", "3", "1", "3", "1"],["3", "1", "3", "1", "3"],//19
    ["2", "1", "3", "1", "2"],["2", "3", "1", "3", "2"],
    ["1", "1", "3", "1", "1"],["3", "3", "1", "3", "3"],
    ["1", "3", "3", "3", "1"],["3", "1", "1", "1", "3"],//25
    ["1", "3", "2", "3", "1"],["3", "1", "2", "1", "3"],
    ["1", "1", "1", "2", "1"],["3", "3", "3", "2", "3"], ["2", "2", "2", "1", "2"],//30
    ["2", "1", "3", "2", "1"],["2", "3", "1", "2", "3"],
    ["1", "3", "2", "1", "3"],["3", "1", "2", "3", "1"],
    ["2", "1", "2", "3", "2"],["2", "3", "2", "1", "2"],
    ["1", "2", "1", "2", "3"],["3", "2", "3", "2", "1"],
    ["1", "1", "3", "3", "3"],["3", "3", "1", "1", "1"],//40
    ["2", "1", "2", "3", "3"],["2", "3", "2", "1", "1"],
    ["3", "2", "1", "3", "2"],["1", "2", "3", "1", "2"],
    ["2", "3", "3", "1", "1"],["3", "1", "1", "2", "3"],
    ["1", "1", "2", "2", "3"],["3", "3", "2", "2", "1"],
    ["1", "3", "2", "2", "1"],["3", "1", "2", "2", "3"]
];
rList = ("[AKQJSs]");

    money = 0;
    bet = 1;
    max = 0;
    spins = 0;
    total = 0.0;
    LINES = LINES30;




vector<vector<char>> Machine::bonusRoll(int rollNum, int rolls, int &rng) {
    vector<vector<char>> roll;
    int BC = 0;
    int bonus = 0;
    if (rng == rollNum) {
        rng = rand() % rolls;
        cout << "SPECIAL ROLL" << endl;
        for (int j = 0; j < 5; j++) {
            vector<char> temp = {};
            BC = 0;
            for (int i = 0; i < 3; i++) {
                temp.push_back(BONUSLIST[j][rand() % BONUSLIST[j].size() - sin(BC)]);
                if (temp[i] == "B") {
                    BC++;
                    bonus++;
                }
            }
            roll.push_back(temp);
        }
    }
    else {
        for (int j = 0; j < 5; j++) {
            vector<char> temp = {};
            BC = 0;
            for (int i = 0; i < 3; i++) {
                temp.push_back(LIST[j][rand() % LIST[j].size() - sin(BC)]);
                if (temp[i] == "B") {
                    BC++;
                    bonus++;
                }
            }
            roll.push_back(temp);
        }
    }
    for (int i = 0; i < roll.size(); i++) {
        for (int j = 0; j < roll[i].size(); j++) {
            cout << roll[i][j] << " ";
        }
        cout << endl;
    }
    calcRoll(roll);
    //calcRoll(roll);
    //spins++;
    if (bonus == 3) {
        cout << "RETRIGGER" << endl;
        BONUS++;
    }
    return roll;
}
void Machine::calcRoll(vector<vector<char>> roll) {
    int amount = 0;
    string line;
    string temp;
    int temp2;
    for(int i = 0; i < this->LINES.size(); i++) {
        line.clear();
        for (int j = 0; j < this->LINES[i].size(); j++) {
            line += roll[j][int(this->LINES[i][j]) - 49];
        }
        temp = calcWild(line);
        temp2 = calcVal(temp);
        if (temp2 > 0) {
            cout << "Line " << i + 1 << ": " << temp << " Worth " << temp2 << endl;
            amount += temp2;
        }
    }
    if (amount / (getBet() * getLines()) > 5) {
        cout << "MASSIVE WIN" << endl;
        this->MW++;
    }
    cout << "Total Win For This Spin:" << amount << endl;
    money += amount;
    total += amount;
    if (amount >= max) { max = amount; }
}

string Machine::calcWild(string str) {
    if (str[0] == "W") {
        int wildCount = 0;
        string temp;
        for (int j = 0; j < str.length(); j++) {
            temp = str[j];
            if (regex_match(temp, rList)) { 
                str[0] = str[j]; 
                j = str.length();
                wildCount += 1;
            }
        }
        if (wildCount == 0) { //Only Wild or Bonus
            str[0] = "S";
        }
    }
    for (int i = 0; i < str.length(); i++) {
        if (str[i] == "W") {
            if (str[i-1] != "W") {
                str[i] = str[i-1];
            }
        }
    }
    return str;
}

int Machine::calcVal(string str) {
    int mult = VALUES.at("W");
    for (int i = 0; i < str.length(); i++) {
        if (str[i] != "W") { 
            mult = VALUES.at(str[i]); 
            i = str.length()+1;
        }
    }
    //cout << mult << endl;
            if(str[0] != str[1] && str[0] != "W" && str[1] != "W") {
                return 0;
            }
            else if ((str[0] == str[2] || str[2] == "W") && (str[0] == str[3] || str[3] == "W") && (str[0] == str[4] || str[4] == "W")) {
                return getBet() * mult * 5;
            }
            else if ((str[0] == str[2] || str[2] == "W") && (str[0] == str[3] || str[3] == "W")) {
                return getBet() * mult * 3;
            }
            else if (str[0] == str[2] || str[2] == "W") {
                return getBet() * mult * 2;
            }
        return 0;
}
int Machine::getBal() {
    return money;
}
int Machine::getBet() {
    return bet;
}
int Machine::getSpins() {
    return spins;
}
int Machine::getMax() {
    return max;
}
int Machine::getLines() {
    return LINES.size();
}
int Machine::getMW() {
    return MW;
}
int Machine::getBonus() {
    return BONUS;
}
float Machine::getTotal() {
    return total;
}

void Machine::setBet(int amount) {
    bet = amount;
}
void Machine::setBonus(int amount) {
    BONUS = amount;
}
void Machine::setLines(int lines) {
    if (lines == 30) { this->LINES = LINES30; }
    else if (lines == 15) { this->LINES = LINES15; }
    else if (lines == 50) { this->LINES = LINES50; }
    else{}
}

int main()
{  
    srand(time(0));
    Machine M1(20000);
    M1.setBet(9);
    M1.setLines(50);
    vector<vector<char>> temp;
    char input;
    string inp;
    int bet;
    int rolls = 0;
    int rng = 0;
    regex regexp("[Nn]");
    regex regex1("[NnYyBbAaLl]");
    regex regexn("[1-9]");
    regex regexlin("15|30|50");
    /*
    while (M1.getMW() <= 0) {
    //for (int i = 0; i < 10000; i++){
        if (M1.getBet() * M1.getLines() < M1.getBal()) { M1.addMoney(1000); }
        M1.roll();
        cout << endl;
    }
    cout << "Total Spins " << M1.getSpins() << " Total Balance " << M1.getTotal() << endl;
    cout << M1.getTotal()/ (M1.getSpins()*M1.getBet()) << "% Average" << endl;
    */
    ///*
    while (true) {
        if (M1.getBet() * M1.getLines() > M1.getBal()) {
            cout << "Bet Amount Exceeds Balance" << endl << "Please Enter New Bet Amount Or Press N To Quit" << endl;
            cin >> inp;
            if (regex_match(inp, regexp)) { return 0; }
            else if (regex_match(inp, regexn)) {
                bet = stoi(inp);
                M1.setBet(bet);
            }
            else { cout << "Non-valid input" << endl; }
        }
        else {
            cout << "Current Balance: " << M1.getBal() << "\n" << "Current Bet: " << M1.getBet() << " X " << M1.getLines() << " lines" << endl << "Total Spins : " << M1.getSpins() << " Max Win: " << M1.getMax() << endl
                << "Press Y To Spin" << endl << "Press B To Change Bet" << endl << "Press L To Change Lines" << endl << "Press N To Quit" << endl;
            cin >> input;
            //for (int k = 0; k < 3; k++) {
            switch (input) {
            case "y":
            case "Y":
                cout << endl;
                temp = M1.roll();
                while (M1.getBonus() >= 1) {
                    M1.setBonus(0);
                    cout << "BONUS SPINS" << endl;
                    if (M1.getBet() == 9) { rolls = 15; }
                    else if (M1.getBet() > 4) { rolls = 12; }
                    else { rolls = 8; }
                    rng = rand() % rolls;
                    for (int i = 0; i < rolls; i++) {
                        cout << "Press Y For Free Spin" << endl;
                        cin >> inp;
                        cout << "FREE SPIN: " << i + 1 << endl;
                        M1.bonusRoll(i, rolls, rng);
                    }
                }
                cout << endl;
                break;
            case "n":
            case "N":
                return 0;
                break;
            case "a":
            case "A":
                int mon;
                cout << "Add Funds" << endl;
                cin >> mon;
                M1.addMoney(mon);
                break;
            case "b":
            case "B":
                cout << "Enter New Bet: ";
                while (cin >> bet) {
                    if (bet > 9 || bet < 0) {
                        cout << "Out Of Range Max Bet is 9X" << endl << "Bet 1-9" << endl;
                        continue;
                    }
                    M1.setBet(bet);
                    break;
            case "l":
            case "L":
                string line;
                cout << "Enter Lines, 15, 30, 50: ";
                while (cin >> line) {
                    if (regex_match(line, regexlin)) {
                        M1.setLines(stoi(line));
                        break;
                    }
                }
                break;
                //}
                }
                cout << endl;
            }
        }
    }
 //   */
}