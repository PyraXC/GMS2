//Timer until fish appears
state = "FISHHH";
if(object_get_parent(fish.obj) == o_fish){
	alarm[1] = fish.bite;
}else{
	alarm[1] = 60;
}