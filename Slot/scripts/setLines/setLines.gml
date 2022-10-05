// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
///arg0
function setLines(argument0){
	inp = argument0;
    if (inp == 30) { LINES = LINES30; }
    else if (inp == 15) { LINES = LINES15; }
    else if (inp == 50) { LINES = LINES50; }
    else{LINES = LINES50; }
}