if(!global.paused){
	radius -= min(3, radius / min_radius);
	var pd =  point_distance(x,y,o_player.x, o_player.y)
	if( is_vulnerable() && pd >= radius-width/2 && pd <= radius + width/2){
		o_conductor.red = true;
	}
}
