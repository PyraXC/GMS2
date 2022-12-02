///@arg value
///@arg limiter
function limit(argument0, argument1){
	var limiter = argument1;
	var value = argument0;
	if limiter == 1{
		if value < limiter{
			return limiter;
		}
	}
	else{
		if value > limiter {
			return limiter;
		}
	}
}