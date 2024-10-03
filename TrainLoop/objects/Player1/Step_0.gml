#region debug stuff
if(keyboard_check_pressed(vk_f1)){
	Player1.x = instance_nearest(x, y, o_enemy).x;
	Player1.y = instance_nearest(x, y, o_enemy).y;
	Player1.z = instance_nearest(x, y, o_enemy).z;
}
if(keyboard_check(vk_f5)){ game_restart();}
#endregion

switch (state)
{
	case "Battle Debug":
	#region battle editor
	if(!instance_exists(o_battle_debug_menu)){
		var temp = instance_create_layer(x, y, "InstancesTop", o_battle_debug_menu);
		temp.depth--;
	}
	#endregion
	break;
	
	case "Move":
	#region Move State
	#region Stuff
		if(!weapon && array_length(weapon_inventory) > 0){
			weapon = weapon_inventory[0];
		}
		focused = 0;
		moveLR = input.right - input.left;
		moveTD = input.up - input.down;
		hsp = moveLR * run_speed;
		ysp = -(moveTD * (run_speed/2));
		jump_speed = i_jump_speed;
		air_speed = 0;
		lag_count = 0;
		wall_jump_count = 0;
		idle_time = 0;
		i = 0;
		jump_input = 0;
		grav = i_grav;
		actions = 1;
		item_actions = 1;
		if(moveLR == 1){
			image_xscale = 1;
		}
		else if(moveLR == -1){
			image_xscale = -1;
		}
		if(abs(moveLR) or abs(moveTD)){
			set_state_sprite(s_move, 1, 0);
		}
		else{
			set_state_sprite(s_idle, 1, 0);
		}
	#endregion
	if input.run{
		run_speed = max_run_speed;
	}else{ 
		run_speed = i_run_speed;
	}
	
	move_and_collide(hsp, ysp, 0);
	can_jump();
	
	if input.pause{
		state = "Paused";
	}
	
	
	/*
	if keyboard_check_pressed(vk_enter){
		skele = instance_nearest(x, y, o_skeleton_king);
		instance_deactivate_object(skele);
	}
	if keyboard_check_pressed(vk_end){
		skele.state = "Invincibility";
	}
	if keyboard_check_pressed(vk_shift){
		instance_activate_object(skele);
	}
	if keyboard_check_pressed(vk_decimal){
		room_goto(rm_battle1);
	}*/

	
	/* if input.right and not input.left
		{
			can_jump();
			move_and_collide_new(run_speed, 0);
			//run_speed = run_speed
			image_xscale = 1;
			if !input.run{set_state_sprite(s_move, 0 + run_speed/10, 0);}
			else{set_state_sprite(s_run, 0 + run_speed/10, 0);}
			idle_time = 0;
			hsp = run_speed;
			if(place_meeting(x+run_speed, y, o_wall))
	{
		while(!place_meeting(x+sign(run_speed), y, o_wall))
		{
			x += sign(run_speed); 
		}
		run_speed = i_run_speed;
	}

	//if animation_hit_frame(1){audio_play_sound(footstep_reverb, 1, 0);}
		}
	if input.left and not input.right
		{
			can_jump();
			move_and_collide_new(-run_speed, 0);
			//run_speed = approach(run_speed, max_run_speed, 0.2);
			image_xscale = -1;
			if !input.run{set_state_sprite(s_move, 0 + run_speed/10, 0);}
			else{set_state_sprite(s_run, 0 + run_speed/10, 0);}
			idle_time = 0;
			hsp = -run_speed;
		if(place_meeting(x-run_speed, y, o_wall))
			{
			while(!place_meeting(x-sign(run_speed), y, o_wall))
				{
					x -= sign(run_speed); 
				}
			run_speed = i_run_speed;
			}
		//	if animation_hit_frame(1){audio_play_sound(footstep_reverb, 1, 0);}
		}
	if not input.left and not input.right
		{
			can_jump();
			if input.pause
				{
					state = "Paused";
				}
			idle_time++;
			run_speed = i_run_speed;
			set_state_sprite(s_move, 0.25, 0);
			hsp = 0;
			if idle_time >= 120
				{
					state = "Idle2";
					run_speed = 0;
				}
		}
	
	if input.left and input.right
		{
			can_jump();
			idle_time++;
			run_speed = i_run_speed;
			set_state_sprite(s_move, 0.25, 0);
			if input.pause
				{
					state = "Paused";
				}
			if idle_time >= 120
				{
					state = "Idle2";
				}
		}
	*/	

	break;
#endregion

	case "Jump":
	#region Jump
	#region stuff
	set_state_sprite(s_jump, 1, 0);
	air_movement_new();
	if i == 0
	{
		grav = 0;
		i++;
	}
	else
	{
		grav = i_grav;
	}
			#endregion
			break;
			#endregion
	
	case "Start Fishing":
	set_state_sprite(s_start_fishing, 1, 0);
	if animation_end(){
		state = "Fishing";
		fish = noone;
		lr = 0;
		inputs = 0;
		k = 0;
		rng = 0;
	}
		break;
		
	case "Fishing":
	#region fishing
	set_state_sprite(s_fishing, 1, 0);
	if((input.left or input.right or input.jump or input.attack) && o_water.state != "FISHHH"){
		state = "Fish Off";
		cout("STAHP");
	}else if (input.jump && o_water.state == "FISHHH"){
		k = 0;
		fish = o_water.fish;
		state = "Fish On";
		o_water.state = "Fish On";
		o_water.alarm[1] = -1;
	}
	#endregion
		break;
		
	case "Fish Off":
	#region stop fishin
	o_water.state = "Not Fishing";
	set_state_sprite(s_stop_fishing, 1, 0);
	if(animation_end()){
		state = "Move";
	}
	#endregion
		break;
	
	case "Fish On":
	#region REEEEL
	if(k == 0){
	fish = o_water.fish;
	lr = choose(1, 2);
	if(object_get_parent(fish.obj) == o_fish){
		timer = fish.time;
		inputs = fish.hp;
	}else{
		timer = 60 * 5;
		inputs = 25;
	}
	k++;
	}
	if(timer > 0){
		if(k ==1){
			alarm[6+lr] = irandom_range(2,6)*30;
			k++;
		}
		if(lr == 1){
			set_state_sprite(s_fishing_L, 1, 0);
			if(input.left and input.jump){
				inputs--;
				//cout(inputs);
			}
			if(input.right and input.jump){
				inputs++;
				//cout(inputs);
			}
		}
		if(lr == 2){
			set_state_sprite(s_fishing_R, 1, 0);
			if(input.right and input.jump){
				inputs--;
				//cout(inputs);
			}
			if(input.left and input.jump){
				inputs++;
				//cout(inputs);
			}
		}
		if(inputs <= 0){
			state = "Catch";
			fish.state = "Collect";
			fish.depth = -1;
			o_water.fish = noone;
			lr = 0;
			timer = 0;
			k = 0;
		}
		timer--;
	}
	else{
		state = "Fish Off";
		lr = 0;
		timer = 0;
		k = 0;
	}
	#endregion
		break;
		
	case "Catch":
	set_state_sprite(s_stop_fishing, 1, 0);
	if animation_end(){
		state = "Move";
		o_water.state = "Not Fishing";
	}
		break;
		
	case "Coin Flip":
	if(!instance_exists(o_cf_menu)){
		instance_create_layer(x, y, "InstancesTop", o_cf_menu);
	}
		break;
	
	case "Noone":
	set_state_sprite(s_idle, 1, 0);
		break;
	
	case "Battle":
	#region Battle Start
	set_state_sprite(s_idle, 1, 0);
	hsp = 0;
	focused = 1;
	dodge();
	if(!place_meeting(x, y+1, o_wall)){
		}
	else{
		if(actions == 0 && o_gameState.state != "End Battle"){ o_gameState.state = "Enemy";}
		if(o_gameState.state == "P1"){
			while(!instance_exists(o_battle_menu)){
				instance_create_layer(x, y-128, "InstancesTop", o_battle_menu);
			}
		}
		else if(o_gameState.state == "Enemy"){
			focused = 0;
			if(input.defend){
				state = "Defend";
			}
			else if(input.attack){
				state = "Deflect";
			}
			else if(input.jump){
				alarm[1] = delay;
				jump_input = 1;
				state = "Dodge";
			}
		}
		else if(o_gameState.state == "End Battle"){
			//set_state_sprite(s_victory, 1, 0);
		}
	}
		#endregion
		break;
		
	case "Defend":
	#region Defend In Enemy Turn
	set_state_sprite(s_defend, 1, 0);
	//cout(defend);
	//if(alarm[1] == -1){
		if(animation_hit_frame(2)){
			defend = 0.0;
		}
		if(animation_hit_frame_range(3, 12)){
			defend = 0.25;
		}
		if(animation_end()){
			defend = iDefend;
			state = "Battle";
		}
	//}
	//else if(animation_end()){
		//	state = "Battle";
	//	}
	#endregion
		break;
		
	case "Deflect":
	#region Attack In Enemy Turn
	set_state_sprite(s_deflect, 1, 0);
	if(animation_hit_frame(17)){
		create_deflect(x, y, self, s_deflect_hitbox, 18, image_xscale, z, 64);
	}
	if(animation_end()){
		state = "Battle";
	}
	#endregion
		break;
		
	case "Dodge":
	#region Evade/Jump In Enemy Turn
	set_state_sprite(s_idle, 1, 0);
	if(alarm[1] == -1){
	set_state_sprite(s_jump, 1, 0);
		dodge();
	}
	#endregion
		break;

	case "Knockback":
	#region
	defend = iDefend;
	knockback_state(s_knockback, "Battle");
	#endregion
		break;
	
	case "Read":
	#region Identify
	state = return_state;
	#endregion
		break;
		
	case "Approach":
	#region Knife Approach
	/*set_state_sprite(s_move, 1, 0);
	approach_target(target);
	if(abs(x - target.x) < 96){
		state = next_state;
		next_state = "";
		attack_type = weapon.type;
	}*/
	if!(on_point(point, 0)){
		set_state_sprite(s_move, 1, 0);
		approach_point(point, 1, 0);
	}else{//Attack
		state = next_state;
		next_state = "";
		attack_type = weapon.type;
	}
	#endregion
		break;
		
	case "Stab":
	#region Knife Approach
	set_state_sprite(s_move, 1, 0);
	approach_target(target);
	if(abs(x - target.x) < 64){
		state = "Stab Attack";
	}
	#endregion
		break;
		
	case "Stab Attack":
	#region Stab Attack
	/*ini_open("attack_spritemaps.ini");
	var map = ds_map_create();
	ds_map_read(map, ini_read_string("Stabs", "Stabs", "UNDEFINED"));
	ini_close();
	var spr = ds_map_find_value(map, weapon.item);*/
	var spr = attack_sprite("Stabs");
	set_state_sprite(spr, 1, 0);
	if(animation_hit_frame(3)){
		create_hitbox(x, y, self, s_attack_damage, 0, 0, 1, 1*weapon.damage + 2, "None", 0, image_xscale, z, 5);
		audio_play_sound(a_medium_hit, 1, 0);	
	}
	if(animation_end()){
		state = "Return";
	}
	
	#endregion
		break;
		
	case "Hit":
	#region Hit Approach
	set_state_sprite(s_move, 1, 0);
	approach_target(target);
	if(abs(x - target.x) < 64){
		state = "Hit Attack";
	}
	#endregion
		break;	
		
	case "Hit Attack":
	#region Hit Attack Tap
	var spr = attack_sprite("Hits");
	var frame = 12;
	set_state_sprite(spr, 1, 0);
	//Start basic input system
	if(input.attack && inp == -1){
		inp = image_index + 1;
	}
	
	if(animation_hit_frame(frame) or inp > -1){
		//cout(image_index);
		image_index = frame;
	//	cout(image_index);
		var dist = frame - inp;
	//	cout(dist);
		tap(dist, 0);
		create_hitbox(x, y, self, s_attack_damage, 0, 0, 1, 1*weapon.damage, "None", 0, image_xscale, z, 5);
		audio_play_sound(a_medium_hit, 1, 0);	
		inp = -2;
		//image_index = frame + 1;
	}
	if(animation_end()){
		inp = -1;
		state = "Return";
		point = attack_point(ix, iz, iy, 1);
	}
	
	#endregion
		break;
	
	case "Sweep":
	#region Sweep Approach
	set_state_sprite(s_move, 1, 0);
	approach_target(target);
	if(abs(x - target.x) < 64){
		state = "Sweep Attack";
	}
	#endregion
		break;
		
	case "Sweep Attack":
	#region Stab Attack
	var spr = attack_sprite("Sweeps");
	set_state_sprite(spr, 1, 0);
	if(animation_hit_frame(3)){
		create_hitbox(x, y, self, s_sweep_damage, 0, 0, 10, max(1, weapon.damage-2), "Break", 100, image_xscale, z, 75);
		audio_play_sound(a_swipe, 1, 0);
	}
	if(animation_end()){
		state = "Return";
		point = attack_point(ix, iz, iy, 1);
	}
	
	#endregion
		break;
		
	case "Overhead":
	#region Knife Approach
	set_state_sprite(s_move, 1, 0);
	approach_target(target);
	if(abs(x - target.x) < 64){
		state = "Overhead Attack";
	}
	#endregion
		break;
		
	case "Overhead Attack":
	#region Stab Attack
	set_state_sprite(s_overhead, 1, 0);
	if(animation_hit_frame(3)){
		create_hitbox(x, y, self, s_overhead_damage, 0, 0, 1, 1*weapon.damage, "Topple", 100, image_xscale, z, 5);
		audio_play_sound(a_medium_hit, 1, 0);
	}
	if(animation_end()){
		state = "Return";
		point = attack_point(ix, iz, iy, 1);
	}
	
	#endregion
		break;

	case "Bone":
	#region Bone Item
	attack_type = "Blunt";
	set_state_sprite(s_throw_bone, 1, 0);
	/*if animation_end(){
		var bone = instance_create_layer(x, y-64, "InstancesTop", o_bone_projectile);
		bone.creator = Player1;
		bone.target = target;
		item.durability--;
		state = return_state;
	}*/
	if(animation_end()){
		throw_bone(true, 0, 2);
		wait = 30;
	}
	#endregion
		break;
		
	case "Projectile Wait":
	#region Waiting
		set_state_sprite(s_idle, 1, 0);
		wait--;
		if(wait <= 0){
			state = return_state;
		}
		#endregion
		break;
		
	case "Health Potion":
	#region Health Item
	set_state_sprite(s_drink_health, 1, 0);
	if animation_end(){
		hp += item.damage;
		item.durability--;
		state = return_state;
	}
	#endregion
		break;
		
	case "Extra Action":
	#region Extra Action Item
	set_state_sprite(s_drink_action, 1, 0);
	if animation_end(){
		actions += item.damage;
		item.durability--;
		state = return_state;
	}
	#endregion
		break;

	case "Return":
		#region return
		if!(on_point(point, 0)){
			set_state_sprite(s_move, 1, 0);
			approach_point(point, 1, 0);
		}else{//Attack
			//if(instance_exists(target)){cout(target.hp);}
			state = return_state;
			point = noone;
		}
		#endregion
		break;
	
	case "Death":
	#region dead lmao
	cout("You Died");
	game_restart();
	#endregion
	
	case "Paused":
	#region Pause Menu
	if(!instance_exists(o_pause_menu)){
		var pause_menu = instance_create_layer(-1000, -1000, "InstancesTop", o_pause_menu);
	}
	#endregion
		break;
	
	case "Skill":
	if(!instance_exists(o_sp_menu)){
		state = "Move";
	}
	#region Skill Menu
	
	#endregion
		break;
		
	case "Idle2":
		#region Idle2
		set_state_sprite(s_idle2, 0.33, 0);
		
	if input.right or input.left
		{
			state= "Move";
			idle_time = 0;
		}
		if input.attack
		{
			state = "Attack One";
			idle_time = 0;
		}
	if input.jump
		{
			state = "Jump";
			idle_time = 0;
		}
	if animation_end()
	{
		state = "Move";
		idle_time = 0;
	}
	#endregion
		break;	
}

