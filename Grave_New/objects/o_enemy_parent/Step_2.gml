if hp <= 0 and state != "Death"{
	state = "Death";
	
	repeat (experience)
	{
		instance_create_layer(x+random_range(-4, 4), y+random_range(-4, 4), "Effects", o_experience);
	}
}