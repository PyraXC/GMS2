global.grav = 0.5;
global.i_grav = 0.5;

function air_movement_new(){
	if state == "Aerial Lag" || state == "Move" //Landing lag
		{
			exit;
		}
		#region Second Player Stat Resets And Such
		dash_count = 0;
		
		#endregion
		if (place_meeting(x,y+1, o_wall)) and jump_input == 1
		{
			vsp =  1 * -jump_speed 
			jump_input = 0;
		}
		moveLR = input.right - input.left;
		moveTD = input.up - input.down;
		hsp = moveLR * run_speed;
		ysp = -(moveTD * (run_speed/2));
		if !input.left && !input.right{hsp = 0;}
		if input.left && input.right{hsp = 0;}
		move_and_collide(hsp, ysp, round(vsp));
		
	if (vsp < 15) vsp += global.grav;
	if (vsp > 15) vsp = 15;
	if(wall_jump_count > 8) wall_jump_count = 8;


		
	
global.grav = global.i_grav;
}