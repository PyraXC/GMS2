///@arg0 other
///@arg1 z amount
function z_axis(argument0, argument1){
	var _other = argument0;
	var _extra = argument1;
	//cout(string(argument0.z+argument0.width) + " " + string(z));
	if(_other.z+_other.wid+_extra > z && _other.z-_extra < z+wid){
		//cout("Hitbox Z:" + string(_other.z) + " Wid:" +string(_other.wid) + " Self Z:" + string(z) + " wid:" + string(wid)); 
		return true;
	}else{
		//cout("Hitbox Z: " + string(_other.z) + " Wid: " +string(_other.wid) + " Self Z: " + string(z) + " wid: " + string(wid)); 
		return false;
	}
}