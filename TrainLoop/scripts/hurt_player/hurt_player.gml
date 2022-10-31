// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function hurt_player(argument0){
	create_hitbox(argument0.x, argument0.y, self, s_attack_damage, 0, 0, 1, 10,1);
}