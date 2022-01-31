if global.paused exit;
d += delta_time/1000000 * 45;
e += delta_time/1000000;
if(e - 0.25 > elast){
	elast = e;
	var i = instance_create_layer(x,y,"Instances",o_orb);
	i.direction = d;
	i.speed = 1;	
	i = instance_create_layer(x,y,"Instances",o_orb);
	i.direction = d + 90;
	i.speed = 1;
	i = instance_create_layer(x,y,"Instances",o_orb);
	i.direction = d + 180;
	i.speed = 1;
	i = instance_create_layer(x,y,"Instances",o_orb);
	i.direction = d + 270;
	i.speed = 1;
}
