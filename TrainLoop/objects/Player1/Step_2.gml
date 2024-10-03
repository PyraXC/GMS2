depth = z;
facing = image_xscale;
if(SHOW_POPUPS){
	//create_popups();
	if(array_length(popup_queue) > 0){
		if!(POPUP_ONSCREEN){
			POPUP_ONSCREEN = true;
			var popup_data = array_pop(popup_queue);
			//cout(popup_data);
			var popup = instance_create_layer(0, 0, "InstancesTop", o_popup);
			popup.depth = -1;
			popup.title = popup_data[0];
			popup.txt = popup_data[1];
			popup.spr = popup_data[2];
			popup.duration = popup_data[3];
		}
	}
}