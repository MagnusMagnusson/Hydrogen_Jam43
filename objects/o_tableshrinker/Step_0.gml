if global.paused exit;
e += delta_time/1000000;

var amount = 25;
if(e - 0.03 > elast){
	elast = e;
	var i = instance_create_layer((room_width / 2) + lengthdir_x(radius, ind),(room_height / 2) + lengthdir_y(radius, ind),"Instances",o_spinningOrb);
	i.dir = dir;
	ind += 360 / amount;
	if(ind >= 360){
		dir *= -1;
		ind = 0;
		radius -= 32;
		if(radius < 100){
			instance_destroy();
		}
	}
	i.speed = 0
}
