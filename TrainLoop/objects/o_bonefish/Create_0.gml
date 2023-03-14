time = 60*10;
bite = 120;
sprite = s_bonefish;
if(random(100) == 69){
	sprite = s_bonefish_REAL;
}
sprite_index = s_empty;
obj = o_bonefish;
nme = "Bonefish";
state = "Idle";
size = irandom_range(0, 4) + irandom_range(2, 10); 
hp = 10 + size;
//hp = 1;