global.midTransition = false;
global.roomTarget = -1;

function place_transition(transition){
	if(layer_exists("transition")) layer_destroy("transition");
	var lay = layer_create(-9999, "transition");
	layer_sequence_create(lay, 0, 0, transition);
}

function TransitionsStart(_roomTarget, _typeOut, _typeIn)
{	
	//don't change room
	/*if(_roomTarget == -1){
		if(!global.midTransition){
			global.midTransition = true;
			place_transition(_typeOut);
			place_transition(_typeIn);
		}
	} else{*/
		//change room
		if(!global.midTransition){
			global.midTransition = true;
			global.roomTarget =_roomTarget;
			place_transition(_typeOut);
			layer_set_target_room(_roomTarget);
			place_transition(_typeIn);
			layer_reset_target_room();
			return true;
		}
		else return false;
	//}
}

function TransitionChangeRoom()
{
	room_goto(global.roomTarget);
}

function TransitionFinished(){
	layer_sequence_destroy(self.elementID);
	global.midTransition = false;
}