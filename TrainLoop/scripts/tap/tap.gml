///@arg dist frame
///@arg create rating or return rating
function tap(argument0, argument1){
	var dist = argument0;
	var rate = 2;
	if(dist >= 10){
		cout("Miss");
	}else if(dist >= 3){
		cout("Good");
		rate = 1;
	}else if(dist >= -1){
		cout("Perfect");
		rate = 0;
	}else{
		cout("Miss");
	}
	
	
	if(argument1){//Return
		return rate;
	}else{
		var rating = instance_create_layer(x, y, "InstancesTop", o_rating);
		rating.rating = rate;
		rating.target = self;
	}
}