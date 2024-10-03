/*if(instance_exists(child)){
	draw_primitive_begin()
}*/
if(instance_exists(target) && signal == 0){
	distX = x - target.x;
	distY = y - target.y;
	signal = 1;
	tot_points = int64(abs(distX) / dist_between);
	cout(tot_points);
}

if(signal == 1){
	for(var i = 0; i < tot_points; i++){
		var xx = irandom_range(dist_between*i +dist_between-20, dist_between*i + dist_between+20); //X+dist_between +- 20
		var yy = irandom_range(y-20, y+20); // Y +- 10
		if(distX < 0){
			points[i] = [x + xx, yy];
		}else{
			points[i] = [x -xx, yy];
		}
	}
	//cout(points);
	signal = 2;
}