///@arg0 other
///@arg1 z amount
function z_axis(argument0, argument1){
	if(argument0.z+argument0.width > z && argument0.z < z+width){
		return true;
	}else{
		return false;
	}
}