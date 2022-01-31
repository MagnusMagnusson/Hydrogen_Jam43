if global.paused exit;

var prev = a;
a += delta()*15;
if(a > 0.75 && prev <= 0.75){
	audio_play_sound(boom,2,false);
}
if(a > 1){
	ex--;
	if(ex == 0){
		instance_destroy();
	}
	a--;
}

if(is_vulnerable() && a > 0.75 && point_in_rectangle(o_player.x,o_player.y,x,y,x+w,y+h)){
	o_conductor.red = true;
}