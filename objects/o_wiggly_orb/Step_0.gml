if(global.paused) {
	x = xprevious;
	y = yprevious;
	exit;
}
if(wigglestep > 1){
	wiggledir = -1;
}
else if(wigglestep < -1){
	wiggledir = 1;
}

wigglestep += 20 * delta() * wiggledir;


if(is_vulnerable() &&  fast_dist_lte(wigglestep * 100 + x,y,o_player.x,o_player.y, size/2)){
	o_conductor.red = true;
}

if(fast_dist_gte(x,y, room_width / 2, room_height / 2, 3*room_width)){
	instance_destroy()
}