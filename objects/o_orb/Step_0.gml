if(global.paused) {
	x = xprevious;
	y = yprevious;
	exit;
}
if(is_vulnerable() && fast_dist_lte(x,y,o_player.x,o_player.y, size/2)){
	o_conductor.red = true;
}

if(x < - 128 || x > room_width + 128 || y < -128 || y > room_height + 128){
	instance_destroy();
}