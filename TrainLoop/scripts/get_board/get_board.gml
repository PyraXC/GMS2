// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_board(){
	if(instance_exists(o_OJ_gameState)){
		return o_OJ_gameState.board;
	}else{
		return -1;
		}
}