if global.paused exit;
e += delta_time/1000000;
if(e - 0.25 > elast){
	elast = e;
	var i = instance_create_layer(x,y,"Instances",o_orb);
	i.speed = 4;
	i.direction = point_direction(x,y,o_player.x,o_player.y);
}
