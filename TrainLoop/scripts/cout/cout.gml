///arg0
function cout(argument0){
	if(is_array(argument0)){
		for(var i = 0; i < array_length(argument0); i++){
			cout(i);
		}
	}else{
		show_debug_message(argument0);
	}
}