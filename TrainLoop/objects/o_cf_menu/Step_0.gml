up_key = keyboard_check_pressed(ord("W"));
down_key = keyboard_check_pressed(ord("S"));
right_key =keyboard_check_pressed(ord("D")); 
left_key =keyboard_check_pressed(ord("A")); 
accept_key = keyboard_check_pressed(vk_space);
return_key = keyboard_check_pressed(vk_backspace);
vx = Player1.x-32;
vy = Player1.y-160;
pos += down_key - up_key;
lr += left_key - right_key;
if pos >= op_length{pos = 0;}
if pos < 0 {pos = op_length - 1;}
if lr > 1{lr = 0;}
if lr < 0{lr = 1;}

if(return_key){ 
	switch(menu_level){
		case 0:  
			Player1.state = "Move";
			o_coin_flip.state = "Not Gambling";
			instance_destroy();
		break;
		case 1:  menu_level = 0; break;		
		case 2:  menu_level = 1; break;
	}
}
if accept_key{
switch(menu_level){
	case 0:
		switch(pos){

			case 0: coin_flip(1, lr); break;

			case 1: coin_flip(10, lr);break;

			case 2: coin_flip(50, lr);break;
			
			case 3: coin_flip(250, lr);break;
			
			case 4: menu_level = 1; break;
			
			case 5: coin_flip(Player1.money, lr);break;
		}
		break;

	case 1:
		switch(pos){
			case 0: coin_flip(2, lr); break;

			case 1: coin_flip(20, lr);break;

			case 2: coin_flip(100, lr);break;
			
			case 3: coin_flip(500, lr);break;
			
			case 4: menu_level = 2; break;
			
			case 5: coin_flip(Player1.money, lr);break;
		}
		break;
	
	case 2:
		switch(pos){
			case 0: coin_flip(4, lr); break;

			case 1: coin_flip(40, lr);break;

			case 2: coin_flip(200, lr);break;
			
			case 3: coin_flip(1000, lr);break;
			
			case 4: coin_flip(Player1.money, lr);break;
		}
	}
}
//cout(option[menu_level]);
//cout(lr);