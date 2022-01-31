if(!global.paused){
	radius -= 4;
	var pd =  point_distance(x,y,o_player.x, o_player.y)
	if( is_vulnerable() && pd >= abs(radius)-width/2 && pd <=abs(radius) + width/2){
		o_conductor.red = true;
	}
	if(abs(radius) > max_radius){
		instance_destroy();
	}
}
