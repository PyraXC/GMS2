switch(state){
	
	case "Strong": //Deflect attacks at beginning of deflect
		if(i == 5){
			//state = "Reflect";
		}
		i++;
		break;
	
	case "Reflect": //Reflect projectiles for after
		break;
		
	case "Reflected": //Reflect projectiles for after
		Player1.state = "Battle";
		instance_destroy();
		break;
}