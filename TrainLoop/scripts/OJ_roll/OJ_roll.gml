// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function OJ_roll(){
	randomize();
	roll = irandom_range(1, 6);
	cout("Roll: " + string(roll));
	return roll;
}