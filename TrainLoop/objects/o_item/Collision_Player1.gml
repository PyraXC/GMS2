state = "Idle";
if(spr == s_coins){
Player1.money += damage;
}else{
array_push(Player1.item_inventory, self);
instance_deactivate_object(self);
}