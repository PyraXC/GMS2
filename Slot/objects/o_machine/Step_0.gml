        if (bet * lines > money) {
            show_debug_message("Bet Amount Exceeds Balance");
			show_debug_message("Please Enter New Bet Amount Or Press N To Quit");
            inp = "1";
            if (regexMatch(inp, regexp)) { return 0; }
            else if (regexMatch(inp, regexn)) {
                bet = real(inp);
            }
            else {show_debug_message("Non-valid input"); }
        }
        else {
            show_debug_message("Current Balance: " + money + "\n" + "Current Bet: " + bet + " X " + lines + " lines" + "\n" + "Total Spins : " + spins + " Max Win: " + max +
                "Press Y To Spin" + "\n" + "Press B To Change Bet" + "\n" + "Press L To Change Lines" + "\n" + "Press N To Quit");
            input = "y";
            //for (int k = 0; k < 3; k++) {
            switch (input) {
            case "y":
            case "Y":
                show_debug_message("");
                temp = roll();
                while (BONUS >= 1) {
                   BONUS -= 1;
                    show_debug_message("BONUS SPINS");
                    if (bet == 9) { rolls = 15; }
                    else if (bet > 4) { rolls = 12; }
                    else { rolls = 8; }
                    rng = random_range(0, rolls);
                    for (var i = 0; i < rolls; i++) {
                        show_debug_message("Press Y For Free Spin");
                        inp = "y";
                        show_debug_message("FREE SPIN: " + (i + 1));
                        bonusRoll(i, rolls, rng);
                    }
                }
                show_debug_message("");
                break;
            case "n":
            case "N":
                return 0;
                break;
            case "a":
            case "A":
                mon = 0;
                show_debug_message("Add Funds");
//                cin >> mon;
                addMoney(mon);
                break;
            case "b":
            case "B":
                cout("Enter New Bet: ");
                while (cin >> bet) {
                    if (bet > 9 || bet < 0) {
                        cout("Out Of Range Max Bet is 9X" + "\n"+ "Bet 1-9" + "\n");
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