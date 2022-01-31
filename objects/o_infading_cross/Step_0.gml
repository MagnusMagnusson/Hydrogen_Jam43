if(global.paused) exit;
a += delta() * 9;
if(a > 0.5){
	a = 1;
	if(is_vulnerable() && 
	point_in_rectangle(o_player.x, o_player.y, room_width / 2 - 16,0,room_width / 2 + 16, room_height) ||
	point_in_rectangle(o_player.x, o_player.y,0,room_height / 2 - 16,room_width, room_height/2 + 16) 
	){
		o_conductor.red = true;
	}
}