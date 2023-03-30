///@arg0 other
///@arg1 z amount
function z_axis(argument0, argument1){
	if abs(z - argument0.z) <= argument1{
		return true;
	}else{
		return false;
	}
}