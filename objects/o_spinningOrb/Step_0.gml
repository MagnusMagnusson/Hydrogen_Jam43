if(global.paused) {
	x = xprevious;
	y = yprevious;
	exit;
}

if(angspeed != 0){
	ang += angspeed;
	r += rspeed;
	r = max(0, r);
	x = (room_width / 2) + lengthdir_x(r,ang);
	y = (room_height / 2) + lengthdir_y(r,ang);
}


if(is_vulnerable() && fast_dist_lte(x,y,o_player.x,o_player.y, size/2)){
	o_conductor.red = true;
}

if(fast_dist_gte(x,y, room_width / 2, room_height / 2, room_width + room_height)){
	instance_destroy()
}