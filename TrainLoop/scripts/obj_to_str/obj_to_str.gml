///@arg List Of Objects
///@arg List To Add To
function obj_to_str(argument0){
	var temp = "";
	var i = 0;
	var len = array_length(argument0);
	while(i < len){
		if(i != 0 && (i)%3 ==0){
			temp += "\n";
			xLength++;
		}
		temp += argument0[i].item;
		if(i < len-1){temp+=" ";}
		i++;
	}
	return temp;
}