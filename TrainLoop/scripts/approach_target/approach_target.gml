// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
///arg0
///arg1
function approach_target(argument0){
	var dir = sign((argument0.x)-x);
	move_and_collide(dir*run_speed, 0);
}