if hp >= max_hp
	{
		hp = max_hp;
	}

if hp < current_hp
	{
		current_hp = hp;
	}
if hp > current_hp
	{
		current_hp = hp;
	}
//show_debug_message(image_xscale);
//show_debug_message(alarm[9]);
//show_debug_message(state);
//show_debug_message(vsp);
//show_debug_message(hsp);
//show_debug_message(y);
//show_debug_message(o_game.a_attack);
//show_debug_message(global.pause);
//show_debug_message(global.game_fps);
//show_debug_message(run_speed);
//show_debug_message(jump_speed);
//show_debug_message(i_jump_speed);
//show_debug_message(wall_jump_count);
//show_debug_message(launch);
//show_debug_message(sign(x - o_tether_point.x));
//show_debug_message(launch_speed_x);
//show_debug_message(launch_speed_y);
//show_debug_message(tether_range);
//show_debug_message(zero_degree_meter);
//show_debug_message(hp);
//cout(lag_count);
//cout(ix);
//cout(weapon_inventory);
//cout(global.obj_list);
//cout(image_xscale);
//cout(state);
//cout(status);
//cout(global.midTransition);
//cout(jump_input);
//cout(return_state);
//cout(target);
//cout(weapon_inventory);
//cout(weapon);
//cout("X:"+string(x)+" Y:"+string(y)+" Z:"+string(z));
//cout(depth);
//cout(z);
//cout(attack_list);
//cout(ds_list_find_value(ground, ds_list_size(ground)-1));
//cout(z_axis(Player1, o_wall));
//cout(string(z + wid) + " " + string(ground.z));
//cout(ysp);
//print_ds(ground);
//cout(grd);
//cout((string(input.jump) + state));
//cout(ix);
//cout(focused);
//cout("Player " + string(depth));
//cout(state);
//cout(x);