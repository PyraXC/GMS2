//Timer until fish appears
state = "FISHHH";
if(object_get_parent(fish.obj.object_index) == o_fish){
	alarm[1] = fish.bite;
}else{
	alarm[1] = 60;
}